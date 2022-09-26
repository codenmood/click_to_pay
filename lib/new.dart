import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:like_button/like_button.dart';


void main() {
  runApp(PayScreen());
}

class PayScreen extends StatefulWidget {
  @override
  _PayScreenState createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {

  // declare confettiController;
  late ConfettiController _topController;

  @override
  void initState() {
    super.initState();

    // initialize confettiController
    _topController = ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {

    // dispose the controller
    _topController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {

                          // invoking confettiController
                          // to come into play
                          _topController.play();
                        },
                        child: Column(
                          children: [
                            Text(
                                '10',
                                style: const TextStyle(
                                    color: Colors.white,
                                     fontWeight: FontWeight.w800,
                                    fontSize: 50)),
                            Text('Coins',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontSize: 30)),
                          ],
                        )),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 430,
                    width: 430,
                    decoration: BoxDecoration(
                        color: Color(0xff1c1c1c),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(200),
                          topRight:Radius.circular(200),
                        )
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black
                          ),
                          child: LikeButton(

                            size: 140,
                            likeBuilder: (isTapped) {
                              return Center(
                                child: Icon(
                                  Icons.currency_bitcoin_rounded,
                                  color: isTapped? Colors.yellow : Color(0xff1c1c1c),
                                  size: 140,
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Text(
                            'CLICK TO PAY',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 30)),

                      ],
                    ),
                  ),
                ],
              ),
              // align the confetti on the screen
              Align(
                alignment: // confetti will pop from top-center
                Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _topController,
                  blastDirectionality: BlastDirectionality.explosive,
                   //maxBlastForce: 3,
                   //minBlastForce: 0,
                   emissionFrequency: 0.01,

                  // 10 paticles will pop-up at a time
                  numberOfParticles: 5,

                  // particles will come down
                  gravity: 0.1,

                  // start again as soon as the
                  // animation is finished
                  shouldLoop: true,

                  // assign colors of any choice
                  colors: const [
                    Colors.green,
                    Colors.yellow,
                    Colors.pink,
                    Colors.orange,
                    Colors.blue
                  ],

                 createParticlePath: drawCustomConfetti,
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
  Path drawCustomConfetti(Size? size) {
    final path = Path();
    path.moveTo(10, 0);
    path.lineTo(0, 10);
    path.lineTo(-10, 0);
    path.lineTo(10, -10);
    path.lineTo(10, 0);
    path.close();
    return path;
}}