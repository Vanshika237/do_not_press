import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DO NOT PRESS!',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MyHomePage(),
    );
  }
}

const color = Color(0xFFdd2e44);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int showIndex = 12;
  int promptIndex = 0;
  bool isInitial = true;

  _changePosition(int currentIndex) {
    if (isInitial) {
      isInitial = false;
    }
    do {
      showIndex = Random().nextInt(25);
    } while (showIndex == currentIndex);
    var oldIndex = promptIndex;
    do {
      promptIndex = Random().nextInt(prompts.length);
    } while (promptIndex == oldIndex);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    bool showSmallButton = MediaQuery.of(context).size.width < 600;
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Text(
              isInitial ? 'DO NOT PRESS THE BUTTON!' : prompts[promptIndex],
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 42),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                for (int i = 0, index = 0; i < 5; i++)
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int j = 0; j < 5; j++, index++)
                          Container(
                            margin: const EdgeInsets.all(16),
                            child: showIndex == index
                                ? Circle(
                                    showSmallButton: showSmallButton,
                                    onHover: () {
                                      _changePosition(index);
                                    })
                                : Container(),
                          )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

final prompts = [
  "Arre! Mana kiya na!",
  "Yeh kya badtameezi hai -_-",
  "I'M FAST AS FCK BOI",
  "Umar badhti jaa rahi hai par harkaton mein koi sudhar nahi",
  "Yaaaaarrrrrrrr",
  "I'd be better off talking to a wall.",
  "Bas bhi karo",
  "Catch me if you can!",
  "Oh? This is how you wanna play?",
  "Aise challenge mat karo",
  "HAHAHAHAHAHAHAHAHA",
  "Meri baat maan jaao yaar",
  "Na beta na, aisa nahi karte",
  "What not to do - Exhibit A",
  "WILL YOU STOP ALREADY",
  "Done? Happy? NOW STOP",
  "Main toh thak gayi bhaisab"
];

class Circle extends StatelessWidget {
  final bool showSmallButton;
  final Function() onHover;
  const Circle(
      {super.key, required this.onHover, required this.showSmallButton});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: onHover,
        onHover: (value) {
          if (value == true) {
            onHover();
          }
        },
        child: Container(
          height: showSmallButton ? 70 : 90,
          width: showSmallButton ? 70 : 90,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(color: Colors.white12, blurRadius: 5, spreadRadius: 2)
          ], color: color, borderRadius: BorderRadius.circular(500)),
        ));
  }
}
