
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class SliderShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: 5,
      shrinkWrap: true,

      itemBuilder: (context, index) {

        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.grey.withOpacity(0.1),
          child: Padding(
            padding:  EdgeInsets.all(12.0),
            child: Expanded(
              child: SizedBox(
                height: 210,
                width: MediaQuery.of(context).size.width * 0.95 ,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),),

                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
