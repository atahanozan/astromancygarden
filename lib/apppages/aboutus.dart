import 'package:flutter/material.dart';
import 'package:fortunetell/core/languages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (await launchUrl(
      url,
      mode: LaunchMode.platformDefault,
      webOnlyWindowName: '_self',
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  final Uri instagram =
      Uri.parse('https://www.instagram.com/astromancygarden/');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: Text(
          'HAKKIMIZDA',
          style: GoogleFonts.benchNine(
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.purple.shade800,
                ),
                Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.purple.shade800,
                ),
                Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.purple.shade800,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                textUtilities.aboutus,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey.shade800),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  _launchInWebViewOrVC(instagram);
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/instagram.png'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text('/astromancygarden'),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/mail.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('astromancygarden@gmail.com'),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
