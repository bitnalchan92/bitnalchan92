package printScoreBoard;

/**
 * 정렬된 점수 데이터 및 과목별 총점을 가지고 콘솔에 출력하는 Class입니다.
 */
public class ScorePrinter {
    static void printer(ScoreData[] scoreData) {
        // Header
        System.out.println("============ 학생별 / 과목별 총점구하기 ============");
        System.out.println("\t\t국어\t\t영어\t\t수학\t\t총점\t\t평균");

        // Body
        for (ScoreData data : scoreData) {
            System.out.println(data);
        }

        // Footer
        System.out.println("===============================================");
        System.out.print("총점 \t");
        System.out.print(Student.korTotal + "\t\t" + Student.engTotal + "\t\t" + Student.mathTotal);
    }
}
