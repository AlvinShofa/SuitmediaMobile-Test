import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(
          title: const Text('Second Screen'),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
          iconTheme: const IconThemeData(color: Colors.black)),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Welcome',
              style: TextStyle(color: Colors.grey[700], fontSize: 16)),
          Text(prov.loggedInName,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Spacer(),
          Center(
              child: Text(prov.selectedUser?.fullName ?? 'Selected User Name',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800))),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ThirdScreen())),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2B637B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: const Text(
                  'Choose a User',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ]),
      ),
    );
  }
}
