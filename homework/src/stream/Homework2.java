package stream;

import java.util.Arrays;
import java.util.List;

/*TODO
    List<String> myList = Arrays.asList("test2.java","test.java", "test2.java", "test.txt", "test.txt", "hta");

    첫줄 조건)
    1. 확장자가 있는 파일만 필터링합니다.(점이 있는지 판단)
    2. 필터링 후 모두 대문자로 만들기
    3. 정렬하기
    4. 리스트로 만들기

    두번째줄 조건)
    1. 확장자가 있는 파일만 필터링합니다.(점이 있는지 판단)
    2. 필터링 후 모두 소문자로 만들기
    3. 중복제거
    4. 정렬하기
    5. 리스트로 만들기

    출력결과)
    [TEST.JAVA, TEST.TXT, TEST.TXT, TEST2.JAVA, TEST2.JAVA]
    [test.java, test.txt, test2.java]
 */
public class Homework2 {
    public static void main(String[] args) {
        List<String> myList = Arrays.asList("test2.java", "test.java", "test2.java", "test.txt", "test.txt", "hta");

        List<String> list1 = myList.stream()
                .filter((ele) -> ele.lastIndexOf(".") != -1) // .filter((ele) -> ele.indexOf(".") != -1)
                .map(String::toUpperCase)
                .sorted()
                .toList(); // collect(Collectors.toList()); // 최종결과를 리스트로 만듭니다.
        System.out.println(list1);


        List<String> list2 = myList.stream()
                .filter((ele) -> ele.lastIndexOf(".") != -1)
                .map(String::toLowerCase)
                .distinct()
                .sorted()
                .toList();
        System.out.println(list2);
    }
}
