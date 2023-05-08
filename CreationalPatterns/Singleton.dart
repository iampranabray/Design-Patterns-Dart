void main() {
  Singleton singleton = Singleton.getInstance(value: "Singleton Instance 1");
  print(singleton.value);
  Singleton singleton1 = Singleton.getInstance(value: "Singleton Instance 2");
  print(singleton1.value);
}

//Singleton Class
class Singleton {
  String? value;
  static Singleton? instance;

  Singleton({this.value});

  static Singleton getInstance({String? value}) {
    if (instance == null) {
      instance = Singleton(value: value);
      return instance!;
    }
    return instance!;
  }
}
