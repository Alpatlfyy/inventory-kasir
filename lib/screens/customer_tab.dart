import 'package:flutter/material.dart';
import '../widgets/customer_card.dart';

class CustomerTab extends StatelessWidget {
  const CustomerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pelanggan',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Kelola komunitas pecinta organik Anda.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: const Icon(Icons.search, color: Colors.black45),
                hintText: 'Cari berdasarkan nama, email, atau tag...',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black38),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip(context, 'Semua Pelanggan', true),
                const SizedBox(width: 8),
                _buildFilterChip(context, 'Anggota VIP', false),
                const SizedBox(width: 8),
                _buildFilterChip(context, 'Pelanggan Baru', false),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const CustomerCard(
            name: 'Amara Okafor',
            avatarUrl: 'https://ui-avatars.com/api/?name=Amara+Okafor&background=random',
            badge: 'ANGGOTA VIP',
            badgeColor: Color(0xFFFDF7C3),
            badgeTextColor: Color(0xFFC0A620), 
            metricLabel: 'TOTAL PENJUALAN KESELURUHAN',
            metricValue: '\$1,240.00',
            metricValueColor: Color(0xFF0F6E31),
          ),
          const SizedBox(height: 16),
          const CustomerCard(
            name: 'Julian Thorne',
            avatarUrl: 'https://ui-avatars.com/api/?name=Julian+Thorne&background=random',
            metricLabel: 'PESANAN TERAKHIR',
            metricValue: '2 jam yang lalu',
            metricValueColor: Colors.black87,
          ),
          const SizedBox(height: 16),
          const CustomerCard(
            name: 'Elena Rodriguez',
            avatarUrl: 'https://ui-avatars.com/api/?name=Elena+Rodriguez&background=random',
            badge: 'PELANGGAN TETAP',
            badgeColor: Color(0xFFEBEBEB),
            badgeTextColor: Colors.black54,
            metricLabel: 'POIN',
            metricValue: '4,850 pts',
            metricValueColor: Color(0xFF8B7355), 
          ),
          const SizedBox(height: 16),
          const CustomerCard(
            name: 'Sienna Brooks',
            avatarUrl: 'https://ui-avatars.com/api/?name=Sienna+Brooks&background=random',
            metricLabel: 'LOKASI',
            metricValue: 'Greenpoint, NY',
            metricValueColor: Colors.black87,
          ),
          const SizedBox(height: 16),
          const CustomerCard(
            name: 'Oliver Chen',
            avatarUrl: 'https://ui-avatars.com/api/?name=Oliver+Chen&background=random',
            metricLabel: 'TOTAL PENJUALAN KESELURUHAN',
            metricValue: '\$342.50',
            metricValueColor: Color(0xFF0F6E31),
          ),
          const SizedBox(height: 16),
          const CustomerCard(
            name: 'Maya Angelis',
            avatarUrl: 'https://ui-avatars.com/api/?name=Maya+Angelis&background=random',
            badge: 'TINDAK LANJUT',
            badgeColor: Color(0xFFFFE0D9),
            badgeTextColor: Color(0xFFD64426),
            metricLabel: 'STATUS',
            metricValue: 'Faktur Belum Dibayar',
            metricValueColor: Color(0xFFD64426),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget _buildFilterChip(BuildContext context, String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF0A5826) : const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: isSelected ? Colors.white : Colors.black54,
            ),
      ),
    );
  }
}
