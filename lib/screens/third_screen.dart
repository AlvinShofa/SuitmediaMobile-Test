import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../models/user.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    final prov = context.read<UserProvider>();
    prov.fetchUsers(refresh: true);
    scrollCtrl.addListener(() {
      if (scrollCtrl.position.pixels >=
          scrollCtrl.position.maxScrollExtent - 200) {
        prov.fetchUsers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<UserProvider>();
    if (prov.refreshing)
      return const Center(child: CircularProgressIndicator());
    if (prov.users.isEmpty) return Center(child: Text('No users found'));

    return Scaffold(
      appBar: AppBar(
          title: const Text('Third Screen'),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
          iconTheme: const IconThemeData(color: Colors.black)),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => context.read<UserProvider>().fetchUsers(refresh: true),
        child: ListView.separated(
          controller: scrollCtrl,
          padding: const EdgeInsets.all(16),
          itemBuilder: (_, i) {
            if (i >= prov.users.length)
              return const Center(child: CircularProgressIndicator());
            final User u = prov.users[i];
            return GestureDetector(
              onTap: () {
                prov.selectUser(u);
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(children: [
                  CircleAvatar(
                      backgroundImage: NetworkImage(u.avatar), radius: 24),
                  const SizedBox(width: 12),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(u.fullName,
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text(u.email,
                            style: const TextStyle(color: Colors.grey)),
                      ]),
                ]),
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemCount: prov.hasMore ? prov.users.length + 1 : prov.users.length,
        ),
      ),
    );
  }
}
