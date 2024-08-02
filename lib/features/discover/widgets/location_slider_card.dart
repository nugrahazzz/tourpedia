import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';
import 'package:tourpedia/features/discover/models/location.dart';
import 'package:tourpedia/features/find_place/pages/detail_page.dart';

class LocationSliderCard extends StatelessWidget {
  final double offset;
  final Location location;

  const LocationSliderCard({
    super.key,
    required this.offset,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: location.imageAsset,
      child: Material(
        type: MaterialType.transparency,
        color: Colors.transparent, // <-- Add this, if needed
        child: GestureDetector(
          onTap: () {
            Get.to(() => DetailPageX(location: location));
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: -offset / 3,
                  bottom: -offset / 3,
                  child: Image.asset(
                    location.imageAsset,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      const Color(0xff131313).withOpacity(0.1),
                      const Color(0xff131313).withOpacity(0.7),
                    ],
                    stops: const [0.0, 0.4, 0.7],
                  )),
                ),
                Positioned(
                  bottom: 5.0.wp,
                  left: 5.0.wp,
                  right: 5.0.wp,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location.title,
                        style: TextStyles.poppinsMedium.copyWith(
                            fontSize: 8.8.wp,
                            height: 1.2,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 3.0.wp,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white.withOpacity(0.8),
                            size: 4.0.wp,
                          ),
                          SizedBox(
                            width: 2.0.wp,
                          ),
                          Text(
                            location.place.toUpperCase(),
                            style: TextStyles.poppinsMedium.copyWith(
                              fontSize: 3.6.wp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
