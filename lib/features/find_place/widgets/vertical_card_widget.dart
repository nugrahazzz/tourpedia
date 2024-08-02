import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:refreshed/refreshed.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';
import 'package:tourpedia/features/discover/models/location.dart';
import 'package:tourpedia/features/find_place/pages/detail_page.dart';

class VerticalCardWidget extends StatelessWidget {
  final Location location;

  const VerticalCardWidget({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailPageX(location: location));
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 4.0.wp,
        ),
        child: Hero(
          tag: location.imageAsset,
          child: Material(
            type: MaterialType.transparency,
            color: Colors.transparent, // <-- Add this, if needed

            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0.wp),
              child: Stack(
                children: [
                  ExtendedImage.asset(
                    height: 80.0.wp,
                    width: double.infinity,
                    location.imageAsset,
                    fit: BoxFit.cover,
                    cacheRawData: true,
                    //cancelToken: cancellationToken,
                  ),
                  Container(
                    height: 80.0.wp,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        const Color(0xff131313).withOpacity(0.2),
                        const Color(0xff131313).withOpacity(0.5),
                      ],
                      stops: const [0.0, 0.5, 0.8],
                    )),
                  ),
                  Positioned(
                    bottom: 5.0.wp,
                    left: 5.0.wp,
                    right: 10.0.wp,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location.title,
                          style: TextStyles.poppinsSemiBold.copyWith(
                              fontSize: 7.5.wp,
                              height: 1.1,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 2.0.wp,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white.withOpacity(0.8),
                                size: 3.6.wp,
                              ),
                              SizedBox(
                                width: 1.25.wp,
                              ),
                              Text(
                                location.place.toUpperCase(),
                                style: TextStyles.poppinsRegular.copyWith(
                                  fontSize: 3.6.wp,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              SizedBox(
                                width: 4.0.wp,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:extended_image/extended_image.dart';
// import 'package:flutter/material.dart';
// import 'package:refreshed/refreshed.dart';
// import 'package:tourpedia/core/app/extensions.dart';
// import 'package:tourpedia/features/travel/screens/detail_screen.dart';
//
// import '../config/app_theme.dart';
//
// class VerticalCardWidget extends StatelessWidget {
//   final String imageUrl;
//
//   const VerticalCardWidget({
//     super.key,
//     required this.imageUrl,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Get.to(() => const DetailScreen());
//       },
//       child: Container(
//         color: Colors.transparent,
//         child: Padding(
//           padding: EdgeInsets.only(
//             bottom: 4.0.wp,
//           ),
//           child: Column(
//             children: [
//               ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: ExtendedImage.network(
//                     imageUrl,
//                     fit: BoxFit.fitWidth,
//                     cache: true,
//                     borderRadius: BorderRadius.all(Radius.circular(4.0.wp)),
//                     //cancelToken: cancellationToken,
//                   )),
//               SizedBox(height: 5.0.wp),
//               Text(
//                 'Fell the thrill on the only surf simulator in Maldives 2023',
//                 style: MyTheme.titleMedium,
//                 textAlign: TextAlign.start,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               SizedBox(height: 4.0.wp),
//               Row(
//                 children: [
//                   Container(
//                     width: 10.0.wp,
//                     height: 10.0.wp,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: NetworkImage(
//                           'https://images.pexels.com/photos/709552/pexels-photo-709552.jpeg',
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 3.5.wp,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Sang Dong-Min', style: MyTheme.titleSmall),
//                       Text('sangdong@gmail.com', style: MyTheme.subtitleMedium),
//                     ],
//                   ),
//                   const Spacer(),
//                   Container(
//                       height: 37,
//                       width: 37,
//                       decoration: BoxDecoration(
//                         color: const Color(0xffEFF5F4),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: const Icon(Icons.send)),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
