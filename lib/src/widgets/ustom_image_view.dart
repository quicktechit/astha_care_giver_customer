import 'package:flutter/material.dart';

void showImageDialog(BuildContext context, image) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Close dialog on tap
              },
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
          ],
        ),
      );
    },
  );
}