import 'package:flutter/material.dart';

import '../model/soma_imc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController pesoControler =  TextEditingController();
  TextEditingController alturaControler =  TextEditingController();
  SomaImc somaImc =  SomaImc();

  String resultado = "";

  String? erroTextPeso;
  String? erroTextAltura;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora De IMC"),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.restore_sharp))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.person_outline,
                size: 130.0,
                color: Colors.green,
              ),
              TextField(
                controller: pesoControler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (Kg)",
                  errorText: erroTextPeso,
                  labelStyle: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: alturaControler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  errorText: erroTextAltura,
                  labelStyle: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (isErroText()){
                      resultado = "";
                      return;
                    }
                    somaImc.somarImc(double.parse(pesoControler.text.trim()),
                        double.parse(alturaControler.text.trim()));
                    setState(
                          () {
                        erroTextPeso = null;
                        erroTextAltura = null;
                        resultado = somaImc.toString();
                      },
                    );
                  },
                  child: const Text(
                    "Calcular",
                    style: TextStyle(fontSize: 30),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      elevation: 20,
                      padding: const EdgeInsets.symmetric(vertical: 20)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                resultado.isEmpty ? "Informe seus dados!" : resultado,
                style: const TextStyle(fontSize: 25, color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isErroText() {
    if (pesoControler.text.isEmpty && alturaControler.text.isEmpty) {
      setState(() {
        erroTextPeso = "Preencha o campo acima";
        erroTextAltura = "Preencha o campo acima";
      });
      return true;
    } else if (pesoControler.text.isEmpty) {
      setState(() {
        erroTextPeso = "Preencha o campo acima";
        erroTextAltura = null;
      });
      return true;
    } else if (alturaControler.text.isEmpty) {
      setState(() {
        erroTextAltura = "Preencha o campo acima";
        erroTextPeso = null;
      });
      return true;
    }
    return false;
  }
}
