package printClock;

import java.text.SimpleDateFormat;

public class PrintClock {
    public static void main(String[] args) {
        System.out.println("===================== 1. 클래스 상속 =================");
        TimeThread1 thread1 = new TimeThread1();
        thread1.start();

        System.out.println("=================== 2. 인터페이스 구현 ================");
        TimeThread2 timeThread2 = new TimeThread2();
        Thread thread2 = new Thread(timeThread2);
        thread2.start();

        System.out.println("=================== 3. 익명클래스 사용 ================");
        Thread thread3 = new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                long time = System.currentTimeMillis();

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 HH시 mm분 ss초");
                System.out.println(sdf.format(time));

                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    System.out.println(e.getMessage());
                }
            }
        });
        thread3.start();
    }
}
