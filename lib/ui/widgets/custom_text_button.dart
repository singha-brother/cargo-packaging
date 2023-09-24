// import 'package:cargo_packaging/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, this.tapHandler});
  final String text;
  final Function()? tapHandler;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: tapHandler,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(width: 2, color: Theme.of(context).primaryColor),
            ),
          ),
          padding: const EdgeInsets.symmetric(
              vertical:
                  10.0), // Optional: Add padding for spacing around the content
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: Theme.of(context).primaryColor),
              Text(
                text, // Replace this with your actual content
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
