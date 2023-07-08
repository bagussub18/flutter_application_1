import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Recent aplikasi
      title: 'Project Flutter',
      // tampilan awal adalah LoginPage
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar dan text nya
      appBar: AppBar(
        title: Text('MyApplication'),
      ),
      // Body SingleChildScrollView agar dapat di scroll terutama saat akan input text
      body: SingleChildScrollView(
        // Column child agar menggunakan child
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              // Menggnakan padding untuk margin 50
              padding: const EdgeInsets.all(50),
              // Menggunakan circleavatar dengan ada background, size gambar, dan directory gambar.
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 48.0,
                child: Image.asset('assets/images/gb1.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              // Menggunakan text field untuk input text serta menggunakan decoration
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Username",
                  // Agar field berbentuk bulat dengan radius 25
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  // Untuk menambahkan icon ke kanan input textfield
                  suffixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  suffixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Material(
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Color.fromARGB(255, 170, 229, 255),
                elevation: 5.0,
                // Menggunakan material button untuk membuat tombol dengan tambahan height, minwidth, color, child
                child: MaterialButton(
                  height: 50.0,
                  minWidth: 200.0,
                  onPressed: () {
                    // Cek apakah username dan password valid
                    if (username == "admin" && password == "admin") {
                      setState(() {
                        isLoggedIn = true;
                      });
                      //akan melakukan push
                      Navigator.push(
                        context,
                        //route saat di push ke Homepage
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }
                  },
                  color: Colors.lightBlueAccent,
                  child: const Text('Log In',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
            // Textbutton untuk forgot password
            TextButton(
              child: const Text(
                'Forgot password?',
                style: TextStyle(
                  color: Color.fromARGB(136, 3, 3, 3),
                  fontSize: 15,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
