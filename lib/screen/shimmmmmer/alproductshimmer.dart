
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class AllproductShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: 5,
      shrinkWrap: true,

      itemBuilder: (context, index) {

        return Container(
          height: 210,
          width: double.infinity,
          child: Card(
            shadowColor: Colors.transparent,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.grey.withOpacity(0.1),
              child: Expanded(
                child: SizedBox(
                  height: 210,
                  width: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),),


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
