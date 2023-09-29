import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashScreen());
  }

  // @override
  // Widget build(BuildContext context) {
  //   return const Scaffold(
  //     body: Center(child: CircularProgressIndicator()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Image.asset('assets/images/logo-white-sm.png')),
          const SizedBox(height: 25),
          const Text("Y O U A P P",
              style: TextStyle(fontSize: 18, color: Colors.grey)),
          const Align(
              heightFactor: 5,
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                color: Colors.white,
              ))
        ],
      )),
    );
  }
}
