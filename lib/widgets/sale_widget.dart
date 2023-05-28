import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1551024709-8f23befc6f87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y29ja3RhaWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  'https://media.istockphoto.com/id/1302684784/fr/photo/cocktail-de-gin-de-mod%C3%A8le-de-pop-art-avec-des-agrumes-de-pamplemousse-dans-le-fond-bleu.jpg?b=1&s=170667a&w=0&k=20&c=gB_su8mcpkj_gGQv-e8k1KpPVIbB_h02DMD9pUUxSIo=',
  'https://media.istockphoto.com/id/1304114901/fr/photo/cocktail-alcoolis%C3%A9-de-p%C3%A9nicilline.jpg?b=1&s=170667a&w=0&k=20&c=dqXpNCjUDbASR_vmr5OF_D9k7SY-Z0oTecveTi3ZJqk=',
  'https://media.istockphoto.com/id/1287561021/fr/photo/vin-chaud-chaud-chaud-chaud-avec-des-oranges-et-du-romarin-dans-une-atmosph%C3%A8re-du-nouvel-an.jpg?b=1&s=170667a&w=0&k=20&c=Ih1iLVlMa6Gt3UVkgLobI_89GrB7iDtesEhq0pGYFiU=',
  'https://media.istockphoto.com/id/697705870/fr/photo/doux-et-rafra%C3%AEchissant-cocktail-caipirinha-de-boisson.jpg?b=1&s=170667a&w=0&k=20&c=amOti6B3eZ5MF6sLjVSYYHt5A3onGLOFo25VYeLSRjw=',
  'https://media.istockphoto.com/id/1323890695/vi/anh/b%C6%B0%E1%BB%9Fi-h%E1%BB%93ng-v%C3%A0-cocktail-gin-h%C6%B0%C6%A1ng-th%E1%BA%A3o-%C4%91%C6%B0%E1%BB%A3c-ph%E1%BB%A5c-v%E1%BB%A5-trong-ly-gin-%C4%91%C3%A3-chu%E1%BA%A9n-b%E1%BB%8B.jpg?s=612x612&w=0&k=20&c=FlhdXgqMIj7-gWUVIf6MYJLNoYNNKI-HbETFPLPC14s='
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        // child: Text(
                        //   'No. ${imgList.indexOf(item)} image',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 20.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class SaleWidget extends StatelessWidget {
  const SaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   Size size = MediaQuery.of(context).size;
    //   return Container(
    //     width: double.infinity,
    //     height: size.height * 0.2,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(18),
    //       gradient: const LinearGradient(
    //           colors: [
    //             Color(0xFF7A60A5),
    //             Color(0xFF82C3DF),
    //           ],
    //           begin: FractionalOffset(0.0, 0.0),
    //           end: FractionalOffset(1.0, 0.0),
    //           stops: [0.0, 1.0],
    //           tileMode: TileMode.clamp),
    //     ),
    //     child: Row(
    //       children: [
    //         Flexible(
    //           flex: 2,
    //           child: Padding(
    //             padding: const EdgeInsets.all(14.0),
    //             child: Container(
    //               height: double.infinity,
    //               decoration: BoxDecoration(
    //                 color: const Color(0xFF9689CE),
    //                 borderRadius: BorderRadius.circular(18),
    //               ),
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Column(
    //                   // mainAxisSize: MainAxisSize.max,
    //                   // mainAxisAlignment: MainAxisAlignment.center,
    //                   // crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: const [
    //                     Text(
    //                       "Chào mừng bạn đã đến với",
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                     SizedBox(
    //                       height: 18,
    //                     ),
    //                     Flexible(
    //                       child: SizedBox(
    //                         width: double.infinity,
    //                         child: FittedBox(
    //                           fit: BoxFit.fill,
    //                           child: Text(
    //                             "The Cocktail",
    //                             style: TextStyle(
    //                               color: Colors.white,
    //                               fontWeight: FontWeight.bold,
    //                               // fontSize: 300,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Flexible(
    //           flex: 3,
    //           child: Padding(
    //             padding: const EdgeInsets.all(14.0),
    //             child: Image.network(
    //               width: double.infinity,
    //               // height: double.infinity,
    //               "https://i.ibb.co/vwB46Yq/shoes.png",
    //               fit: BoxFit.contain,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        ],
      ),
    );
  }
}
