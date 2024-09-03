package statementLike.multi;

import java.util.ArrayList;
import java.util.Scanner;

public class CRUD {
    static String[] menus = {"사원번호", "사원이름", "직급", "매니저", "입사일자", "급여", "커미션", "부서번호", "종료"
    };

    public static void main(String[] args) {
        String[] search_word = menuselect();
        search(search_word);
    }

    private static String[] menuselect() {
        //Scanner 객체 생성
        Scanner sc = new Scanner(System.in);

        //8개의 크기를 갖는 String배열 search 선언
        String[] search = new String[8];

        System.out.println("✨EMP 테이블 조회 조건✨");
        int i = 0;
        for (String m : menus) {
            System.out.println(++i + "." + m);
        }

        int menu = 0;
        do {
            System.out.print("조회할 컬럼을 선택하세요 > ");

            //menu에 inputNumber(sc) 호출한 결과 저장;
            menu = inputNumber(sc);

            if (menu == 9) {
                sc.close();
                break;
            }

            //search의 특정 컬럼에 searchData(sc, menu) 호출한 결과 저장
            search[menu - 1] = searchData(sc, menu);

        } while (true);

        return search;
    }

    private static int inputNumber(Scanner scanner) {
        int input = 0;
        int lowNumber = 1;
        int highNumber = menus.length;

        while (true) {
            try {
                input = Integer.parseInt(scanner.nextLine());
                if (input <= highNumber && input >= lowNumber) {
                    return input;
                } else {
                    System.out.print(lowNumber + " ~ " + highNumber + " 사이의 숫자를 입력하세요 > ");
                }
            } catch (NumberFormatException e) {
                System.out.print("숫자로 입력하세요 > ");
            }
        }
    }

    private static String input(int menu, Scanner scanner) {
        String result = "";

        if (menu != 9)
            result = searchData(scanner, menu);

        return result;
    }

    private static String searchData(Scanner scanner, int menu) {
        String menuName = menus[menu - 1];
        System.out.print("조회할 " + menuName + "를(을) 입력하세요 > ");

        return scanner.nextLine();
    }

    private static void search(String[] search_word) {
        DAO dao = new DAO();

        ArrayList<Emp> list = dao.search(search_word);

        System.out.println("✨EMP 테이블 조회결과✨");
        if (list.isEmpty()) {
            System.out.println("검색 결과가 없습니다.");
        } else {
            System.out.printf("%s\t%s\t%s\t\t\t\t %s\t%s\t\t\t%s\t\t%s\t%s\t\n"
                    , menus[0], menus[1], menus[2], menus[3]
                    , menus[4], menus[5], menus[6], menus[7]);
            for (Emp s : list) {
                System.out.println(s.toString());
            }
        }
    }
}