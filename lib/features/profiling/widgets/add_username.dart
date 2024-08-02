import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';
import 'package:tourpedia/features/profiling/controller/profiling_controller.dart';

class AddUsernamePage extends GetView<ProfilingController> {
  const AddUsernamePage({super.key});

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
                "Silahkan masukan\nnama lengkap Anda.",
                style: TextStyles.poppinsBold.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 6.0.wp,
                  color: Colors.black.withOpacity(0.9),
                ),
              ),
              SizedBox(height: 1.5.wp),

              Text(
                "(Masih dapat diubah nantinya)",
                style: TextStyles.poppinsRegular.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 4.5.wp,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 18.0.wp),
              // xxxx
              Padding(
                padding: EdgeInsets.only(right: 2.0.wp),
                child: TextFormField(
                  controller: controller.nameTEF,
                  focusNode: controller.nameFN,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (String? value) {
                    return value.toString().isEmpty
                        ? '* Nama Anda masih kosong'
                        : value.toString().length < 4
                            ? '* Panjang karakter minimal adalah 4'
                            : null;
                  },
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  style: TextStyles.poppinsMedium.copyWith(
                    color: ColorManager.bgDark,
                    fontSize: 4.5.wp,
                    fontWeight: FontWeight.w500,
                  ),
                  autofocus: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: " Nama Lengkap Anda",
                    hintStyle: TextStyles.poppinsMedium.copyWith(
                      color: ColorManager.bgDark.withOpacity(0.7),
                      fontSize: 4.5.wp,
                      fontWeight: FontWeight.w500,
                    ),
                    errorStyle: TextStyles.poppinsRegular.copyWith(
                      fontSize: 3.3.wp,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.teal.withOpacity(0.7),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: ColorManager.bgDark.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
