import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  final nameCtrl = TextEditingController();
  final sentenceCtrl = TextEditingController();

  bool isPalindrome(String s) {
    final cs = s.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return cs == cs.split('').reversed.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset('assets/background.png', fit: BoxFit.cover),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Image.asset('assets/ic_photo.png', width: 100, height: 100),
                    const SizedBox(height: 32),
                    TextField(controller: nameCtrl, decoration: decor('Name')),
                    const SizedBox(height: 16),
                    TextField(
                        controller: sentenceCtrl,
                        decoration: decor('Palindrome')),
                    const SizedBox(height: 24),
                    btn('CHECK', () {
                      final res = isPalindrome(sentenceCtrl.text)
                          ? 'It\'s a palindrome!'
                          : 'Not palindrome';
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          content: Text(res),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            )
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 12),
                    btn('NEXT', () {
                      final name = nameCtrl.text.trim();
                      if (name.isNotEmpty) {
                        context.read<UserProvider>().setLoggedInName(name);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SecondScreen()),
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  InputDecoration decor(String hint) => InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      );

  Widget btn(String label, VoidCallback onTap) => SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF2B637B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
}
