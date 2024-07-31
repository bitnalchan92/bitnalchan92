# System.out.println();

## 주요 특징

1. 표준 출력 스트림 : `System.out` 은 `PrintStream` 객체로, 기본적으로 콘솔에 데이터를 출력합니다.

2. 줄 바꿈 추가 : `println()` 메서드는 출력한 후 자동으로 줄 바꿈 문자를 추가합니다. 줄바꿈 문자는 시스템 속성 `line.separator` 에 의해 정의됩니다.

3. 자동 플러시 : `println()` 메서드는 호출될 때마다 자동으로 출력 스트림을 플러시합니다. 이는 데이터를 버퍼에 저장하지 않고 즉시 출력한다는 의미

   - 참고 사항

     - 스트림을 플러시(flush)한다는 것은 스트림 내부에 버퍼링된 데이터를 강제로 출력 장치나 저장장치로 내보내는 것을 의미함

     - 성능 향상과, 데이터 완전성 측면에서 필요성을 가집니다.

       ``` java
       // PrintStream.java
           private void write(char[] buf) {
               try {
                   synchronized (this) {
                       ensureOpen();
                       textOut.write(buf);
                       textOut.flushBuffer();
                       charOut.flushBuffer();
                       if (autoFlush) {
                           for (int i = 0; i < buf.length; i++)
                               if (buf[i] == '\n') {
                                   out.flush(); // <== flush() 함수 참고
                                   break;
                               }
                       }
                   }
               } catch (InterruptedIOException x) {
                   Thread.currentThread().interrupt();
               } catch (IOException x) {
                   trouble = true;
               }
           }
       ```

       



## 1. `System`

- `java.lang package`에 속한 클래스입니다.
  - `java.lang package`에는 자바 프로그래밍 언어 설계에 근간이 되는 클래스들을 제공하는 패키지입니다.
    ( `Object class`도 이 패키지에 속해있음 )
- `Object class` 를 상속받았으며 `final`로 선언되어 있으며, 따라서 변경될 수 없는 클래스 & 확장될 수 없는 클래스가 됩니다. ( 따라서, 다른 클래스의 부모(=조상)클래스가 될 수 없음 )
- 주로 표준 입출력, 에러출력 스트림 등 유틸리티성 메서드를 포함하고 있는 클래스입니다.



## 2. `out`

- `out`은 `public static final PrintStream out`으로 `System.java`에 작성되어 있고, `System.out` 은 `PrintStream` 타입의 정적 필드입니다.

  - 표준 출력 스트림이라고 합니다. ( `The "standard" out stream.` & 이미 열려 있으며 출력 데이터를 수신할 준비가 되어 있는.  )

  - 타입은 `PrintStream` 입니다.

    - 다양한 데이터 값을 편리하게 출력할 수 있는 기능을 다른 출력 스트림에 추가하는 기능을 가지고 있는  클래스입니다.

    - `java.io package`에 속하며, 이는 데이터 스트림, 직렬화 및 파일 시스템을 통한 시스템 입출력을 제공하는 패키지입니다.


      ```
      Module java.base
      Package java.io
      
      Class PrintStream
      java.lang.Object
      	java.io.OutputStream
      		java.io.FilterOutputStream
      			java.io.PrintStream
      
      All Implemented Interfaces:
      	Closeable, Flushable, Appendable, AutoCloseable
      ```



## 3. println()

- `PrintStream.java` 작성되어 있는 함수입니다.

  ```java
  // 889행
  public void println() {
  	newLine(); // Terminates the current line by writing the line separator string.
  }
  ```

- 각기 다른 데이터 타입을 처리하도록 오버로드되어 있는데 본 함수 위아래로 참고 할 수 있습니다.
- 현재 줄을 줄 구분자 문자열을 작성하여 종료합니다. 줄 구분자 문자열은 시스템 속성 line.separator에 의해 정의되고, 반드시 단일 줄 바꿈 문자(`\n`)일 필요는 없습니다.