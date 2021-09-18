import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  String appTitle = "Selam Dünyalı";
  @override
  Widget build(BuildContext context) {
    var ogrenciler = ["Engin", "Kerem", "Berkay"];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: Text(appTitle),
        backgroundColor: const Color.fromRGBO(255, 0, 0, 1),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: ogrenciler.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(ogrenciler[index]);
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
                var alert = AlertDialog(
                  title: Builder(builder: (context) {
                    return const Text(
                      "Sınav Sonucu",
                      textAlign: TextAlign.center,
                    );
                  }),
                  content: const Text("Geçti", textAlign: TextAlign.center),
                );

                showDialog(
                    context: context, builder: (BuildContext context) => alert);
              },
            ),
          ),
        ],
      ),
    );
  }
}
