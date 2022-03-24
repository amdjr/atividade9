import 'package:flutter/material.dart';
import 'dart:convert' as Convert;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Consumindo JSON"),
        ),
        body: MyFutureBuilder());
  }
}

class MyFutureBuilder extends StatelessWidget {
  const MyFutureBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('json/arquivo.json'),
        builder: (context, AsyncSnapshot snapshot) {
          List carregaDados = Convert.json.decode(snapshot.data.toString());
          print(carregaDados.length);
          print(carregaDados);

          return ListView.builder(
              itemCount: carregaDados.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(carregaDados[index]['nome']),
                  subtitle: Text(carregaDados[index]['email']),
                  trailing: Text(carregaDados[index]['telefone']),
                  onTap: () {
                    print("Clicou no item: $index");
                  },
                );
              });
        });
  }
}
