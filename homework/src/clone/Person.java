package clone;

public class Person implements Cloneable {
    String name;
    int age;
    Address address;

    public Person(String name, int age, Address address) {
        this.name = name;
        this.age = age;
        this.address = address;
    }

    @Override
    public String toString() {
        return "Person{name='" + this.name + "', age=" + this.age + ", address=" + this.address + "}";
    }

    @Override
    public boolean equals(Object obj) {
        if (obj != null && obj instanceof Person) {
            Person obj2 = (Person) obj;
            return this.name.equals(obj2.name) && this.age == obj2.age && this.address.equals(obj2.address);
        } else {
            return false;
        }
    }

    @Override
    public Person clone() {
        try {
            Person clone = (Person) super.clone();
            clone.address = new Address(this.address.street, this.address.city);
            return clone;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError();
        }
    }
}