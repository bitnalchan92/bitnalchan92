package com.naver.myhome4.controller;

import com.naver.myhome4.domain.Board;
import com.naver.myhome4.domain.PaginationResult;
import com.naver.myhome4.service.BoardService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.List;

/*
    @Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정할 수 있지만 모든 클래스에 @Component를 할당하면 어떤 클래스가 어떤 역할을 수행하는지 파악하기 어렵습니다.
    스프링프레임워크에서는 이런 클래스들을 분류하기 위해서 @Component를 상속하여 다음과 같은 세 개의 애노테이션을 제공합니다.

    1. @Controller - 사용자의 요청을 제어하는 Controller 클래스
    2. @Repository - 데이터베이스 연동을 처리하는 DAO 클래스
    3. @Service - 비지니스 로직을 처리하는 Service 클래스
 */
@Controller
@RequestMapping(value = "/board") // http://localhost:8088/myhome4/board/로 시작하는 주소 매핑
public class BoardController {
    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    private BoardService boardService;

    /*
        클래스에 생성자가 하나만 존재하는 경우 Spring이 자동으로 의존성을 주입해 주므로 @Autowired를 붙일 필요가 없습니다.
        SpringBoot2.6 이상에서는 생성자가 하나뿐인 경우 @Autowired를 생략하는 것을 권장합니다.
     */
    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @GetMapping(value = "/list")
    public ModelAndView list(
            @RequestParam(defaultValue = "1") int page,
            ModelAndView mv,
            HttpSession session
    ) {
        session.setAttribute("referer", "list");
        int limit = 10;

        int listCount = boardService.getListCount(); // 총 list 수를 받아옴
        List<Board> list = boardService.getBoardList(page, limit); // 리스트를 받아옴

        PaginationResult result = new PaginationResult(page, limit, listCount);

        mv.setViewName("board/board_list");

        mv.addObject("page", page);
        mv.addObject("maxPage", result.getMaxPage());
        mv.addObject("startPage", result.getStartPage());
        mv.addObject("endPage", result.getEndPage());
        mv.addObject("listCount", listCount);
        mv.addObject("boardList", list);
        mv.addObject("limit", limit);

        return mv;
    }

    @GetMapping(value = "/write")
    public String boardWrite() {
        return "board/board_write";
    }

    @PostMapping(value = "/add")
    public String add(Board board, HttpServletRequest request) throws Exception {
        String saveFolder = request.getSession().getServletContext().getRealPath("resources/upload");
        MultipartFile uploadFile = board.getUploadFile();

        if (!uploadFile.isEmpty()) {
            String fileDBName = boardService.saveUploadedFile(uploadFile, saveFolder);

            board.setBOARD_FILE(fileDBName);
            board.setBOARD_ORIGINAL(uploadFile.getOriginalFilename());
        }

        boardService.insertBoard(board); // 저장메서드 호출

        logger.info(board.toString()); // selectKey로 정의한 BOARD_NUM 값 확인해 봅니다.

        return "redirect:list";
    }

    @GetMapping(value = "/detail")
    public ModelAndView boardDetail(int num, ModelAndView mv, HttpServletRequest request, @RequestHeader(value = "referer", required = false) String beforeURL, HttpSession session) {
        /*
            1. String beforeURL = request.getHeader("referer"); 의미로
            어느 주소에서 detail로 이동했는지 header의 정보 중에서 "referer"를 통해 알 수 있습니다.

            2. 수정 후 이곳으로 이동하는 경우 조회수는 증가하지 않도록 합니다.

            3. myhome4/board/list에서 제목을 클릭한 경우 조회수가 증가하도록 합니다.
         */
        String sessionReferer = (String) session.getAttribute("referer");
        logger.info("referer : " + beforeURL);

        if (sessionReferer != null && sessionReferer.equals("list")) {
            if (beforeURL != null && beforeURL.endsWith("list")) {
                boardService.setReadCountUpdate(num);
            }

            session.removeAttribute("referer");
        }

        Board board = boardService.getDetail(num); // board=null; // error 페이지 이동 확인하고자 임의로 지정합니다.

        if (board == null) {
            logger.info("상세보기 실패");

            mv.setViewName("error/error");
            mv.addObject("url", request.getRequestURL());
            mv.addObject("message", "상세보기 실패입니다.");
        } else {
            logger.info("상세보기 성공");

            // int count = commentService.getListCount(num);
            int count = 0;

            mv.setViewName("board/board_view");

            mv.addObject("count", count);
            mv.addObject("boardData", board);
        }

        return mv;
    }

    @GetMapping("/modifyView")
    public ModelAndView boardModifyView(
            int num,
            ModelAndView mv,
            HttpServletRequest request
    ) {
        Board boardData = boardService.getDetail(num);

        // 글 내용 불러오기 실패한 경우입니다.
        if (boardData == null) {
            logger.info("수정 보기 실패");

            mv.setViewName("error/error");
            mv.addObject("url", request.getRequestURL());
            mv.addObject("message", "수정보기 실패입니다.");
        } else {
            logger.info("(수정) 상세보기 성공");

            // 수정 폼 페이지로 이동할 때 원문 글 내용을 보여주기 때문에 boardData 객체를 ModelAndView 객체에 저장합니다.
            mv.addObject("boardData", boardData);
            mv.setViewName("board/board_modify");
        }

        return mv;
    }

    @PostMapping("/modifyAction")
    public String boardModifyAction(
            Board boardData,
            String check,
            Model mv,
            HttpServletRequest request,
            RedirectAttributes rAttr
    ) throws Exception {
        boolean userCheck = boardService.isBoardWriter(boardData.getBOARD_NUM(), boardData.getBOARD_PASS());

        // 비밀번호가 다른 경우
        if (!userCheck) {
            rAttr.addFlashAttribute("result", "passFail");
            rAttr.addAttribute("num", boardData.getBOARD_NUM());

            return "redirect:modifyView";
        }

        String url = "";
        MultipartFile uploadFile = boardData.getUploadFile();
        String saveFolder = request.getSession().getServletContext().getRealPath("resources/upload");

        if (check != null && !check.equals("")) { // 기존 파일 그대로 사용하는 경우
            logger.info("기존 파일 그대로 사용합니다.");

            boardData.setBOARD_ORIGINAL(check);
            // <input type="hidden" name="BOARD_FILE" value="${boardData.BOARD_FILE}">
            // 위 문장 때문에 board.setBOARD_FILE() 값은 자동 저장됩니다.
        } else {
            // 답변글의 경우 파일 첨부에 대한 기능이 없습니다.
            // 만약 답변글을 수정할 경우
            // <input type="file" id="upFile"" name="uploadFile"> 엘리먼트가 존재하지 않아
            // private MultipartFile uploadFile; 에서 uploadFile은 null입니다.
            if (uploadFile != null && !uploadFile.isEmpty()) {
                logger.info("파일이 변경되었습니다.");

                String fileDBName = boardService.saveUploadedFile(uploadFile, saveFolder);

                boardData.setBOARD_FILE(fileDBName); // 바뀐 파일명으로 저장
                boardData.setBOARD_ORIGINAL(uploadFile.getOriginalFilename()); // 원래 파일명 저장

            } else { // 기존 파일이 없는데 파일 선택하지 않은 경우 또는 기존 파일이 있었는데 삭제한 경우
                logger.info("선택 파일이 없습니다.");
                // <input type="hidden" name="BOARD_FILE" value="${boardData.BOARD_FILE}">
                // 위 태그에 값이 있다면 ""로 값을 변경합니다.
                boardData.setBOARD_FILE(""); // ""로 초기화합니다.
                boardData.setBOARD_ORIGINAL(""); // ""로 초기화 합니다.
            }
        }

        // DAO에서 수정 메서드 호출하여 수정합니다.
        int result = boardService.boardModify(boardData);

        // 수정에 실패한 경우
        if (result == 0) {
            logger.info("게시판 수정 실패");

            mv.addAttribute("url", request.getRequestURL());
            mv.addAttribute("message", "게시판 수정 실패");

            url = "error/error";
        } else { // 수정 성공의 경우
            logger.info("게시판 수정 완료");

            // 수정한 글의 내용을 보여주기 위해 글 내용 보기 페이지로 이동하기 위해 경로를 설정합니다.
            url = "redirect:detail";

            rAttr.addAttribute("num", boardData.getBOARD_NUM());
        }

        return url;
    }

    @GetMapping("/replyView")
    public ModelAndView boardReplyView(
            int num,
            ModelAndView mv,
            HttpServletRequest request
    ) {
        Board boardData = boardService.getDetail(num);

        if (boardData == null) {
            mv.setViewName("error/error");
            mv.addObject("url", request.getRequestURL());
            mv.addObject("message", "게시판 답변글 가져오기 실패.");
        }

        mv.addObject("boardData", boardData);
        mv.setViewName("board/board_reply");

        return mv;
    }

    @PostMapping("/replyAction")
    public ModelAndView boardReplyAction(
            Board board,
            ModelAndView mv,
            HttpServletRequest request,
            RedirectAttributes rAttr
    ) {
        int result = boardService.boardReply(board);

        if (result == 0) {
            mv.setViewName("error/error");
            mv.addObject("url", request.getRequestURL());
            mv.addObject("message", "게시판 답변 처리 실패");
        } else {
            rAttr.addAttribute("num", board.getBOARD_NUM());
            mv.setViewName("redirect:detail");
        }

        return mv;
    }

    @PostMapping("/delete")
    public String boardDeleteAction(String BOARD_PASS, int num, Model mv, RedirectAttributes rAttr, HttpServletRequest request) {
        /*
             글 삭제 명령을 요청한 사용자가 글을 작성한 사용자인지 판단하기 위해 입력한 비밀번호와 저장된 비밀번호를 비교하여 일치하면 삭제합니다.
         */
        boolean userCheck = boardService.isBoardWriter(num, BOARD_PASS);

        // 비밀번호가 일치하지 않는 경우
        if (userCheck == false) {
            rAttr.addFlashAttribute("result", "passFail");
            rAttr.addAttribute("num", num);

            return "redirect:detail";
        }

        // 비밀번호가 일치하는 경우 삭제 처리합니다.
        int result = boardService.boardDelete(num);

        // 삭제 처리 실패한 경우
        if (result == 0) {
            logger.info("게시판 삭제 실패");

            mv.addAttribute("url", request.getRequestURL());
            mv.addAttribute("message", "삭제 실패");

            return "error/error";
        } else {
            // 삭제 처리 성공한 경우 - 글 목록 보기 요청을 전송하는 부분입니다.
            logger.info("게시판 삭제 성공");

            rAttr.addFlashAttribute("result", "deleteSuccess");

            return "redirect:list";
        }
    }

    @ResponseBody
    @PostMapping("/down")
    public byte[] BoardFileDown(
            String fileName,
            HttpServletRequest request,
            String original,
            HttpServletResponse response
    ) throws Exception {
        String savePath = "resources/upload";

        // 서블릿의 실행 환경 정보를 담고 있는 객체를 리턴합니다.
        ServletContext context = request.getSession().getServletContext();
        String sDownloadPath = context.getRealPath(savePath);

        String sFilePath = sDownloadPath + fileName;

        File file = new File(sFilePath);

        // org.springframework.util.FileCopyUtils.copyToByteArray(File file) - File 객체를 읽어서 바이트 배열로 반환합니다.
        byte[] bytes = FileCopyUtils.copyToByteArray(file);

        String sEncoding = new String(original.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);

        // Content-Disposition: attachment: 브라우저는 해당 Content를 처리하지 않고, 다운로드 하게 됩니다.
        response.setHeader("Content-Disposition", "attachment;filename=" + sEncoding);

        response.setContentLength(bytes.length);

        return bytes;
    }
}
