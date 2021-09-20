class Student {
  late String firstName;
  late String lastName;
  late int grade;
  late String status;
  late String image;

  Student(String _name, String _lastName, int _grade, String _image) {
    firstName = _name;
    lastName = _lastName
        .toUpperCase(); //Soyadları küçük harfle girilmiş olsa bile uppercase ile tamamı büyük harfle yazdırılıyor
    grade = _grade;
    status = "Geçti";
    image = _image;
  }
}
