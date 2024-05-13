import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  const Card({super.key, //required this.active
  });
  //final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.bookmark_border),
    );
  }
}
