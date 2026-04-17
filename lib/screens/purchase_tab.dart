import 'package:flutter/material.dart';
import '../widgets/purchase_item.dart';

class PurchaseTab extends StatelessWidget {
  const PurchaseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F6F0),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -20,
                  bottom: -20,
                  child: Icon(Icons.receipt_long, size: 100, color: Colors.black.withOpacity(0.04)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Pembelian Bulan Ini',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Kelola Stock',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Barang Masuk', style: TextStyle(color: Colors.black54, fontSize: 12)),
                      SizedBox(height: 4),
                      Text('142 Item', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Vendor Aktif', style: TextStyle(color: Colors.black54, fontSize: 12)),
                      SizedBox(height: 4),
                      Text('8 Mitra', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
               Text('Daftar Barang Masuk', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
               Text('Terbaru', style: TextStyle(color: Colors.black54, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),
          const PurchaseItem(
            name: 'Espresso Blend Premium',
            imageUrl: 'https://images.unsplash.com/photo-1559525839-b184a4d698c7?w=150',
            weight: '20 kg',
            date: '24 Okt 2023',
            status: 'DITERIMA',
            statusColor: Color(0xFFC7F1CF),
            statusTextColor: Color(0xFF0B6A26),
          ),
          const SizedBox(height: 12),
          const PurchaseItem(
            name: 'Whole Wheat Flour',
            imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=150',
            weight: '50 kg',
            date: '23 Okt 2023',
            status: 'DITERIMA',
            statusColor: Color(0xFFC7F1CF),
            statusTextColor: Color(0xFF0B6A26),
          ),
          const SizedBox(height: 12),
          const PurchaseItem(
            name: 'Oat Milk Barista Edition',
            imageUrl: 'https://images.unsplash.com/photo-1600788886242-5c96aabe3757?w=150',
            weight: '24 unit',
            date: '22 Okt 2023',
            status: 'PENDING',
            statusColor: Color(0xFFFDF7C3),
            statusTextColor: Color(0xFFC0A620),
          ),
          const SizedBox(height: 12),
          const PurchaseItem(
            name: 'Ceramic Mug - White',
            imageUrl: 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?w=150',
            weight: '12 unit',
            date: '21 Okt 2023',
            status: 'DITERIMA',
            statusColor: Color(0xFFC7F1CF),
            statusTextColor: Color(0xFF0B6A26),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
