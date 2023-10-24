

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:testt/HOME_pages/Home.dart';
import 'package:testt/HOME_pages/Topproduct/top_product_view_all.dart';
import 'package:testt/HOME_pages/all_product/allProduct_view.dart';
import 'package:testt/HOME_pages/categories/categories.dart';
import 'package:testt/HOME_pages/categories/categories_list.dart';
import 'package:testt/HOME_pages/most_rated/mostrated_product_view_all.dart';
import 'package:testt/HOME_pages/newestproduct/newestproduct_view_all.dart';
import 'package:testt/screen/ontapproduct.dart';
import 'package:testt/screen/wishlist/wishlist.dart';

class MyRoutes{

  static final FluroRouter router = FluroRouter();
  static Handler home = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) => Home());
  static Handler _CategoriesRoute = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) => catagories_screen());
  static Handler _Allproduct = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) => all_product_screen());
  static Handler _Topproduct = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) => top_product_view_all());
  static Handler _Mostproduct = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) => mostratedproduct());
  static Handler _newestproduct = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) => newestproduct());
  static Handler _catRepo = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) => catagories_screen_list(
      id: params['id'][0],
    name: params['name'][0],
  ));
  static Handler _Detailpage = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) => OnTap
        (id: params['id'][0], product_name: params['product_name'][0],
        product_category: params['product_category'][0],)
  );


  static void setupRouter() {
    router.define(
      '/',
      handler: home,
    );
    router.define(
      '/category',
      handler: _CategoriesRoute,
    );
    router.define(
      '/allproduct',
      handler: _Allproduct,
    );
    router.define(
      '/top_product',
      handler: _Topproduct,
    );
    router.define(
      '/most_rated_product',
      handler: _Mostproduct,
    );
    router.define(
      '/newest_product',
      handler: _newestproduct,
    );
    router.define(
      '/category/:id/:name',

      handler: _catRepo,
    );
    router.define(
      '/productdetail/:id/:product_category/:product_name',

      handler: _Detailpage,
    );

  }




}

