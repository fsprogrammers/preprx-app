import 'package:flutter/material.dart';


class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
         decoration: const BoxDecoration(
          gradient: LinearGradient(
         
                begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.4, 0.7, 1.0],
            colors: [
              Color(0xFF32D3DB), // Cyan Top
              Color(0xFF32D3DB), // Extending cyan lower
              Color(0xFF86DAB2), // Green middle
              Color(0xFFF1CC8E), // Sandy orange bottom
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}



class GradientsmallBackground extends StatelessWidget {
  final Widget child;

  const GradientsmallBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
         decoration: const BoxDecoration(
          gradient: LinearGradient(
         
                begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0,1.0],
            colors: [
              // Color(0xFF32D3DB), // Cyan Top
              // Color(0xFF32D3DB), // Extending cyan lower
              // Color(0xFF86DAB2), // Green middle
              Color(0xFFF1CC8E), // Sandy orange bottom
              Color(0xFFF1CC8E), // Sandy orange bottom
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
