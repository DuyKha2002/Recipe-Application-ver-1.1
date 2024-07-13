import 'package:flutter/material.dart';
import 'package:switcher_button/switcher_button.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final void Function()? onTap;
  const MyButton({Key? key,required this.color,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SwitcherButton(
              value: true,
              onChange: (value) {
                print("Successful");
              },
            ),
            Text(
              "Dark Mode",
              style: TextStyle(
                color: Colors.white, // Adjust color based on your theme
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
