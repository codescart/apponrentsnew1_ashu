import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:testt/HOME_pages/HomeDrawer.dart';
import 'package:testt/HOME_pages/Slider/Web_allcatagories_slider.dart';
import 'package:testt/HOME_pages/Slider/most_rated_prodect_slider.dart';
import 'package:testt/HOME_pages/Slider/mostrated_banner.dart';
import 'package:testt/HOME_pages/Slider/newest_product_slider.dart';
import 'package:testt/HOME_pages/Slider/web_top_product_slider.dart';
import 'package:testt/HOME_pages/Topproduct/top_product_view_all.dart';
import 'package:testt/HOME_pages/all_product/allProduct_view.dart';
import 'package:testt/HOME_pages/animatesearch.dart';
import 'package:testt/HOME_pages/categories/categories.dart';
import 'package:testt/HOME_pages/most_rated/mostrated_product_view_all.dart';
import 'package:testt/HOME_pages/newestproduct/newestproduct_view_all.dart';
import 'package:testt/HOME_pages/slider_with_type.dart';
import 'package:testt/HOME_pages/web_view/web_all_product.dart';
import 'package:testt/HOME_pages/web_view/web_categories.dart';
import 'package:testt/constants.dart';
import 'package:testt/frontapi.dart';
import 'package:testt/launch.dart';
import 'package:testt/responsive.dart';
import 'package:testt/screen/shimmmmmer/alproductshimmer.dart';
import 'package:testt/screen/shimmmmmer/categorieshimmer.dart';
import 'package:testt/screen/slide.dart';
import 'package:http/http.dart' as http;
import 'package:testt/screen/mobcard.dart';
import 'package:testt/HOME_pages/categories/home_categories_view.dart';
import 'package:testt/screen/wishlist/wishlist.dart';
import 'package:uni_links/uni_links.dart';
import 'package:uni_links/uni_links.dart';


class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);
  final _key = GlobalKey<ScaffoldState>();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _id;
  String link = "http://localhost:51141/allproduct";

  void _getInfo() async {
    String? result = await PlatformDeviceId.getDeviceId;
   // final devins= await http.post(Uri.parse('url'));
    setState(() async{
      _id = result;
      final prefs = await SharedPreferences.getInstance();
      final key = 'deviceId';
      final deviceId = _id ;
      prefs.setString(key, deviceId!);
    });
  }
  TextEditingController textController = TextEditingController();

  void initState() {
    // initUniLinks().then((value) => this.setState(() {
    //   link = value;
    // }));
    _getInfo();
    super.initState();
  }

  // Future<String> initUniFuture<String> initUniLinks() async {
  //
  //   try {
  //     final initialLink = await getInitialLink();
  //
  //     return initialLink;
  //   } on PlatformException {
  //   }
  // }
  // Links() async {
  //   try {
  //     final initialLink = await getInitialLink();
  //     return initialLink;
  //   } on PlatformException {
  //   }
  // }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  String _text = '';
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: MediaQuery.of(context).size.width<800 && MediaQuery.of(context).size.width<=1200?
      AppBar(
        leading:   IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  HomeDrewer()),
          );

        },icon: Icon(Icons.menu),
        ),
        elevation: 0.3,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Wishlist_page()));
          }, icon:  Icon(Icons.favorite_border_outlined, color: icontextcolor,)),
          IconButton(icon: Icon(Icons.call,color: Colors.redAccent,), onPressed: () { launchCaller(); },),

        ],
        title: Image.asset('images/logo_horizon.png', height: 40,),
      ):
      AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/logo_horizon.png', height: 30,),
            Container(
              height: 20,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.70,
              padding: EdgeInsets.only(left: 20,),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<
                          Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.hovered))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.pressed))
                              return pressedtextcolor;
                            return textcolor; // null throus error in flutter 2.2+.
                          }),
                    ),
                    onPressed: () {},
                    child: Text('Product', style: TextStyle(fontSize: 15)),
                  ),

                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<
                          Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.hovered))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.pressed))
                              return pressedtextcolor;
                            return textcolor; // null throus error in flutter 2.2+.
                          }),
                    ),
                    onPressed: () {},
                    child: Text('My Orders', style: TextStyle(fontSize: 15)),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<
                          Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.hovered))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.pressed))
                              return pressedtextcolor;
                            return textcolor; // null throus error in flutter 2.2+.
                          }),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Wishlist_page()));
                    },
                    child: Text('Favourite', style: TextStyle(fontSize: 15)),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<
                          Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.hovered))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.pressed))
                              return pressedtextcolor;
                            return textcolor; // null throus error in flutter 2.2+.
                          }),
                    ),
                    onPressed: () {},
                    child: Text('Aboutus', style: TextStyle(fontSize: 15),),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<
                          Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.hovered))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.pressed))
                              return pressedtextcolor;
                            return textcolor; // null throus error in flutter 2.2+.
                          }),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Free SEO', style: TextStyle(fontSize: 15),),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<
                          Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.hovered))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.pressed))
                              return pressedtextcolor;
                            return textcolor; // null throus error in flutter 2.2+.
                          }),
                    ),
                    onPressed: () {},
                    child: Text('My Orders', style: TextStyle(fontSize: 15)),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<
                          Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.hovered))
                              return nohovertextcolor;
                            if (states.contains(MaterialState.pressed))
                              return pressedtextcolor;
                            return textcolor; // null throus error in flutter 2.2+.
                          }),
                    ),
                    onPressed: () {},
                    child: Text('Login/logout', style: TextStyle(fontSize: 15),),
                  ),

                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Wishlist_page()));

          }, icon:  Icon(Icons.favorite_border_outlined, color: icontextcolor,)),
          IconButton(onPressed: (){}, icon:  Icon(Icons.person, color: icontextcolor,)),

        ],


      )

      ,


      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        desktop: desk(context),
      ),

      floatingActionButton: Column(
mainAxisAlignment: MainAxisAlignment.end,

        children:[

          Wrap( //will break to another line on overflow
            direction: Axis.horizontal, //use vertical to show  on vertical axis
            children: <Widget>[ //button first
              Padding(
                padding: const EdgeInsets.only(top: 20.0,right:80),
                child: FloatingActionButton(

                  onPressed: (){
                    openwhatsapp("hi we are visited your app https://ApponRent.com , we have some Query...");
                  },
                  backgroundColor: Colors.transparent,
                  splashColor:Colors.transparent,
                  child: Image.asset('images/wp.gif'),
                ),
              ),
              search(context),
              // button third// Add more buttons here
            ],
          ),

        ],
      ),



    );
  }

  mobile(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [

        Container(
            height: 200,
            child: Slider_wer()),



        Padding(
          padding:EdgeInsets.only(left: 20, right: 10, top: 20),
          child: Row(
            children: [
               Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),


               Spacer(),
              TextButton(
                onPressed: () => {

                  Navigator.push(context,MaterialPageRoute(builder: (context)=>catagories_screen())),

                },


                child: Row( // Replace with a Row for horizontal icon + text
                  children:[
                    Text("View All",style: TextStyle(color:Colors.redAccent ),),
                    Icon(Icons.keyboard_arrow_right_rounded,color:Colors.redAccent ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height:MediaQuery.of(context).size.height*.25,
          child: FutureBuilder<List<Album>>(
              future: bowss(),
              builder: (context, snapshot) {
                if (snapshot.hasData) print(snapshot.error);
                return snapshot.hasData
                    ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return MobileCard( id: snapshot.data![index].id,
                      images_file: snapshot.data![index].images_file,
                      shortdescription: snapshot.data![index].shortdescription,
                      name:snapshot.data![index].name,
                      seo:snapshot.data![index].seo,
                      status: snapshot.data![index].status,);
                  },
                )
                    :  ChatShimmer();
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 20,),
          child: Row(
            children: [
              const Text(
                'All Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
               Spacer(),
              TextButton(
                onPressed: () => {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>all_product_screen())),
                },
                child: Row( // Replace with a Row for horizontal icon + text
                  children:[

                    Text("View All",style: TextStyle(color:Colors.redAccent ),),
                    Icon(Icons.keyboard_arrow_right_rounded,color:Colors.redAccent ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<Allproducts>>(
            future: Allproduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) print(snapshot.error);
              return snapshot.hasData
                  ? GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
                   itemBuilder: (BuildContext context, int index) {
                   return  mobcard(
                     id: snapshot.data![index].id, product_image: snapshot.data![index].product_image, other_images: snapshot.data![index].other_images,
                  sdescription: snapshot.data![index].sdescription, full_description: snapshot.data![index].full_description, product_name: snapshot.data![index].product_name,
                  mispell_key: snapshot.data![index].mispell_key, features: snapshot.data![index].features, rental_price: snapshot.data![index].rental_price,
                  selling_price: snapshot.data![index].selling_price, discount: snapshot.data![index].discount, time: snapshot.data![index].time, seo: snapshot.data![index].seo, web_url: snapshot.data![index].web_url,
                  product_spiecified: snapshot.data![index].product_spiecified, mobile_app: snapshot.data![index].mobile_app, category:snapshot.data![index].category,
                  likes: snapshot.data![index].likes, video_url: snapshot.data![index].video_url, wishlists: snapshot.data![index].wishlists, admin_url: snapshot.data![index].admin_url,
                  mylikes: snapshot.data![index].mylikes, product_category: snapshot.data![index].product_category, plan_name: snapshot.data![index].plan_name, month_3: snapshot.data![index].month_3,
                  month_6: snapshot.data![index].month_6, mywishlist: snapshot.data![index].mywishlist, month_12: snapshot.data![index].month_12, year_2: snapshot.data![index].year_2,
                  year_10: snapshot.data![index].year_10, year_10price: snapshot.data![index].year_10price, year_5: snapshot.data![index].year_5, recentview: snapshot.data![index].recentview, month_3price: snapshot.data![index].month_3price, month_6price: snapshot.data![index].month_6price, month_12price: snapshot.data![index].month_12, year_2price: snapshot.data![index].year_2price, year_5price: snapshot.data![index].year_5price
                   );
              },
            ): AllproductShimmer();
          }
        ),
        Container(
            height: 200,
            child: slider_with_type()),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 20,),
          child: Row(
            children: [
              const Text(
                'Top Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () => {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>top_product_view_all())),
                },
                child: Row( // Replace with a Row for horizontal icon + text
                  children:[

                    Text("View All",style: TextStyle(color:Colors.redAccent ),),
                    Icon(Icons.keyboard_arrow_right_rounded,color:Colors.redAccent ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<Topproduct>>(
            future: top(),
            builder: (context, snapshot) {
              if (snapshot.hasData) print(snapshot.error);
              return snapshot.hasData
                  ? GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
                itemBuilder: (BuildContext context, int index) {
                  return  mobcard(
                      id: snapshot.data![index].id, product_image: snapshot.data![index].product_image, other_images: snapshot.data![index].other_images,
                      sdescription: snapshot.data![index].sdescription, full_description: snapshot.data![index].full_description, product_name: snapshot.data![index].product_name,
                      mispell_key: snapshot.data![index].mispell_key, features: snapshot.data![index].features, rental_price: snapshot.data![index].rental_price,
                      selling_price: snapshot.data![index].selling_price, discount: snapshot.data![index].discount, time: snapshot.data![index].time, seo: snapshot.data![index].seo, web_url: snapshot.data![index].web_url,
                      product_spiecified: snapshot.data![index].product_spiecified, mobile_app: snapshot.data![index].mobile_app, category:snapshot.data![index].category,
                      likes: snapshot.data![index].likes, video_url: snapshot.data![index].video_url, wishlists: snapshot.data![index].wishlists, admin_url: snapshot.data![index].admin_url,
                      mylikes: snapshot.data![index].mylikes, product_category: snapshot.data![index].product_category, plan_name: snapshot.data![index].plan_name, month_3: snapshot.data![index].month_3,
                      month_6: snapshot.data![index].month_6, mywishlist: snapshot.data![index].mywishlist, month_12: snapshot.data![index].month_12, year_2: snapshot.data![index].year_2,
                      year_10: snapshot.data![index].year_10, year_10price: snapshot.data![index].year_10price, year_5: snapshot.data![index].year_5, recentview: snapshot.data![index].recentview, month_3price: snapshot.data![index].month_3price, month_6price: snapshot.data![index].month_6price, month_12price: snapshot.data![index].month_12, year_2price: snapshot.data![index].year_2price, year_5price: snapshot.data![index].year_5price
                  );
                },
              ): Container();
            }
        ),
        Container(
            height: 200,
            child: mostrated_banner()),
        Padding(
          padding:EdgeInsets.only(left: 20, right: 10, top: 20),
          child: Row(
            children: [
              Text(
                'Most Rated',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              Spacer(),
              TextButton(
                onPressed: () => {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>mostratedproduct())),

                },


                child: Row( // Replace with a Row for horizontal icon + text
                  children:[
                    Text("View All",style: TextStyle(color:Colors.redAccent ),),
                    Icon(Icons.keyboard_arrow_right_rounded,color:Colors.redAccent ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<Allproducts>>(
            future: most(),
            builder: (context, snapshot) {
              if (snapshot.hasData) print(snapshot.error);
              return snapshot.hasData
                  ? GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
                itemBuilder: (BuildContext context, int index) {
                  return  mobcard(
                      id: snapshot.data![index].id, product_image: snapshot.data![index].product_image, other_images: snapshot.data![index].other_images,
                      sdescription: snapshot.data![index].sdescription, full_description: snapshot.data![index].full_description, product_name: snapshot.data![index].product_name,
                      mispell_key: snapshot.data![index].mispell_key, features: snapshot.data![index].features, rental_price: snapshot.data![index].rental_price,
                      selling_price: snapshot.data![index].selling_price, discount: snapshot.data![index].discount, time: snapshot.data![index].time, seo: snapshot.data![index].seo, web_url: snapshot.data![index].web_url,
                      product_spiecified: snapshot.data![index].product_spiecified, mobile_app: snapshot.data![index].mobile_app, category:snapshot.data![index].category,
                      likes: snapshot.data![index].likes, video_url: snapshot.data![index].video_url, wishlists: snapshot.data![index].wishlists, admin_url: snapshot.data![index].admin_url,
                      mylikes: snapshot.data![index].mylikes, product_category: snapshot.data![index].product_category, plan_name: snapshot.data![index].plan_name, month_3: snapshot.data![index].month_3,
                      month_6: snapshot.data![index].month_6, mywishlist: snapshot.data![index].mywishlist, month_12: snapshot.data![index].month_12, year_2: snapshot.data![index].year_2,
                      year_10: snapshot.data![index].year_10, year_10price: snapshot.data![index].year_10price, year_5: snapshot.data![index].year_5, recentview: snapshot.data![index].recentview, month_3price: snapshot.data![index].month_3price, month_6price: snapshot.data![index].month_6price, month_12price: snapshot.data![index].month_12, year_2price: snapshot.data![index].year_2price, year_5price: snapshot.data![index].year_5price
                  );
                },
              ): Container();
            }
        ),

        Container(
            height: 200,
            child: mostrated_banner()),
        Padding(
          padding:EdgeInsets.only(left: 20, right: 10, top: 20),
          child: Row(
            children: [
              Text(
                'Newest Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              Spacer(),
              TextButton(
                onPressed: () => {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>newestproduct())),

                },


                child: Row( // Replace with a Row for horizontal icon + text
                  children:[
                    Text("View All",style: TextStyle(color:Colors.redAccent ),),
                    Icon(Icons.keyboard_arrow_right_rounded,color:Colors.redAccent ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<Allproducts>>(
            future: newest(),
            builder: (context, snapshot) {
              if (snapshot.hasData) print(snapshot.error);
              return snapshot.hasData
                  ? GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
                itemBuilder: (BuildContext context, int index) {
                  return  mobcard(
                      id: snapshot.data![index].id, product_image: snapshot.data![index].product_image, other_images: snapshot.data![index].other_images,
                      sdescription: snapshot.data![index].sdescription, full_description: snapshot.data![index].full_description, product_name: snapshot.data![index].product_name,
                      mispell_key: snapshot.data![index].mispell_key, features: snapshot.data![index].features, rental_price: snapshot.data![index].rental_price,
                      selling_price: snapshot.data![index].selling_price, discount: snapshot.data![index].discount, time: snapshot.data![index].time, seo: snapshot.data![index].seo, web_url: snapshot.data![index].web_url,
                      product_spiecified: snapshot.data![index].product_spiecified, mobile_app: snapshot.data![index].mobile_app, category:snapshot.data![index].category,
                      likes: snapshot.data![index].likes, video_url: snapshot.data![index].video_url, wishlists: snapshot.data![index].wishlists, admin_url: snapshot.data![index].admin_url,
                      mylikes: snapshot.data![index].mylikes, product_category: snapshot.data![index].product_category, plan_name: snapshot.data![index].plan_name, month_3: snapshot.data![index].month_3,
                      month_6: snapshot.data![index].month_6, mywishlist: snapshot.data![index].mywishlist, month_12: snapshot.data![index].month_12, year_2: snapshot.data![index].year_2,
                      year_10: snapshot.data![index].year_10, year_10price: snapshot.data![index].year_10price, year_5: snapshot.data![index].year_5, recentview: snapshot.data![index].recentview, month_3price: snapshot.data![index].month_3price, month_6price: snapshot.data![index].month_6price, month_12price: snapshot.data![index].month_12, year_2price: snapshot.data![index].year_2price, year_5price: snapshot.data![index].year_5price
                  );
                },
              ): Container();
            }
        ),
      ],
    );
  }

  tablet(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
            height: 200,
            child: Slider_wer()),


        Padding(
          padding:EdgeInsets.only(left: 20, right: 10, top: 20),
          child: Row(
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () => {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>catagories_screen())),

                },


                child: Row( // Replace with a Row for horizontal icon + text
                  children:[
                    Text("View All",style: TextStyle(color:Colors.redAccent ),),
                    Icon(Icons.keyboard_arrow_right_rounded,color:Colors.redAccent ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height:MediaQuery.of(context).size.height*.22,
          child: FutureBuilder<List<Album>>(
              future: bowss(),
              builder: (context, snapshot) {
                if (snapshot.hasData) print(snapshot.error);
                return snapshot.hasData
                    ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return MobileCard( id: snapshot.data![index].id,
                      images_file: snapshot.data![index].images_file,
                      shortdescription: snapshot.data![index].shortdescription,
                      name:snapshot.data![index].name,
                      seo:snapshot.data![index].seo,
                      status: snapshot.data![index].status,);
                  },
                )
                    :  ChatShimmer();
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 20,),
          child: Row(
            children: [
              const Text(
                'All Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () => {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>all_product_screen())),
                },
                child: Row( // Replace with a Row for horizontal icon + text
                  children:[
                    Text("View All",style: TextStyle(color:Colors.redAccent ),),
                    Icon(Icons.keyboard_arrow_right_rounded,color:Colors.redAccent ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<Allproducts>>(
            future: Allproduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) print(snapshot.error);
              return snapshot.hasData
                  ? GridView.builder(

                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 20.0, mainAxisSpacing: 20.0,
                  // childAspectRatio: (itemWidth / itemHeight),
                  childAspectRatio: 0.75,

                ),
                itemBuilder: (BuildContext context, int index) {
                  return  mobcard(
                      id: snapshot.data![index].id, product_image: snapshot.data![index].product_image, other_images: snapshot.data![index].other_images,
                      sdescription: snapshot.data![index].sdescription, full_description: snapshot.data![index].full_description, product_name: snapshot.data![index].product_name,
                      mispell_key: snapshot.data![index].mispell_key, features: snapshot.data![index].features, rental_price: snapshot.data![index].rental_price,
                      selling_price: snapshot.data![index].selling_price, discount: snapshot.data![index].discount, time: snapshot.data![index].time, seo: snapshot.data![index].seo, web_url: snapshot.data![index].web_url,
                      product_spiecified: snapshot.data![index].product_spiecified, mobile_app: snapshot.data![index].mobile_app, category:snapshot.data![index].category,
                      likes: snapshot.data![index].likes, video_url: snapshot.data![index].video_url, wishlists: snapshot.data![index].wishlists, admin_url: snapshot.data![index].admin_url,
                      mylikes: snapshot.data![index].mylikes, product_category: snapshot.data![index].product_category, plan_name: snapshot.data![index].plan_name, month_3: snapshot.data![index].month_3,
                      month_6: snapshot.data![index].month_6, mywishlist: snapshot.data![index].mywishlist, month_12: snapshot.data![index].month_12, year_2: snapshot.data![index].year_2,
                      year_10: snapshot.data![index].year_10, year_10price: snapshot.data![index].year_10price, year_5: snapshot.data![index].year_5, recentview: snapshot.data![index].recentview, month_3price: snapshot.data![index].month_3price, month_6price: snapshot.data![index].month_6price, month_12price: snapshot.data![index].month_12, year_2price: snapshot.data![index].year_2price, year_5price: snapshot.data![index].year_5price
                  );
                },
              ): Container();
            }
        ),
        Container(
            height: 200,
            child: slider_with_type()),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 20,),
          child: Row(
            children: [
              const Text(
                'Top Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () => {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>top_product_view_all())),
                },
                child: Row( // Replace with a Row for horizontal icon + text
                  children:[

                    Text("View All",style: TextStyle(color:Colors.redAccent ),),
                    Icon(Icons.keyboard_arrow_right_rounded,color:Colors.redAccent ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<Topproduct>>(
            future: top(),
            builder: (context, snapshot) {
              if (snapshot.hasData) print(snapshot.error);
              return snapshot.hasData
                  ? GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return  mobcard(
                      id: snapshot.data![index].id, product_image: snapshot.data![index].product_image, other_images: snapshot.data![index].other_images,
                      sdescription: snapshot.data![index].sdescription, full_description: snapshot.data![index].full_description, product_name: snapshot.data![index].product_name,
                      mispell_key: snapshot.data![index].mispell_key, features: snapshot.data![index].features, rental_price: snapshot.data![index].rental_price,
                      selling_price: snapshot.data![index].selling_price, discount: snapshot.data![index].discount, time: snapshot.data![index].time, seo: snapshot.data![index].seo, web_url: snapshot.data![index].web_url,
                      product_spiecified: snapshot.data![index].product_spiecified, mobile_app: snapshot.data![index].mobile_app, category:snapshot.data![index].category,
                      likes: snapshot.data![index].likes, video_url: snapshot.data![index].video_url, wishlists: snapshot.data![index].wishlists, admin_url: snapshot.data![index].admin_url,
                      mylikes: snapshot.data![index].mylikes, product_category: snapshot.data![index].product_category, plan_name: snapshot.data![index].plan_name, month_3: snapshot.data![index].month_3,
                      month_6: snapshot.data![index].month_6, mywishlist: snapshot.data![index].mywishlist, month_12: snapshot.data![index].month_12, year_2: snapshot.data![index].year_2,
                      year_10: snapshot.data![index].year_10, year_10price: snapshot.data![index].year_10price, year_5: snapshot.data![index].year_5, recentview: snapshot.data![index].recentview, month_3price: snapshot.data![index].month_3price, month_6price: snapshot.data![index].month_6price, month_12price: snapshot.data![index].month_12, year_2price: snapshot.data![index].year_2price, year_5price: snapshot.data![index].year_5price
                  );
                },
              ): Container();
            }
        ),
        Container(
            height: 200,
            child: mostrated_banner()),
        Padding(
          padding:EdgeInsets.only(left: 20, right: 10, top: 20),
          child: Row(
            children: [
              Text(
                'Most Rated',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              Spacer(),
              TextButton(
                onPressed: () => {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>mostratedproduct())),

                },


                child: Row( // Replace with a Row for horizontal icon + text
                  children:[
                    Text("View All",style: TextStyle(color:Colors.redAccent ),),
                    Icon(Icons.keyboard_arrow_right_rounded,color:Colors.redAccent ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<Allproducts>>(
            future: most(),
            builder: (context, snapshot) {
              if (snapshot.hasData) print(snapshot.error);
              return snapshot.hasData
                  ? GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return  mobcard(
                      id: snapshot.data![index].id, product_image: snapshot.data![index].product_image, other_images: snapshot.data![index].other_images,
                      sdescription: snapshot.data![index].sdescription, full_description: snapshot.data![index].full_description, product_name: snapshot.data![index].product_name,
                      mispell_key: snapshot.data![index].mispell_key, features: snapshot.data![index].features, rental_price: snapshot.data![index].rental_price,
                      selling_price: snapshot.data![index].selling_price, discount: snapshot.data![index].discount, time: snapshot.data![index].time, seo: snapshot.data![index].seo, web_url: snapshot.data![index].web_url,
                      product_spiecified: snapshot.data![index].product_spiecified, mobile_app: snapshot.data![index].mobile_app, category:snapshot.data![index].category,
                      likes: snapshot.data![index].likes, video_url: snapshot.data![index].video_url, wishlists: snapshot.data![index].wishlists, admin_url: snapshot.data![index].admin_url,
                      mylikes: snapshot.data![index].mylikes, product_category: snapshot.data![index].product_category, plan_name: snapshot.data![index].plan_name, month_3: snapshot.data![index].month_3,
                      month_6: snapshot.data![index].month_6, mywishlist: snapshot.data![index].mywishlist, month_12: snapshot.data![index].month_12, year_2: snapshot.data![index].year_2,
                      year_10: snapshot.data![index].year_10, year_10price: snapshot.data![index].year_10price, year_5: snapshot.data![index].year_5, recentview: snapshot.data![index].recentview, month_3price: snapshot.data![index].month_3price, month_6price: snapshot.data![index].month_6price, month_12price: snapshot.data![index].month_12, year_2price: snapshot.data![index].year_2price, year_5price: snapshot.data![index].year_5price
                  );
                },
              ): AllproductShimmer();
            }
        ),

        Container(
            height: 200,
            child: mostrated_banner()),
        Padding(
          padding:EdgeInsets.only(left: 20, right: 10, top: 20),
          child: Row(
            children: [
              Text(
                'Newest Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              Spacer(),
              TextButton(
                onPressed: () => {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>newestproduct())),

                },


                child: Row( // Replace with a Row for horizontal icon + text
                  children:[
                    Text("View All",style: TextStyle(color:Colors.redAccent ),),
                    Icon(Icons.keyboard_arrow_right_rounded,color:Colors.redAccent ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<Allproducts>>(
            future: newest(),
            builder: (context, snapshot) {
              if (snapshot.hasData) print(snapshot.error);
              return snapshot.hasData
                  ? GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return  mobcard(
                      id: snapshot.data![index].id, product_image: snapshot.data![index].product_image, other_images: snapshot.data![index].other_images,
                      sdescription: snapshot.data![index].sdescription, full_description: snapshot.data![index].full_description, product_name: snapshot.data![index].product_name,
                      mispell_key: snapshot.data![index].mispell_key, features: snapshot.data![index].features, rental_price: snapshot.data![index].rental_price,
                      selling_price: snapshot.data![index].selling_price, discount: snapshot.data![index].discount, time: snapshot.data![index].time, seo: snapshot.data![index].seo, web_url: snapshot.data![index].web_url,
                      product_spiecified: snapshot.data![index].product_spiecified, mobile_app: snapshot.data![index].mobile_app, category:snapshot.data![index].category,
                      likes: snapshot.data![index].likes, video_url: snapshot.data![index].video_url, wishlists: snapshot.data![index].wishlists, admin_url: snapshot.data![index].admin_url,
                      mylikes: snapshot.data![index].mylikes, product_category: snapshot.data![index].product_category, plan_name: snapshot.data![index].plan_name, month_3: snapshot.data![index].month_3,
                      month_6: snapshot.data![index].month_6, mywishlist: snapshot.data![index].mywishlist, month_12: snapshot.data![index].month_12, year_2: snapshot.data![index].year_2,
                      year_10: snapshot.data![index].year_10, year_10price: snapshot.data![index].year_10price, year_5: snapshot.data![index].year_5, recentview: snapshot.data![index].recentview, month_3price: snapshot.data![index].month_3price, month_6price: snapshot.data![index].month_6price, month_12price: snapshot.data![index].month_12, year_2price: snapshot.data![index].year_2price, year_5price: snapshot.data![index].year_5price
                  );
                },
              ): AllproductShimmer();
            }
        ),
      ],
    );
  }



  desk(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          Padding(
            padding:EdgeInsets.only(left: 20, right: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sectors',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.75,
                  child: FutureBuilder<List<Album>>(
                      future: bowss(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) print(snapshot.error);
                        return snapshot.hasData
                            ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return MobileCard_web( id: snapshot.data![index].id,
                              images_file: snapshot.data![index].images_file,
                              shortdescription: snapshot.data![index].shortdescription,
                              name:snapshot.data![index].name,
                              seo:snapshot.data![index].seo,
                              status: snapshot.data![index].status,);
                          },
                        )
                            :  ChatShimmer();
                      }),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(onPressed: (){
                    Navigator.pushNamed(context, '/category');
                  },
                    icon: Icon(Icons.keyboard_arrow_right_rounded),
                  label: Text('view all'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shadowColor: Colors.red,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
               ),
                )
              ],
            ),
          ),

          Container(
            height:MediaQuery.of(context).size.height*0.35,
            width: MediaQuery.of(context).size.width*0.70,
            child: web_allcategories_slider(),
          ),
          Padding(
            padding:EdgeInsets.only(left: 20, right: 10, top: 20),
            child: Row(
              children: [
                Text(
                  'All Product',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(onPressed: (){
                    Navigator.pushNamed(context,'/allproduct');
                  },
                    icon: Icon(Icons.keyboard_arrow_right_rounded),
                    label: Text('view all'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shadowColor: Colors.red,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                // TextButton(
                //   onPressed: () => {
                //     Navigator.pushNamed(context,'/allproduct' )
                //    // Navigator.push(context,MaterialPageRoute(builder: (context)=>catagories_screen())),
                //
                //   },
                //
                //
                //   child: Row( // Replace with a Row for horizontal icon + text
                //     children:[
                //       Text("View All",style: TextStyle(color:Colors.redAccent ),),
                //       Icon(Icons.keyboard_arrow_right_rounded,color:Colors.redAccent ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          FutureBuilder<List<Allproducts>>(
              future: Allproduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) print(snapshot.error);
                return snapshot.hasData
                    ? GridView.builder(

                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 20.0, mainAxisSpacing: 20.0,
                    // childAspectRatio: (itemWidth / itemHeight),
                    childAspectRatio: 1,

                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return  web_all_categories(
                        id: snapshot.data![index].id, product_image: snapshot.data![index].product_image, other_images: snapshot.data![index].other_images,
                        sdescription: snapshot.data![index].sdescription, full_description: snapshot.data![index].full_description, product_name: snapshot.data![index].product_name,
                        mispell_key: snapshot.data![index].mispell_key, features: snapshot.data![index].features, rental_price: snapshot.data![index].rental_price,
                        selling_price: snapshot.data![index].selling_price, discount: snapshot.data![index].discount, time: snapshot.data![index].time, seo: snapshot.data![index].seo, web_url: snapshot.data![index].web_url,
                        product_spiecified: snapshot.data![index].product_spiecified, mobile_app: snapshot.data![index].mobile_app, category:snapshot.data![index].category,
                        likes: snapshot.data![index].likes, video_url: snapshot.data![index].video_url, wishlists: snapshot.data![index].wishlists, admin_url: snapshot.data![index].admin_url,
                        mylikes: snapshot.data![index].mylikes, product_category: snapshot.data![index].product_category, plan_name: snapshot.data![index].plan_name, month_3: snapshot.data![index].month_3,
                        month_6: snapshot.data![index].month_6, mywishlist: snapshot.data![index].mywishlist, month_12: snapshot.data![index].month_12, year_2: snapshot.data![index].year_2,
                        year_10: snapshot.data![index].year_10, year_10price: snapshot.data![index].year_10price, year_5: snapshot.data![index].year_5, recentview: snapshot.data![index].recentview, month_3price: snapshot.data![index].month_3price, month_6price: snapshot.data![index].month_6price, month_12price: snapshot.data![index].month_12, year_2price: snapshot.data![index].year_2price, year_5price: snapshot.data![index].year_5price
                    );
                  },
                ): Container();
              }
          ),



          Padding(
            padding:EdgeInsets.only(left: 20, right: 10, top: 20),
            child: Row(
              children: [
                Text(
                  'Top Products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(onPressed: (){
                    Navigator.pushNamed(context,'/top_product');
                  },
                    icon: Icon(Icons.keyboard_arrow_right_rounded),
                    label: Text('view all'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shadowColor: Colors.red,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                // TextButton(
                //   onPressed: () => {
                //     Navigator.pushNamed(context,'/allproduct' )
                //    // Navigator.push(context,MaterialPageRoute(builder: (context)=>catagories_screen())),
                //
                //   },
                //
                //
                //   child: Row( // Replace with a Row for horizontal icon + text
                //     children:[
                //       Text("View All",style: TextStyle(color:Colors.redAccent ),),
                //       Icon(Icons.keyboard_arrow_right_rounded,color:Colors.redAccent ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.60,
                child: FutureBuilder<List<Topproduct>>(
                    future: top(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) print(snapshot.error);
                      return snapshot.hasData
                          ? GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0,
                         // childAspectRatio: ,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return  web_all_categories(
                              id: snapshot.data![index].id, product_image: snapshot.data![index].product_image, other_images: snapshot.data![index].other_images,
                              sdescription: snapshot.data![index].sdescription, full_description: snapshot.data![index].full_description, product_name: snapshot.data![index].product_name,
                              mispell_key: snapshot.data![index].mispell_key, features: snapshot.data![index].features, rental_price: snapshot.data![index].rental_price,
                              selling_price: snapshot.data![index].selling_price, discount: snapshot.data![index].discount, time: snapshot.data![index].time, seo: snapshot.data![index].seo, web_url: snapshot.data![index].web_url,
                              product_spiecified: snapshot.data![index].product_spiecified, mobile_app: snapshot.data![index].mobile_app, category:snapshot.data![index].category,
                              likes: snapshot.data![index].likes, video_url: snapshot.data![index].video_url, wishlists: snapshot.data![index].wishlists, admin_url: snapshot.data![index].admin_url,
                              mylikes: snapshot.data![index].mylikes, product_category: snapshot.data![index].product_category, plan_name: snapshot.data![index].plan_name, month_3: snapshot.data![index].month_3,
                              month_6: snapshot.data![index].month_6, mywishlist: snapshot.data![index].mywishlist, month_12: snapshot.data![index].month_12, year_2: snapshot.data![index].year_2,
                              year_10: snapshot.data![index].year_10, year_10price: snapshot.data![index].year_10price, year_5: snapshot.data![index].year_5, recentview: snapshot.data![index].recentview, month_3price: snapshot.data![index].month_3price, month_6price: snapshot.data![index].month_6price, month_12price: snapshot.data![index].month_12, year_2price: snapshot.data![index].year_2price, year_5price: snapshot.data![index].year_5price
                          );
                        },
                      ): Container();
                    }
                ),
              ),
              Container(
                height:MediaQuery.of(context).size.height*1,
                width: MediaQuery.of(context).size.width*0.40,
                child: web_top_product_slider(),
              ),
            ],
          ),

          Padding(
            padding:EdgeInsets.only(left: 20, right: 10, top: 20),
            child: Row(
              children: [
                Text(
                  'Most Rated',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                Spacer(),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(onPressed: (){
                    Navigator.pushNamed(context,'/most_rated_product');
                  },
                    icon: Icon(Icons.keyboard_arrow_right_rounded),
                    label: Text('view all'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shadowColor: Colors.red,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.60,
                child: FutureBuilder<List<Allproducts>>(
                    future: most(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) print(snapshot.error);
                      return snapshot.hasData
                          ? GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0,
                         // childAspectRatio: 0.75,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return  web_all_categories(
                              id: snapshot.data![index].id, product_image: snapshot.data![index].product_image, other_images: snapshot.data![index].other_images,
                              sdescription: snapshot.data![index].sdescription, full_description: snapshot.data![index].full_description, product_name: snapshot.data![index].product_name,
                              mispell_key: snapshot.data![index].mispell_key, features: snapshot.data![index].features, rental_price: snapshot.data![index].rental_price,
                              selling_price: snapshot.data![index].selling_price, discount: snapshot.data![index].discount, time: snapshot.data![index].time, seo: snapshot.data![index].seo, web_url: snapshot.data![index].web_url,
                              product_spiecified: snapshot.data![index].product_spiecified, mobile_app: snapshot.data![index].mobile_app, category:snapshot.data![index].category,
                              likes: snapshot.data![index].likes, video_url: snapshot.data![index].video_url, wishlists: snapshot.data![index].wishlists, admin_url: snapshot.data![index].admin_url,
                              mylikes: snapshot.data![index].mylikes, product_category: snapshot.data![index].product_category, plan_name: snapshot.data![index].plan_name, month_3: snapshot.data![index].month_3,
                              month_6: snapshot.data![index].month_6, mywishlist: snapshot.data![index].mywishlist, month_12: snapshot.data![index].month_12, year_2: snapshot.data![index].year_2,
                              year_10: snapshot.data![index].year_10, year_10price: snapshot.data![index].year_10price, year_5: snapshot.data![index].year_5, recentview: snapshot.data![index].recentview, month_3price: snapshot.data![index].month_3price, month_6price: snapshot.data![index].month_6price, month_12price: snapshot.data![index].month_12, year_2price: snapshot.data![index].year_2price, year_5price: snapshot.data![index].year_5price
                          );
                        },
                      ): AllproductShimmer();
                    }
                ),
              ),
              Container(
                height:MediaQuery.of(context).size.height*1,
                width: MediaQuery.of(context).size.width*0.40,
                child: most_rated_prodect_slider(),
              ),
            ],
          ),

          Padding(
            padding:EdgeInsets.only(left: 20, right: 10, top: 20),
            child: Row(
              children: [
                Text(
                  'Newest Products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                Spacer(),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(onPressed: (){
                    Navigator.pushNamed(context,'/newest_product');
                  },
                    icon: Icon(Icons.keyboard_arrow_right_rounded),
                    label: Text('view all'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shadowColor: Colors.red,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.60,
                child: FutureBuilder<List<Allproducts>>(
                    future: newest(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) print(snapshot.error);
                      return snapshot.hasData
                          ? GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0,
                         // childAspectRatio: 0.75,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return  web_all_categories(
                              id: snapshot.data![index].id, product_image: snapshot.data![index].product_image, other_images: snapshot.data![index].other_images,
                              sdescription: snapshot.data![index].sdescription, full_description: snapshot.data![index].full_description, product_name: snapshot.data![index].product_name,
                              mispell_key: snapshot.data![index].mispell_key, features: snapshot.data![index].features, rental_price: snapshot.data![index].rental_price,
                              selling_price: snapshot.data![index].selling_price, discount: snapshot.data![index].discount, time: snapshot.data![index].time, seo: snapshot.data![index].seo, web_url: snapshot.data![index].web_url,
                              product_spiecified: snapshot.data![index].product_spiecified, mobile_app: snapshot.data![index].mobile_app, category:snapshot.data![index].category,
                              likes: snapshot.data![index].likes, video_url: snapshot.data![index].video_url, wishlists: snapshot.data![index].wishlists, admin_url: snapshot.data![index].admin_url,
                              mylikes: snapshot.data![index].mylikes, product_category: snapshot.data![index].product_category, plan_name: snapshot.data![index].plan_name, month_3: snapshot.data![index].month_3,
                              month_6: snapshot.data![index].month_6, mywishlist: snapshot.data![index].mywishlist, month_12: snapshot.data![index].month_12, year_2: snapshot.data![index].year_2,
                              year_10: snapshot.data![index].year_10, year_10price: snapshot.data![index].year_10price, year_5: snapshot.data![index].year_5, recentview: snapshot.data![index].recentview, month_3price: snapshot.data![index].month_3price, month_6price: snapshot.data![index].month_6price, month_12price: snapshot.data![index].month_12, year_2price: snapshot.data![index].year_2price, year_5price: snapshot.data![index].year_5price
                          );
                        },
                      ): AllproductShimmer();
                    }
                ),
              ),
              Container(
                height:MediaQuery.of(context).size.height*1,
                width: MediaQuery.of(context).size.width*0.40,
                child: newest_product_slider(),
              ),
            ],
          ),



        ],
      ),
    );
  }





  String ids = '';
  TextEditingController sear = TextEditingController();
  search(BuildContext context) {
    return SizedBox(
      // color: Colors.white,

      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FutureBuilder<List<DAlbum>>(
              future: bow(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 6),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){

                              var id= snapshot.data![index].id;
                              var product_name= snapshot.data![index].product_name;var product_category= snapshot.data![index].product_category;

                              Navigator.pushNamed(context,'/productdetail/$id/$product_category/$product_name');

                            },
                            child:  Column(
                              children: [
                                // Allproduct
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),

                                  child: ListTile(
                                    leading: ClipRRect(

                                        borderRadius: BorderRadius.all(Radius.circular(10)),

                                     child : Image.network(Apiconst.productimage+snapshot.data![index].product_image,fit: BoxFit.fill,
                                        ),
                                    ),
                                    title: Text(
                                      snapshot.data![index].product_name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                )
                              ],
                            ),
                          );

                          //   Expanded(
                          //   child: GestureDetector(
                          //
                          //     child: Text("${snapshot.data![index].name}", style: TextStyle(color: Colors.deepOrange),)
                          //   ),
                          // );
                        })
                    : Container();


              }),
          AnimSearchBar(
            rtl: true,
            width: 500,
            textController: textController,
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            },
           onSubmitted: (String ) {
           setState(() {
             ids = String;
           });
           bow();
           },

          onChanged: (value) {
            setState(() {
              ids = value;
            });
            bow();
          }
          ),


        ],
      ),
    );
  }
  Future<List<DAlbum>> bow() async {

    final response = await http.get(
      Uri.parse(
          Apiconst.product_search+'?search=$ids&count=5'
      ),

    );

    var jsond = json.decode(response.body)["data"];
    print(ids);
    print("qqqqqqqqqq");
    print(jsond);
    List<DAlbum> allround = [];
    for (var o in jsond) {
      DAlbum al = DAlbum(
        o["id"],
        o["product_image"],
        o["other_images"],
        o["category"],
        o["product_name"],
        o["sdescription"],
        o["full_description"],
        o["seo"],
        o["mispell_key"],
        o["features"],
        o["rental_price"],
        o["selling_price"],
        o["discount"],
        o["time"],
        o["product_spiecified"],
        o["admin_url"],
        o["web_url"],
        o["mobile_app"],
        o["video_url"],
        o["likes"],
        o["recentview"],
        o["wishlists"],
        o["mywishlist"],
        o["mylikes"],
        o["product_category"],
        o["plan_name"],
        o["month_3"],
        o["month_6"],
        o["month_12"],
        o["year_2"],
        o["year_5"],
        o["year_10"],
        o["month_3price"],
        o["month_6price"],
        o["month_12price"],
        o["year_2price"],
        o["year_5price"],
        o["year_10price"],
      );

      allround.add(al);
    }
    return allround;
  }
//Categories api
  Future<List<Album>> bowss() async {
    final response = await http.post(
      Uri.parse(
          Apiconst.Categories_api+"?count=5"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var jsond = json.decode(response.body)["data"];
    print(response.body);
    List<Album> allround = [];
    for (var o in jsond) {
      Album al = Album(
        o["id"],
        o["images_file"],
        o["mispell_key"],
        o["name"],
        o["seo"],
        o["shortdescription"],
        o["status"],
      );
      allround.add(al);
    }
    return allround;
  }
//topproduct api
  Future<List<Topproduct>> top() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'deviceId';
    final deviceId = prefs.getString(key) ?? "0";
    print(deviceId);
    print("janu");
    final response = await http.post(
      Uri.parse(
          Apiconst.All_Products+"?device_id=$deviceId&count=4&type=2"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // print(apptok);

    var jsond = json.decode(response.body)["data"];
    print(response.body);
    List<Topproduct> alllround = [];
    for (var o in jsond) {
      Topproduct al = Topproduct(
        o["id"],
        o["product_image"],
        o["other_images"],
        o["category"],
        o["product_name"],
        o["sdescription"],
        o["full_description"],
        o["seo"],
        o["mispell_key"],
        o["features"],
        o["rental_price"],
        o["selling_price"],
        o["discount"],
        o["time"],
        o["product_spiecified"],
        o["admin_url"],
        o["web_url"],
        o["mobile_app"],
        o["video_url"],
        o["likes"],
        o["recentview"],
        o["wishlists"],
        o["mywishlist"],
        o["mylikes"],
        o["product_category"],
        o["plan_name"],
        o["month_3"],
        o["month_6"],
        o["month_12"],
        o["year_2"],
        o["year_5"],
        o["year_10"],
        o["month_3price"],
        o["month_6price"],
        o["month_12price"],
        o["year_2price"],
        o["year_5price"],
        o["year_10price"],

      );
      alllround.add(al);
    }
    return alllround;
  }
//mostrated api
  Future<List<Allproducts>> most() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'deviceId';
    final deviceId = prefs.getString(key) ?? "0";
    print(deviceId);
    print("janu");
    final response = await http.post(
      Uri.parse(
          Apiconst.All_Products+"?device_id=$deviceId&count=4&type=3"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // print(apptok);
    print("aryamansrr");
    var jsond = json.decode(response.body)["data"];
    print(response.body);
    List<Allproducts> alllround = [];
    for (var o in jsond) {
      Allproducts al = Allproducts(
        o["id"],
        o["product_image"],
        o["other_images"],
        o["category"],
        o["product_name"],
        o["sdescription"],
        o["full_description"],
        o["seo"],
        o["mispell_key"],
        o["features"],
        o["rental_price"],
        o["selling_price"],
        o["discount"],
        o["time"],
        o["product_spiecified"],
        o["admin_url"],
        o["web_url"],
        o["mobile_app"],
        o["video_url"],
        o["likes"],
        o["recentview"],
        o["wishlists"],
        o["mywishlist"],
        o["mylikes"],
        o["product_category"],
        o["plan_name"],
        o["month_3"],
        o["month_6"],
        o["month_12"],
        o["year_2"],
        o["year_5"],
        o["year_10"],
        o["month_3price"],
        o["month_6price"],
        o["month_12price"],
        o["year_2price"],
        o["year_5price"],
        o["year_10price"],

      );
      alllround.add(al);
    }
    return alllround;
  }

//coresel api
  Future<List<Alb>> Crasualslide() async{
    final response = await http.post(
      Uri.parse("https://sv.codescarts.com/apponrent/guruji/api/Mobile_app/get_multipal_banner?count=1"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        // "hospital_id":"98"
      }),

    );

    var jsond = json.decode(response.body)["data"];
    print(jsond);
    List<Alb> allround = [];
    for (var o in jsond)  {
      Alb al = Alb(
        o["id"],
        o["image"],
        o["short_text"],
        o["describe"],
        o["tittle"],
        o["status"],


      );

      allround.add(al);
    }
    return allround;
  }
//allproduct api

  Future<List<Allproducts>> Allproduct() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'deviceId';
    final deviceId = prefs.getString(key) ?? "0";
    print(deviceId);
    print("janu");
    final response = await http.post(
      Uri.parse(
          Apiconst.All_Products+"?device_id=$deviceId&category=1&count=4"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // print(apptok);
    print("aryamansrr");
    var jsond = json.decode(response.body)["data"];
    print(response.body);
    List<Allproducts> alllround = [];
    for (var o in jsond) {
      Allproducts al = Allproducts(
        o["id"],
        o["product_image"],
        o["other_images"],
        o["category"],
        o["product_name"],
        o["sdescription"],
        o["full_description"],
        o["seo"],
        o["mispell_key"],
        o["features"],
        o["rental_price"],
        o["selling_price"],
        o["discount"],
        o["time"],
        o["product_spiecified"],
        o["admin_url"],
        o["web_url"],
        o["mobile_app"],
        o["video_url"],
        o["likes"],
        o["recentview"],
        o["wishlists"],
        o["mywishlist"],
        o["mylikes"],
        o["product_category"],
        o["plan_name"],
        o["month_3"],
        o["month_6"],
        o["month_12"],
        o["year_2"],
        o["year_5"],
        o["year_10"],
        o["month_3price"],
        o["month_6price"],
        o["month_12price"],
        o["year_2price"],
        o["year_5price"],
        o["year_10price"],

      );
      alllround.add(al);
    }
    return alllround;
  }

  Future<List<Allproducts>> newest() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'deviceId';
    final deviceId = prefs.getString(key) ?? "0";
    print(deviceId);
    print("janu");
    final response = await http.post(
      Uri.parse(
          Apiconst.All_Products+"?device_id=$deviceId&count=4&type=4"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // print(apptok);
    print("aryamansrr");
    var jsond = json.decode(response.body)["data"];
    print(response.body);
    List<Allproducts> alllround = [];
    for (var o in jsond) {
      Allproducts al = Allproducts(
        o["id"],
        o["product_image"],
        o["other_images"],
        o["category"],
        o["product_name"],
        o["sdescription"],
        o["full_description"],
        o["seo"],
        o["mispell_key"],
        o["features"],
        o["rental_price"],
        o["selling_price"],
        o["discount"],
        o["time"],
        o["product_spiecified"],
        o["admin_url"],
        o["web_url"],
        o["mobile_app"],
        o["video_url"],
        o["likes"],
        o["recentview"],
        o["wishlists"],
        o["mywishlist"],
        o["mylikes"],
        o["product_category"],
        o["plan_name"],
        o["month_3"],
        o["month_6"],
        o["month_12"],
        o["year_2"],
        o["year_5"],
        o["year_10"],
        o["month_3price"],
        o["month_6price"],
        o["month_12price"],
        o["year_2price"],
        o["year_5price"],
        o["year_10price"],

      );
      alllround.add(al);
    }
    return alllround;
  }

}

class Album {
  String id;
  String images_file;
  String mispell_key;
  String name;
  String seo;
  String shortdescription;
  String status;

  Album(
      this.id,
      this.images_file,
      this.mispell_key,
      this.name,
      this.seo,
      this.shortdescription,
      this.status,
      );
}

//All Products
class Allproducts {
  String id;
  String product_image;
  String other_images;
  String category;
  String product_name;
  String sdescription;
  String full_description;
  String seo;
  String mispell_key;
  String features;
  String rental_price;
  String selling_price;
  String discount;
  String time;
  String product_spiecified;
  String admin_url;
  String web_url;
  String mobile_app;
  String video_url;
  String likes;
  String recentview;
  String wishlists;
  String mywishlist;
  String mylikes;
  String product_category;
  String plan_name;
  String month_3;
  String month_6;
  String month_12;
  String year_2;
  String year_5;
  String year_10;
  String month_3price;
  String month_6price;
  String month_12price;
  String year_2price;
  String year_5price;
  String year_10price;

  Allproducts(
      this.id,
      this.product_image,
      this.other_images,
      this.category,
      this.product_name,
      this.sdescription,
      this.full_description,
      this.seo,
      this.mispell_key,
      this.features,
      this.rental_price,
      this.selling_price,
      this.discount,
      this.time,
      this.product_spiecified,
      this.admin_url,
      this.web_url,
      this.mobile_app,
      this.video_url,
      this.likes,
      this.recentview,
      this.wishlists,
      this.mywishlist,
      this.mylikes,
      this.product_category,
      this.plan_name,
      this.month_3,
      this.month_6,
      this.month_12,
      this.year_2,
      this.year_5,
      this.year_10,
      this.month_3price,
      this.month_6price,
      this.month_12price,
      this.year_2price,
      this.year_5price,
      this.year_10price,
      );
}