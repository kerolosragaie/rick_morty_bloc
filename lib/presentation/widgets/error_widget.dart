import 'package:flutter/material.dart';

class ErrorGifWidget extends StatelessWidget {
  final String gifLocation;
  final String message;
  const ErrorGifWidget(
      {super.key,
      this.gifLocation = "assets/images/error.gif",
      required this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          gifLocation,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.5,
          left: MediaQuery.of(context).size.height / 8,
          child: SizedBox(
            width: 240,
            child: Text(
              message,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
