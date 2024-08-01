/**
 * 학생들의 점수 정보를 가지고 콘솔에 출력하는데 필요한 데이터를 위한 Class입니다.
 */
package printScoreBoard;

import java.util.Arrays;
import java.util.Comparator;

public class ScoreData {
    Student student; // Student ( Student class와 ScoreData class는 포함관계(Composite) )
    int total; // 총점
    float average; // 평균

    public ScoreData(Student student, int total, float average) {
        this.student = student;
        this.total = total;
        this.average = average;
    }

    public int getTotal() {
        return total;
    }

    public float getAverage() {
        return average;
    }

    /**
     * 학생정보 및 총점과 평균을 가진 ScoreData[]를 정렬 후 반환하는 함수
     */
    static ScoreData[] getScoreData(Student[] students, SortingConditionType sortingConditionType, boolean ascending) {
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
    static void sortScoreData(SortingConditionType sortingConditionType, boolean ascending, ScoreData[] scoreData) {
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
}
