package printClock;

public class TimeThread1 extends Thread {
    private SharedArea sharedArea;

    TimeThread1(SharedArea sharedArea) {
        this.sharedArea = sharedArea;
    }

    @Override
    public void run() {
        System.out.println("============== 1. Thread 클래스 상속 ===================");
        for (int i = 0; i < 5; i++) {
            long time = System.currentTimeMillis();
            System.out.println(SharedArea.SIMPLE_DATE_FORMAT.format(time));

            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                System.out.println(e.getMessage());
            }
        }

        this.sharedArea.setIsDoneTh1(true);

        synchronized (this.sharedArea) {
            this.sharedArea.notify();
        }
    }
}
