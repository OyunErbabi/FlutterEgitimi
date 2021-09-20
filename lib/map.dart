void main() {
  var dictionary1 = new Map();
  dictionary1["book"] = "kitap";
  dictionary1["little"] = "küçük";

  var dictionary2 = {"kitap": "book", "küçük": "little"};
  dictionary2["büyük"] = "big";

  print(dictionary1);
  print(dictionary2);

  dictionary1.remove("book");
  print(dictionary1);

  for (var item in dictionary2.keys) {
    print(item);
  }

  print(dictionary2.containsKey("keyboard"));
  print(dictionary2.containsKey("kitap"));

  dictionary2.forEach((key, value) {
    print(key + " : " + value);
  });
}
