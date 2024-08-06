package printStudent;

import java.util.ArrayList;

class Student5 {
    String name; // 이름
    int kor, eng, math;// 국어, 영어, 수학
    static int korTotal, mathTotal, engTotal; //각 과목 별 총합

    Student5(String name, int kor, int eng, int math) {
        this.name = name;
        this.kor = kor;
        this.eng = eng;
        this.math = math;
        korTotal += kor;
        engTotal += eng;
        mathTotal += math;
    }

    int getTotal() {
        return this.kor + this.eng + this.math;
    }

    float getAverage() {
        return Math.round(this.getTotal() / 3f * 10) / 10f;
    }

    static void sort(ArrayList<Student5> studentArr) {
        for (int i = 0; i < studentArr.size(); i++) {
            for (int j = i + 1; j < studentArr.size(); j++) {
                if (studentArr.get(i).getTotal() < studentArr.get(j).getTotal()) {
                    Student5 temp = studentArr.get(i);
                    studentArr.set(i, studentArr.get(j));
                    studentArr.set(j, temp);
                }
            }
        }
    }

    public String toString() {
        String justifiedName = this.name.getBytes().length >= 9 ? this.name : (this.name + "\t");

        return justifiedName + "\t\t" + this.kor + "\t\t" + this.eng + "\t\t" + this.math
                + "\t\t" + this.getTotal() + "\t\t" + this.getAverage();
    }
}