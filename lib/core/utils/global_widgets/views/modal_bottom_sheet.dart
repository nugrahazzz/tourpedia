import 'package:flutter/material.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0.wp, right: 5.0.wp, left: 5.0.wp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            style: TextStyle(
              color: ColorManager.white,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "Enter your class code",
              hintStyle: TextStyle(
                color: ColorManager.white.withOpacity(
                  0.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: ColorManager.white.withOpacity(0.5),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: Image.asset(
                      "assets/images/user.png",
                      width: 32,
                      height: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Eko Widiatmoko",
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "ekowidiatmoko@gmail.com",
                        style: TextStyle(
                          color: ColorManager.white.withOpacity(
                            0.5,
                          ),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.chevron_right,
                  color: ColorManager.grey.withOpacity(0.75),
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          MaterialButton(
            minWidth: 100.0.wp,
            elevation: 0,
            highlightElevation: 0,
            splashColor: Theme.of(context).canvasColor.withOpacity(0.15),
            highlightColor: Theme.of(context).canvasColor.withOpacity(0.25),
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Join Class",
              style: TextStyle(
                color: ColorManager.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              // Do something & close modal
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
