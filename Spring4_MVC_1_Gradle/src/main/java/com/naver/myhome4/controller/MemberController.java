package com.naver.myhome4.controller;

import com.naver.myhome4.domain.Member;
import com.naver.myhome4.service.MemberService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/*
    @Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정할 수 있지만 모든 클래스에 @Component를 할당하면 어떤 클래스가 어떤 역할을 수행하는지 파악하기 어렵습니다.
    스프링프레임워크에서는 이런 클래스들을 분류하기 위해서 @Component를 상속하여 다음과 같은 세 개의 애노테이션을 제공합니다.

    1. @Controller - 사용자의 요청을 제어하는 Controller 클래스
    2. @Repository - 데이터베이스 연동을 처리하는 DAO 클래스
    3. @Service - 비지니스 로직을 처리하는 Service 클래스
 */
@Controller
@RequestMapping(value = "/member") // http://localhost:8088/myhome4/member/로 시작하는 주소 매핑
public class MemberController {
    // import org.slf4j.Logger;
    // import org.slf4j.LoggerFactory;
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    private MemberService memberService;

    /*
        원래 @AutoWired로 작성해야했는데 부트에서 생략됨
     */
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping(value = "/login")
    public ModelAndView login(
            ModelAndView mv,
            @CookieValue(value = "saveId", required = false) Cookie readCookie
    ) {
        if (readCookie != null) {
            mv.addObject("saveId", readCookie.getValue());
            logger.info("saveId = " + readCookie.getValue());
        }

        mv.setViewName("member/member_loginForm");

        return mv;
    }

    @GetMapping(value = "/join")
    public String join() {
        return "member/member_joinForm";
    }

    @ResponseBody // 반드시 ajax로 호출하는 경우에는 응답을 실어서 보내야한다. 이때 @ResponseBody를 사용함.
    @GetMapping(value = "/idCheck")
    public int idCheck(String id) {
        return memberService.isId(id);
    }

    @PostMapping(value = "/joinProcess")
    public String joinProcess(Member member, RedirectAttributes rAttr) {
        memberService.insert(member);

        /*
            스프링에서 제공하는 RedirectAttributes는 기존의 Servlet에서 사용되던
            response.sendRedirect()를 사용할 때와 동일한 용도로 사용합니다.

            리다이렉트로 전송하면 파라미터를 전달하고자 할 때 addAttribute()나 addFlashAttribute()를 사용합니다.
            예) response.sendRedirect("/test?result=1");
               => rAttr.addAttribute("result", 1);
         */

        rAttr.addFlashAttribute("result", "joinSuccess");

        return "redirect:login";
    }

    @PostMapping(value = "/loginProcess")
    public String loginProcess(
            String id,
            String password,
            @RequestParam(defaultValue = "") String remember,
            HttpServletResponse response,
            HttpSession session,
            RedirectAttributes rAttr
    ) {
        int result = memberService.isId(id, password);
        logger.info("결과 : " + result);

        if (result == 1) {
            // 로그인 성공
            session.setAttribute("id", id);

            Cookie saveCookie = new Cookie("saveId", id);

            if (!remember.equals("")) {
                // remember 선택한 경우
                saveCookie.setMaxAge(60 * 60 * 24); // 1일
                logger.info("쿠키 저장 : 60*60*24");
            } else {
                logger.info("쿠키 저장 : 0");
                saveCookie.setMaxAge(0);
            }

            response.addCookie(saveCookie); // cookie를 response에 담아야한다.

            return "redirect:/board/list"; // http://localhost:9401/myhome4/board/list
        } else {
            rAttr.addFlashAttribute("result", result);

            return "redirect:login"; // http://localhost:9401/myhome4/member/login
        }
    }

    @GetMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.invalidate();

        return "redirect:login";
    }

    @GetMapping(value = "/update")
    public ModelAndView update(ModelAndView mv, HttpSession session) {
        String id = (String) session.getAttribute("id");
        Member member = memberService.memberInfo(id);

        mv.addObject("member", member);
        mv.setViewName("member/member_updateForm");

        return mv;
    }
}
