void main() {
  SelamVer();
  ParametreliSelamVer("Akif");

  var hesapSonucu = hesapla(100000, 15);
  print(hesapSonucu);

  test(1);
  test2(1);
  test2(1, 9);
  test3(sayi1: 1, sayi2: 2, sayi3: 3);
}

void SelamVer() {
  print("Arkadaşlar sea");
}

void ParametreliSelamVer(String isim) {
  print("Selam " + isim);
}

double hesapla(double krediTutari, double yuzde) {
  var sonuc = krediTutari * yuzde / 100;
  return sonuc; //return edilen değer tipi her zaman fonksiyonun değer tipi ile aynı olmalı
}

void test(int sayi1, [int? sayi2, int? sayi3]) {
  print(sayi1);
  print(sayi2);
  print(sayi3);
}

void test2(int sayi1, [int sayi2 = 5]) {
  //Eğer sayı2'ye bir parametrede değer vermezsek null yerine default olarak 5 şekilinde tanımlacaktır
  print(sayi1);
  print(sayi2);
}

void test3({int? sayi1, int? sayi2, int? sayi3}) {
  print(sayi1);
  print(sayi2);
  print(sayi3);
}
