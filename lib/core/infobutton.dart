import 'package:flutter/material.dart';

class InfoButton extends StatefulWidget {
  const InfoButton({
    Key? key,
    required this.content,
    required this.title,
  }) : super(key: key);

  final Widget title;
  final Widget content;

  @override
  State<InfoButton> createState() => _InfoButtonState();
}

class _InfoButtonState extends State<InfoButton> {
  @override
  Widget build(BuildContext infocontext) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: infocontext,
          builder: (infocontext) => AlertDialog(
            title: widget().title,
            content: SingleChildScrollView(
              child: widget().content,
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(infocontext),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    foregroundColor: Colors.white70),
                child: const Text("Tamam"),
              ),
            ],
          ),
        );
      },
      icon: const Icon(Icons.info_rounded),
    );
  }
}
