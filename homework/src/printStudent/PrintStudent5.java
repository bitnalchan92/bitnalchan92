package printStudent;

import java.util.ArrayList;
import java.util.Scanner;

public class PrintStudent5 {
    public static void main(String[] args) {
        ArrayList<Student5> as = new ArrayList<>();
        input(as);
        Student5.sort(as);
        print(as);
    }

    private static void input(ArrayList<Student5> studentArr) {
        Scanner sc = new Scanner(System.in);

        /*
            String pandan = sc.nextLine();
            while ( !pandan.equalsIgnoreCase("q")) {
                // ...
            }
         */
        while (true) {
            System.out.print("이름을 입력하세요 > ");
            String name = sc.nextLine();
            System.out.print("국어 점수를 입력하세요 > ");
            int kor = inputNumber(sc, 0, 100);
            System.out.print("영어 점수를 입력하세요 > ");
            int eng = inputNumber(sc, 0, 100);
            System.out.print("수학 점수를 입력하세요 > ");
            int math = inputNumber(sc, 0, 100);

            studentArr.add(new Student5(name, kor, eng, math));

            System.out.print("계속 입력하시겠습니까?(q 또는 Q 이면 종료 그 외는 계속) ");

            String command = sc.nextLine();
            if (command.equals("q") || command.equals("Q")) break;
        }

        sc.close();
    }

    private static int inputNumber(Scanner sc) {
        return inputNumber(sc, 0, 100);
    }

    private static int inputNumber(Scanner sc, int minNum, int maxNum) {
        try {
            int result = Integer.parseInt(sc.nextLine());
            if (minNum <= result && result <= maxNum) {
                return result;
            } else {
                System.out.print(minNum + "~" + maxNum + " 사이의 숫자를 입력하세요 > ");
                return inputNumber(sc);
            }
        } catch (NumberFormatException e) {
            System.out.print("숫자로 다시 입력하세요 > ");
            return inputNumber(sc);
        }
    }

    private static void print(ArrayList<Student5> studentArr) {
        System.out.println("============ 학생별 / 과목별 총점구하기 =================");
        System.out.println("\t\t\t국어\t\t영어\t\t수학\t\t총점\t\t평균");

        for (Student5 student : studentArr) {
            System.out.println(student);
        }

        System.out.println("====================================================");
        System.out.print("총점 \t\t");
        System.out.print(Student5.korTotal + "\t\t" + Student5.engTotal + "\t\t" + Student5.mathTotal);
    }
}
