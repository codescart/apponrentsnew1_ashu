import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testt/HOME_pages/categories/categories_list.dart';
import 'package:testt/HOME_pages/Home.dart';
import 'package:testt/constants.dart';
import 'package:testt/screen/mobcategories.dart';
import 'package:shimmer/shimmer.dart';

class MobileCard_web extends StatefulWidget {

  final String? id;
  final String? images_file;
  final String? name;
  final String? seo;
  final String? shortdescription;
  final String? status;
  MobileCard_web({

    required this.id,
    required this.images_file,
    required this.name,
    required this.seo,
    required this.shortdescription,
    required this.status
  });

  @override
  State<MobileCard_web> createState() => _MobileCard_webState();
}

class _MobileCard_webState extends State<MobileCard_web> {
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
        height: 40,
       width: 250,
       // height:MediaQuery.of(context).size.height*0.85,
        //width:MediaQuery.of(context).size.width*0.60,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration( borderRadius: BorderRadius.only
                (topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),),


              child: Image.network(
                Apiconst.image_path+"${widget.images_file}",
               height: 50,
               width: 50,
               // height:MediaQuery.of(context).size.height*.10,
               // width: MediaQuery.of(context).size.width*0.60,
              ),
            ),
            Text(
              '${widget.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style:  TextStyle(
                fontSize:MediaQuery.of(context).size.width/60,
                fontWeight: FontWeight.bold,
                color: Colors.black,

              ),
            ),
          ],
        ),
      ),
    );
  }
}



