import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Row(children: [Expanded(child: Container(height: 1,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[
                Colors.transparent,Colors.grey])),)),
      const SizedBox(width: 10),
      Text("Or continue with",style: TextStyle(color: Colors.grey)),
      const SizedBox(width: 10),
      Expanded(
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey, Colors.transparent],
            ),
          ),
        ),
      ),

    ],
    ),
      const SizedBox(height: 20),

      Row(mainAxisAlignment: MainAxisAlignment.center,children: [Image.asset('assets/google.png'),
        SizedBox(width: 15),
        Image.asset('assets/facebook.png'),
        SizedBox(width: 15),
        Image.asset('assets/apple.png'),],),
    ],);
  }
}