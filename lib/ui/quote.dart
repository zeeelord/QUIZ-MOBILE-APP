import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  State<Wisdom> createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "The best way to predict your future is to create it.",
    "It does not matter how slowly you go as long as you do not stop.",
    "The only way to do great work is to love what you do.",
    "Believe you can and you're halfway there.",
    "Success is not final, failure is not fatal: it is the courage to continue that counts.",
    "The greatest glory in living lies not in never falling, but in rising every time we fall."
        "Everything you've ever wanted is on the other side of fear.",
    "Happiness is not something ready-made. It comes from your own actions.",
    "Don't watch the clock; do what it does. Keep going.",
    "The best time to plant a tree was 20 years ago. The second best time is now."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded(
            //   child: Center(
            //     child: Container(
            //         width: 350,
            //         height: 200,
            //         margin: EdgeInsets.all(30.0),
            //         decoration: BoxDecoration(
            //           color: Colors.greenAccent,
            //           borderRadius: BorderRadius.circular(18.0),
            //         ),
            //         child: Center(
            //
            //             child: Text(quotes[_index % quotes.length]))),
            //   ),
            // ),
            Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                 child: Center(child: Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Text(quotes[_index % quotes.length]),
                 ))),
            Divider(
              thickness: 1.3,
              color: Colors.pink,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: TextButton.icon(
                onPressed: _showQuote,
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.greenAccent.shade700),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                icon: Icon(Icons.wb_sunny),
                label: Text(
                  "Inspire me...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.8,
                  ),
                ),
              ),
            ), //Spacer()

          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index += 1;
    });
  }
}
