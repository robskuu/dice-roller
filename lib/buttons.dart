import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final String buttonImage;
  final VoidCallback buttonTapped;

  const MyButton({
    Key? key,
    required this.buttonText,
    required this.buttonImage,
    required this.buttonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      color: const Color.fromRGBO(60, 60, 60, 1),
      child: ListView(
        children: [
          Column(
            children: [
              IconButton(
                onPressed: buttonTapped,
                icon: Image.asset(buttonImage),
              ),
              Text(
                buttonText,
                style: const TextStyle(
                  color: Color.fromRGBO(195, 195, 195, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
