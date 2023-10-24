import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:testt/HOME_pages/web_view/web_categories_view.dart';
import 'package:testt/constants.dart';
import 'package:testt/launch.dart';
import 'package:testt/responsive.dart';
import 'package:testt/screen/shimmmmmer/categorieshimmer.dart';
import 'package:http/http.dart' as http;
import 'package:testt/HOME_pages/categories/home_categories_view.dart';


class catagories_screen extends StatefulWidget {
  const catagories_screen({Key? key}) : super(key: key);

  @override
  State<catagories_screen> createState() => _catagories_screenState();
}

class _catagories_screenState extends State<catagories_screen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.call,color: Colors.redAccent,), onPressed: () { launchCaller(); },),

        ],
        title: Image.asset('images/logo_horizon.png', height: 40,),
      ),
     
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        desktop: desk(context),
      ),
    
    );
  }
  mobile(BuildContext context) {
    return
    FutureBuilder<List<Album>>(
        future: bowss(),
        builder: (context, snapshot) {
          if (snapshot.hasData) print(snapshot.error);
          return snapshot.hasData
              ? GridView.builder(
           // physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.length,
           // shrinkWrap: true,
            //scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return MobileCard(
                id: snapshot.data![index].id,
                images_file: snapshot.data![index].images_file,
                shortdescription: snapshot.data![index].shortdescription,
                name:snapshot.data![index].name,
                seo:snapshot.data![index].seo,
                status: snapshot.data![index].status,);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),
          )
              :  ChatShimmer();
        });
  }
  tablet(BuildContext context) {
    return
      FutureBuilder<List<Album>>(
          future: bowss(),
          builder: (context, snapshot) {
            if (snapshot.hasData) print(snapshot.error);
            return snapshot.hasData
                ? GridView.builder(
              // physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              // shrinkWrap: true,
              //scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return MobileCard( id: snapshot.data![index].id,
                  images_file: snapshot.data![index].images_file,
                  shortdescription: snapshot.data![index].shortdescription,
                  name:snapshot.data![index].name,
                  seo:snapshot.data![index].seo,
                  status: snapshot.data![index].status,);
              }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            )
                :  ChatShimmer();
          });
  }
  desk(BuildContext context) {
    return
    FutureBuilder<List<Album>>(
        future: bowss(),
        builder: (context, snapshot) {
          if (snapshot.hasData) print(snapshot.error);
          return snapshot.hasData
              ? GridView.builder(
            // physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.length,
            // shrinkWrap: true,
            //scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return web_categories_view(
                id: snapshot.data![index].id,
                images_file: snapshot.data![index].images_file,
                shortdescription: snapshot.data![index].shortdescription,
                name:snapshot.data![index].name,
                seo:snapshot.data![index].seo,
                status: snapshot.data![index].status,
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
            ),
          )
              :  ChatShimmer();
        });
  }





  Future<List<Album>> bowss() async {
    final response = await http.post(
      Uri.parse(
          Apiconst.Categories_api+"?count=100"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var jsond = json.decode(response.body)["data"];
    print(jsond);
    print(response.body);
    // final prefs1 = await SharedPreferences.getInstance();
    // final key1 = 'categaryId';
    // final categaryId = data['data']['id'] ;
    // prefs1.setString(key1, categaryId);
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