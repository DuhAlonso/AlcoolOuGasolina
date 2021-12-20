import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _alcoolController = TextEditingController();
  final TextEditingController _gasolinaController = TextEditingController();
  String msg = 'Saiba qual a melhor opção para abastecimento do seu carro';

  void _calculate() {
    double priceAlcool = double.parse(_alcoolController.text);
    double priceGasolina = double.parse(_gasolinaController.text);

    if (priceGasolina == 0 || priceAlcool == 0) {
      setState(() {
        msg = 'Número inválido';
      });
    } else if (priceAlcool / priceGasolina < 0.75) {
      setState(() {
        msg = 'Abasteça com Álcool';
      });
    } else {
      setState(() {
        msg = 'Abasteça com Gasolina';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Álcool ou Gasolina?'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/escolha.png',
                width: 260,
                height: 150,
              ),
              // Text(
              //   msgResult,
              //   style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              // ),
              const SizedBox(
                height: 20,
              ),
              Text(
                msg,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _alcoolController,
                keyboardType: TextInputType.number,
                maxLength: 5,
                style: const TextStyle(fontSize: 30),
                decoration: const InputDecoration(
                  label: Text(
                    'Preço do Álcool. Ex: 3.59',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onSubmitted: (value) => _calculate(),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                style: const TextStyle(fontSize: 30),
                controller: _gasolinaController,
                keyboardType: TextInputType.number,
                maxLength: 5,
                decoration: const InputDecoration(
                  label: Text(
                    'Preço da Gasolina. Ex: 5.59',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onSubmitted: (value) => _calculate(),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: double.infinity,
                child: TextButton(
                  onPressed: _calculate,
                  child: const Text(
                    'Calcular',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
