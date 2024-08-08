package printClock;

public class PrintClock {
    public static void main(String[] args) {
        /*
        공유데이터를 관리하는 객체 생성
         */
        SharedArea sharedArea = new SharedArea();

        /*
        Thread 클래스를 상속받아 시간을 출력하는 쓰레드
         */
        TimeThread1 thread1 = new TimeThread1(sharedArea);
        thread1.start();

        /*
        Runnable interface를 구현하여 시간을 출력하는 쓰레드
         */
        TimeThread2 timeThread2 = new TimeThread2(sharedArea);
        Thread thread2 = new Thread(timeThread2);
        thread2.start();

        /*
        익명클래스를 만든 후 람다로 시간을 출력하는 쓰레드
         */
        Thread thread3 = new Thread(() -> {
            if (!sharedArea.getIsDoneTh1() || !sharedArea.getIsDoneTh2()) {
                try {
                    synchronized (sharedArea) {
                        sharedArea.wait();
                    }
                } catch (InterruptedException e) {
                    System.out.println(e.getMessage());
                }
            }

            System.out.println("============== 3. 람다로 표현 ==========================");
            for (int i = 0; i < 5; i++) {
                long time = System.currentTimeMillis();
                System.out.println(SharedArea.SIMPLE_DATE_FORMAT.format(time));

                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    System.out.println(e.getMessage());
                }
            }
            sharedArea.setIsDoneTh3(true);

            synchronized (sharedArea) {
                sharedArea.notify();
            }
        });
        thread3.start();

        /*
        모든 처리가 완료되면 공유공간에서 보관 중인 쓰레드별 처리결과를 출력하는 쓰레드
         */
        Thread thread4 = new Thread(() -> {
            if (!sharedArea.getIsDoneTh1() || !sharedArea.getIsDoneTh2()) {
                try {
                    synchronized (sharedArea) {
                        sharedArea.wait();
                    }
                } catch (InterruptedException e) {
                    System.out.println(e.getMessage());
                }
            }

            System.out.println("============== 4. 쓰레드 처리 결과 ======================");
            sharedArea.print();
        });
        thread4.start();
    }
}
