import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingIndicators {
  static Widget ballSpinFadeLoader({required BuildContext context}) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.width / 5,
        width: MediaQuery.of(context).size.width / 5,
        child: const LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [
            Color.fromRGBO(0, 138, 70, 1),
            Color.fromRGBO(137, 199, 74, 1),
            Colors.grey,
          ],
        ),
      ),
    );
  }

  static Widget ballScale() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: LoadingIndicator(
          indicatorType: Indicator.ballScale,
          colors: [
            Color.fromRGBO(0, 138, 70, 1),
            Color.fromRGBO(137, 199, 74, 1),
            Colors.grey,
          ],
        ),
      ),
    );
  }

  static Widget ballPulse() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: LoadingIndicator(
          indicatorType: Indicator.ballPulse,
          colors: [
            Color.fromRGBO(0, 138, 70, 1),
            Color.fromRGBO(137, 199, 74, 1),
            Colors.grey,
          ],
        ),
      ),
    );
  }
}
