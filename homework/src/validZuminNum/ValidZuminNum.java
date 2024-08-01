package validZuminNum;

import java.util.Scanner;

public class ValidZuminNum {
    private static final int ZUMIN_LENGTH = 14;
    private static final int HYPHEN_INDEX = 6;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.print("주민번호 입력 (exit=e) : ");
            String zumin = sc.nextLine();

            if (zumin.equals("e")) {
                System.out.println("종료합니다.");
                return;
            }

            printCheck(zumin);
        }
    }

    public static String getGender(String genderTypeStr) {
        return switch (genderTypeStr) {
            case "1", "3" -> "남자";
            case "2", "4" -> "여자";
            default -> "외국인";
        };
    }

    public static boolean checkLength(String zumin) {
        return zumin.length() == ZUMIN_LENGTH;
    }

    public static boolean checkHyphen(String zumin) {
        return zumin.charAt(HYPHEN_INDEX) == '-';
    }

    public static boolean isNumber(String str) {
        if (str == null || str.isEmpty()) return false;

        for (char c : str.toCharArray()) {
            if (!Character.isDigit(c)) return false;
        }

        return true;
    }

    public static void printCheck(String zumin) {
        if (!checkLength(zumin)) {
            System.out.println("주민번호 길이는 14개 입니다.");
        } else {
            if (!checkHyphen(zumin)) {
                System.out.println("주민번호 형식에 맞지 않습니다.(-위치)");
            } else {
                String frontPart = zumin.substring(0, HYPHEN_INDEX);
                String backPart = zumin.substring(HYPHEN_INDEX + 1);

                if (!isNumber(frontPart)) {
                    System.out.println("앞자리에 숫자를 입력하세요.");
                } else if (!isNumber(backPart)) {
                    System.out.println("뒷자리에 숫자를 입력하세요.");
                } else {
                    String genderType = zumin.substring(HYPHEN_INDEX + 1, 8);
                    String gender = getGender(genderType);
                    System.out.println(gender + "입니다.");
                }
            }
        }
    }
}
