import 'package:flutter/material.dart';
import 'package:flutter_translate/developer.dart';
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
        title: const Text("Translate"),
        leading: const Icon(Icons.translate),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Developer()));
              },
              icon: const Icon(Icons.account_box))
        ],
      ),
      body: Card(
        margin: const EdgeInsets.all(12),
        child: ListView(padding: const EdgeInsets.all(20), children: [
          const Text("English to Arabic"),
          const SizedBox(
            height: 8,
          ),
          TextField(
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(hintText: "Enter text"),
            onChanged: (text) async {
              final t = await text.translate(from: "en", to: "ar");
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
