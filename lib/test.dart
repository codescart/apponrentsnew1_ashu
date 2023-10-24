// /:id/:sdescription/:mispell_key/:selling_price/:product_spiecified/:likes/:mylikes/:month_6/:year_10/:month_3price/:year_2price/:product_image/:full_description/:features/:discount/:mobile_app/:video_url/:product_category/:mywishlist/:year_10price/:month_6price/:year_5price/:other_images/:product_name/:rental_price/:time/:category/:wishlists/:plan_name/:month_12/:year_5/:month_12price/:seo/:web_url/:admin_url/:month_3/:year_2/:recentview
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text("Expandable List"),
        backgroundColor: Colors.redAccent,
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new ExpandableListView(title: "Title $index");
        },
        itemCount: 5,
      ),
    );
  }
}

class ExpandableListView extends StatefulWidget {
  final String title;

   ExpandableListView({Key ?key, required this.title}) : super(key: key);

  @override
  _ExpandableListViewState createState() => new _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 1.0),
      child: new Column(
        children: <Widget>[
          new Container(
            color: Colors.blue,
            padding: new EdgeInsets.symmetric(horizontal: 5.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new IconButton(
                    icon: new Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: new BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: new Center(
                        child: new Icon(
                          expandFlag ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        expandFlag = !expandFlag;
                      });
                    }),
                new Text(
                  widget.title,
                  style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            ),
          ),
          new ExpandableContainer(
              expanded: expandFlag,
              child: Text('dataffffffffff')

          )
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight=100.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
        decoration: new BoxDecoration(border: new Border.all(width: 1.0, color: Colors.blue)),
      ),
    );
  }
}