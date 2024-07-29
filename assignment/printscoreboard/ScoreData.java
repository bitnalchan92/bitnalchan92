package assignment.printscoreboard;

public class ScoreData {
    Student student; // Student
    int total; // 총점
    float average; // 평균

    public ScoreData(Student student, int total, float average) {
        this.student = student;
        this.total = total;
        this.average = average;
    }

    public Student getStudent() {
        return student;
    }

    public int getTotal() {
        return total;
    }

    public float getAverage() {
        return average;
    }

}
