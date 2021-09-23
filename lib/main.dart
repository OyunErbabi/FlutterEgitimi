// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:temel_flutter/models/student.dart';
import 'package:temel_flutter/screens/student_add.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String appTitle = "Yıkıklar Takip Sistemi";

  Student nullStudent = Student.withId(0, "", "", 0, "");
  Student selectedStudent = Student.withId(0, "", "", 0, "");
  bool selectedStatus = false;
  int selectedIndex =
      -1; //Eğer Sıfır yaparsam listenin en başındaki eleman otomatikman seçili geliyor

  List<Student> students = [
    Student.withId(1, "Akif", "ERSOY", 70,
        "https://s1.dmcdn.net/v/1U46Y1Vj_axfqWLTO/x1080"),
    Student.withId(2, "Gülce", "EFE", 25,
        "https://memegenerator.net/img/images/15088125.jpg"),
    Student.withId(3, "Engin", "DEMİROĞ", 45,
        "https://cdn.vox-cdn.com/thumbor/eReqmSD1nz4TXHXzbPslJgRcKRQ=/0x0:3840x2400/1200x800/filters:focal(1613x893:2227x1507)/cdn.vox-cdn.com/uploads/chorus_image/image/62630829/The_Walking_Dead_TV_502082_3840x2400.0.jpg"),
    Student.withId(4, "Berkay", "SUSAK", 10,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWg4rCQitwySMfgseQ7cHqeiYXQEWjnGvudCHi2alCtgIz_hJMF0W1Y1sWCab8jS-N1fU&usqp=CAU")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
          title: Text(appTitle),
          backgroundColor: const Color.fromRGBO(255, 0, 0, 1),
        ),
        body: buildBody(context));
  }

  String SinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 50) {
      mesaj = "Geçti";
    } else if (puan >= 40) {
      mesaj = "Bütünlemeye Kaldı";
    } else {
      mesaj = "Kaldı";
    }
    return mesaj;
  }

  void MesajGoster(BuildContext context, String warnHeaderText, String mesaj) {
    var alert = AlertDialog(
      title: Builder(builder: (context) {
        return Text(
          warnHeaderText,
          textAlign: TextAlign.center,
        );
      }),
      content: Text(mesaj, textAlign: TextAlign.center),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(students[index].image),
                ),
                title: Text(
                  students[index].firstName + " " + students[index].lastName,
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  "Sınavdan Aldığı Not : " +
                      students[index].grade.toString() +
                      " [" +
                      students[index].getStatus +
                      "]",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: buildStatusIcon(students[index].grade),
                selectedTileColor: Colors.blueGrey.shade200,
                selected: index == selectedIndex,
                onTap: () {
                  setState(() {
                    if (selectedIndex == index) {
                      selectedIndex = -1;
                    } else {
                      selectedIndex = index;
                      selectedStudent = students[index];
                    }
                  });
                  print(selectedStudent.firstName);
                },
              );
            },
          )),
          Text("Seçili Yıkık: " +
              selectedStudent.firstName +
              " " +
              selectedStudent.lastName),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: const Text(
                          "Yeni Yıkık",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen.shade300,
                    padding: const EdgeInsets.all(12),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentAdd(students)));
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                  child: Title(
                    color: Colors.red,
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.update,
                          color: Colors.black,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: const Text(
                            "Güncelle",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellowAccent.shade700,
                    padding: const EdgeInsets.all(12),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    String mesaj = SinavHesapla(55);
                    MesajGoster(context, "Güncellendi!", mesaj);
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                  child: Title(
                    color: Colors.red,
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: const Text(
                            "Sil",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent.shade200,
                    padding: const EdgeInsets.all(12),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });
                    MesajGoster(
                        context,
                        "Silindi!",
                        selectedStudent.firstName +
                            " " +
                            selectedStudent.lastName);
                    selectedStudent =
                        nullStudent; // Burada öğrenci seçildikten sonra aşağıda ismi kalmasın diye uçuruyoruz
                    selectedIndex = -1;
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade > 50) {
      return const Icon(Icons.done, color: Colors.black);
    } else if (grade >= 40) {
      return const Icon(Icons.album, color: Colors.black);
    } else {
      return const Icon(Icons.clear, color: Colors.black);
    }
  }
}
