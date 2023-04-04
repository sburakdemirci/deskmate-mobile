import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

//TODO you can customize this shimmer for each view.
//TODO use this shimmer if needed. If response is fast maybe its better to not use it

//NOTE this page is loading page. 
class DefaultShimmer extends StatelessWidget {
  const DefaultShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const SizedBox(height: 80),
          );
        },
      ),
    );
  }
}
