import 'package:flutter/material.dart';
import 'package:flutter_notion_avatar/flutter_notion_avatar.dart';
import 'package:flutter_notion_avatar/flutter_notion_avatar_controller.dart';

import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/utils/global_widgets/widgets.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';
import 'package:tourpedia/features/profiling/controller/profiling_controller.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class ChooseAvatarPage extends StatefulWidget {
  const ChooseAvatarPage({super.key});

  @override
  State<ChooseAvatarPage> createState() => _ChooseAvatarPageState();
}

class _ChooseAvatarPageState extends State<ChooseAvatarPage> {
  late ProfilingController profilingController;

  @override
  void initState() {
    profilingController = Get.put(ProfilingController());
    super.initState();
  }

  @override
  void dispose() {
    profilingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: 100.0.hp,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 5.0.wp).copyWith(top: 5.5.wp),
          child: ListView(
            children: [
              Text(
                "Silahkan mengatur\ntampilan avatar Anda.",
                style: TextStyles.poppinsBold.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 6.0.wp,
                  color: Colors.black.withOpacity(0.9),
                ),
              ),
              SizedBox(height: 1.5.wp),

              Text(
                "(Klik perbarui jika tidak cocok)",
                style: TextStyles.poppinsRegular.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 4.5.wp,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 10.0.wp),
              //

              Column(
                children: [
                  WidgetsToImage(
                    controller: profilingController.widgetsToImageController,
                    child: SizedBox(
                      width: 82.0.wp,
                      height: 82.0.wp,
                      child: NotionAvatar(
                        useRandom: true,
                        onCreated:
                            (NotionAvatarController notionAvatarControllerNew) {
                          profilingController.notionAvatarC =
                              notionAvatarControllerNew;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.0.wp,
                  ),
                  CustomButton(
                    color: Colors.white,
                    width: 60.0.wp,
                    title: "Perbarui Avatar",
                    titleColor: ColorManager.bgDark.withOpacity(0.95),
                    borderColor: ColorManager.bgDark.withOpacity(0.95),
                    icons: Icons.change_circle_outlined,
                    function: () {
                      profilingController.notionAvatarC!.random();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
