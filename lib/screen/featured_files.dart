import 'package:flutter/material.dart';
import 'package:testt/constants.dart';
import 'package:testt/widget/sizes_helpers.dart';

class FeaturedFiles extends StatefulWidget {
  const FeaturedFiles({Key? key}) : super(key: key);

  @override
  State<FeaturedFiles> createState() => _FeaturedFilesState();
}

class _FeaturedFilesState extends State<FeaturedFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Card(
              child: Row(
                children: [
                  Image.asset('images/image.jpg',height: 170,width: 310,fit: BoxFit.cover,),
                  Container(
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(onPressed: (){},child: Text("This week  best web themes & templates have arrived")),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.arrow_right_rounded),
                            Text(' best web themes & templates have arrived'),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.arrow_right_rounded),
                            Text(' Offline Online Courses Elementor WooCommerce'),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.arrow_right_rounded),
                            Text(' 1-Click Easy Premade Website Installation'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 0.5,
                    color: Colors.grey,
                  ),
                 Container(
                   width: 280,
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Icon(Icons.menu_open_outlined),
                           SizedBox(width: 10,),
                           Icon(Icons.favorite),
                         ],
                       ),
                       Text('19',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                       SizedBox(height: 10,),
                       Text('Last updated: 23 Dec 22'),
                       SizedBox(height: 10,),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           IconButton(
                             hoverColor: Colors.black12.withOpacity(0.1),
                             icon: const Icon(Icons.shopping_cart),
                             onPressed: () {},
                           ),
                           SizedBox(width: 10,),
                           Container(
                             width: displayWidth(context)*0.2,
                             height: 30,
                             child: ElevatedButton(
                               onPressed: () {},
                               style: ButtonStyle(
                                 overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                       (Set<MaterialState> states) {
                                     if (states.contains(MaterialState.hovered))
                                       return nohovertextcolor;
                                     else{
                                       return null;
                                     }//<-- SEE HERE
                                   },
                                 ),
                               ),
                               child: Text(
                                 'Live Preview',
                                 style: TextStyle(fontSize:15),
                               ),
                             ),
                           ),
                         ],
                       )
                     ],
                   ),
                 )
                ],
              ),
          ),
           ),
        ],
      ),
    );
  }
}
