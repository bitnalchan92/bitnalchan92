package printStudent;

class Student6 implements Comparable<Student6> {
    String name; // 이름
    int kor, eng, math;// 국어, 영어, 수학
    static int korTotal, mathTotal, engTotal; //각 과목 별 총합

    Student6(String name, int kor, int eng, int math) {
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

    @Override
    public String toString() {
        String justifiedName = this.name.getBytes().length >= 9 ? this.name : (this.name + "\t");

        return justifiedName + "\t\t" + this.kor + "\t\t" + this.eng + "\t\t" + this.math
                + "\t\t" + this.getTotal() + "\t\t" + this.getAverage();
    }

//    @Override
//    public int compareTo(Student6 student) {
    // 오름차순(<), 내림차순(>)
//        if (this.getTotal() > student.getTotal()) {
//            return -1;
//        } else if (this.getTotal() == student.getTotal()) {
//            return 0;
//        } else {
//            return 1;
//        }
//    }
    /*
        자바 7 이상에서는 Integer.compare를 사용하여 간결하게 작성할 수 있다.
        public static int compare ( int x, int y ) {
            return ( x < y ) ? -1 : ( (x==y) ? 0 : 1 );
        }
     */


    public int compareTo(Student6 other) {
        return Integer.compare(other.getTotal(), this.getTotal());
    }

}