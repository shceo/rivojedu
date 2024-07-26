import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/screens/teacher_profile_screen/teacher_profile_screen.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../domain/entity/message_model.dart';

class PersonalMessage extends StatefulWidget {
  const PersonalMessage({super.key});

  @override
  State<PersonalMessage> createState() => _PersonalMessageState();
}

class _PersonalMessageState extends State<PersonalMessage> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO KEYINCHALIK MODEL OLIB KIRAMIZ VA HAMMA USER UCHUN ALOHIDA ID BOLADI!!!!
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        color: c0340F0.withOpacity(0.5),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.w),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: c0340F0.withOpacity(0.5),
                          ),
                          child: SvgPicture.asset(CommonAssets.arrowBack),
                        ),
                      ),
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.w,
                        color: blackDark,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const TeacherProfileScreen()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 21.w,
                        backgroundImage:
                            const AssetImage(CommonAssets.background),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      messages.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 13.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 18.w,
                                vertical: 14.h,
                              ),
                              margin: EdgeInsets.only(bottom: 4.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.w),
                                color: messages[index].admin
                                    ? x2F75B8.withOpacity(.8)
                                    : FECB17.withOpacity(.25),
                              ),
                              child: Text(
                                messages[index].message,
                                style: TextStyle(
                                  fontSize: 14.w,
                                  color: messages[index].admin
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Text(
                              messages[index]
                                  .timestamp
                                  .toString()
                                  .substring(14, 19),
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12.w,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    50.getH(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.h,
              child: Container(
                color: Colors.white,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        CommonAssets.skalpel,
                        colorFilter: const ColorFilter.mode(
                          D7D7D7,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    6.getW(),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          color: white,
                          border: Border.all(width: 1.w, color: white),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(1, 1),
                              color: Colors.white.withOpacity(.1),
                            ),
                          ],
                        ),
                        // height: 33.h,
                        child: TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13.w,
                              color: Colors.black,
                            ),
                            hintText: "Xabar yozing",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.w),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.white.withOpacity(.1),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 16.w),
                          ),
                        ),
                      ),
                    ),
                    18.getW(),
                    IconButton(
                      onPressed: () {
                        if (messageController.text.isNotEmpty) {
                          messages.add(
                            MessageModel(
                              admin: true,
                              messageId: messageId.toString(),
                              senderId: messageId.toString(),
                              senderName: "Admin",
                              message: messageController.text,
                              timestamp: DateTime.now(),
                            ),
                          );
                          messageId++;
                          messageController.clear();
                          setState(() {});
                        }
                      },
                      icon: Image.asset(CommonAssets.img, height: 34.h),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<MessageModel> messages = [
  MessageModel(
    admin: true,
    messageId: '1',
    senderId: 'user1',
    senderName: 'Alice',
    message:
        'Your lesson has been rescheduled: Monday, May 30, 10:00 - 10:30 Reason: I am busy',
    timestamp: DateTime.now().subtract(const Duration(days: 1)),
  ),
  MessageModel(
    admin: false,
    messageId: '2',
    senderId: 'user2',
    senderName: 'Bob',
    message:
        'New lesson has been scheduled: Monday, May 23, 10:00 - 10:30 Meet your teacher in the Etalk virtual classroom for easy video calls and lesson notes.',
    timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
  ),
  MessageModel(
    admin: true,
    messageId: '3',
    senderId: 'user1',
    senderName: 'Alice',
    message:
        'Your lesson has been rescheduled: Monday, May 30, 10:00 - 10:30 Reason: I am busy How are you?',
    timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
  ),
  MessageModel(
    admin: false,
    messageId: '4',
    senderId: 'user2',
    senderName: 'Bob',
    message: 'I\'m good, thanks!',
    timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 1)),
  ),
  MessageModel(
    admin: true,
    messageId: '5',
    senderId: 'user1',
    senderName: 'Alice',
    message:
        'New lesson has been scheduled: Monday, May 23, 10:00 - 10:30 Meet your teacher in the Etalk virtual classroom for easy video calls and lesson notes.',
    timestamp: DateTime.now().subtract(const Duration(days: 1, minutes: 30)),
  ),
  MessageModel(
    admin: false,
    messageId: '6',
    senderId: 'user2',
    senderName: 'Bob',
    message: 'Just chilling at home.',
    timestamp: DateTime.now().subtract(const Duration(days: 1, minutes: 20)),
  ),
  MessageModel(
    admin: false,
    messageId: '7',
    senderId: 'user1',
    senderName: 'Alice',
    message:
        'She is so nice and also very beautiful, and i think I’ll will make a huge improvement through her help',
    timestamp: DateTime.now().subtract(const Duration(days: 1, minutes: 10)),
  ),
  MessageModel(
    admin: false,
    messageId: '8',
    senderId: 'user2',
    senderName: 'Bob',
    message:
        'She is so nice and also very beautiful, and i think I’ll will make a huge improvement through her help',
    timestamp: DateTime.now().subtract(const Duration(days: 1, minutes: 5)),
  ),
  MessageModel(
    admin: true,
    messageId: '9',
    senderId: 'user1',
    senderName: 'Alice',
    message:
        'New lesson has been scheduled: Monday, May 23, 10:00 - 10:30 Meet your teacher in the Etalk virtual classroom for easy video calls and lesson notes.',
    timestamp: DateTime.now().subtract(const Duration(days: 1)),
  ),
  MessageModel(
    admin: true,
    messageId: '10',
    senderId: 'user2',
    senderName: 'Bob',
    message:
        'She is so nice and also very beautiful, and i think I’ll will make a huge improvement through her help',
    timestamp: DateTime.now(),
  ),
];
int messageId = 1000;
