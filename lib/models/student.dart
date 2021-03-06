class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String status;
  late String image;

  Student.withId(
      int _id, String _name, String _lastName, int _grade, String _image) {
    id = _id;
    firstName = _name;
    lastName = _lastName
        .toUpperCase(); //Soyadları küçük harfle girilmiş olsa bile uppercase ile tamamı büyük harfle yazdırılıyor
    grade = _grade;
    status = "Geçti";
    image = _image;
  }

  Student(String _name, String _lastName, int _grade, String _image) {
    firstName = _name;
    lastName = _lastName
        .toUpperCase(); //Soyadları küçük harfle girilmiş olsa bile uppercase ile tamamı büyük harfle yazdırılıyor
    grade = _grade;
    status = "Geçti";
    image = _image;
  }

  Student.withOutInfo() {
    firstName = "";
    lastName = "";
    grade = 0;
    image = "";
  }

  String get getStatus {
    String outputText = "";
    if (grade >= 50) {
      outputText = "Geçti";
    } else if (grade >= 40) {
      outputText = "Bütünlemeye Kaldı";
    } else {
      outputText = "Kaldı";
    }
    return outputText;
  }
}
