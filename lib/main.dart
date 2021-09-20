import 'package:flutter/material.dart';
import 'package:temel_flutter/models/student.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  String appTitle = "Yıkıklar Takip Sistemi";
  List<Student> students = [
    Student(
        "Akif", "ERSOY", 70, "https://s1.dmcdn.net/v/1U46Y1Vj_axfqWLTO/x1080"),
    Student("Gülce", "EFE", 25,
        "https://memegenerator.net/img/images/15088125.jpg"),
    Student("Engin", "DEMİROĞ", 45,
        "https://cdn.vox-cdn.com/thumbor/eReqmSD1nz4TXHXzbPslJgRcKRQ=/0x0:3840x2400/1200x800/filters:focal(1613x893:2227x1507)/cdn.vox-cdn.com/uploads/chorus_image/image/62630829/The_Walking_Dead_TV_502082_3840x2400.0.jpg"),
    Student("Berkay", "SUSAK", 10,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWg4rCQitwySMfgseQ7cHqeiYXQEWjnGvudCHi2alCtgIz_hJMF0W1Y1sWCab8jS-N1fU&usqp=CAU")
  ];

  //var ogrenciler = ["Engin", "Kerem", "Berkay"];
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

  void MesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Builder(builder: (context) {
        return const Text(
          "Sınav Sonucu",
          textAlign: TextAlign.center,
        );
      }),
      content: Text(mesaj, textAlign: TextAlign.center),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
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
                  students[index].firstName + " " + students[index].lastName),
              subtitle: Text(
                  "Sınavdan Aldığı Not : " + students[index].grade.toString()),
              trailing: buildStatusIcon(students[index].grade),
              onTap: () {
                print(
                    students[index].firstName + " " + students[index].lastName);
              },
            );
          },
        )),
        Center(
          child: ElevatedButton(
            child: Title(
              color: Colors.red,
              child: const Text("Sonucu Gör"),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              padding: const EdgeInsets.all(12),
              textStyle: const TextStyle(fontSize: 22),
            ),
            onPressed: () {
              String mesaj = SinavHesapla(55);
              MesajGoster(context, mesaj);
            },
          ),
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade > 50) {
      return const Icon(Icons.done);
    } else if (grade >= 40) {
      return const Icon(Icons.album);
    } else {
      return const Icon(Icons.clear);
    }
  }
}
