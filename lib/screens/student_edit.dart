import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temel_flutter/main.dart';
import 'package:temel_flutter/models/student.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent = new Student.withOutInfo();
  StudentEdit(Student _student) {
    selectedStudent = _student;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent);
  }
}

class _StudentEditState extends State {
  Student selectedStudent = new Student.withOutInfo();
  _StudentEditState(Student _student) {
    selectedStudent = _student;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
          title: Text("Yeni Yıkık Ekle"),
          backgroundColor: Colors.lightGreen.shade300,
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    buildFirstNameField(),
                    buildLastNameField(),
                    buildGradeField(),
                    SizedBox(height: 20),
                    buildSubmitButton()
                  ],
                )),
          ),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(
          label: Text("Yıkık Adı"), hintText: "Kulağına okunan ismi"),
      validator: (ValueKey) {
        //validateFirstName(ValueKey.toString()); // toString ifadesini mecbur ekledim çünkü buraya girilen değer her türlü string olmak zorunda!
        if (ValueKey == null || ValueKey.isEmpty) {
          return "Boş Bırakamazsın bişeyler yaz!";
        } else if (ValueKey.length < 2) {
          return "İsim en az iki karakter olmalıdır";
        }
        return null;
      },
      onSaved: (String? value) {
        print("Save Edildi");
        selectedStudent.firstName = value.toString();
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration:
          InputDecoration(label: Text("Yıkık Soyadı"), hintText: "Evet Soyadı"),
      validator: (ValueKey) {
        if (ValueKey == null || ValueKey.isEmpty) {
          return "Boş Bırakamazsın bişeyler yaz!";
        } else if (ValueKey.length < 2) {
          return "Soyisim en az iki karakter olmalıdır";
        }
        return null;
      },
      onSaved: (String? value) {
        selectedStudent.lastName = value.toString();
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      keyboardType: TextInputType.number, // Burası Sadece numerik klavyeyi açar
      inputFormatters: <TextInputFormatter>[
        // burası ise text input alanına sadece rakam yazabilmeye izin veriyor
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
          label: Text("Aldığı Not"),
          hintText: "100 üzerinden değerlendirilmiş"),
      validator: (ValueKey) {
        int grade = int.parse(ValueKey.toString());
        if (grade < 0 || grade > 100) {
          return "Not 0 ile 100 arasında olmalıdır!";
        } else {
          return null;
        }
      },
      onFieldSubmitted: (String value) {
        print("EditComplete");
      },
      onSaved: (String? value) {
        selectedStudent.grade = int.parse(value.toString());
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Row(
        children: [
          Icon(Icons.save),
          SizedBox(
            width: 20,
          ),
          Text("Kayıt Et")
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          // Null check "!" işareti var dikkatli bak
          formKey.currentState!.save();
          SaveStudent();
          Navigator.pop(context, "Örnek geri dönerken yollanan değer");
        }
      },
    );
  }

  void SaveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}
