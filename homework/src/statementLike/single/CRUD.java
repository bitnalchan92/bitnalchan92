package statementLike.single;

import java.util.ArrayList;
import java.util.Scanner;

public class CRUD {
    static String[] menus = {"사원번호", "사원이름", "직급", "매니저", "입사일자", "급여", "커미션", "부서번호", "종료"};

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int menu = menuSelect(scanner);
        String searchWord = input(menu, scanner);

        search(menu, searchWord);
    }

    private static int menuSelect(Scanner scanner) {
        System.out.println("✨EMP 테이블 조회 조건✨");
        int i = 0;
        for (String m : menus) {
            System.out.println(++i + "." + m);
        }

        System.out.print("조회할 컬럼을 선택하세요 > ");

        return inputNumber(scanner);
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

    private static void search(int menu, String searchWord) {
        DAO dao = new DAO();

        ArrayList<Emp> list = dao.search(menu, searchWord);

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