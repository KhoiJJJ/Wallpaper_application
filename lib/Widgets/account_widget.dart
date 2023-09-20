import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_icons.dart';
import 'big_text.dart';

class AccountWidget extends StatelessWidget {
  final AppIcon appIcon;
  final BigText bigText;
  AccountWidget({super.key,required this.appIcon,required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.only(left: 20,
      right: 10,
      bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0,2),
            color: Colors.grey.withOpacity(0.2)
          )
        ]
      ),
      child: Row(
        children: [
          appIcon,
          const SizedBox(width: 20,),
          bigText,
        ],
      ),
    );
  }
}
