import 'package:flutter/material.dart';
import 'package:testt/constants.dart';
import 'package:testt/widget/mobstar.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width*0.9,
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 200,
                    width: 200,
                    child: Image.asset('images/code.png',)
                ),
                Column(
                  children: [
                    Container(
                      child: Text("Every week, our staff personally hand-pick"),
                    ),
                    Container(
                      child: Text("Every week, our staff personally hand-pick"),
                    ),
                  ],
                ),

                 Column(
                  children: [
                    Container(
                        width: 200,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 140.0),
                              child: Text("Rs 12",style: TextStyle(fontSize: 15),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 70.0),
                              child: mobstar(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 130.0),
                              child: Text('Sales 12',style: TextStyle(fontSize: 15),),
                            ),

                          ],
                        )
                    ),
                    Container(
                      width: 150,
                      child: Row(
                        children: [
                          IconButton(
                            // hoverColor: Colors.black12.withOpacity(0.1),
                            icon: const Icon(Icons.shopping_cart),
                            onPressed: () {},
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered))
                                    return nohovertextcolor;
                                  else{
                                    return null;
                                  }//<-- SEE HERE
                                  // Defer to the widget's default.
                                },
                              ),
                            ),
                            child: const Text(
                              'Live Preview',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
