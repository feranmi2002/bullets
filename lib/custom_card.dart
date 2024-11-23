import 'package:flutter/material.dart';

import 'colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)),
      color: cardColor,
      margin:
      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: const Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20,
        ),
        child: ListTile(),

      ),
    );
  }
}
