import 'package:flutter/material.dart';

class EcommercePesananTab extends StatelessWidget {
  const EcommercePesananTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pesanan', style: TextStyle(color: Colors.black87, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: -1)),
          const SizedBox(height: 8),
          const Text('Riwayat dan antrean pesanan online eCommerce.', style: TextStyle(color: Colors.black54, fontSize: 13)),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: Colors.black45),
                hintText: 'Cari ID pesanan...',
                hintStyle: TextStyle(color: Colors.black38, fontSize: 13),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 48),
          Center(
            child: Column(
              children: [
                Icon(Icons.receipt_long_outlined, size: 80, color: Colors.grey[300]),
                const SizedBox(height: 16),
                Text('Riwayat pesanan referensi eCommerce masih kosong.', style: TextStyle(color: Colors.grey[500], fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
