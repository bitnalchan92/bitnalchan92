package assignment.printscoreboard;

import java.util.Arrays;
import java.util.Comparator;

public class PrintScoreBoard {
    public static void main(String[] args) {
        Student[] students = {
                new Student("강호동", 85, 60, 70)
                , new Student("이승기", 90, 95, 80)
                , new Student("유재석", 75, 80, 100)
                , new Student("하하", 80, 72, 95)
                , new Student("이광수", 100, 65, 80)
        };
        String[] sub_name = {"국어", "영어", "수학"};

        SortingConditionType sortingConditionType = SortingConditionType.MATH;
        boolean ascending = false; // true: 오름차순, false: 내림차순

        printHeader(sub_name);

        ScoreData[] scoreData = getScoreData(students, sortingConditionType, ascending);
        printBody(scoreData);

        int[] subject = calcSubjectTotal(students);
        printFooter(subject);
    }

    /**
     * 학생정보 및 총점과 평균을 가진 ScoreData[]를 정렬 후 반환하는 함수
     */
    private static ScoreData[] getScoreData(Student[] students, SortingConditionType sortingConditionType, boolean ascending) {
        ScoreData[] result = new ScoreData[students.length];

        for (int i = 0; i < students.length; i++) {
            Student student = students[i];
            ScoreData scoreData = new ScoreData(student, student.getTotal(), student.getAverage());

            result[i] = scoreData;
        }

        sortScoreData(sortingConditionType, ascending, result);

        return result;
    }

    /**
     * 만들어진 데이터를 특정 조건에 따라 정렬해주는 함수
     */
    private static void sortScoreData(SortingConditionType sortingConditionType, boolean ascending, ScoreData[] scoreData) {
        switch (sortingConditionType.getValue()) {
            case "name" -> {
                if (ascending) {
                    Arrays.sort(scoreData, Comparator.comparing(scoreData2 -> scoreData2.student.name));
                } else {
                    Arrays.sort(scoreData, (scoreData1, scoreData2) -> scoreData2.student.name.compareTo(scoreData1.student.name));
                }
            }
            case "kor" -> {
                if (ascending) {
                    Arrays.sort(scoreData, Comparator.comparingInt(scoreData2 -> scoreData2.student.kor));
                } else {
                    Arrays.sort(scoreData, (scoreData1, scoreData2) -> Integer.compare(scoreData2.student.kor, scoreData1.student.kor));
                }
            }
            case "eng" -> {
                if (ascending) {
                    Arrays.sort(scoreData, Comparator.comparingInt(scoreData2 -> scoreData2.student.eng));
                } else {
                    Arrays.sort(scoreData, (scoreData1, scoreData2) -> Integer.compare(scoreData2.student.eng, scoreData1.student.eng));
                }
            }
            case "math" -> {
                if (ascending) {
                    Arrays.sort(scoreData, Comparator.comparingInt(scoreData2 -> scoreData2.student.math));
                } else {
                    Arrays.sort(scoreData, (scoreData1, scoreData2) -> Integer.compare(scoreData2.student.math, scoreData1.student.math));
                }
            }
            case "total" -> {
                if (ascending) {
                    Arrays.sort(scoreData, Comparator.comparingInt(scoreData2 -> scoreData2.total));
                } else {
                    Arrays.sort(scoreData, (scoreData1, scoreData2) -> Integer.compare(scoreData2.total, scoreData1.total));
                }
            }
            case "average" -> {
                if (ascending) {
                    Arrays.sort(scoreData, (scoreData1, scoreData2) -> Float.compare(scoreData1.average, scoreData2.average));
                } else {
                    Arrays.sort(scoreData, (scoreData1, scoreData2) -> Float.compare(scoreData2.average, scoreData1.average));
                }
            }
            default ->
                    throw new IllegalArgumentException("Invalid sorting sortCondition: " + sortingConditionType.getValue());
        }
    }

    /**
     * 과목별 총점을 계산 후 int[]를 반환하는 함수
     */
    private static int[] calcSubjectTotal(Student[] students) {
        int korTotal = 0;
        int engTotal = 0;
        int mathTotal = 0;

        for (Student student : students) {
            korTotal += student.kor;
            engTotal += student.eng;
            mathTotal += student.math;
        }

        return new int[]{korTotal, engTotal, mathTotal};
    }

    /**
     * 점수표 헤더에 제목과 점수 분류명을 콘솔에 출력해주는 함수
     */
    private static void printHeader(String[] sub_name) {
        System.out.println("============ 학생별 / 과목별 총점구하기 ============");
        System.out.print("\t\t");
        for (String subject_name : sub_name) {
            System.out.print(subject_name + "\t\t");
        }
        System.out.println("총점\t\t평균\t");
    }

    /**
     * 조건에 따라 정렬이 완료된 학생의 점수 데이터를 콘솔에 출력하는 함수
     */
    private static void printBody(ScoreData[] scoreData) {
        for (ScoreData data : scoreData) {
            String originalName = data.student.name;
            String name = originalName.length() == 3 ? originalName : originalName + " ";
            int totalScore = data.getTotal();
            float averageScore = data.getAverage();

            System.out.print(name + "\t");
            System.out.print(data.student.kor + "\t\t");
            System.out.print(data.student.eng + "\t\t");
            System.out.print(data.student.math + "\t\t");
            System.out.print(totalScore + "\t\t");
            System.out.printf("%.1f\n", averageScore);
        }
    }

    /**
     * 점수표 하단 표기될 과목별 총점을 콘솔에 출력하는 함수
     */
    private static void printFooter(int[] subject) {
        System.out.println("===============================================");
        System.out.print("총점 \t");
        for (int sub_total_score : subject) {
            System.out.print(sub_total_score + "\t\t");
        }
    }
}
