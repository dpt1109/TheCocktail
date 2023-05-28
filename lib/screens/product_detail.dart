import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import '../consts/global_colors.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            const BackButton(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Category",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          "Name Cocktail",
                          textAlign: TextAlign.start,
                          style: titleStyle,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.4,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return FancyShimmerImage(
                    width: double.infinity,
                    imageUrl:
                        "https://media.istockphoto.com/id/1323890695/vi/anh/b%C6%B0%E1%BB%9Fi-h%E1%BB%93ng-v%C3%A0-cocktail-gin-h%C6%B0%C6%A1ng-th%E1%BA%A3o-%C4%91%C6%B0%E1%BB%A3c-ph%E1%BB%A5c-v%E1%BB%A5-trong-ly-gin-%C4%91%C3%A3-chu%E1%BA%A9n-b%E1%BB%8B.jpg?s=612x612&w=0&k=20&c=FlhdXgqMIj7-gWUVIf6MYJLNoYNNKI-HbETFPLPC14s=",
                    boxFit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: 3,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description', style: titleStyle),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
