import 'package:flutter/material.dart';
import 'package:rentaroom/constants.dart';

class TitleWithUnderline extends StatelessWidget {
  const TitleWithUnderline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              "List of rooms available",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
