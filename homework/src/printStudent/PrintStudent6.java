package printStudent;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class PrintStudent6 {
    public static void main(String[] args) {
        ArrayList<Student6> list = new ArrayList<>();
        input(list);

        // 자바에서 리스트를 정렬하기 위해 사용되는 메서드입니다.
        // 이 메서드는 java.util.Collections 클래스에 속하며 리스트의 요소들을 정렬 규칙에 따라 정렬합니다.(오름차순 또는 내림차순)
        Collections.sort(list);
        print(list);
    }

    private static void input(ArrayList<Student6> studentArr) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.print("이름을 입력하세요 > ");
            String name = sc.nextLine();
            System.out.print("국어 점수를 입력하세요 > ");
            int kor = inputNumber(sc, 0, 100);
            System.out.print("영어 점수를 입력하세요 > ");
            int eng = inputNumber(sc, 0, 100);
            System.out.print("수학 점수를 입력하세요 > ");
            int math = inputNumber(sc, 0, 100);

            studentArr.add(new Student6(name, kor, eng, math));

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

    private static void print(ArrayList<Student6> studentArr) {
        System.out.println("============ 학생별 / 과목별 총점구하기 =================");
        System.out.println("\t\t\t국어\t\t영어\t\t수학\t\t총점\t\t평균");

        for (Student6 student : studentArr) {
            System.out.println(student);
        }

        System.out.println("====================================================");
        System.out.print("총점 \t\t");
        System.out.print(Student6.korTotal + "\t\t" + Student6.engTotal + "\t\t" + Student6.mathTotal);
    }
}
