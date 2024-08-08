package printClock;

import java.text.SimpleDateFormat;

public class SharedArea {
    public static final SimpleDateFormat SIMPLE_DATE_FORMAT = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 HH시 mm분 ss초");
    private boolean isDoneTh1;
    private boolean isDoneTh2;
    private boolean isDoneTh3;

    SharedArea() {
    }

    public boolean getIsDoneTh1() {
        return this.isDoneTh1;
    }

    public void setIsDoneTh1(boolean isDoneTh1) {
        this.isDoneTh1 = isDoneTh1;
    }

    public boolean getIsDoneTh2() {
        return this.isDoneTh2;
    }

    public void setIsDoneTh2(boolean isDoneTh2) {
        this.isDoneTh2 = isDoneTh2;
    }

    public boolean getIsDoneTh3() {
        return this.isDoneTh3;
    }

    public void setIsDoneTh3(boolean isDoneTh3) {
        this.isDoneTh3 = isDoneTh3;
    }

    public void print() {
        System.out.println("Thread1 is done : " + this.isDoneTh1);
        System.out.println("Thread2 is done : " + this.isDoneTh2);
        System.out.println("Thread3 is done : " + this.isDoneTh3);
    }
}
