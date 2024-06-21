import 'package:flutter/material.dart';
import 'package:mercubuana1/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formGlobalKey = GlobalKey<FormState>();

  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            // Image
            SizedBox(
              child: Image.asset('lib/images/register1.png'),
            ),
            const Text(
              "Selamat Datang!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Text("Silahkan Mendaftar"),
            Form(
              key: _formGlobalKey,
              child: Column(
                children: [
                  // Nama
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                        controller: _fullNameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text("Nama Lengkap"),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mohon isi data dengan benar.';
                          }
                          return null;
                        }),
                  ),
                  // Email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text("Email"),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mohon isi data dengan benar.';
                          }
                          return null;
                        }),
                  ),
                  // NIM
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                        controller: _nimController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text("NIM"),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mohon isi data dengan benar.';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text("Password"),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mohon isi data dengan benar.';
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilledButton(
                      onPressed: () async {
                        _formGlobalKey.currentState!.validate();

                        String url =
                            'https://test.komputasiawanmercu.my.id/user/register';
                      },
                      child: const Text("Daftar"))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Sudah Punya Akun?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
