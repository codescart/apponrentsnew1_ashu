import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testt/HOME_pages/categories/categories_list.dart';
import 'package:testt/HOME_pages/Home.dart';
import 'package:testt/constants.dart';
import 'package:testt/screen/mobcategories.dart';
import 'package:shimmer/shimmer.dart';

class MobileCard extends StatefulWidget {

  final String? id;
  final String? images_file;
  final String? name;
  final String? seo;
  final String? shortdescription;
  final String? status;
  MobileCard({

     this.id,
     this.images_file,
     this.name,
     this.seo,
     this.shortdescription,
     this.status
  });

  @override
  State<MobileCard> createState() => _MobileCardState();
}

class _MobileCardState extends State<MobileCard> {
  @override
  void initState() {
    // setcatId();
    super.initState();
  }
  // setcatId() async{
  //   final prefs1 = await SharedPreferences.getInstance();
  //   final key1 = 'categaryId';
  //   final categaryId = widget.id;
  //   prefs1.setString(key1, categaryId!);
  //   print(categaryId);
  //   print("daku");
  // }
  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    catagories_screen_list(
                    id:widget.id,
                    name:widget.name)
                ));
          },
          child: Container(
            height: 250,
            width: 200,
            padding: const EdgeInsets.all(10),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
              children: [
                Container(
                  decoration: BoxDecoration( borderRadius: BorderRadius.only
                    (topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),),


                  child: Image.network(
                    Apiconst.image_path+"${widget.images_file}",
                    height:MediaQuery.of(context).size.height*.10,
                    width: MediaQuery.of(context).size.width*0.60,
                    ),
                ),

                Text(
                  '${widget.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style:  TextStyle(
                    fontSize:MediaQuery.of(context).size.width/21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,

                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    "${widget.shortdescription}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )),
          ),
    );
  }
}



