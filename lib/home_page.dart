import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _autoPlay = false;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          iconCreator(),
                          iconCreator(),
                        ],
                      ),
                    ),
                  ShakeWidget(
                    enableWebMouseHover: false,
                    shakeConstant: ShakeChunkConstant(),
                    autoPlay: _autoPlay,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200.0), 
                      child: Image.asset("lib/assets/image.jpg", width: 400, height: 400,),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _visible = !_visible;
                      _autoPlay = !_autoPlay; // _autoPlay = !_autoPlay -> clicar transforma autoplay no contrário do que ele é (false -> true)
                    });

                    // Future.delayed(const Duration(seconds: 5), (){
                    //   setState(() {
                    //     _autoPlay = false;
                    //   });
                    // });
                    },
                  child: const Text("Shake!"),
                ),
              ),
            ],           
          ),
        ),
      ),
    );
  }
  Widget iconCreator() {
    return const Icon(
      Icons.celebration,
      color: Colors.purple,
      size: 50
    );
  }
}