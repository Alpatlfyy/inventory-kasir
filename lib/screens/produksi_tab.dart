import 'package:flutter/material.dart';
import '../widgets/produksi_item.dart';

class ProduksiTab extends StatelessWidget {
  const ProduksiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aktivitas Produksi',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.2,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Pantau hasil produksi harian Anda dengan presisi.',
            style: TextStyle(color: Colors.black54, fontSize: 13),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: const [
                      Text('TOTAL ITEM', style: TextStyle(color: Colors.black54, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                      SizedBox(height: 8),
                      Text('1,240', style: TextStyle(color: Color(0xFF0F6E31), fontSize: 28, fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF86EF86),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: const [
                      Text('TARGET\nHARI INI', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF074D1F), fontSize: 11, fontWeight: FontWeight.w800, height: 1.2, letterSpacing: 0.5)),
                      SizedBox(height: 8),
                      Text('85%', style: TextStyle(color: Color(0xFF074D1F), fontSize: 28, fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const ProduksiItem(
            name: 'Sourdough Bread',
            imageUrl: 'https://images.unsplash.com/photo-1585478259715-876a6a81fa08?w=150', // bread
            batchAndDate: 'Batch #A-204 • 24 Okt 2023',
            badge: 'DAPUR UTAMA',
            qty: '45',
            unit: 'Pcs',
            status: 'SELESAI',
            hasBackground: false,
          ),
          const SizedBox(height: 12),
          const ProduksiItem(
            name: 'Butter Croissant',
            imageUrl: 'https://images.unsplash.com/photo-1555507036-ab1f40ce88cb?w=150', // croissant
            batchAndDate: 'Batch #C-112 • 24 Okt 2023',
            badge: 'PASTRY LAB',
            qty: '120',
            unit: 'Pcs',
            status: 'SELESAI',
            hasBackground: true,
          ),
          const SizedBox(height: 12),
          const ProduksiItem(
            name: 'Dark Cocoa Cake',
            imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=150', // chocolate cake
            batchAndDate: 'Batch #K-892 • 23 Okt 2023',
            badge: 'DAPUR UTAMA',
            qty: '12',
            unit: 'Pcs',
            status: 'SELESAI',
            hasBackground: false,
          ),
          const SizedBox(height: 120),
        ],
      )
    );
  }
}
