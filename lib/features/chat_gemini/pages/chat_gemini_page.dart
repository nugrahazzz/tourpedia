import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'package:image_picker/image_picker.dart';
import 'package:quickly/quickly.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/config/routes/routes.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/utils/global_widgets/widgets.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';

class ChatGeminiPage extends StatefulWidget {
  const ChatGeminiPage({super.key});

  @override
  State<ChatGeminiPage> createState() => _ChatGeminiPageState();
}

class _ChatGeminiPageState extends State<ChatGeminiPage> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "You");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage:
        "https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png",
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardShowing = MediaQuery.of(context).viewInsets.vertical > 0;

    return BackButtonListener(
      onBackButtonPressed: () {
        Get.offAndToNamed(Routes.homePage);
        return Future.value(true);
      },
      child: ConnectivityWidget(
        showOfflineBanner: false,
        builder: (context, isOnline) => (isOnline)
            ? Scaffold(
                backgroundColor: ColorManager.white,
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(
                    "AsistenQ",
                    style: TextStyles.poppinsBold.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.bgDark.withOpacity(0.8)),
                  ),
                ),
                body: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.0.wp),
                      child: DashChat(
                        inputOptions: InputOptions(
                          alwaysShowSend: false,
                          inputTextStyle:
                              TextStyles.poppinsRegular.copyWith(),
                          inputDecoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  VerticalDivider(
                                    width: 2,
                                    color: ColorManager.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 3.0.wp,
                                  ),
                                  Icon(
                                    Icons.image,
                                    color: ColorManager.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 2.0.wp,
                                  ),
                                ],
                              ),
                              onPressed: _sendMediaMessage,
                            ),
                            isCollapsed: false,
                            isDense: true,
                            hintText: " Tulis pesan Anda",
                            errorMaxLines: 2,
                            hintMaxLines: 2,
                            constraints: BoxConstraints(
                              minHeight: 14.0.wp, // Atur tinggi minimum
                              maxHeight: 14.0.wp,
                              minWidth: 80.0.wp,
                              maxWidth: 80.0.wp, // Atur tinggi maksimum
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorManager.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(6.0.wp),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorManager.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(6.0.wp),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.circular(6.0.wp),
                            ),
                          ),
                        ),
                        currentUser: currentUser,
                        onSend: _sendMessage,
                        messages: messages,
                        messageOptions: MessageOptions(
                            messageTextBuilder: (ChatMessage message,
                                ChatMessage? previousMessage,
                                ChatMessage? nextMessage) {
                              return Text(
                                message.text
                                    .trim()
                                    .replaceAll("**", "")
                                    .replaceAll("  ", ""),
                                textAlign: TextAlign.justify,
                                style: TextStyles.poppinsRegular.copyWith(
                                  fontSize: 3.5.wp,
                                  color: message.user.id == "0"
                                      ? Colors.white
                                      : Colors.black,
                                  // Ubah warna font berdasarkan pengirim
                                ),
                              );
                            },
                            timeTextColor: ColorManager.bgDark,
                            messageDecorationBuilder: (ChatMessage message,
                                ChatMessage? previousMessage,
                                ChatMessage? nextMessage) {
                              if (message.user.id == "0") {
                                // Pesan dari user
                                return BoxDecoration(
                                  color: ColorManager.bgDark.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(3.0.wp),
                                );
                              } else {
                                // Pesan dari support atau lainnya
                                return BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(3.0.wp),
                                );
                              }
                            },
                            currentUserContainerColor: ColorManager.primaryColor,
                            messagePadding: EdgeInsets.all(4.0.wp),
                            showTime: true,
                            timePadding: EdgeInsets.only(top: 2.0.wp)),
                        messageListOptions: MessageListOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          dateSeparatorBuilder: (date) => DefaultDateSeparator(
                            date: date,
                            textStyle: TextStyle(
                              color: ColorManager.bgDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // onLoadEarlier: () async {
                          //   await Future.delayed(const Duration(seconds: 1));
                          // },
                        ),
                      ),
                    ),
                    (messages.isEmpty)
                        ? Visibility(
                            visible: isKeyboardShowing ? false : true,
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "---   Pertanyaan Cepat   ---",
                                    style: TextStyles.poppinsBold.copyWith(
                                        color: ColorManager.bgDark,
                                        fontSize: 4.5.wp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 4.0.wp,
                                  ),
                                  DelayedWidget(
                                    delayDuration: 200.milliseconds,
                                    child: CustomButton(
                                      function: () {
                                        sendQuickMessage(
                                            "Adakah tempat wisata alam yang sering dikunjungi di Indonesia?");
                                      },
                                      title:
                                          "Adakah tempat wisata alam yang sering dikunjungi?",
                                      height: 17.0.wp,
                                      width: 90.0.wp,
                                      fontSize: 4.0.wp,
                                      titleColor: ColorManager.white,
                                      color: ColorManager.bgDark,
                                      borderRadius: 6.0.wp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.0.wp,
                                  ),
                                  DelayedWidget(
                                    delayDuration: 500.milliseconds,
                                    child: CustomButton(
                                      function: () {
                                        sendQuickMessage(
                                            "Bisakah Anda memberikan informasi tentang tempat wisata sejarah di Indonesia?");
                                      },
                                      title:
                                          "Bisakah Anda memberikan informasi tentang tempat wisata sejarah?",
                                      height: 17.0.wp,
                                      width: 96.0.wp,
                                      fontSize: 4.0.wp,
                                      titleColor: ColorManager.white,
                                      color: ColorManager.bgDark,
                                      borderRadius: 6.0.wp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.0.wp,
                                  ),
                                  DelayedWidget(
                                    delayDuration: 800.milliseconds,
                                    child: CustomButton(
                                      function: () {
                                        sendQuickMessage(
                                          "Apa saja destinasi wisata yang bisa direkomendasikan di Indonesia?",
                                        );
                                      },
                                      title:
                                          "Apa saja destinasi wisata yang bisa direkomendasikan?",
                                      height: 17.0.wp,
                                      width: 90.0.wp,
                                      fontSize: 4.0.wp,
                                      titleColor: ColorManager.white,
                                      color: ColorManager.bgDark,
                                      borderRadius: 6.0.wp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              )
            : NoConnectionDialog(
                colorStatusBar: ColorManager.transparent,
                colorNavigationBar: ColorManager.bgDark,
              ),
      ),
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(
            () {
              messages = [lastMessage!, ...messages];
            },
          );
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text:
            "Bisakah Anda membantu saya mengidentifikasi di mana tempat ini berada?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      _sendMessage(chatMessage);
    }
  }

  sendQuickMessage(String message) {
    ChatMessage chatMessage = ChatMessage(
      user: currentUser,
      createdAt: DateTime.now(),
      text: message,
    );

    _sendMessage(chatMessage);
  }
}
