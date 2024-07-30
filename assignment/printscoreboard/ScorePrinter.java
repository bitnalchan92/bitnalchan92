package assignment.printscoreboard;

/**
 * 정렬된 점수 데이터 및 과목별 총점을 가지고 콘솔에 출력하는 Class입니다.
 */
public class ScorePrinter {
    static void printer(ScoreData[] scoreData) {
        // Header
        System.out.println("============ 학생별 / 과목별 총점구하기 ============");
        System.out.print("\t\t");
        for (String subject_name : new String[]{"국어", "영어", "수학"}) {
            System.out.print(subject_name + "\t\t");
        }
        System.out.println("총점\t\t평균\t");

        // Body
        for (ScoreData data : scoreData) {
            String originalName = data.student.name;
            String name = originalName.length() == 3 ? originalName : originalName + " "; // intellij 콘솔 특성때문에 이름 길이 조정

            System.out.print(name + "\t");
            System.out.print(data.student.kor + "\t\t");
            System.out.print(data.student.eng + "\t\t");
            System.out.print(data.student.math + "\t\t");
            System.out.print(data.getTotal() + "\t\t");
            System.out.printf("%.1f\n", data.getAverage());
        }

        // Footer
        System.out.println("===============================================");
        System.out.print("총점 \t");
        System.out.print(Student.korTotal + "\t\t" + Student.engTotal + "\t\t" + Student.mathTotal);
    }
}
