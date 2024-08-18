import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/about'),
            child: Text(
              'Go to about',
              style: GoogleFonts.nunito(
                  // fontSize: 20,
                  ),
            )),
      ),
    );
  }
}
