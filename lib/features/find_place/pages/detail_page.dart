import 'package:auto_size_text/auto_size_text.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:quickly/quickly.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/app/function.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';
import 'package:tourpedia/features/discover/models/location.dart';
import 'package:tourpedia/features/find_place/model/review.dart';
import 'package:tourpedia/features/find_place/widgets/add_rating_bottomsheet.dart';
import 'package:tourpedia/features/find_place/widgets/rating_card_widget.dart';

class DetailPageX extends StatefulWidget {
  final Location location;

  const DetailPageX({super.key, required this.location});

  @override
  State<DetailPageX> createState() => _DetailPageXState();
}

class _DetailPageXState extends State<DetailPageX> {
  late MapController mapController;
  List<Review> listReview = Review.getRandomReviews(3);

  void openGoogleMaps({required Location location}) async {
    final availableMaps = await MapLauncher.installedMaps;
    print(
        availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

    if (availableMaps.isNotEmpty) {
      await availableMaps.first.showMarker(
        coords: Coords(
          location.position.lat,
          location.position.long,
        ),
        title: location.title,
        zoom: 10
      );
    } else {
      showSnackBar(title: "Gagal menampilkan", description: "aplikasi maps tidak tersedia");
    }
  }

  @override
  void initState() {
    mapController = MapController.withPosition(
      initPosition: GeoPoint(
          latitude: widget.location.position.lat,
          longitude: widget.location.position.long),
    );
    super.initState();
  }

  void _openRatingBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return AddRatingBottomSheet(
          onSubmit: (rating, review) {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    systemBarColor(
        ColorManager.transparent, const Color.fromRGBO(240, 240, 240, 1));
    return BackButtonListener(
      onBackButtonPressed: () {
        systemBarColor(ColorManager.white, ColorManager.white);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 4.0.wp).copyWith(top: 11.0.wp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: widget.location.imageAsset,
                      child: Material(
                        type: MaterialType.transparency,
                        color: Colors.transparent, // <-- Add this, if needed
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0.wp),
                          child: ExtendedImage.asset(
                            height: 80.0.wp,
                            width: 100.0.wp,
                            widget.location.imageAsset,
                            enableMemoryCache: true,
                            fit: BoxFit.cover,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0)),
                          ),
                        ),
                      ),
                    ),
                    DelayedWidget(
                      delayDuration: 250.milliseconds,
                      child: Column(
                        children: [
                          //ukuran gambar dikurang 10.0.wp
                          Container(
                            height: 67.5.wp,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0.wp),
                            height: 25.0.wp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0.wp),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4.0.wp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    widget.location.title,
                                    maxLines: 1,
                                    style: TextStyles.poppinsBold.copyWith(
                                        fontSize: 7.0.wp,
                                        height: 1.1,
                                        fontWeight: FontWeight.w700,
                                        color: ColorManager.bgDark
                                            .withOpacity(0.9)),
                                  ),
                                  SizedBox(
                                    height: 3.0.wp,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.grey.withOpacity(0.8),
                                          size: 4.0.wp,
                                        ),
                                        SizedBox(
                                          width: 1.25.wp,
                                        ),
                                        Text(
                                          widget.location.place.toUpperCase(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyles.poppinsRegular
                                              .copyWith(
                                            fontSize: 3.5.wp,
                                            fontWeight: FontWeight.w500,
                                            color: ColorManager.bgDark
                                                .withOpacity(0.8),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6.0.wp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 4.0.wp,
                                        ),
                                        SizedBox(
                                          width: 1.25.wp,
                                        ),
                                        Text(
                                          "4.8",
                                          style: TextStyles.poppinsRegular.copyWith(
                                            fontSize: 3.8.wp,
                                            fontWeight: FontWeight.w500,
                                            color: ColorManager.bgDark
                                                .withOpacity(0.8),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1.25.wp,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RotationTransition(
                      turns: const AlwaysStoppedAnimation(90 / 360),
                      child: Text(
                        "...",
                        style: TextStyles.poppinsSemiBold.copyWith(
                            fontSize: 4.0.wp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.bgDark.withOpacity(0.75)),
                      ),
                    ),
                    RotationTransition(
                      turns: const AlwaysStoppedAnimation(90 / 360),
                      child: Text(
                        "...",
                        style: TextStyles.poppinsSemiBold.copyWith(
                            fontSize: 4.0.wp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.bgDark.withOpacity(0.75)),
                      ),
                    )
                  ],
                ),
                DelayedWidget(
                  delayDuration: 600.milliseconds,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 4.0.wp, vertical: 4.0.wp),
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius:
                            BorderRadius.all(Radius.circular(6.0.wp))),
                    child: Text(
                      widget.location.description,
                      style: TextStyles.poppinsRegular.copyWith(
                        fontSize: 3.8.wp,
                        height: 1.35,
                        // fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.0.wp,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        openGoogleMaps(location: widget.location);
                      },
                      child: AbsorbPointer(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0.wp),
                          child: Container(
                            color: ColorManager.white,
                            height: 50.0.wp,
                            width: double.infinity,
                            padding: EdgeInsets.all(1.0.wp),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0.wp),
                              child: OSMFlutter(
                                onMapIsReady: (bool isReady) async {
                                  await mapController.moveTo(
                                      GeoPoint(
                                          latitude:
                                              widget.location.position.lat,
                                          longitude:
                                              widget.location.position.long),
                                      animate: true);
                                },
                                controller: mapController,
                                osmOption: const OSMOption(
                                  enableRotationByGesture: false,
                                  zoomOption: ZoomOption(
                                    initZoom: 14,
                                  ),
                                  roadConfiguration: RoadOption(
                                    roadColor: Colors.yellowAccent,
                                  ),
                                ),
                                mapIsLoading: Center(
                                  child:
                                      LoadingAnimationWidget.staggeredDotsWave(
                                    size: 8.0.wp,
                                    color: ColorManager.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    DelayedWidget(
                      delayDuration: 1500.milliseconds,
                      child: SizedBox(
                        height: 50.0.wp,
                        child: Center(
                          child: Icon(
                            Icons.location_on,
                            color: ColorManager.bgDark,
                            size: 8.0.wp,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6.0.wp,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 4.5.wp, vertical: 4.0.wp),
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0.wp))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.0.wp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ulasan',
                              style: TextStyles.poppinsBold.copyWith(
                                  fontSize: 5.0.wp,
                                  height: 1.35,
                                  fontWeight: FontWeight.bold
                                  // fontWeight: FontWeight.w400,
                                  ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.0.wp),
                        child: const Divider(
                          height: 2,
                        ),
                      ),
                      ListView.separated(
                        separatorBuilder: (context, length) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0.wp),
                            child: const Divider(
                              height: 2,
                            ),
                          );
                        },
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listReview.length,
                        itemBuilder: (context, index) {
                          return RatingCardWidget(
                            review: listReview[index],
                          );
                        },
                      ),
                      // CustomButton(
                      //   function: () {
                      //     showSnackBar(
                      //         title: "Tidak bisa memberi ulasan",
                      //         description:
                      //             "Anda tidak berada di lokasi wisata");
                      //   },
                      //   title: "Berikan Ulasan",
                      //   fontSize: 4.0.wp,
                      //   titleColor: ColorManager.white,
                      //   color: ColorManager.bgDark,
                      //   borderRadius: 6.0.wp,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.0.wp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
