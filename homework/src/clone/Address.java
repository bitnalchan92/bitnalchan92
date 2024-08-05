package clone;

public class Address {
    String street;
    String city;

    public Address(String street, String city) {
        this.street = street;
        this.city = city;
    }

    @Override
    public String toString() {
        return "Address{street='" + this.street + "', city='" + this.city + "'}";
    }

    @Override
    public boolean equals(Object obj) {
        if (obj != null && obj instanceof Address) {
            Address obj2 = (Address) obj;
            return this.street.equals(obj2.street) && this.city.equals(obj2.city);
        } else {
            return false;
        }
    }
}
