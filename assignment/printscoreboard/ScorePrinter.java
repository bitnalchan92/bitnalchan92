package assignment.printscoreboard;

public class ScorePrinter {
    static void printer(ScoreData[] scoreData) {
        String[] sub_name = {"국어", "영어", "수학"};

        System.out.println("============ 학생별 / 과목별 총점구하기 ============");
        System.out.print("\t\t");
        for (String subject_name : sub_name) {
            System.out.print(subject_name + "\t\t");
        }
        System.out.println("총점\t\t평균\t");

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

        System.out.println("===============================================");
        System.out.print("총점 \t");
        int[] subject = new int[3];
        int korTotal = 0;
        int engTotal = 0;
        int mathTotal = 0;

        for (ScoreData data : scoreData) {
            korTotal += data.student.kor;
            engTotal += data.student.eng;
            mathTotal += data.student.math;
        }

        subject[0] = korTotal;
        subject[1] = engTotal;
        subject[2] = mathTotal;
        for (int sub_total_score : subject) {
            System.out.print(sub_total_score + "\t\t");
        }
    }
}
