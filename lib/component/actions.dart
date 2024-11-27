import 'package:flutter/material.dart';

import '../values/colors.dart';
import '../values/dimensions.dart';

class AppBarAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Dimension.circleWidth,
          height: Dimension.circleHeight,
          decoration: BoxDecoration(
              color: MyColor.greyWhite,
              borderRadius: BorderRadius.circular(Dimension.circleRadius)
          ),
          child: GestureDetector(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset('lib/assets/icons/search.png'),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: Dimension.circleWidth,
          height: Dimension.circleHeight,
          decoration: BoxDecoration(
              color: MyColor.greyWhite,
              borderRadius: BorderRadius.circular(Dimension.circleRadius)
          ),
          child: GestureDetector(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset('lib/assets/icons/notification.png'),
            ),
          ),
        ),
      ],
    );
  }
}
