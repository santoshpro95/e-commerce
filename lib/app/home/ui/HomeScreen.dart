import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mecommerce/app/config/ColorsSet.dart';
import 'package:mecommerce/app/config/ImagesSet.dart';
import 'package:mecommerce/app/config/Routes.dart';
import 'package:mecommerce/app/config/StringsSet.dart';
import 'package:mecommerce/app/home/fragment/cart/CartWidget.dart';
import 'package:mecommerce/app/home/fragment/favorite/FavoriteWidget.dart';
import 'package:mecommerce/app/home/fragment/homeFragment/HomeWidget.dart';
import 'package:mecommerce/app/home/fragment/profile/ProfileWidget.dart';
import 'package:mecommerce/app/home/fragment/shop/ShopWidget.dart';
import 'package:mecommerce/app/home/bloc/HomeBloc.dart';
import 'package:mecommerce/app/products/ProductsScreen.dart';


import '../../config/ColorsSet.dart';

class HomeScreen extends StatefulWidget {
  static const tag = Routes.homeScreen;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = HomeBloc();

  List screen = [
    HomeWidget(),
    CartWidget(),
    ShopWidget(),
    ProductScreen(productType: StringsSet.favorites,),
    ProfileWidget(),
  ];

  @override
  void initState() {



    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: StreamBuilder<int>(
            stream: _homeBloc.bottomBarStream,
            initialData: 0,
            builder: (context, AsyncSnapshot<int> snapshot) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: screen[snapshot.data],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      child: BottomNavigationBar(
                        currentIndex: snapshot.data,
                        elevation: 12,
                        onTap: (position) =>
                            _homeBloc.onChangeBottomBar(position),
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: AppColors.red,
                        showSelectedLabels: true,
                        unselectedItemColor: Colors.grey,
                        showUnselectedLabels: true,
                        items: [
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              ImagesSet.home,
                              height: 24.0,
                              width: 24.0,
                              color: AppColors.lightGray,
                            ),
                            title: Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            activeIcon: SvgPicture.asset(
                              ImagesSet.home,
                              height: 24.0,
                              width: 24.0,
                              color: AppColors.red,
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              ImagesSet.cart,
                              height: 24.0,
                              width: 24.0,
                              color: AppColors.lightGray,
                            ),
                            title: Text(
                              "Cart",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            activeIcon: SvgPicture.asset(
                              ImagesSet.cart,
                              height: 24.0,
                              width: 24.0,
                              color: AppColors.red,
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              ImagesSet.bag,
                              height: 24.0,
                              width: 24.0,
                              color: AppColors.lightGray,
                            ),
                            title: Text(
                              "Shop",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            activeIcon: SvgPicture.asset(
                              ImagesSet.bag,
                              height: 24.0,
                              width: 24.0,
                              color: AppColors.red,
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              ImagesSet.favorite,
                              height: 24.0,
                              width: 24.0,
                              color: AppColors.lightGray,
                            ),
                            title: Text(
                              "Favorite",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            activeIcon: SvgPicture.asset(
                              ImagesSet.favorite,
                              height: 24.0,
                              width: 24.0,
                              color: AppColors.red,
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              ImagesSet.profile,
                              height: 24.0,
                              width: 24.0,
                              color: AppColors.lightGray,
                            ),
                            title: Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            activeIcon: SvgPicture.asset(
                              ImagesSet.profile,
                              height: 24.0,
                              width: 24.0,
                              color: AppColors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
