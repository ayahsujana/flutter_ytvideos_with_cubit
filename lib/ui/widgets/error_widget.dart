// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'no_network_widget.dart';

class ErrorMessage extends StatelessWidget {
  final Function onPress;
  final String messageTitle;
  final String messageDescription;
  ErrorMessage({
    Key? key,
    required this.onPress,
    required this.messageTitle,
    required this.messageDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: EmptyFailureNoInternetView(
          image: 'assets/lottie/no_internet_lottie.json',
          title: messageTitle,
          description: messageDescription,
          buttonText: "Retry",
          onPressed: () => onPress,
        ));
  }
}
