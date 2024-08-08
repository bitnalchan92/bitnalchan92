package printClock;

public class TimeThread2 implements Runnable {
    private SharedArea sharedArea;

    TimeThread2(SharedArea sharedArea) {
        this.sharedArea = sharedArea;
    }

    @Override
    public void run() {
        if (!this.sharedArea.getIsDoneTh1()) {
            try {
                synchronized (this.sharedArea) {
                    this.sharedArea.wait();
                }
            } catch (InterruptedException e) {
                System.out.println(e.getMessage());
            }
        }

        System.out.println("============== 2. Runnable 인터페이스 구현 ==============");
        for (int i = 0; i < 5; i++) {
            long time = System.currentTimeMillis();
            System.out.println(SharedArea.SIMPLE_DATE_FORMAT.format(time));
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                System.out.println(e.getMessage());
            }
        }

        this.sharedArea.setIsDoneTh2(true);

        synchronized (this.sharedArea) {
            this.sharedArea.notify();
        }
    }
}
