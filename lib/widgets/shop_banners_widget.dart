// import 'dart:async';
// import 'dart:math';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_marketplace_service/models/shop_banner_model.dart';
// // import 'package:flutter_marketplace_service/service/ShopBannerProvider.dart';

// class ShopBannersWidget extends StatefulWidget {
//   @override
//   _ShopBannersWidgetState createState() => _ShopBannersWidgetState();
// }

// class _ShopBannersWidgetState extends State<ShopBannersWidget> {
//   final StreamController sc = StreamController();
//   final rng = Random();

//   // int _currentBanner = 0;

//   final containers = [
//     Container(color: Colors.pink),
//     Container(color: Colors.black),
//     Container(color: Colors.yellow),
//     Container(color: Colors.brown),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     initBanners();
//     Timer.periodic(
//       Duration(seconds: 5),
//       (t) {
//         sc.add(rng.nextInt(containers.length));
//       },
//     );
//   }

//   void initBanners() async {
//     // List<ShopBanners> banners = await ShopBannerProvider.getBanners();
//     // print(banners);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: sc.stream,
//       builder: (context, snapshot) {
//         if (snapshot.hasData == false) {
//           return CircularProgressIndicator();
//         }
//         return Container(
//           child: mainView(containers, containers[snapshot.data]),
//         );
//       },
//     );
//   }

//   Widget mainView(
//     List<Container> queue,
//     Container mediaItemX,
//   ) {
//     return CarouselSlider.builder(
//       options: CarouselOptions(
//         autoPlay: true,
//         height: 150,
//         aspectRatio: 1,
//         enlargeCenterPage: true,
//         onPageChanged: (index, reason) {
//           // setState(() {
//           //   _currentBanner = index;
//           // });
//         },
//       ),
//       itemCount: queue.length,
//       // initialPage: queue.indexOf(mediaItemX), //only works first time
//       itemBuilder: (BuildContext context, int itemIndex) {
//         print('changed');

//         return mediaItemX;
//       },
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marketplace/config/colors.dart';
import 'package:flutter_marketplace_service/service/shop_banner/shop_banner_repository.dart';

class ShopBannersWidget extends StatefulWidget {
  ShopBannersWidget({Key key}) : super(key: key);

  @override
  _ShopBannersWidgetState createState() => _ShopBannersWidgetState();
}

class _ShopBannersWidgetState extends State<ShopBannersWidget> {
  int _currentBanner = 0;
  final shopBannerRepository = ShopBannerRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: 150,
              aspectRatio: 1,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentBanner = index;
                });
              },
            ),
            items: List.generate(
              6,
              (_) => Container(
                width: double.infinity,
                child: InkWell(
                  child: Image.asset(
                    'assets/carousel.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,
                  (index) => Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentBanner == index
                          ? MyColors.white
                          : MyColors.iron,
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

// // import 'dart:async';
// // import 'dart:math';

// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // // import 'package:flutter_marketplace_service/models/shop_banner_model.dart';
// // // import 'package:flutter_marketplace_service/service/ShopBannerProvider.dart';

// // class ShopBannersWidget extends StatefulWidget {
// //   @override
// //   _ShopBannersWidgetState createState() => _ShopBannersWidgetState();
// // }

// // class _ShopBannersWidgetState extends State<ShopBannersWidget> {
// //   final StreamController sc = StreamController();
// //   final rng = Random();

// //   // int _currentBanner = 0;

// //   final containers = [
// //     Container(color: Colors.pink),
// //     Container(color: Colors.black),
// //     Container(color: Colors.yellow),
// //     Container(color: Colors.brown),
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     initBanners();
// //     Timer.periodic(
// //       Duration(seconds: 5),
// //       (t) {
// //         sc.add(rng.nextInt(containers.length));
// //       },
// //     );
// //   }

// //   void initBanners() async {
// //     // List<ShopBanners> banners = await ShopBannerProvider.getBanners();
// //     // print(banners);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder(
// //       stream: sc.stream,
// //       builder: (context, snapshot) {
// //         if (snapshot.hasData == false) {
// //           return CircularProgressIndicator();
// //         }
// //         return Container(
// //           child: mainView(containers, containers[snapshot.data]),
// //         );
// //       },
// //     );
// //   }

// //   Widget mainView(
// //     List<Container> queue,
// //     Container mediaItemX,
// //   ) {
// //     return CarouselSlider.builder(
// //       options: CarouselOptions(
// //         autoPlay: true,
// //         height: 150,
// //         aspectRatio: 1,
// //         enlargeCenterPage: true,
// //         onPageChanged: (index, reason) {
// //           // setState(() {
// //           //   _currentBanner = index;
// //           // });
// //         },
// //       ),
// //       itemCount: queue.length,
// //       // initialPage: queue.indexOf(mediaItemX), //only works first time
// //       itemBuilder: (BuildContext context, int itemIndex) {
// //         print('changed');

// //         return mediaItemX;
// //       },
// //     );
// //   }
// // }

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_marketplace/config/colors.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_marketplace_service/service/shop_banner/cubit/shop_banner_cubit.dart';
// import 'package:flutter_marketplace_service/service/shop_banner/shop_banner_repository.dart';

// class ShopBannersWidget extends StatefulWidget {
//   ShopBannersWidget({Key key}) : super(key: key);

//   @override
//   _ShopBannersWidgetState createState() => _ShopBannersWidgetState();
// }

// class _ShopBannersWidgetState extends State<ShopBannersWidget> {
//   int _currentBanner = 0;
//   final shopBannerRepository = ShopBannerRepository();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ShopBannerCubit>(
//       create: (context) =>
//           ShopBannerCubit(shopBannerRepository)..fetchBanners(),
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 18),
//         child: BlocBuilder<ShopBannerCubit, ShopBannerState>(
//           builder: (context, state) {
//             // final ShopBannerCubit shopBannerCubit =
//             //     context.watch<ShopBannerCubit>();
//             return Stack(
//               children: [
//                 CarouselSlider(
//                   options: CarouselOptions(
//                     autoPlay: true,
//                     height: 150,
//                     aspectRatio: 1,
//                     enlargeCenterPage: true,
//                     onPageChanged: (index, reason) {
//                       setState(() {
//                         _currentBanner = index;
//                       });
//                     },
//                   ),
//                   items: List.generate(
//                     6,
//                     (_) => Container(
//                       width: double.infinity,
//                       child: InkWell(
//                         child: Image.asset(
//                           'assets/carousel.jpg',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   width: MediaQuery.of(context).size.width,
//                   bottom: 0,
//                   left: 0,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 2,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(
//                         6,
//                         (index) => Container(
//                           width: 8.0,
//                           height: 8.0,
//                           margin: EdgeInsets.symmetric(
//                               vertical: 10.0, horizontal: 2.0),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: _currentBanner == index
//                                 ? MyColors.white
//                                 : MyColors.iron,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
