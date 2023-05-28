import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/screens/feeds_screen.dart';
import 'package:store_api_flutter_course/screens/login.dart';

import '../services/api-handler.dart';
import '../widgets/appbar_icons.dart';
import '../widgets/feeds_widget.dart';
import '../widgets/sale_widget.dart';
import '../screens/saved_screen.dart';
import 'package:store_api_flutter_course/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            // elevation: 4,
            title: const Text('The Cocktail'),

            // actions: [
            //   IconButton(
            //       icon: Icon(Icons.nightlight_round),
            //       onPressed: () {
            //         themeMode.value = themeMode.value == 1 ? 2 : 1;
            //       }),
            // ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(),
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 175, 0, 120),
                    ),
                    accountName: Text('Trí Đặng'),
                    accountEmail: Text('dangphuctri5887@gmail.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://scontent.fsgn5-15.fna.fbcdn.net/v/t39.30808-1/321709505_853432479243283_6097919050086336721_n.jpg?stp=dst-jpg_p320x320&_nc_cat=111&ccb=1-7&_nc_sid=7206a8&_nc_ohc=ZLmr9yagi3gAX87dXGT&_nc_ht=scontent.fsgn5-15.fna&oh=00_AfCnlXuJrg-lrPsiyfOzKQPQE2Cy2cjf8ihqSeDhnAqRig&oe=64474888'),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.save),
                  title: const Text('Saved'),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const SavedScreen()));
                  },
                ),
                ListTile(
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text('Log out'),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const Login()));
                    }),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('Infomation'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      suffixIcon: Icon(
                        IconlyLight.search,
                        color: lightIconsColor,
                      )),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: size.height * 0.5,
                        child: Swiper(
                          itemCount: 6,
                          itemBuilder: (ctx, index) {
                            return const SaleWidget();
                          },
                          autoplay: true,
                          pagination: const SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.pinkAccent,
                                  activeColor: Colors.white)),
                          // control: const SwiperControl(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "All Products",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            AppBarIcons(
                                function: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: const FeedsScreen()));
                                },
                                icon: IconlyBold.arrowRight2),
                          ],
                        ),
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0.0,
                                  mainAxisSpacing: 0.0,
                                  childAspectRatio: 0.6),
                          itemBuilder: (ctx, index) {
                            return const FeedsWidget();
                          })
                    ]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
