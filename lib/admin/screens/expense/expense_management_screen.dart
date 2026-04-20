import 'package:flutter/material.dart';
import 'package:inventoryy/admin/appsidebar/sidebar.dart';

class ExpenseManagementScreen extends StatefulWidget {
  const ExpenseManagementScreen({super.key});

  @override
  State<ExpenseManagementScreen> createState() => _ExpenseManagementScreenState();
}

class _ExpenseManagementScreenState extends State<ExpenseManagementScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  // Data dummy untuk transaksi pengeluaran
  final List<Map<String, dynamic>> transactions = [
    {
      'title': 'Restock Bahan Baku',
      'category': 'OPERASIONAL',
      'icon': Icons.inventory_2_outlined,
      'iconColor': Color(0xFF4169E1),
      'date': '24 Okt 2023, 14:20',
      'amount': 'Rp 12.400.000',
    },
    {
      'title': 'Tagihan Listrik & Air',
      'category': 'UTILITAS',
      'icon': Icons.bolt_outlined,
      'iconColor': Color(0xFFFF6B35),
      'date': '22 Okt 2023, 09:15',
      'amount': 'Rp 3.250.000',
    },
    {
      'title': 'Iklan Media Sosial',
      'category': 'PEMASARAN',
      'icon': Icons.campaign_outlined,
      'iconColor': Color(0xFF00BFA5),
      'date': '20 Okt 2023, 16:45',
      'amount': 'Rp 5.000.000',
    },
    {
      'title': 'Servis AC & Perbaikan',
      'category': 'PEMELIHARAAN',
      'icon': Icons.build_outlined,
      'iconColor': Colors.grey,
      'date': '18 Okt 2023, 11:30',
      'amount': 'Rp 850.000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[50],
      drawer: const AppSidebar(), 
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildTotalExpenseCard(),
            _buildTransactionSummaryBox(),
            _buildTransactionListHeader(),
            _buildTransactionList(),
            _buildViewAllButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
      // Jika Anda menggunakan bottomNav custom, pastikan tetap sinkron
      // bottomNavigationBar: _buildBottomNav(), 
    );
  }

  // Tambahkan parameter BuildContext context
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false, // Menjaga teks tetap di sebelah kiri
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => _scaffoldKey.currentState?.openDrawer(),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF4169E1).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.grid_view_rounded, 
              color: Color(0xFF4169E1), 
              size: 20
            ),
          ),
        ),
      ),
      titleSpacing: 0, // Mengurangi gap agar rapat dengan icon
      title: const Row(
        children: [
          Text('POS', style: TextStyle(color: Color(0xFF4169E1), fontWeight: FontWeight.bold, fontSize: 18)),
          Text('Architect', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 18)),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&q=80&w=400'),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MANAJEMEN PENGELUARAN',
            style: TextStyle(color: Color(0xFF4169E1), fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.5),
          ),
          SizedBox(height: 8),
          Text(
            'Laporan Keuangan',
            style: TextStyle(color: Colors.black87, fontSize: 28, fontWeight: FontWeight.bold, height: 1.2),
          ),
          SizedBox(height: 8),
          Text(
            'Pantau arus kas keluar dan kelola operasional bisnis Anda dengan presisi editorial.',
            style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.5),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add, size: 20),
              label: Text('Tambah Pengeluaran', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4169E1),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 0,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildTotalExpenseCard() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TOTAL PENGELUARAN BULAN INI',
            style: TextStyle(color: Colors.grey[500], fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5),
          ),
          SizedBox(height: 8),
          Text(
            'Rp 42.850.000',
            style: TextStyle(color: Color(0xFF4169E1), fontSize: 32, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Color(0xFFFFE0D5), borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Icon(Icons.trending_up, color: Color(0xFFFF6B35), size: 14),
                    SizedBox(width: 4),
                    Text('+12.5%', style: TextStyle(color: Color(0xFFFF6B35), fontSize: 11, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Text('dibandingkan bulan lalu', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionSummaryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF4169E1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
            child: Icon(Icons.receipt_long_outlined, color: Colors.white, size: 24),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('128', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              Text('Transaksi tercatat minggu ini', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionListHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Daftar Transaksi Terbaru', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
          Row(
            children: [
              Icon(Icons.tune, color: Colors.grey[600], size: 20),
              SizedBox(width: 16),
              Icon(Icons.search, color: Colors.grey[600], size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    return Column(
      children: transactions.map((tx) => _buildTransactionItem(tx)).toList(),
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> tx) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: tx['iconColor'].withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                child: Icon(tx['icon'], color: tx['iconColor'], size: 24),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tx['title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(tx['category'], style: TextStyle(color: Colors.grey[500], fontSize: 11, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tx['date'], style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              Text(tx['amount'], style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Colors.black87)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildViewAllButton() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Lihat Semua Riwayat',
          style: TextStyle(color: Color(0xFF4169E1), fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, -2))],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.grid_view_rounded, 'BERANDA', false),
              _buildNavItem(Icons.shopping_cart_outlined, 'ECOMMERCE', false),
              _buildNavItem(Icons.people_outline, 'PELANGGAN', true),
              _buildNavItem(Icons.more_horiz, 'LAINNYA', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? Color(0xFF4169E1) : Colors.grey[400], size: 24),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Color(0xFF4169E1) : Colors.grey[400],
            fontSize: 10,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}