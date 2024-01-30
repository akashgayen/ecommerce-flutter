import 'package:ecom_flutter/models/cart.dart';
import 'package:ecom_flutter/widgets/categorieslistview.dart';
import 'package:ecom_flutter/widgets/productlistview.dart';
import 'package:ecom_flutter/screens/cartview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: 2.h,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: const Color(
                                0xFFDFDFDF,
                              ),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  fontSize: 12.sp,
                                ),
                                prefixIcon: Icon(
                                  CupertinoIcons.search,
                                  size: 16.sp,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(
                                  9.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            color: const Color(
                              0xFFDFDFDF,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.heart,
                              size: 16.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            color: const Color(
                              0xFFDFDFDF,
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Visibility(
                                visible: ccart.count != 0 ? true : false,
                                child: Text(
                                  '${ccart.count}',
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Cartview(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  CupertinoIcons.cart,
                                  size: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 25.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.all(
                        10.sp,
                      ),
                      child: SizedBox(
                        width: 100.w,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Upto ',
                                      style: TextStyle(
                                        fontSize: 22.sp,
                                      ),
                                    ),
                                    Text(
                                      '80% off',
                                      style: TextStyle(
                                        fontSize: 22.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'on Electronics',
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Shop now',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(),
                                  Icon(
                                    Icons.devices_other_rounded,
                                    size: 90.sp,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Sort by ',
                          style: TextStyle(
                            fontSize: 17.sp,
                          ),
                        ),
                        Text(
                          'Categories',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17.h,
                      child: const CategoriesListView(),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Trending',
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'See more',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 39.34.h,
                      child: const ProductListView(
                        number: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
