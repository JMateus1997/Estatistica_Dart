import 'dart:io';
import 'dart:convert';
import 'package:csv/csv.dart';
import 'DadosMercado.dart';
import 'Estatistica.dart';
import 'ListaMercado.dart';


void main() async{

  Duration duracaoLeitura = Duration();
  Stopwatch tempoLeitura = Stopwatch()..start();

  var csvFile =
  File('C:\\Users\\Lenovo-IdeaPad\\Desktop\\questao1.csv').readAsLinesSync();
  ListaMercado listaMercado1 = ListaMercado();
  ListaMercado listaMercado2 = ListaMercado();
  ListaMercado listaMercado3 = ListaMercado();
  try{


    String cabecalho = csvFile[0];
    List<String> nomes = cabecalho.split(",");
    csvFile.removeAt(0);

    listaMercado1.nome = nomes[1];
    listaMercado2.nome = nomes[2];
    listaMercado3.nome = nomes[3];

    for (var i in csvFile){

      final linhas = i.split(",");

      listaMercado1.precoMoeda.add(double.parse(linhas[1]));
      listaMercado2.precoMoeda.add(double.parse(linhas[2]));
      listaMercado3.precoMoeda.add(double.parse(linhas[3]));

    }
    duracaoLeitura = tempoLeitura.elapsed;

  }catch(on){

  }
  finally{

  }

  DadosMercado dadosMercado1 = estatistica(listaMercado1);
  mostraResultados(dadosMercado1);

  DadosMercado dadosMercado2 = estatistica(listaMercado2);
  mostraResultados(dadosMercado2);

  DadosMercado dadosMercado3 = estatistica(listaMercado3);
  mostraResultados(dadosMercado3);

  print("Tempo de leitura de arquivo CSV: \n${duracaoLeitura.inMilliseconds} ms");

}

void mostraResultados(DadosMercado dadosMercado){
  print("Moeda: \n" + dadosMercado.moedaNome);
  print("Retornos: \n ${dadosMercado.retorno}");
  print("Media: \n ${dadosMercado.media}");
  print("Variancia: \n ${dadosMercado.variancia}");
  print("Desvio: \n ${dadosMercado.desvio}");
  print("Tempo de calculo de retornos: \n ${dadosMercado.tempoRetorno.inMicroseconds} us");
  print("Tempo de calculo de media: \n ${dadosMercado.tempoMedia.inMicroseconds} us");
  print("Tempo de calculo de variancia: \n ${dadosMercado.tempoVariancia.inMicroseconds} us");
  print("Tempo de calculo de desvio: \n ${dadosMercado.tempoDesvio.inMicroseconds} us");
}
