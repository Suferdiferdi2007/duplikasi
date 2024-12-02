import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Center(
          child: Text(
            'Menu Yummy Hari Ini',
            style: TextStyle(color: Colors.black),
          ),
        ),
        // Atur tinggi AppBar jika perlu
        toolbarHeight: 56.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: 4, // Mengubah itemCount menjadi 4 untuk 4 resep
          itemBuilder: (context, index) {
            return RecipeCard(
              title: getRecipeTitle(index),
              imagePath: getImagePath(index),
              rating: getRating(index),
              time: getTime(index),
              price: getPrice(index),
            );
          },
        ),
      ),
    );
  }

  // ... (Metode lainnya tetap sama)

  String getRecipeTitle(int index) {
    switch (index) {
      case 0:
        return 'Bubur Ayam';
      case 1:
        return 'Mie Nyemek';
      case 2:
        return 'Salad Buah';
      case 3:
        return 'Es Doger';
      default:
        return '';
    }
  }

  String getImagePath(int index) {
    switch (index) {
      case 0:
        return 'assets/images/bubur.jpg';
      case 1:
        return 'assets/images/mie.jpg';
      case 2:
        return 'assets/images/salad.jpg';
      case 3:
        return 'assets/images/Doger.jpg';
      default:
        return '';
    }
  }

  String getRating(int index) {
    switch (index) {
      case 0:
        return '4.8';
      case 1:
        return '5';
      case 2:
        return '4.6';
      case 3:
        return '5';
      default:
        return '';
    }
  }

  String getTime(int index) {
    switch (index) {
      case 0:
        return '60 mnt';
      case 1:
        return '30 mnt';
      case 2:
        return '40 mnt';
      case 3:
        return '60 mnt';
      default:
        return '';
    }
  }

  String getPrice(int index) {
    switch (index) {
      case 0:
        return '16,6 rb';
      case 1:
        return '20,2 rb';
      case 2:
        return '26,6 rb';
      case 3:
        return '30,3 rb';
      default:
        return '';
    }
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String rating;
  final String time;
  final String price;

  const RecipeCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.rating,
    required this.time,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian gambar
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama dan Rating
                const Row(
                  children: [
                    Text(
                      'Yummy Official',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Spacer(),
                    Icon(Icons.check_circle, size: 14, color: Colors.blue),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.orange),
                    const SizedBox(width: 5),
                    Text(rating),
                    const Spacer(),
                    Text(time, style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 10),
                // Harga dan Icon Simpan
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Icon(Icons.bookmark_border, size: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}