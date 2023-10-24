import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testt/constants.dart';
import 'package:testt/responsive.dart';
import 'package:testt/screen/shimmmmmer/categorieshimmer.dart';


class Wishlist_page extends StatefulWidget {
  const Wishlist_page({Key? key}) : super(key: key);

  @override
  State<Wishlist_page> createState() => _Wishlist_pageState();
}

class _Wishlist_pageState extends State<Wishlist_page> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        desktop: desk(context),
      ),

    );



  }
  mobile(BuildContext context) {
    return FutureBuilder<List<Album>>(
        future: bowss(),
        builder: (context, snapshot) {
          if (snapshot.hasData) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15.0),
                  ),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width*.50,
                      height: MediaQuery.of(context).size.height*.30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap:(){},
                            child: Image.network(Apiconst.productimage+snapshot.data![index].product_image,
                              height: MediaQuery.of(context).size.height*.30,
                              width: MediaQuery.of(context).size.width*.26,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(snapshot.data![index].product_name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(snapshot.data![index].catname),
                                Text(snapshot.data![index].sdescription),
                                RichText(
                                    text:
                                    TextSpan(
                                        text: 'Price : ₹ '+snapshot.data![index].selling_price,

                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '('+snapshot.data![index].discount+'% off)',

                                            style: TextStyle(
                                              color: Color(0xffF80849),
                                              fontSize: 15,
                                            ),

                                          )
                                        ])),
                              ],
                            ),
                          ),
                          IconButton(onPressed: ()async{
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Stack(
                                      clipBehavior: Clip.none,
                                      children:[
                                        Positioned(
                                          right: -40.0,
                                          top: -40.0,
                                          child: InkResponse(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              child: Icon(Icons.close),
                                              backgroundColor: Colors.red,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child:Text('Are u want t sure')
                                            ),
                                            Row(
                                              children: [
                                                ElevatedButton.icon(
                                                  icon: Icon(Icons.favorite_border),
                                                  label: Text("Favorite", style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: MediaQuery.of(context).size.width/90,
                                                      fontWeight: FontWeight.bold
                                                  ),),

                                                  onPressed: () {
                                                    delete_wish_list( context,snapshot,index);

                                                  },

                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.redAccent,
                                                    onPrimary: Colors.white,
                                                    shadowColor: Colors.red,
                                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                              icon: Icon(Icons.delete_forever_outlined))
                        ],
                      )
                  ),
                );
              })
              :  ChatShimmer();
        });
  }
  tablet(BuildContext context) {
    return FutureBuilder<List<Album>>(
        future: bowss(),
        builder: (context, snapshot) {
          if (snapshot.hasData) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15.0),
                  ),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width*.50,
                      height: MediaQuery.of(context).size.height*.30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap:(){},
                            child: Image.network(Apiconst.productimage+snapshot.data![index].product_image,
                              height: MediaQuery.of(context).size.height*.30,
                              width: MediaQuery.of(context).size.width*.26,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(snapshot.data![index].product_name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(snapshot.data![index].catname),
                                Text(snapshot.data![index].sdescription),
                                RichText(
                                    text:
                                    TextSpan(
                                        text: 'Price : ₹ '+snapshot.data![index].selling_price,

                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '('+snapshot.data![index].discount+'% off)',

                                            style: TextStyle(
                                              color: Color(0xffF80849),
                                              fontSize: 15,
                                            ),

                                          )
                                        ])),
                              ],
                            ),
                          ),
                          IconButton(onPressed: ()async{
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Stack(
                                      clipBehavior: Clip.none,
                                      children:[
                                        Positioned(
                                          right: -40.0,
                                          top: -40.0,
                                          child: InkResponse(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              child: Icon(Icons.close),
                                              backgroundColor: Colors.red,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child:Text('Are u want t sure')
                                            ),
                                            Row(
                                              children: [
                                                ElevatedButton.icon(
                                                  icon: Icon(Icons.favorite_border),
                                                  label: Text("Favorite", style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: MediaQuery.of(context).size.width/90,
                                                      fontWeight: FontWeight.bold
                                                  ),),

                                                  onPressed: () {
                                                    delete_wish_list( context,snapshot,index);

                                                  },

                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.redAccent,
                                                    onPrimary: Colors.white,
                                                    shadowColor: Colors.red,
                                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                              icon: Icon(Icons.delete_forever_outlined))
                        ],
                      )
                  ),
                );
              })
              :  ChatShimmer();
        });
  }
  desk(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*.40,
              height:   MediaQuery.of(context).size.height*.50,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      15.0),
                ),
                margin:  EdgeInsets.all(10),

              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*.50,
              child: FutureBuilder<List<Album>>(
                  future: bowss(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) print(snapshot.error);
                    return snapshot.hasData
                        ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15.0),
                          ),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width*.50,
                              height: MediaQuery.of(context).size.height*.30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap:(){},
                                  child: Image.network(Apiconst.productimage+snapshot.data![index].product_image,
                                    height: MediaQuery.of(context).size.height*.30,
                                    width: MediaQuery.of(context).size.width*.26,),
                                ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Text(snapshot.data![index].product_name,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Text(snapshot.data![index].catname),
                                          Text(snapshot.data![index].sdescription),
                                    RichText(
                                            text:
                                            TextSpan(
                                                text: 'Price : ₹ '+snapshot.data![index].selling_price,

                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: '('+snapshot.data![index].discount+'% off)',

                                                    style: TextStyle(
                                                      color: Color(0xffF80849),
                                                      fontSize: 15,
                                                    ),

                                                  )
                                                ])),
                                  ],
                                ),
                              ),
                                IconButton(onPressed: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Stack(
                                            clipBehavior: Clip.none,
                                            children:[
                                              Positioned(
                                                right: -40.0,
                                                top: -40.0,
                                                child: InkResponse(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: CircleAvatar(
                                                    child: Icon(Icons.close),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: TextFormField(),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child:Text('Are u want t sure')
                                                  ),
                                                  Row(
                                                    children: [
                                                      ElevatedButton.icon(
                                                        icon: Icon(Icons.favorite_border),
                                                        label: Text("Favorite", style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: MediaQuery.of(context).size.width/90,
                                                            fontWeight: FontWeight.bold
                                                        ),),

                                                        onPressed: () {
                                                          delete_wish_list( context,snapshot,index);

                                                        },

                                                        style: ElevatedButton.styleFrom(
                                                          primary: Colors.redAccent,
                                                          onPrimary: Colors.white,
                                                          shadowColor: Colors.red,
                                                          elevation: 5,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      });


                                },
                                    icon: Icon(Icons.delete_forever_outlined))
                              ],
                            )
                          ),
                        );
                      })
                        :  ChatShimmer();
                  }),
            ),
          ],
        ),
      ],
    );
  }
  Future<List<Album>> bowss() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'deviceId';
    final deviceId = prefs.getString(key) ?? "0";
    print(deviceId);
    print('wwwwwwwwwwwwwwwwwwwww');
    final response = await http.get(
      Uri.parse(
         // Apiconst.Categories_api+"?count=5"
        'https://backend.apponrent.com/Mobile_app/mywishlist_get?device_id=$deviceId'
      ),

    );
    print("yyyyyyyyyyyyyyyyyy");
    final jsond = json.decode(response.body)["data"];
    print(jsond);

    print("uuuuuuuuuuuuuuuuuuuuuu");
    List<Album> allround = [];
    for (var o in jsond) {
      Album al = Album(
        o["id"],
        o["product_id"],
        o["product_image"],
        o["category"],
        o["product_name"],
        o["sdescription"],
        o["selling_price"],
        o["discount"],
        o["type"],
        o["catname"],
      );
      allround.add(al);
    }
    return allround;
  }

  delete_wish_list(BuildContext context,snapshot,index)async {
    final id= snapshot.data![index].id;
    print(id);
    print("xxxxxxxxxxx");
    final url= Apiconst.wishlist_view+"id=$id";
    final delete= await http.get(Uri.parse(url));
    print(url);

    final data=jsonDecode(delete.body);
    print(data);
    print('eeeeeeeeeeeee');
    if (data['error'] == 200) {
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else {
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    print(data);
  }
}


class Album {
  String id;
  String product_id;
  String product_image;
  String category;
  String product_name;
  String sdescription;
  String selling_price;
  String discount;
  String type;
  String catname;

  Album(
      this.id,
      this.product_id,
      this.product_image,
      this.category,
      this.product_name,
      this.sdescription,
      this.selling_price,
      this.discount,
      this.type,
      this.catname,
      );
}