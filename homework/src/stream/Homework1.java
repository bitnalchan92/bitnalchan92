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
/*
    1. list.stream()을 통해 리스트의 스트림을 생성합니다.
    2. mapToInt(Member::getAge)
        스트림의 각 Member 객체에 대해 getAge 메서드를 호출하여 나이를 정수(int)로 매핑합니다.
        이 단계에서는 Member 객체의 스트림을 IntStream으로 변환합니다.
        IntStream은 Java의 스트림 API에서 기본형 int를 위한 특화된 스트림 타입입니다.
        LongStream, DoubleStream 등의 특화된 스트림을 제공합니다.
    3. average()를 호출하여 스트림의 요소들의 평균을 계산하고 OptionalDouble로 반환합니다.
        이는 평균값이 없을 경우(예: 스트림이 비어 있는 경우)를 대비하기 위함입니다.
    4. getAsDouble()을 통해 OptionalDouble에서 실제 평균값을 추출합니다.
        만약 평균값이 존재하지 않을 경우(예: 스트림이 비어 있는 경우) 예외가 발생합니다.
 */
public class Homework1 {
    public static void main(String[] args) {
        List<Member> list = new ArrayList<>();
        list.add(new Member("홍길동", 21));
        list.add(new Member("자바", 30));
        list.add(new Member("이순신", 30));

        Stream<Integer> stream = list.stream().map(Member::getAge);

        OptionalDouble averageAge = stream.mapToInt(Integer::intValue).average();
        /*
            IntStream intStream = list.stream().mapToInt(Member::getAge);
            OptionalDouble averageAge = intStream.average();
         */

        if (averageAge.isPresent()) {
            System.out.println(averageAge.getAsDouble());
        } else {
            System.out.println("사용가능한 평균 값이 없습니다.");
        }
    }
}