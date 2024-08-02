import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/app/function.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';
import 'package:tourpedia/features/discover/models/location.dart';
import 'package:tourpedia/features/discover/widgets/location_slider_card.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  double _parallaxOffset = 0;

  @override
  Widget build(BuildContext context) {
    systemBarColor(ColorManager.white, ColorManager.white);
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 600),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 140.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
                  child: Column(
                    children: [
                      Text(
                        "Favorite Tour",
                        style: TextStyles.poppinsSemiBold.copyWith(
                            color: ColorManager.bgDark,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .3,
                            fontSize: 7.0.wp),
                      ),
                      SizedBox(
                        height: 3.0.wp,
                      ),
                      Text(
                        "\"One's destination is never a place, but always a new way of seeing things\"",
                        style: TextStyles.poppinsRegular.copyWith(
                            color: ColorManager.bgDark,
                            fontWeight: FontWeight.w400,
                            fontSize: 3.8.wp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 16.0.wp,
                      ),
                    ],
                  ),
                ),
                _buildImageSlider(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildImageSlider(BuildContext context) {
    List<Location> sliderLocations = Location.getLocations().take(5).toList();

    return CarouselSlider(
      options: CarouselOptions(
          height: 110.0.wp,
          autoPlay: false,
          aspectRatio: 1.6,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          viewportFraction: (MediaQuery.of(context).size.width - 3 * 25) /
              MediaQuery.of(context).size.width,
          disableCenter: true,
          onScrolled: (val) {
            setState(() {
              _parallaxOffset = (val ?? 0) * 100;
            });
          }),
      items: sliderLocations
          .map((location) => LocationSliderCard(
                offset: _parallaxOffset,
                location: location,
              ))
          .toList(),
    );
  }
}
