import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercubuana1/controllers/user_controller.dart';
import 'package:mercubuana1/entities/UserData.dart';
import 'dart:math';

import 'package:mercubuana1/screens/profile_screen.dart';

class Dashboard extends StatefulWidget {
  final UserData currentUser;

  Dashboard({super.key, required this.currentUser});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final userController = Get.find<UserController>();

  List allUserMateri = [];

  @override
  Widget build(BuildContext context) {
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
                      Color(0xFF1E90FF),
                      Color(0xFF00BFFF),
                      Color(0xFFADD8E6)
                    ]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Halo,",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              userController.fullName.value.length < 20
                                  ? Text(
                                      userController.fullName.value,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : MediaQuery.of(context).orientation ==
                                          Orientation.portrait
                                      ? Text(
                                          userController.fullName.value
                                              .substring(
                                                  0,
                                                  min(
                                                      22,
                                                      userController.fullName
                                                          .value.length)),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          userController.fullName.value
                                              .substring(
                                                  0,
                                                  min(
                                                      54,
                                                      userController.fullName
                                                          .value.length)),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                            ],
                          )),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                      currentUser: widget.currentUser,
                                    )),
                          ).then((_) => setState(() {}));
                        },
                        child: Obx(() => CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  userController.picture.value ??
                                      'https://picsum.photos/id/255/200/300'),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                height: 150,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: const Offset(0, 3),
                          blurStyle: BlurStyle.normal)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ScheduleScreen(
                            //             currentUserNim: widget.currentUser.nim,
                            //           )),
                            // ).then((_) => setState(() {}));
                          },
                          child: Image.asset(
                            'lib/images/voice_call.png',
                            height: 50,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Jadwal")
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => PostsScreen(
                            //             currentUserNim: widget.currentUser.nim,
                            //           )),
                            // );
                          },
                          child: Image.asset(
                            'lib/images/posting1.png',
                            height: 50,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Posts")
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => FriendsScreen(
                            //               currentNim: widget.currentUser.nim,
                            //             )));
                          },
                          child: Image.asset(
                            'lib/images/video_call.png',
                            height: 50,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Teman")
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // MatkulCard(
            //   dosen: "Joni",
            // ),
            const Divider(
              indent: 40,
              endIndent: 40,
            ),
            // FutureBuilder(
            //   future: getAllUserMateri(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else {
            //       return SizedBox(
            //         height: MediaQuery.of(context).orientation ==
            //                 Orientation.portrait
            //             ? MediaQuery.of(context).size.height * 0.6
            //             : MediaQuery.of(context).size.height * 0.5,
            //         child: RefreshIndicator(
            //           onRefresh: makeRefresh,
            //           child: ListView.builder(
            //               scrollDirection: Axis.vertical,
            //               shrinkWrap: true,
            //               itemCount: allUserMateri.length,
            //               itemBuilder: (context, index) => Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                         horizontal: 5, vertical: 1),
            //                     child: Card.outlined(
            //                       child: ListTile(
            //                         // matkulName: allUserMateri[index]['namateri'],
            //                         // dosen: allUserMateri[index]['dosen'],
            //                         // ruangan: allUserMateri[index]['ruangan'],
            //                         // matkulDate: allUserMateri[index]['hari'],
            //                         // matkulJam: allUserMateri[index]['jam'],
            //                         // friendNim: allPeople[index].nim,
            //                         // friendPicture: allPeople[index].picture,
            //                         title: Text(
            //                           allUserMateri[index]['namateri'],
            //                           style: const TextStyle(
            //                               fontWeight: FontWeight.bold),
            //                         ),
            //                         subtitle: Column(
            //                           children: [
            //                             Row(
            //                               children: [
            //                                 const Text(
            //                                   "Dosen : ",
            //                                 ),
            //                                 Text(
            //                                   allUserMateri[index]['dosen'],
            //                                   overflow: TextOverflow.ellipsis,
            //                                   maxLines: 1,
            //                                 ),
            //                               ],
            //                             ),
            //                             Row(
            //                               children: [
            //                                 const Text(
            //                                   "Ruang : ",
            //                                 ),
            //                                 Text(
            //                                   allUserMateri[index]['ruangan'],
            //                                 ),
            //                               ],
            //                             ),
            //                             Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: [
            //                                 const Text(""),
            //                                 Row(
            //                                   children: [
            //                                     const Text(
            //                                       "",
            //                                       style:
            //                                           TextStyle(fontSize: 14),
            //                                     ),
            //                                     const SizedBox(width: 4),
            //                                     Text(
            //                                         allUserMateri[index]['hari']
            //                                                     [0]
            //                                                 .toUpperCase() +
            //                                             allUserMateri[index]
            //                                                     ['hari']
            //                                                 .substring(1),
            //                                         style: const TextStyle(
            //                                             fontSize: 14)),
            //                                     const SizedBox(width: 4),
            //                                     Text(
            //                                         allUserMateri[index]['jam'],
            //                                         style: const TextStyle(
            //                                             fontSize: 14)),
            //                                   ],
            //                                 ),
            //                               ],
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                   )),
            //         ),
            //       );
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
