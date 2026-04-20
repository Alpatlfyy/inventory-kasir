import 'package:flutter/material.dart';
import 'package:inventoryy/admin/screens/employee/employee_list_screen.dart';
import 'package:inventoryy/admin/screens/expense/expense_management_screen.dart';
import 'package:inventoryy/admin/screens/prouction/production_screen.dart';
import 'package:inventoryy/admin/screens/purchase/purchase_screen.dart';
import 'package:inventoryy/admin/screens/supplier/supplier_list_screen.dart';
import 'package:inventoryy/admin/screens/setting/setting_screen.dart';
import 'package:inventoryy/admin/screens/transaction/transaction_summary_screen';

class MoreTab extends StatelessWidget {
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _buildTitle(),
                  const SizedBox(height: 24),
                  _buildMenuGrid(context), // Tambahkan context
                  const SizedBox(height: 24),
                  _buildCloudSyncCard(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white, size: 16),
              ),
              const SizedBox(width: 8),
              Text(
                'Indigo Ledger',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              const Icon(Icons.notifications_none, color: Colors.blue),
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ADMINISTRATOR SUITE',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Menu Lainnya',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.blue[800],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Akses kontrol operasional dan pengaturan sistem\nsecara menyeluruh.',
          style: TextStyle(fontSize: 12, color: Colors.grey[600], height: 1.4),
        ),
      ],
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    // List menu items dengan route masing-masing
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': Icons.badge_outlined,
        'title': 'Pegawai',
        'subtitle': 'MANAJEMEN',
        'iconBg': const Color(0xFFE8EEFF),
        'iconColor': const Color(0xFF4A4A4A),
        'route': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EmployeeManagementScreen()),
        ),
      },
      {
        'icon': Icons.shopping_basket_outlined,
        'title': 'Pembelian',
        'subtitle': 'PENGADAAN',
        'iconBg': const Color(0xFFE8EEFF),
        'iconColor': const Color(0xFF4A4A4A),
        'route': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PurchaseScreen()),
        ),
      },
      {
        'icon': Icons.local_shipping_outlined,
        'title': 'Supplier',
        'subtitle': 'VENDOR',
        'iconBg': const Color(0xFFE8EEFF),
        'iconColor': const Color(0xFF4A4A4A),
        'route': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SupplierListScreen()),
        ),
      },
      {
        'icon': Icons.precision_manufacturing_outlined,
        'title': 'Produksi',
        'subtitle': 'OPERASIONAL',
        'iconBg': const Color(0xFFFFE8DD),
        'iconColor': const Color(0xFF4A4A4A),
        'route': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductionCenterScreen()),
        ),
      },
      {
        'icon': Icons.account_balance_wallet_outlined,
        'title': 'Pengeluaran',
        'subtitle': 'EXPENSE',
        'iconBg': const Color(0xFFE8EEFF),
        'iconColor': const Color(0xFF4A4A4A),
        'route': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ExpenseManagementScreen()),
        ),
      },
      {
        'icon': Icons.receipt_long_outlined,
        'title': 'Rekap Transaksi',
        'subtitle': 'KAS KASIR',
        'iconBg': const Color(0xFFE8EEFF),
        'iconColor': const Color(0xFF4A4A4A),
        'route': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TransactionSummaryScreen()),
        ),
      },
      {
        'icon': Icons.settings_outlined,
        'title': 'Pengaturan',
        'subtitle': 'KONFIGURASI',
        'iconBg': const Color(0xFFF0F0F0),
        'iconColor': const Color(0xFF4A4A4A),
        'route': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SettingsScreen()),
        ),
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return _buildMenuCard(item, context);
      },
    );
  }

  Widget _buildMenuCard(Map<String, dynamic> item, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: item['route'] != null
              ? () => item['route']()
              : null, // INI YANG PENTING - onTap memanggil route
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: item['iconBg'],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item['icon'], color: item['iconColor'], size: 24),
              ),
              const SizedBox(height: 16),
              Text(
                item['title'],
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item['subtitle'],
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloudSyncCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sinkronisasi Cloud',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Semua data transaksi dan inventaris Anda\nsedang dicadangkan secara real-time ke\nserver aman kami.',
            style: TextStyle(fontSize: 12, color: Colors.white70, height: 1.4),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'STATUS: ONLINE',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'V2.4.0',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.cloud_done_outlined,
              color: Colors.white.withOpacity(0.8),
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
