import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic>? data = snapshot.data;
          return _categoriesListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

Future<List<dynamic>> _getCategories() async {
  const productURL = 'https://fakestoreapi.com/products/categories';
  final response = await http.get(Uri.parse(productURL));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse;
  } else {
    throw Exception('Failed to load products from fake API');
  }
}

ListView _categoriesListView(data) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: data.length,
    itemBuilder: (context, index) {
      List categoryIcons = [
        Icon(
          CupertinoIcons.device_laptop,
          size: 20.sp,
        ),
        Icon(
          Icons.diamond_outlined,
          size: 20.sp,
        ),
        Icon(
          Icons.male,
          size: 20.sp,
        ),
        Icon(
          Icons.female,
          size: 20.sp,
        ),
      ];
      return Padding(
        padding: EdgeInsets.all(5.sp),
        child: SizedBox(
          width: 20.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 10.h,
                width: 15.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFDFDFDF),
                ),
                child: Center(
                  child: categoryIcons[index],
                ),
              ),
              Center(
                child: Text(
                  data[index],
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
