class User {
  final String name;
  final String avatar;
  final String phone;

  User({
    required this.name,
    required this.avatar,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      //mengambil nilai 'name' dari objek JSON dan menyimpannya dalam variabel name
      name: json['name'],
      //mengambil nilai 'avatar' dari objek JSON dan menyimpannya dalam variabel avatar
      avatar: json['avatar'],
      //meengambil nilai 'phone' dari objek JSON, mengonversinya menjadi string, dan menyimpannya dalam variabel phone
      phone: json['phone'].toString(),
    );
  }
}
