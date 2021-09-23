import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temel_flutter/fonksiyonlar.dart';
import 'package:temel_flutter/main.dart';
import 'package:temel_flutter/models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students = List.empty();
  StudentAdd(List<Student> _students) {
    students = _students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State {
  List<Student> students = List.empty();
  _StudentAddState(List<Student> _students) {
    students = _students;
  }

  Student student = Student.withOutInfo();
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
        student.firstName = value.toString();
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
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
        student.lastName = value.toString();
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      keyboardType: TextInputType.number, // Burası Sadece numerik klavyeyi açar
      inputFormatters: <TextInputFormatter>[
        // burası ise text input alanına sadece rakam yazabilmeye izin veriyor
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
          label: Text("Hocanın Uygun Gördüğü Not"),
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
        student.grade = int.parse(value.toString());
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
        setState(() {});
        if (formKey.currentState!.validate()) {
          // Null check "!" işareti var dikkatli bak
          formKey.currentState!.save();
          students.add(student);
          SaveStudent();
          Navigator.pop(context);
          /*
            Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyApp()))
                .then((value) {
              setState(() {});
            });
            
          Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MyApp()))
              .then((value) {
            setState(() {});
          });
          */
        }
      },
    );
  }

  void SaveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
