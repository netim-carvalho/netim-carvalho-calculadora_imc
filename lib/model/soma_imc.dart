
class SomaImc {
  late double peso;
  late double altura;
  late  double imc = 0;
  late String classificacao;

  void somarImc(double peso, double altura) {
    this.peso = peso;
    this.altura = altura/100;
   imc =  this.peso / (this.altura * 2);

    if (imc < 18.5) {
      classificacao = "Magreza";
    } else if (imc >= 18.5 && imc <= 24.9) {
      classificacao = "Normal";
    } else if (imc >= 25 && imc <= 29.9) {
      classificacao = "Sobrepeso";
    } else if (imc >= 30 && imc <= 39.9) {
      classificacao = "Obsidade";
    } else if(imc > 40){
      classificacao = "Obsidade Grave";
    }
  }
  @override
  String toString() {
    return "Seu IMC é ${imc.toStringAsFixed(1)} - Classificação: $classificacao";
  }
}
