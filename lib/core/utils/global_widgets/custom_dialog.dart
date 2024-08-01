part of 'widgets.dart';

class CustomDialog extends StatefulWidget {
  final String? title, description, buttonText;
  final String? imagePath;
  final Function()? function;
  final Color? colorStatusBar;
  final Color? colorNavigationBar;

  const CustomDialog({
    super.key,
    this.title = "",
    this.description = "",
    this.buttonText = "",
    this.imagePath = "",
    this.function,
    this.colorStatusBar = Colors.transparent,
    this.colorNavigationBar = Colors.transparent,
  });

  @override
  CustomDialogState createState() => CustomDialogState();
}

class CustomDialogState extends State<CustomDialog> {
  double padding = 5.0.wp;
  double avatarRadius = 15.0.wp;

  @override
  void initState() {
    super.initState();
    systemBarColor(widget.colorStatusBar!, widget.colorNavigationBar!);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: avatarRadius + padding / 2,
              left: padding,
              right: padding,
            ),
            margin: EdgeInsets.only(top: avatarRadius),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(padding),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Text(
                  widget.title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 6.0.wp,
                    fontWeight: FontWeight.w900,
                    color: ColorManager.bgDark.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 2.5.wp),
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 3.3.wp),
                  child: Text(
                    widget.description!,
                    textAlign: TextAlign.center,
                    style: TextStyles.poppinsSemiBold.copyWith(
                        color: ColorManager.bgDark.withOpacity(0.8),
                        fontSize: 3.4.wp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                        wordSpacing: 1),
                  ),
                ),
                SizedBox(height: 8.0.wp),
                //ya
                CustomButton(
                    onlyIcon: false,
                    width: 60.0.wp,
                    borderRadius: 16,
                    height: 14.0.wp,
                    color: ColorManager.bgDark,
                    borderColor: ColorManager.bgDark,
                    title: widget.buttonText,
                    titleColor: ColorManager.white,
                    function: () {
                      Navigator.pop(context, true);
                      widget.function!();
                    }),
                //tidak
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 1.0.wp),
                    color: Colors.transparent,
                    height: 6.25.hp,
                    child: Center(
                      child: Text(
                        //No, thanks
                        "Tidak, terima kasih",
                        style: TextStyle(
                          fontSize: 3.4.wp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.darkGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Gambar
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipOval(
                child: Container(
                  color: Colors.white,
                  height: 30.0.wp,
                  width: 30.0.wp,
                  child: Padding(
                    padding: EdgeInsets.all(3.0.wp),
                    child: Lottie.asset(
                      widget.imagePath!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
