import 'package:flutter/material.dart';

class MyDrawerTitle extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const MyDrawerTitle({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            color: Colors.deepPurple,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.deepPurple,
        ),
        onTap: onTap,
      ),
    );
  }
}
