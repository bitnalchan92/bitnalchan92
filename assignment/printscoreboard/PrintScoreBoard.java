package assignment.printscoreboard;

public class PrintScoreBoard {
    public static void main(String[] args) {
        Student[] students = {
                new Student("강호동", 85, 60, 70)
                , new Student("이승기", 90, 95, 80)
                , new Student("유재석", 75, 80, 100)
                , new Student("하하", 80, 72, 95)
                , new Student("이광수", 100, 65, 80)
        };

        SortingConditionType sortingConditionType = SortingConditionType.TOTAL;
        boolean ascending = true; // true: 오름차순, false: 내림차순

        ScoreData[] scoreData = ScoreData.getScoreData(students, sortingConditionType, ascending);
        ScorePrinter.printer(scoreData);
    }
}