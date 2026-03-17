import 'package:flutter/material.dart';
import 'models/book.dart';
import 'book_detail_page.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koleksi Buku'),
        backgroundColor: const Color(0xFF3E2723),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: dummyBooks.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final book = dummyBooks[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

              // 1. Bagian Gambar
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  book.imagePath,
                  width: 50,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 50,
                      height: 70,
                      color: Color(int.parse(book.coverColor)),
                      child: Center(
                        child: Text(book.title[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
                ),
              ),

              title: Text(
                  book.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3E2723), fontSize: 16)
              ),
              subtitle: Text(
                  "${book.genre} • ${book.author}",
                  style: TextStyle(color: Colors.grey.shade700)
              ),

              trailing: const Icon(Icons.chevron_right, color: Color(0xFF3E2723)),

              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailPage(book: book)));
              },
            ),
          );
        },
      ),
    );
  }
}