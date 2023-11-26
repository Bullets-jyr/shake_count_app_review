import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:shake_count_app/red_box.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
// class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // late ShakeDetector detector;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    // The value of the local variable 'detector' isn't used.
    ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          _counter++;
        });
      },
      shakeThresholdGravity: 1.5,
    );
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RedBox(),
                Column(
                  children: [
                    const RedBox().box.padding(EdgeInsets.all(30)).color(Colors.blue).make(),
                    '흔들어서 카운트를 올려보세요.'
                        .text
                        .color(Colors.red)
                        .bold
                        .white
                        .black
                        .size(20)
                        // .make()
                        .isIntrinsic
                        .makeCentered()
                        .box
                        // .rounded
                        .withRounded(value: 50)
                        .color(Colors.green)
                        .height(150)
                        .make()
                        .pSymmetric(h: 20, v: 50),
                    const RedBox(),
                  ],
                ),
                const RedBox(),
              ],
            ),
            // ValueListenableBuilder(
            //   valueListenable: _counter,
            //   builder: (BuildContext context, int value, Widget? child) => Text(
            //     '${_counter.value}',
            //     style: Theme.of(context).textTheme.displayLarge,
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // detector.startListening();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.paused:
        // detector.stopListening();
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }
}
