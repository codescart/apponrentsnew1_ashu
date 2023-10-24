import 'package:flutter/material.dart';


class retail_finance_list extends StatefulWidget {
  const retail_finance_list({Key? key}) : super(key: key);

  @override
  State<retail_finance_list> createState() => _retail_finance_listState();
}

class _retail_finance_listState extends State<retail_finance_list> {


  final _goldColors = const [
    Color(0xFFa2790d),
    Color(0xFFebd197),
    Color(0xFFa2790d),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Retail Finance"),
            flexibleSpace: Container(
              decoration:BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:  _goldColors ,
                ),
              ),
            ),
            centerTitle: true,

            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.teal,
              tabs: [
                Tab( text: "Add New Finance"),
                Tab(
                    text: "Finance User"),

              ],
            ),
          ),
          body: TabBarView(
            children: [
           Text("data"),
              Text("data")
            ],
          ),
        ),
      ),
    );
  }
}