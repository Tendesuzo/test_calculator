import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double hw = 88;
  int pre_result = 0;
  int result = 0;
  int _counter = 0;
  int stay = 0;
  int stay_two = 0;
  int push = 0;
  int signal = 0; //decide four arithmetic operations
  int signal_2 = 0; //whether or not do immediately before calculation

  void _text(){
    Text('$result',
        style: TextStyle(
        fontSize:hw,
        ),
    );
    }

  void _one(){ //1
    setState(() {
        push = 1;
      if(stay == 0){
        stay = push;
      }else{
        stay = stay * 10 + push;
      }
      pre_result = stay;
    });
  }

  void _two(){ //2
    setState(() {
      push = 2;
      if(stay == 0){
        stay = push;
      }else{
        stay = stay * 10 + push;
      }
      pre_result = stay;
    });
  }

  void _three(){ //3
    setState(() {
      push = 3;
      if(stay == 0){
        stay = push;
      }else{
        stay = stay * 10 + push;
      }
      pre_result = stay;
    });
  }

  void _seven(){ //7
    setState(() {
      push = 7;
      if(stay == 0){
        stay = push;
      }else{
        stay = stay * 10 + push;
      }
      pre_result = stay;
    });
  }

  void _addition() {
    setState(() {
      if(signal == 0 && signal_2 == 0) {
        stay_two = stay;
        stay = 0;
        signal = 1;
      }else{
        signal = 1;
      }
    });
  }

  void _subtraction(){
    setState(() {
      _counter = _counter - 1;
      result = _counter;
    });
  }

  void _equal(){
    setState(() {
      if (signal == 1){
        result = stay + stay_two;
        Text('$result');
      }
      stay_two = result;
      push = 0;
      stay = 0;
      pre_result = 0;
      signal = 0;
      signal_2 = 1;
    });
  }

  void _reset(){
    setState(() {
      pre_result = 0;
      result = 0;
      stay = 0;
      stay_two = 0;
      signal = 0;
      signal_2 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('$pre_result',
                style: TextStyle(
                  fontSize:hw/2,
                )
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text('$result',
                    style: TextStyle(
                      fontSize:hw,
                    )
                )
                ]
            ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
              SizedBox(
                height: hw,
                width: hw,
                child: TextButton( //7
                  onPressed: _seven,
                  child: const Text('7'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black12,
                    shape: const CircleBorder(
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: hw,
                width: hw,
                child: TextButton( //subtraction
                  onPressed: _subtraction,
                  child: const Text('8'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black12,
                  ),
                ),
              ),
              SizedBox(
                height: hw,
                width: hw,
                child: TextButton( //multiplication
                  onPressed: _subtraction,
                  child: const Text('9'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black12,
                  ),
                ),
              ),
              SizedBox(
                height: hw,
                width: hw,
                child: TextButton( //subtraction
                  onPressed: _subtraction,
                  child: const Text('÷'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black26,
                  ),
                ),
              ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                SizedBox(
                  height: hw,
                  width: hw,
                  child: TextButton( //addition
                    onPressed: _addition,
                    child: const Text('4'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black12,
                    ),
                  ),
                ),
                SizedBox(
                  height: hw,
                  width: hw,
                  child: TextButton( //subtraction
                    onPressed: _subtraction,
                    child: const Text('5'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black12,
                    ),
                  ),
                ),
                SizedBox(
                  height: hw,
                  width: hw,
                  child: TextButton( //multiplication
                    onPressed: _subtraction,
                    child: const Text('6'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black12,
                    ),
                  ),
                ),
                SizedBox(
                  height: hw,
                  width: hw,
                  child: TextButton( //subtraction
                    onPressed: _subtraction,
                    child: const Text('×'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black26,
                    ),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                SizedBox(
                  height: hw,
                  width: hw,
                  child: TextButton( //addition
                    onPressed: _one,
                    child: const Text('1'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black12,
                    ),
                  ),
                ),
                SizedBox(
                  height: hw,
                  width: hw,
                  child: TextButton( //subtraction
                    onPressed: _two,
                    child: const Text('2'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black12,
                    ),
                  ),
                ),
                SizedBox(
                  height: hw,
                  width: hw,
                  child: TextButton( //multiplication
                    onPressed: _three,
                    child: const Text('3'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black12,
                    ),
                  ),
                ),
                SizedBox(
                  height: hw,
                  width: hw,
                  child: TextButton( //subtraction
                    onPressed: _subtraction,
                    child: const Text('-'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black26,
                    ),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                SizedBox(height: hw,
                  width: hw,
                  child:
                  TextButton( //addition
                    onPressed: _addition,
                    child: const Text('0'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black12,
                    ),
                  ),
                ),
                SizedBox( //AC
                  height: hw,
                  width: hw,
                  child: TextButton( //subtraction
                    onPressed: _reset,
                    child: const Text('AC'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black26,
                    ),
                  ),
                ),
                SizedBox( //equal
                  height: hw,
                  width: hw,
                  child: TextButton( //equal
                    onPressed: _equal,
                    child: const Text('='),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black26,
                    ),
                  ),
                ),
                SizedBox(
                  height: hw,
                  width: hw,
                  child: TextButton( //addition
                    onPressed: _addition,
                    child: const Text('+'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black26,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
