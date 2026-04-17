import 'package:flutter/material.dart';
import '../widgets/transaction_item.dart';

class TransaksiTab extends StatelessWidget {
  const TransaksiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Transaksi',
            style: TextStyle(color: Colors.black87, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: -1),
          ),
          const SizedBox(height: 8),
          const Text(
            'Riwayat pencatatan keluar-masuk dana.',
            style: TextStyle(color: Colors.black54, fontSize: 13),
          ),
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
                hintText: 'Cari nomor ID pesanan...',
                hintStyle: TextStyle(color: Colors.black38, fontSize: 13),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 32),
          const TransactionItem(
            icon: Icons.shopping_basket_outlined,
            orderNo: 'Pesanan #8492',
            details: '14:45 • 3 item',
            price: '\$45.00',
            status: 'SELESAI',
          ),
          const SizedBox(height: 12),
          const TransactionItem(
            icon: Icons.local_cafe_outlined,
            orderNo: 'Pesanan #8491',
            details: '14:30 • 1 item',
            price: '\$6.50',
            status: 'SELESAI',
          ),
          const SizedBox(height: 12),
          const TransactionItem(
            icon: Icons.eco_outlined,
            orderNo: 'Pesanan #8490',
            details: '14:12 • 5 item',
            price: '\$128.40',
            status: 'SELESAI',
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
