class StudentValidationMixin {
  String validateFirstName(String value) {
    if (value.length < 2) {
      print("Hata 2 karakterden az");
      return "İsim en az iki karakter olmalıdır";
    } else {
      return value;
    }
  }

  String validateLastName(String value) {
    if (value.length < 2) {
      print("Hata 2 karakterden az");
      return "Soyisim en az iki karakter olmalıdır";
    } else {
      return value;
    }
  }

  String validateGrade(String value) {
    if (value.length >= 1 && value != null) {
      try {
        int grade = int.parse(value);
        if (grade < 0 || grade > 100) {
          print("Hata 2 karakterden az");
          return "Not 0 ile 100 arasında olmalıdır!";
        } else {
          return value;
        }
      } catch (error) {
        print("Hata Yakalandı! :" + error.toString());
        return "0";
      }
    } else {
      return "0";
    }
  }
}
