import 'package:flutter/material.dart';
import 'package:sender/components/black_border_textfield.dart';
import 'package:sender/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';

class WhatsAppPage extends StatefulWidget {
  const WhatsAppPage({Key? key}) : super(key: key);

  @override
  State<WhatsAppPage> createState() => _WhatsAppPageState();
}

class _WhatsAppPageState extends State<WhatsAppPage> {
  TextEditingController phoneEditingController = TextEditingController();

  TextEditingController messageEditingController = TextEditingController();
  String naijacode = '234';
  void openWhatsApp({@required number, @required message}) async {
    String url = 'https://wa.me/$number?text=$message';
    await canLaunch(url) ? launch(url) : print('Cant open');
  }

  @override
  void dispose() {
    phoneEditingController.dispose();
    messageEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('WhatsApp Sender'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Form(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Spacer(),
              TextFormField(
                maxLength: 11,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                controller: phoneEditingController,
                decoration: const InputDecoration(
                  hintText: 'Mobile Number',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                maxLines: 3,
                maxLength: 200,
                controller: messageEditingController,
                decoration: const InputDecoration(
                  hintText: 'Message',
                  fillColor: Colors.grey,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final number = phoneEditingController.text.trim();
          final message = messageEditingController.text.trim();
          if (number.isNotEmpty && message.isNotEmpty) {
            openWhatsApp(number: naijacode + number, message: message);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Please input receiver's contact and message",
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: const Icon(
          Icons.send,
        ),
      ),
    );
  }
}
