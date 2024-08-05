package clone;

public class CloneTest {
    public static void main(String[] args) {
        Address address1 = new Address("123 Street", "City");
        Person p1 = new Person("Alice", 30, address1);
        Person p2 = new Person("Alice", 30, address1);
        Person p3 = new Person("Bob", 25, new Address("456 Avenue", "Town"));

        // equals() 테스트
        System.out.println(p1.equals(p2));
        System.out.println(p1.equals(p3));

        // toString() 테스트
        System.out.println(p1);

        Person p4 = p1.clone();
        System.out.println(p4.equals(p1));
        System.out.println(p4);
        System.out.println(p4.address == p1.address);
    }
}
