import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}


class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //var yarattık, zar atıldıkça güncellenecek
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;


// var yarattıktan sonra pressed fonsiyonunu buraya tanımladım yoksa fonksyion çalışmaz!!
  void pressed(){
    setState(() {
      //zar atılınca güncelle dedik.
      // random olarak 0 da gelebildiği için +1 dedim hep 1'den başlasın diye
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1; // sola tıklayınca 2si de değişiyor böylece
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget> [
          Expanded(
            child: TextButton(
                onPressed: () {
                  print('Left button pressed');
                  pressed(); //calling the pressed function
                },
                child: Image.asset('images/dice$leftDiceNumber.png')),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  print('Right button pressed');
                  pressed(); //calling the pressed function
                },
                child: Image.asset('images/dice$rightDiceNumber.png')),
          ),

        ],
      ),
    );
  }
}
