import 'dart:convert';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/apppages/aboutus.dart';
import 'package:fortunetell/core/languages.dart';
import 'package:http/http.dart' as http;

class AnimatedFAB extends StatefulWidget {
  const AnimatedFAB({Key? key}) : super(key: key);

  @override
  State<AnimatedFAB> createState() => _AnimatedFABState();
}

class _AnimatedFABState extends State<AnimatedFAB>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  final nameController = TextEditingController();
  final subjectController = TextEditingController();
  final mailController = TextEditingController();
  final messageController = TextEditingController();

  Future sendEmail() async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_5zt2qzt";
    const templateId = "template_prny5um";
    const userID = "nyA_vUhjJEV1bajRM";
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'origin': 'http://localhost'
        },
        body: json.encode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userID,
          "template_params": {
            "name": nameController.text,
            "subject": subjectController.text,
            "message": messageController.text,
            "user_email": mailController.text,
          }
        }));
    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      items: <Bubble>[
        // Floating action menu item

        // Floating action menu item
        Bubble(
          title: "Hakkında",
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.people,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            _animationController.reverse();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUs()));
          },
        ),
        //Floating action menu item
        Bubble(
          title: "Mesaj",
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.message_rounded,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            _animationController.reverse();
            //E-mail details diolog page
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Falcı İle İletişime Geçin"),
                      actions: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  textUtilities.mailsub,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    icon: Icon(Icons.account_circle_rounded),
                                    label: Text("İsim"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: mailController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    icon: Icon(Icons.email_rounded),
                                    label: Text("E-mail"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: TextFormField(
                                  controller: subjectController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    icon: Icon(Icons.subject_rounded),
                                    label: Text("Konu"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: TextFormField(
                                  maxLines: 10,
                                  controller: messageController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    icon: Icon(Icons.message_rounded),
                                    label: Text("Mesaj"),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Kapat")),
                                  ElevatedButton(
                                      onPressed: () {
                                        sendEmail();
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Mesajınız Falcıya Gönderilmiştir.")));
                                      },
                                      child: const Text("Gönder")),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ));
          },
        ),
      ],
      animation: _animation,

      // On pressed change animation state
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),

      // Floating Action button Icon color
      iconColor: Colors.white,

      // Flaoting Action button Icon
      iconData: Icons.add_rounded,
      backGroundColor: Colors.blue.shade800,
    );
  }
}
