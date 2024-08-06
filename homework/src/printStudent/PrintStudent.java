package printStudent;

import java.util.Scanner;

public class PrintStudent {
    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        System.out.print("학생 수를 입력하세요(최대10명) > ");
        int su = inputNumber(sc);

        Student[] arr = new Student[su];
        input(arr, sc);

        Student.sort(arr);
        printStudent(arr);
    }

    private static int inputNumber(Scanner sc) {
        return inputNumber(sc, 1, 10);
    }

    private static int inputNumber(Scanner sc, int minNum, int maxNum) {
        try {
            int result = Integer.parseInt(sc.nextLine());
            if (minNum <= result && result <= maxNum) {
                return result;
            } else {
                System.out.print("1~10 사이의 숫자를 입력하세요 > ");
                return inputNumber(sc);
            }
        } catch (NumberFormatException e) {
            System.out.print("숫자로 입력하세요 > ");
            return inputNumber(sc);
        }
    }

    private static void input(Student[] arr, Scanner sc) {
        for (int i = 0; i < arr.length; i++) {
            System.out.println("============ " + (i + 1) + "번째 사람 ============");
            System.out.print("이름을 입력하세요 > ");
            String name = sc.nextLine();
            System.out.print("국어 점수를 입력하세요 > ");
            int kor = inputNumber(sc, 0, 100);
            System.out.print("영어 점수를 입력하세요 > ");
            int eng = inputNumber(sc, 0, 100);
            System.out.print("수학 점수를 입력하세요 > ");
            int math = inputNumber(sc, 0, 100);

            arr[i] = new Student(name, kor, eng, math);
        }

        sc.close();
    }

    private static void printStudent(Student[] arr) {
        System.out.println("============ 학생별 / 과목별 총점구하기 =================");
        System.out.println("\t\t\t국어\t\t영어\t\t수학\t\t총점\t\t평균");

        // Body
        for (Student student : arr) {
            System.out.println(student);
        }

        // Footer
        System.out.println("====================================================");
        System.out.print("총점 \t\t");
        System.out.print(Student.korTotal + "\t\t" + Student.engTotal + "\t\t" + Student.mathTotal);
    }
}
