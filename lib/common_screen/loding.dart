import 'package:flutter/material.dart';

import 'Comman_Container.dart';
import 'Comman_text.dart';

class LodingDiloge extends StatelessWidget {
  const LodingDiloge({Key? key, this.message}) : super(key: key);

  final String? message;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 14),
            // circular progress bar
            child: Comman_Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Comman_Text(
            text: message.toString() + " Please wait...",
          )
        ],
      ),
    );
  }
}
