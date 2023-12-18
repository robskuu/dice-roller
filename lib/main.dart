import 'package:flutter/material.dart';
import 'buttons.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int result = 0;
  int counter = 0;
  int resultWith = 0;
  Random random = Random();
  final List buttons = [
    ["d4", 4, "assets/4-1.png"],
    [
      "d6",
      6,
      "assets/6-1.png",
      "assets/6-2.png",
      "assets/6-3.png",
      "assets/6-4.png",
      "assets/6-5.png",
      "assets/6-6.png",
    ],
    ["d8", 8, "assets/8-1.png"],
    ["d10", 10, "assets/10-1.png"],
    ["d12", 12, "assets/12-1.png"],
    ["d20", 20, "assets/20-1.png", "assets/20-2.png"],
    ["d100", 100, "assets/100-1.png"],
    ["d2", 2, "assets/2-1.png"],
  ];

  void clearAll() {
    setState(() {
      result = 0;
      resultWith = 0;
    });
  }

  void rollDice(int num) {
    clearAll();
    int randomNum = random.nextInt(num) + 1;
    int without = randomNum;
    if (counter != 0) {
      if (counter < 0) {
        randomNum -= counter;
      } else {
        randomNum += counter;
      }
    }
    setState(() {
      result = without;
      resultWith = randomNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 32, 32, 1),
      appBar: AppBar(
        title: const Text("Dice Roller"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(131, 150, 177, 1),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: const Color.fromRGBO(50, 50, 50, 1),
            child: IconButton(
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
              icon: Icon(
                Icons.remove,
                color: Colors.red[600],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            "$counter",
            style: const TextStyle(
              color: Color.fromRGBO(195, 195, 195, 1),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            color: const Color.fromRGBO(50, 50, 50, 1),
            child: IconButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              icon: Icon(
                Icons.add,
                color: Colors.green[600],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 150,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return MyButton(
                    buttonText: buttons[index][0],
                    buttonImage: buttons[index][2],
                    buttonTapped: () {
                      rollDice(buttons[index][1]);
                    },
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  "Result: $resultWith",
                  style: const TextStyle(
                    color: Color.fromRGBO(195, 195, 195, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Result without extras: $result",
                  style: const TextStyle(
                    color: Color.fromRGBO(195, 195, 195, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                clearAll();
                setState(() {
                  counter = 0;
                });
              },
              child: const Text(
                "Click to Clear!",
                style: TextStyle(
                  color: Color.fromRGBO(195, 195, 195, 1),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
