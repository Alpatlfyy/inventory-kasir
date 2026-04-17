import 'package:flutter/material.dart';
import '../widgets/supplier_card.dart';

class SupplierTab extends StatelessWidget {
  const SupplierTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: Colors.black45),
                hintText: 'Cari nama atau email supplier...',
                hintStyle: TextStyle(color: Colors.black38, fontSize: 13),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'SEMUA SUPPLIER (12)',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              Icon(Icons.filter_list, color: Colors.black54, size: 18),
            ],
          ),
          const SizedBox(height: 16),
          const SupplierCard(
            name: 'Agro Lestari Abadi',
            email: 'contact@agrolestari.id',
            phone: '+62 812 3456 7890',
            icon: Icons.domain,
          ),
          const SizedBox(height: 16),
          const SupplierCard(
            name: 'Kopi Nusantara Hub',
            email: 'sales@kopi-nusantara.com',
            phone: '+62 811 9988 7766',
            icon: Icons.local_shipping_outlined,
          ),
          const SizedBox(height: 16),
          const SupplierCard(
            name: 'Pecah Belah Sentosa',
            email: 'info@sentosahouse.id',
            phone: '+62 21 5550 123',
            icon: Icons.inventory_2_outlined,
          ),
          const SizedBox(height: 48),
          Center(
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.inventory_2, size: 48, color: Colors.black12),
                ),
                const SizedBox(height: 16),
                const Text(
                  'UJUNG DAFTAR SUPPLIER',
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
