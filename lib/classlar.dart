void main() {
  PersonelManager pm = PersonelManager();
  pm.Add();

  CustomerManager cm = CustomerManager();
  Customer customer = Customer.withInfo("Akif", "ERSOY");

  cm.Add(customer);

  Customer customer2 = Customer();
  customer2._firstName = "Mehmet";
  customer2._lastName = "ERSOY";
  cm.Add(customer2);
}

class PersonelManager {
  void Add() {
    print("Eklendi");
  }

  void Update() {
    print("Güncellendi");
  }

  void Delete() {
    print("Silindi");
  }
}

class CustomerManager {
  void Add(Customer customer) {
    print(customer._firstName + " Eklendi");
  }

  void Update() {
    print("Güncellendi");
  }

  void Delete() {
    print("Silindi");
  }
}

class Customer {
  late String _firstName;
  late String _lastName;

  Customer() {}

  Customer.withInfo(String firstName, String lastName) {
    _firstName = firstName;
    _lastName = lastName;
  }
}

class Personel extends Person {
  late int _dateOfStart;
  Personel() {}

  Personel.withInfo(String firstName, String lastName, int dateOfStart) {
    _firstName = firstName;
    _lastName = lastName;
    _dateOfStart = dateOfStart;
  }
}

class Person {
  late String _firstName;
  late String _lastName;
}
