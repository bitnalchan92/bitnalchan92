package assignment.printscoreboard;

public class Student {
    String name; // 학생의 이름
    int kor; // 국어 점수
    int eng; // 영어 점수
    int math; // 수학 점수

    Student(String name, int kor, int eng, int math) {
        this.name = name;
        this.kor = kor;
        this.eng = eng;
        this.math = math;
    }

    int getTotal() {
        return this.kor + this.eng + this.math;
    }

    float getAverage() {
        return this.getTotal() / 3.0f;
    }
}
