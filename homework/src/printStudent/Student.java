package printStudent;

class Student {
    String name; // 이름
    int kor, eng, math;// 국어, 영어, 수학
    static int korTotal, mathTotal, engTotal; //각 과목 별 총합


    Student(String name, int kor, int eng, int math) {
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
        //return (float) (Math.round(getTotal()/3.0*10)/10.0);
    }

    static void sort(Student[] students) {
        for (int i = 0; i < students.length; i++) {
            for (int j = i + 1; j < students.length; j++) {
                if (students[i].getTotal() > students[j].getTotal()) {
                    Student imsi1 = students[i];
                    students[i] = students[j];
                    students[j] = imsi1;
                }
            }
        }
    }

    public String toString() {
        String justifiedName = this.name.length() == 2 ? (this.name + " ") : this.name;
        return justifiedName + "\t\t" + this.kor + "\t\t" + this.eng + "\t\t" + this.math
                + "\t\t" + this.getTotal() + "\t\t" + this.getAverage();
    }
}