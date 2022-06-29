import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _numeroaleatorio = 0;
  var _fraseescolhida = '';
  final List _frases = [
    'A persistência é o caminho do êxito.',
    'No meio da dificuldade encontra-se a oportunidade.',
    'Eu faço da dificuldade a minha motivação. A volta por cima vem na continuação.',
    'Pedras no caminho? Eu guardo todas. Um dia vou construir um castelo.',
    'Tudo o que um sonho precisa para ser realizado é alguém que acredite que ele possa ser realizado.',
    'O que me preocupa não é o grito dos maus. É o silêncio dos bons.',
    'O sucesso é ir de fracasso em fracasso sem perder o entusiasmo.'
  ];

  void _gerarFrase() {
    setState(() {
      _numeroaleatorio = Random().nextInt(_frases.length);
      _fraseescolhida = _frases[_numeroaleatorio];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("images/logo.png"),
                    const Text(
                      "Clique abaixo para gerar uma frase!",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                      onPressed: _gerarFrase,
                      child: const Text(
                        "Gerar Frase",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      _fraseescolhida,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                  ]))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: _gerarFrase,
        tooltip: "Gerar Frase",
        child: const Icon(Icons.android),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Container(height: 50.0),
      ),
    );
  }
}
