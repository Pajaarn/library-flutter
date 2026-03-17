import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF3E2723),
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text('Nama Mahasiswa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3E2723))),
              const Text('NIM: 123456789', style: TextStyle(fontSize: 16, color: Colors.grey)),
              const Text('Jurusan: Teknik Informatika', style: TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 32),
              const Divider(color: Color(0xFF3E2723), thickness: 0.5),
              ListTile(
                leading: const Icon(Icons.email, color: Color(0xFF3E2723)),
                title: const Text('Email'),
                subtitle: const Text('mahasiswa@email.com'),
              ),
              ListTile(
                leading: const Icon(Icons.school, color: Color(0xFF3E2723)),
                title: const Text('Universitas'),
                subtitle: const Text('Universitas Negeri'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}