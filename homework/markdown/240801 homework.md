```
1. main()메서드
   (1) Scanner 객체 생성합니다.
   (2) 무한 반복 시작합니다. - 3~6 반복합니다.
   (3) "주민번호 입력 (exit=e): "출력합니다.
   (4) 주민번호 입력 받습니다.
   (5) 입력 문자열이 "e"이면 "종료합니다." 출력하고 반복문 벗어납니다.
   (6) printCheck(zumin) 호출합니다.

2. 메서드 이름 : checkLength
   매개변수 : 입력 받은 주민번호(String)
   기능 : 입력받은 주민번호 길이가 14개인지 판단(14개이면 true, 아니면 false)
   반환형 : boolean

3. 메서드 이름 : checkHyphen
   매개변수 : 입력 받은 주민번호(String)
   기능 : 입력받은 주민번호의 7번째 문자가 '-'인지 판단('-'이면 true, 아니면 false)
   반환형 : boolean 
 

4. 메서드 이름 : isNumber
   매개변수 : 입력 받은 주민번호  앞자리 또는 뒷자리(String)
   기능 : 매개변수의 값이 null이거나 ""(빈문자열)이면 false 리턴
          아닌 경우에는 매개변수의 모든 문자가 숫자인지 판단해서 숫자가 아니면 false 리턴
          숫자이면 true 리턴
   반환형 : boolean 
 

5. 메서드 이름 : getGender
   매개변수 : 뒷자리 첫문자를 받는 문자열
   기능 : 매개변수의 값이 "1" 또는 "3"이면 "남자", "2" 또는 "4"이면 "여자" 그 외는 "외국인" 리턴
   반환형 : String
      
6. 메서드 이름 : printCheck
   매개변수 : 입력 받은 주민번호(String)
   기능 : checkLength()가 거짓이면 "주민번호 길이는 14개 입니다."
         checkLength()가 거짓이 아닌 경우 checkHyphen()가 거짓이면 "주민번호 형식에 맞지 않습니다.(-위치)"
         checkHyphen()가 거짓이 아닌 경우 isNumber(앞자리6자리)가 거짓이면 "앞자리에 숫자를 입력하세요"
         isNumber(앞자리6자리)가 거짓이 아닌 경우 isNumber(뒷자리7자리)가 거짓이면 "뒤자리에 숫자를 입력하세요"
         isNumber(뒷자리7자리)가 거짓이 아닌 경우 성별구분짓는 문자 추출해서 판단하는 getGender()호출
   반환형 : void
```

