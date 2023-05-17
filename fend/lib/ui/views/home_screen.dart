import 'package:allwellbuy/business_logic/auth.dart';
import 'package:allwellbuy/ui/views/chatroom_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _search = TextEditingController();

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      //print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text("FEND", style: TextStyle(color: Colors.black)),
        //logout user
        actions: [
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                Auth().signOut(context);
              },
              child:
                  const Text("Logout", style: TextStyle(color: Colors.black)))
        ],
      ),
      body: isLoading
          ? Center(
              child: SizedBox(
                height: size.height / 20,
                width: size.height / 20,
                child: const CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  // height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: size.height / 14,
                    width: size.width / 1.15,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            onPressed: onSearch,
                            icon: const Icon(Icons.search),
                          )),
                    ),
                  ),
                ),

                SizedBox(
                  height: size.height / 30,
                ),
                userMap != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 223, 220, 231),
                              borderRadius: BorderRadius.circular(7)),
                          child: ListTile(
                            onTap: () {
                              String roomId = chatRoomId(
                                  _auth.currentUser!.displayName!,
                                  userMap!['name']);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChatRoom(
                                    chatRoomId: roomId,
                                    userMap: userMap!,
                                  ),
                                ),
                              );
                            },
                            leading: const CircleAvatar(
                              child: Center(
                                child: Icon(Icons.account_box,
                                    color: Colors.white),
                              ),
                            ),
                            title: Text(
                              userMap!['name'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(userMap!['email']),
                            trailing:
                                const Icon(Icons.chat, color: Colors.black),
                          ),
                        ),
                      )
                    : Container(),

                SizedBox(
                  height: size.height / 30,
                ),
                const Divider(
                  height: 2,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text("Recent"),
                    )),
                //already chat user list
                FirebaseFirestore.instance.collection('userlist').get() != null
                    ? FutureBuilder(
                        future: _firestore.collection('userlist').get(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError) {
                            return const Text("Error");
                          } else if (snapshot.hasData) {
                            var data = snapshot.data.docs;

                            return Expanded(
                              child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    var indexData = data![index];

                                    Map<String, dynamic> data2 =
                                        indexData.data();
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 223, 220, 231),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: ListTile(
                                          onTap: () {
                                            String roomId = chatRoomId(
                                                _auth.currentUser!.displayName!,
                                                indexData['name']);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => ChatRoom(
                                                  chatRoomId: roomId,
                                                  userMap: data2,
                                                ),
                                              ),
                                            );
                                          },
                                          leading: const CircleAvatar(
                                            child: Center(
                                              child: Icon(Icons.account_box,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          title: Text(indexData['name']),
                                          subtitle: Text(indexData['email']),
                                          trailing: const Icon(Icons.chat,
                                              color: Colors.black),
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        })
                    : const Center(child: Text("No recent Chat"))
              ],
            ),
    );
  }
}
