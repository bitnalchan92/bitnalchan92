package printClock;

import java.text.SimpleDateFormat;

public class TimeThread1 extends Thread {
    @Override
    public void run() {
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
    }
}
