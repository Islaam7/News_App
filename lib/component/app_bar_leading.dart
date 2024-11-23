import 'package:flutter/material.dart';

import '../values/colors.dart';
import '../values/dimensions.dart';

class AppBarLeading  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
    offset: const Offset(16, 0),
    child: Container(
    decoration: BoxDecoration(
    color: MyColor.grayWhite,
    borderRadius: BorderRadius.circular(Dimension.circleRadius)
    ),
    child: GestureDetector(
    onTap: (){},
    child: Padding(
    padding: const EdgeInsets.only(top: 17),
    child: Image.asset('lib/assets/icons/menu.png'),
    ),

    ),
    ),
    );
  }
}
