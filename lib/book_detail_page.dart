import 'package:flutter/material.dart';
import 'models/book.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        backgroundColor: const Color(0xFF3E2723),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 180, // Sedikit diperbesar agar lebih mantap
                height: 260,
                decoration: BoxDecoration(
                  color: Color(int.parse(book.coverColor)), // Warna dasar jika gambar telat dimuat
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 10)
                    )
                  ],
                  // Di sini kita panggil gambar lokalnya
                  image: DecorationImage(
                    image: AssetImage(book.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
                book.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF3E2723))
            ),
            const SizedBox(height: 8),
            Text(
                book.author,
                style: const TextStyle(fontSize: 18, color: Colors.brown, fontWeight: FontWeight.w500)
            ),
            const SizedBox(height: 16),
            Chip(
              label: Text(book.genre, style: const TextStyle(color: Color(0xFF3E2723), fontWeight: FontWeight.bold)),
              backgroundColor: Colors.brown.shade100,
              side: BorderSide.none, // Menghilangkan garis pinggir agar lebih bersih
            ),
            const Divider(height: 40, color: Color(0xFF3E2723), thickness: 0.3),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Sinopsis', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3E2723))),
            ),
            const SizedBox(height: 12),
            Text(
                book.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.black87)
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}