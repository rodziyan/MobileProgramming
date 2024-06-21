import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercubuana1/components/ProfileButton.dart';
import 'package:mercubuana1/controllers/user_controller.dart';
import 'package:mercubuana1/entities/UserData.dart';
import 'package:mercubuana1/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final UserData currentUser;

  const ProfileScreen({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    TextEditingController newPictureController = TextEditingController();
    TextEditingController newNameController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(255, 158, 158, 158),
                    Color.fromARGB(255, 210, 209, 209),
                    Color(0xFFF8F8FF),
                  ],
                ),
              ),
            ),
            Center(
              child: Transform.translate(
                offset: const Offset(0, -50),
                child: Obx(() => CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          userController.picture.value ??
                              'https://picsum.photos/id/255/200/300'),
                    )),
              ),
            ),
            Column(
              children: [
                Obx(() => Text(
                      userController.fullName.value,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  currentUser.email,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  currentUser.nim,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            "Ubah Nama Lengkap",
                            textAlign: TextAlign.center,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                textAlign: TextAlign.center,
                                controller: newNameController,
                                decoration: const InputDecoration(
                                    hintText: "(Nama Lengkap)",
                                    hintStyle: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black26)),
                              )
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () async {
                                  String targetUrl =
                                      'https://test.komputasiawanmercu.my.id/user/update/name';
                                },
                                child: const Text("Ubah Nama"))
                          ],
                        ));
              },
              child: const ProfileButton(
                option: "Ubah Nama",
                trailingIcon: Icons.person,
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      "Perbarui Foto Profil",
                      textAlign: TextAlign.center,
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          maxLines: 1,
                          decoration: const InputDecoration(
                              hintText: "(alamat URL gambar .jpg .png)",
                              hintStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black26)),
                          autocorrect: false,
                          controller: newPictureController,
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () async {
                          String targetUrl =
                              'https://test.komputasiawanmercu.my.id/user/update/picture';
                        },
                        child: const Text("Update"),
                      )
                    ],
                  ),
                );
              },
              child: const ProfileButton(
                option: "Perbarui Foto Profil",
                trailingIcon: Icons.co_present,
              ),
            ),
            // const ProfileButton(
            //   option: "Reset Password",
            //   trailingIcon: Icons.lock,
            // ),
            GestureDetector(
              onTap: () {},
              child: const ProfileButton(
                option: "Lihat Pesan Masuk",
                trailingIcon: Icons.email_outlined,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ProfileButton(
                option: "Lihat Tulisan Anda",
                trailingIcon: Icons.list,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ProfileButton(
                option: "Lihat Pengikut Anda",
                trailingIcon: Icons.people_alt_outlined,
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            "Log Out ?",
                            textAlign: TextAlign.center,
                          ),
                          content: const Text(
                            "Apakah anda yakin ingin keluar?",
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Tidak")),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()),
                                      (route) => false);
                                  userController.nim.value = "";
                                  userController.email.value = "";
                                  userController.id.value = "";
                                  userController.fullName.value = "";
                                },
                                child: const Text("Log Out"))
                          ],
                        ));
              },
              child: const ProfileButton(
                option: "Log Out",
                trailingIcon: Icons.logout,
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "MOBILE PROGRAMMING - W152100016 - Sabtu 07:00-09:29 (D-205) ",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "(Dosen: Riad Sahara, S.SI., MT)",
                                textAlign: TextAlign.center,
                              ),
                              Divider(),
                              Text(
                                "Anggota Kelompok",
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Andre Yudoharyanto - 41521120022",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Mohamad Rodziyan Algifari - 41522010029",
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ));
              },
              child: const ProfileButton(
                option: "Informasi tentang aplikasi",
                trailingIcon: Icons.info_outline,
              ),
            )
          ],
        ),
      ),
    );
  }
}
