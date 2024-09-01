package stream;

import java.util.ArrayList;
import java.util.List;
import java.util.OptionalDouble;
import java.util.stream.Stream;

/*
TODO
    List<Member> list = new ArrayList<>();
    list.add(new Member("홍길동", 21));
    list.add(new Member("자바", 30));
    list.add(new Member("이순신",30 ));
    문제)
        list에 존재하는 Member 객체들의 나이 평균을 구하세요.
    출력)
        27.0
 */
public class Homework1 {
    public static void main(String[] args) {
        List<Member> list = new ArrayList<>();
        list.add(new Member("홍길동", 21));
        list.add(new Member("자바", 30));
        list.add(new Member("이순신", 30));

        Stream<Integer> stream = list.stream().map(Member::getAge);

        OptionalDouble averageAge = stream.mapToInt(Integer::intValue).average();

        if (averageAge.isPresent()) {
            System.out.println(averageAge.getAsDouble());
        } else {
            System.out.println("사용가능한 평균 값이 없습니다.");
        }
    }
}