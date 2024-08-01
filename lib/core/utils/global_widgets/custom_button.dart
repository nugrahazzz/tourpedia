part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final Function()? function;
  final String? title;
  final Color? color, disabledColor, titleColor, borderColor;
  final double? height;
  final double? fontSize;
  final double? borderRadius;
  final double? width;
  final bool? withBorder;
  final bool? onlyIcon;
  final IconData? icons;

  const CustomButton({
    super.key,
    @required this.function,
    this.title = "",
    this.color = Colors.transparent,
    this.disabledColor,
    this.titleColor,
    this.borderColor,
    this.height,
    this.fontSize,
    this.borderRadius = 12,
    this.width,
    this.withBorder = false,
    this.icons,
    this.onlyIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: EdgeInsets.all((withBorder == true) ? 1 : 0),
        height: height ?? 60.0,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color: (borderColor) != null ? borderColor! : color!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            (borderRadius != null) ? borderRadius! : 12,
          ),
          color: color ?? Colors.cyan,
        ),
        child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              (borderRadius != null) ? borderRadius! : 12,
            ),
            color: color ?? Colors.cyan,
          ),
          child: (onlyIcon != true)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                        child: Center(
                          child: AutoSizeText(
                            title!,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyles.poppinsBold.copyWith(
                              color: titleColor,
                              fontSize: (fontSize != null) ? fontSize : 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    (icons != null)
                        ? Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(
                              icons,
                              color: Colors.black.withOpacity(0.9),
                              size: 24.0,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                )
              : Center(child: Icon(icons)),
        ),
      ),
    );
  }
}
