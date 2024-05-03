import 'package:flutter/material.dart';

import 'custom_montserrat_text.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: CircleAvatar(

          ),
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        CustomMontserratText(
            text: "Test",
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white)
      ],
    );
  }
}

