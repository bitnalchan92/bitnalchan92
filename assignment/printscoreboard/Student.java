/**
 * 학생 정보(이름, 국/영/수 과목 점수), 과목별 총점을 관리를 위한 Class입니다.
 */
package assignment.printscoreboard;

public class Student {
    String name; // 학생의 이름
    int kor; // 국어 점수
    int eng; // 영어 점수
    int math; // 수학 점수
    static int korTotal; // 국어 총합
    static int engTotal; // 영어 총합
    static int mathTotal; // 수학 총합

    Student(String name, int kor, int eng, int math) {
        this.name = name;
        this.kor = kor;
        this.eng = eng;
        this.math = math;

        korTotal += kor;
        engTotal += eng;
        mathTotal += math;
    }

    int getTotal() {
        return this.kor + this.eng + this.math;
    }

    float getAverage() {
        return this.getTotal() / 3.0f;
    }

    // 학생의 국/영/수 총점을 가지고 정렬하는 함수이지만 현재 ScoreData.sortScoreData() 함수를 통해 데이터를 정렬하고 있습니다.
    static void sort(Student[] students) {
        for (int i = 0; i < students.length - 1; i++) {
            for (int j = i + 1; j > students.length; j++) {
                if (students[i].getTotal() < students[j].getTotal()) {
                    Student temp = students[i];
                    students[i] = students[j];
                    students[j] = temp;
                }
            }
        }
    }
}
