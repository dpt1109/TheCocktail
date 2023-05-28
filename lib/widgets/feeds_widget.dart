import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_api_flutter_course/screens/product_detail.dart';

import '../consts/global_colors.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const ProductDetail(),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Mojito",
                              style: TextStyle(
                                  color: lightTextColor,
                                  fontWeight: FontWeight.w600)),
                        ]),
                      ),
                    ),
                    const Icon(IconlyBold.heart),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  height: size.height * 0.2,
                  width: double.infinity,
                  errorWidget: const Icon(
                    IconlyBold.danger,
                    color: Colors.red,
                    size: 28,
                  ),
                  imageUrl:
                      'https://media.istockphoto.com/id/1323890695/vi/anh/b%C6%B0%E1%BB%9Fi-h%E1%BB%93ng-v%C3%A0-cocktail-gin-h%C6%B0%C6%A1ng-th%E1%BA%A3o-%C4%91%C6%B0%E1%BB%A3c-ph%E1%BB%A5c-v%E1%BB%A5-trong-ly-gin-%C4%91%C3%A3-chu%E1%BA%A9n-b%E1%BB%8B.jpg?s=612x612&w=0&k=20&c=FlhdXgqMIj7-gWUVIf6MYJLNoYNNKI-HbETFPLPC14s=',
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "An open, crowd-sourced database of drinks and cocktails from around the world.We also offer a free JSON API for anyone wanting to use it.If you like the site, please consider supporting us on Patreon by clicking the link below...",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 9,
                  style: TextStyle(
                    fontSize: 17,
                    //  fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
