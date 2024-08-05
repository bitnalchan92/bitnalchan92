package printCalendar;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Scanner;

public class PrintCalendar {

    public static void main(String[] args) {
        /*
        1. 출력하고자 하는 연도 / 월 입력받기
         */
        int[] yearAndMonth;
        try {
            yearAndMonth = requestYearAndMonth();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return;
        }
        int year = yearAndMonth[0];
        int month = yearAndMonth[1];

        /*
        2. 달력 출력에 필요한 변수 생성
         */
        // YearMonth 객체 생성
        YearMonth yearMonth = YearMonth.of(year, month);
        // 해당 연/월의 일수
        int cntOfMonth = yearMonth.lengthOfMonth();
        // 해당 연/월/일의 시작일 객체 생성
        LocalDate firstDayOfMonth = yearMonth.atDay(1);
        // 해당 연/월/일의 시작일의 요일
        DayOfWeek firstDayOfWeek = firstDayOfMonth.getDayOfWeek();

        /*
        3. 달력 헤더 출력
         */
        printCalendarHeader(year, month);

        /*
        4. 달력 일 출력
         */
        printCalendarDay(cntOfMonth, firstDayOfWeek);
    }

    private static int[] requestYearAndMonth() throws Exception {
        try {
            int[] result = new int[2];

            Scanner scanner = new Scanner(System.in);
            System.out.println("================================================");
            System.out.print("> 출력하고자 하는 달력의 \"연도\"를 입력해주세요 ~> ");
            result[0] = scanner.nextInt();

            System.out.print("> 출력하고자 하는 달력의 \"월\"를 입력해주세요 ~> ");
            result[1] = scanner.nextInt();
            System.out.println("================================================");
            scanner.close();

            return result;
        } catch (Exception e) {
            throw new Exception("연도/월은 숫자 입력만 가능합니다.");
        }
    }

    private static void printCalendarDay(int cntOfMonth, DayOfWeek day) {
        int spaceCount = getNumOfDay(day);
        while (spaceCount > 0) {
            System.out.print("\t");
            spaceCount--;
        }

        final int DATE_PER_ROW = 7; // 한 줄에 표기하는 날짜의 수
        for (int i = 1; i <= cntOfMonth; i++) {
            System.out.print(i + "\t");
            if ((i + getNumOfDay(day)) % DATE_PER_ROW == 0) System.out.println();
        }
    }

    private static int getNumOfDay(DayOfWeek day) {
        return switch (day.toString()) {
            case "SUNDAY" -> 0;
            case "MONDAY" -> 1;
            case "TUESDAY" -> 2;
            case "WEDNESDAY" -> 3;
            case "THURSDAY" -> 4;
            case "FRIDAY" -> 5;
            case "SATURDAY" -> 6;
            default -> throw new IllegalArgumentException("Unexpected value: " + day);
        };
    }

    private static void printCalendarHeader(int year, int month) {
        String title = "<< " + year + "년 " + month + "월 >>";
        String dayName = "일\t월\t화\t수\t목\t금\t토";
        int emptySpace = ((27 - title.length()) / 2);
        for (int i = 0; i < emptySpace; i++) {
            System.out.print(" ");
        }
        System.out.println(title);
        System.out.println(dayName);
    }
}