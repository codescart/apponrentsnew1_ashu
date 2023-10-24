import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:testt/launch.dart';

class zoompic extends StatefulWidget {
  final String image;
  const zoompic({super.key, required this.image});

  @override
  State<zoompic> createState() => _zoompicState();
}

class _zoompicState extends State<zoompic> {
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
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: PhotoView(
          backgroundDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          // minScale: 100,
          imageProvider: NetworkImage(
            widget.image,
          ),
        ),
      ),

    );
  }
}
