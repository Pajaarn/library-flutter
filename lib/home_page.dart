import 'package:flutter/material.dart';
import 'models/book.dart';
import 'book_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library App', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Gimmick Search Bar di bawah Navbar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            color: const Color(0xFF3E2723),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari judul buku atau penulis...",
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 1000 ? 6 : (constraints.maxWidth > 600 ? 4 : 2);
                return GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: dummyBooks.length,
                  itemBuilder: (context, index) => _buildClassicBookCard(context, dummyBooks[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClassicBookCard(BuildContext context, Book book) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => BookDetailPage(book: book))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 4))],
                image: DecorationImage(
                  image: AssetImage(book.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(book.title, maxLines: 1, overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF3E2723))),
          Text(book.author, style: const TextStyle(fontSize: 12, color: Colors.brown)),
        ],
      ),
    );
  }
}