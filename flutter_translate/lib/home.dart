import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String translate = "Translate";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Translate"), leading: const Icon(Icons.translate)),
      body: Card(
        margin: const EdgeInsets.all(12),
        child: ListView(padding: const EdgeInsets.all(20), children: [
          const Text("Auto to English"),
          const SizedBox(
            height: 8,
          ),
          TextField(
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(hintText: "Enter text"),
            onChanged: (text) async {
              final t = await text.translate(from: "auto", to: "en");
              setState(() {
                translate = t.text;
              });
            },
          ),
          const Divider(height: 32),
          Text(
            translate,
            style: const TextStyle(
                fontSize: 36,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
