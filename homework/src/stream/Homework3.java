package stream;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/*
    List<String> myList = Arrays.asList("CLERK", "SALESMAN", "MANAGER", "ANALYST", "PRESIDENT", "SALESMAN",
                    "ANALYST");
    문제)
    1. job에 대한 인원 수 구하기 - 리스트의 크기 구하기
    2. job의 종류를 중복 제거하고 출력
    3. job의 종류를 중복 제거 후 오름차순 정렬 출력
    4. job의 갯수 구하기


    출력결과)
    7명
    [CLERK, SALESMAN, MANAGER, ANALYST, PRESIDENT]
    [ANALYST, CLERK, MANAGER, PRESIDENT, SALESMAN]
    5
 */
public class Homework3 {
    public static void main(String[] args) {
        List<String> myList = Arrays.asList(
                "CLERK", "SALESMAN", "MANAGER", "ANALYST", "PRESIDENT", "SALESMAN", "ANALYST");

        System.out.println(myList.size() + "명");

        List<String> list1 = myList.stream()
                .distinct()
                .collect(Collectors.toList());
        System.out.println(list1);

        List<String> list2 = list1.stream()
                .sorted()
                .collect(Collectors.toList());
        System.out.println(list2);

        System.out.println(list1.size());
    }
}
