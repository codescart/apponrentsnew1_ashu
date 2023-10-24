
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ChatShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.grey.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: SizedBox(
                height: 210,
                width: 200,
                child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        ),
 ),
              ),
            ),
          ),
        );
      },
    );
  }
}
