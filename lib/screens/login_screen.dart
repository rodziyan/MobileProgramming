import 'package:flutter/material.dart';
import 'package:mercubuana1/controllers/user_controller.dart';
import 'package:mercubuana1/entities/UserData.dart';
import 'package:mercubuana1/screens/dashboard_screen.dart';
import 'package:mercubuana1/screens/register_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formGlobalKey = GlobalKey<FormState>();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
              child: Image.asset('lib/images/login1.png'),
            ),
            const Text(
              "Welcome Back!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Text("Silahkan Login"),
            const SizedBox(height: 10),
            Form(
              key: _formGlobalKey,
              child: Column(
                children: [
                  // NIM
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      controller: _nimController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("NIM"),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon lengkapi data.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text("Password"),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.key_rounded),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mohon lengkapi data.';
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
                            'https://test.komputasiawanmercu.my.id/user/login';

                        // if (successUser.full_name.isNotEmpty) {
                        //   Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Dashboard(
                        //               currentUser: successUser,
                        //             )),
                        //     (route) => false,
                        //   );
                        // }
                        userController.id.value = "1";
                        userController.fullName.value = "Mahasiswa Mercu Buana";
                        userController.nim.value = "41521120100";
                        userController.email.value = "mercubuana@mail.com";
                        userController.picture.value =
                            "https://picsum.photos/id/10/200/300";

                        UserData successUser = UserData(
                          id: "1",
                          full_name: "Mahasiswa Mercu Buana",
                          email: "mercubuana@mail.com",
                          nim: "41521120100",
                          picture: "https://picsum.photos/id/10/200/300",
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Dashboard(currentUser: successUser)));
                      },
                      child: const Text("Login"))
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Belum Punya Akun?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text("Daftar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
