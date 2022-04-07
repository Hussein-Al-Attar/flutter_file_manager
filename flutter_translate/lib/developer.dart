import 'package:flutter/material.dart';

class Developer extends StatefulWidget {
  const Developer({Key? key}) : super(key: key);

  @override
  State<Developer> createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: const Text("Developer Telegram",
                style: TextStyle(color: Colors.white)),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient:
                    const LinearGradient(colors: [Colors.blue, Colors.red]),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            readOnly: true,
            initialValue: "https://t.me/husseinahk",
            style: const TextStyle(color: Colors.blue),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ]),
      ),
    );
  }
}
