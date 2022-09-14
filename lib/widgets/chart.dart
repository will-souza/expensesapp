import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.black12,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const [],
              ),
            ),
          ),
        )
      ],
    );
  }
}
