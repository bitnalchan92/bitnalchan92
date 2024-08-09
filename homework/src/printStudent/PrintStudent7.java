package printStudent;

import java.io.*;
import java.util.ArrayList;
import java.util.Collections;

public class PrintStudent7 {
    public static void main(String[] args) {
        ArrayList<Student7> list = new ArrayList<>();
        input(list);
        Collections.sort(list);
        print(list);
    }

    private static void input(ArrayList<Student7> studentArr) {
        String filePath = "src/printStudent/jumsu.txt";
        String message;

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            while ((message = reader.readLine()) != null) {
                String[] data = message.split(" ");

                String name = data[0];
                int kor = Integer.parseInt(data[1]);
                int eng = Integer.parseInt(data[2]);
                int math = Integer.parseInt(data[3]);

                studentArr.add(new Student7(name, kor, eng, math));
            }
        } catch (FileNotFoundException fnfe) {
            System.out.println("파일이 존재하지 않습니다.");
        } catch (IOException ioe) {
            System.out.println("파일을 읽을 수 없습니다.");
        }
    }

    private static void print(ArrayList<Student7> studentArr) {
        System.out.println("============ 학생별 / 과목별 총점구하기 =================");
        System.out.println("\t\t\t국어\t\t영어\t\t수학\t\t총점\t\t평균");

        for (Student7 student : studentArr) {
            System.out.println(student);
        }

        System.out.println("====================================================");
        System.out.print("총점 \t\t");
        System.out.print(Student7.korTotal + "\t\t" + Student7.engTotal + "\t\t" + Student7.mathTotal);
    }
}
