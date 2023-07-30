import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static Future<void> launchURL({@required number, @required message}) async {
    String url = 'whatsapp://send?phone=$number&text=$message';
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        print("Can't open WhatsApp");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Launch whatsapp'),
       actions: [
        IconButton(onPressed: () {
          Share.share('https://play.google.com/store/apps/details?id=com.starbight.muslim_life');
          
        }, icon: Icon(Icons.share),),
       ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                launchURL(number: '+88001874007261', message: 'hello eAppair');
              },
              child: Container(
                alignment: Alignment.center,
                child: Image.asset('asstes/images/whatsapp.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
