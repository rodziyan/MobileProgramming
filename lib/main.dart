import 'package:flutter/material.dart';
import 'package:mercubuana1/screens/login_screen.dart';
import 'package:mercubuana1/screens/register_screen.dart';

void main() {
/*
  Nama  : Andre Yudoharyanto
  NIM   : 41521120022

  Nama  : Mohamad Rodziyan Algifari 
  NIM   : 41522010029
*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Selamat Datang!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const Text(
              "Silahkan Login atau Register",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 30,
            ),
            // Image
            Container(
              padding: const EdgeInsets.all(20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const Image(
                image: AssetImage(
                  'lib/images/logofooter.webp',
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Image.asset("lib/images/login1.png")),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()));
                          },
                          child: Image.asset(
                            "lib/images/register1.png",
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
