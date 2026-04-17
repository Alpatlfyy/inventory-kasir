import 'package:flutter/material.dart';
import '../widgets/transaction_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selamat pagi, Julian',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.black45,
                  letterSpacing: 0.5,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'Hari ini luar biasa.',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 24),
          _buildMainCard(context),
          const SizedBox(height: 16),
          _buildTotalTransaksiCard(context),
          const SizedBox(height: 16),
          _buildPenjualanCard(context),
          const SizedBox(height: 16),
          _buildStokRendahCard(context),
          const SizedBox(height: 16),
          _buildLoyalitasCard(context),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaksi Terakhir',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Lihat Semua',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: const Color(0xFF0F6E31),
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildMainCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4EB),
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Siap melayani\npelanggan baru?',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 22,
                  height: 1.2,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'Mulai transaksi baru untuk\nmemberikan pengalaman terbaik\nbagi tamu kita.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0B6A26),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 0,
            ),
            icon: const Icon(Icons.shopping_cart_outlined, size: 18),
            label: Text(
              'Mulai Transaksi Baru',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalTransaksiCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFFDFEFD7),
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.receipt_long_outlined, color: Color(0xFF0F6E31), size: 24),
          const SizedBox(height: 16),
          Text(
            'Total Transaksi',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            '128',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.trending_up, color: Color(0xFF0F6E31), size: 16),
              const SizedBox(width: 4),
              Text(
                '+12% dari kemarin',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: const Color(0xFF0F6E31),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPenjualanCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.payments_outlined, color: Color(0xFF0F6E31), size: 24),
          const SizedBox(height: 16),
          Text(
            'Penjualan Hari Ini',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            '\$4,280.50',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0B6A26)),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '70% dari target harian',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.black45,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildStokRendahCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF7C3),
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.inventory_2_outlined, color: Colors.black54, size: 24),
          const SizedBox(height: 16),
          Text(
            'Peringatan Stok Rendah',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            '04',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Hampir habis untuk: Matcha, Madu',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoyalitasCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFFEBEBEB),
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.stars_rounded, color: Colors.black54, size: 24),
          const SizedBox(height: 16),
          Text(
            'Check-in Loyalitas',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            '52',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SizedBox(
                width: 60,
                height: 24,
                child: Stack(
                  children: [
                    const Positioned(
                      left: 0,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue,
                        backgroundImage: NetworkImage('https://ui-avatars.com/api/?name=A&background=random'),
                      ),
                    ),
                    const Positioned(
                      left: 16,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        backgroundImage: NetworkImage('https://ui-avatars.com/api/?name=B&background=random'),
                      ),
                    ),
                    const Positioned(
                      left: 32,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.green,
                        backgroundImage: NetworkImage('https://ui-avatars.com/api/?name=C&background=random'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '+20',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.black87,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
