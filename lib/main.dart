import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toto/chat_page.dart';

const wblack = Color(0xFF34322D);
const wgreen = Color(0xFF32C1A9);
const wwhite = Color(0xFFEFFFFB);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'whatsapp redesign',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: wblack,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 30,
            color: wwhite,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
              color: wwhite,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: wgreen,
        child: const Icon(
          Icons.edit,
          size: 20,
        ),
        onPressed: () {},
      ),
      body: Column(
        children: [
          MenuSection(),
          const FavoriteSection(),
          Expanded(child: MessageSection())
        ],
      ),
    );
  }
}

class MenuSection extends StatelessWidget {
  MenuSection({Key? key}) : super(key: key);

  final List menuItems = ["Message", "Online", "Groups", "Calls"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      color: wblack,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            children: menuItems.map((menu) {
              return Container(
                margin: const EdgeInsets.only(right: 55),
                child: Text(
                  menu,
                  style: const TextStyle(color: wwhite, fontSize: 40),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class FavoriteSection extends StatelessWidget {
  const FavoriteSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List favoriteContacts = [
      {"name": "Ange", "profile": "images/avatar/a1.jpg"},
      {"name": "Guyzo", "profile": "images/avatar/a2.jpg"},
      {"name": "Victorien", "profile": "images/avatar/a3.jpg"},
      {"name": "Soro", "profile": "images/avatar/a4.jpg"},
      {"name": "Donald", "profile": "images/avatar/a5.jpg"},
      {"name": "Sylvain", "profile": "images/avatar/a6.jpg"},
      {"name": "Roland", "profile": "images/avatar/a7.jpg"},
    ];
    return Container(
      color: wblack,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: wgreen,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Favorite contact",
                  style: TextStyle(fontSize: 15, color: wwhite),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 20,
                    color: wwhite,
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: favoriteContacts.map(
                  (contact) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                color: wwhite, shape: BoxShape.circle),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(contact["profile"]),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            contact["name"],
                            style: GoogleFonts.roboto(
                              color: wwhite,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageSection extends StatelessWidget {
  MessageSection({Key? key}) : super(key: key);
  final List messageItems = [
    {
      "senderProfile": "images/avatar/a1.jpg",
      "senderName": "Angelo",
      "message": "Hi!",
      "unRead": 2,
      "date": "20:35"
    },
    {
      "senderProfile": "images/avatar/a2.jpg",
      "senderName": "Victorien",
      "message": "Comment tu vas champi",
      "unRead": 0,
      "date": "02:35"
    },
    {
      "senderProfile": "images/avatar/a3.jpg",
      "senderName": "Guyzo",
      "message": "J'ai besoin de gbèsè",
      "unRead": 4,
      "date": "12:32"
    },
    {
      "senderProfile": "images/avatar/a4.jpg",
      "senderName": "Sylvain",
      "message": "Tu vu la nouvelle moto ?",
      "unRead": 4,
      "date": "06:20"
    },
    {
      "senderProfile": "images/avatar/a5.jpg",
      "senderName": "Soro",
      "message":
          "J'ai besoin du shema de la DB ffg ggvf cdf ggd cdf cdrff cddt ctcddf ceresz xdrr ddsxsqz dddzzqs fgyhghy ffffced",
      "unRead": 1,
      "date": "13:33"
    },
    {
      "senderProfile": "images/avatar/a6.jpg",
      "senderName": "Donald",
      "message": "Trop bien ce code",
      "unRead": 2,
      "date": "23:55"
    },
    {
      "senderProfile": "images/avatar/a7.jpg",
      "senderName": "Roland",
      "message": "Je reviens stp !",
      "unRead": 1,
      "date": "14:00"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: messageItems.map((message) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPage()),
            );
          },
          splashColor: wgreen,
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 15, top: 10),
            child: Row(
              children: [
                Container(
                  height: 62,
                  width: 62,
                  decoration: BoxDecoration(
                    color: wgreen,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        message["senderProfile"],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message["senderName"],
                                  style: GoogleFonts.roboto(
                                    color: Colors.grey.withOpacity(0.8),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Wrap(
                                  children: [
                                    Text(
                                      message["message"],
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                        fontSize: 15.2,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message["date"],
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                if (message["unRead"] > 0)
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      color: wgreen,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      message["unRead"].toString(),
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: wwhite,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        color: Colors.grey[400],
                        height: 0.5,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    ));
  }
}
