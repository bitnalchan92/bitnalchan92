package printClock;

import java.text.SimpleDateFormat;

public class PrintClock_TEST {
    public static void main(String[] args) {
        Thread time = new Thread() {
            public void run() {
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy년 MM월 dd일 a HH시 mm분 ss초 EEEE");

                while (true) {
                    long time1 = System.currentTimeMillis(); // 현재 시각 측정
                    System.out.println(sdf1.format(time1));

                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException ie) {
                        System.out.println(ie.toString());
                    }
                }
            }
        };

        time.start();
    }
}
