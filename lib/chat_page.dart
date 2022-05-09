import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toto/main.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wblack,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: wwhite,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: wwhite,
            ),
          )
        ],
        elevation: 0.0,
        backgroundColor: wblack,
      ),
      body: const ChatingSection(),
      bottomNavigationBar: const BottomSection(),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      child: Container(
        padding: const EdgeInsets.all(10),
        color: wwhite,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: wgreen,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    const InkWell(
                      child: Icon(
                        Icons.insert_emoticon,
                        color: wwhite,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(color: wwhite),
                      ),
                    ),
                    const InkWell(
                      child: Icon(
                        Icons.upload_outlined,
                        color: wwhite,
                      ),
                    ),
                    const InkWell(
                      child: Icon(
                        Icons.image,
                        color: wwhite,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 45,
              width: 45,
              margin: const EdgeInsets.only(left: 20),
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: wgreen),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic_none_sharp,
                  size: 18,
                  color: wwhite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatingSection extends StatelessWidget {
  final message = "Comment tu vas  ?";
  final date = "16:34";
  final senderProfile = "images/avatar/a3.jpg";
  final isReceiver = 1;
  final isDirect = 0;

  const ChatingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: wwhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            "Angelo",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              color: wblack,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Il était en ligne il y'a 56 second",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.normal,
              color: wblack.withOpacity(0.6),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextMessage(
            message: message,
            date: "Aujourd'hui 15:20",
            senderProfile: senderProfile,
            isReceiver: isReceiver,
            isDirect: isDirect,
          ),
          TextMessage(
            message: "Bien et chez toi ?",
            date: " Aujourd'hui 18:20",
            senderProfile: "images/avatar/a4.jpg",
            isReceiver: 0,
            isDirect: isDirect,
          ),
          const TextMessage(
            message: "Hey broh ",
            date: " Aujourd'hui 18:22",
            senderProfile: "images/avatar/a4.jpg",
            isReceiver: 0,
            isDirect: 1,
          ),
          const ImageMessage(
              image: "images/avatar/a1.jpg",
              senderProfile: "images/avatar/a1.jpg",
              date: "Hier 16:30"),
          const AudioMessage(
            audio: "images/sound-waves.png",
            date: "Ajourd'hui 06:30",
            senderProfile: "images/avatar/a4.jpg",
            isReceiver: 1,
            isDirect: 0,
          ),
          TextMessage(
            message: "Elle est belle !",
            date: "Aujourd'hui 15:20",
            senderProfile: senderProfile,
            isReceiver: isReceiver,
            isDirect: isDirect,
          ),
          const AudioMessage(
            audio: "images/sound-waves.png",
            date: "Ajourd'hui 06:30",
            senderProfile: "images/avatar/a4.jpg",
            isReceiver: 1,
            isDirect: 0,
          ),
        ],
      )),
    );
  }
}

class TextMessage extends StatelessWidget {
  final String? message, date, senderProfile;
  final int? isReceiver, isDirect;
  const TextMessage({
    Key? key,
    this.message,
    this.date,
    this.senderProfile,
    this.isReceiver,
    this.isDirect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: (isReceiver == 1)
          ? Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(senderProfile.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: wblack,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Text(
                      message.toString(),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        color: wgreen,
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.check,
                  color: wgreen,
                  size: 12,
                ),
                Text(
                  date.toString(),
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    color: wgreen,
                    fontSize: 10,
                  ),
                )
              ],
            )
          : Row(
              children: [
                const Icon(
                  Icons.check,
                  color: wgreen,
                  size: 12,
                ),
                Text(
                  date.toString(),
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    color: wgreen,
                    fontSize: 10,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, left: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: wgreen,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Text(
                      message.toString(),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        color: wwhite,
                      ),
                    ),
                  ),
                ),
                (isDirect == 0)
                    ? Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(senderProfile.toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        width: 45,
                      )
              ],
            ),
    );
  }
}

class ImageMessage extends StatelessWidget {
  final String? image;
  final String? senderProfile;
  final String? date;
  final bool? isDirect;
  const ImageMessage(
      {Key? key, this.image, this.senderProfile, this.date, this.isDirect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          color: wgreen,
          size: 12,
        ),
        Text(
          date.toString(),
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            color: wgreen,
            fontSize: 10,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 5,
            ),
            height: 150,
            decoration: BoxDecoration(
              color: wgreen,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class AudioMessage extends StatelessWidget {
  final String? audio;
  final String? senderProfile;
  final String? date;
  final int? isReceiver;
  final int? isDirect;

  const AudioMessage(
      {Key? key,
      this.audio,
      this.date,
      this.senderProfile,
      this.isReceiver,
      this.isDirect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          color: wgreen,
          size: 12,
        ),
        Text(
          date.toString(),
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            color: wgreen,
            fontSize: 10,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 10, left: 5),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: wgreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.play_arrow,
                    color: wwhite,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 10,
                    child: Image.asset(
                      audio.toString(),
                      height: 35,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        (isDirect == 0)
            ? Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(senderProfile.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Container(width: 45)
      ],
    );
  }
}
