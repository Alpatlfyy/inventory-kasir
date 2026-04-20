import 'package:flutter/material.dart';
import 'package:inventoryy/admin/appsidebar/sidebar.dart';

class SupplierListScreen extends StatefulWidget {

  @override
  State<SupplierListScreen> createState() => _SupplierListScreenState();
}

class _SupplierListScreenState extends State<SupplierListScreen> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
Widget build(BuildContext context) {
  return Scaffold(
    key: _scaffoldKey,
    backgroundColor: const Color(0xFFF8F9FB),
    drawer: const AppSidebar(), 
    appBar: _buildAppBar(context),
    body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildQuickStats(),
          _buildSearchAndFilter(),
          _buildPremiumSupplierCard(),
          _buildFeaturedSupplierCard(),
          _buildStandardSupplierCard('Paper Roll Specialist', 'Penyedia Kertas Thermal & Label', 'Andi Wijaya', '+62 811 2233 4455'),
          _buildStandardSupplierCard('Secure Payment Systems', 'Integrasi Keamanan & Gateway', 'Maria Ozawa', '+62 21 7890 5678'),
          _buildLoadMoreButton(),
          const SizedBox(height: 40),
        ],
      ),
    ),
  );
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
onTap: () => _scaffoldKey.currentState?.openDrawer(),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1565C0).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.grid_view_rounded, 
            color: Color(0xFF1565C0), 
            size: 20
          ),
        ),
      ),
    ),
    titleSpacing: 0,
    title: const Row(
      children: [
        Text('POS ', style: TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.bold, fontSize: 18)),
        Text('Architect', style: TextStyle(color: Color(0xFF1A1A2E), fontWeight: FontWeight.w500, fontSize: 18)),
      ],
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=80&h=80&fit=crop'),
        ),
      ),
    ],
  );
}

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MANAJEMEN INVENTARIS',
            style: TextStyle(color: Color(0xFF1565C0), fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 1.2),
          ),
          const SizedBox(height: 4),
          const Text(
            'Daftar Supplier',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF1A1A2E)),
          ),
          const SizedBox(height: 8),
          const Text(
            'Kelola mitra pemasok dan detail kontak operasional Anda.',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.storefront_outlined),
              label: const Text('Tambah Supplier Baru', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1565C0),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildStatRow(Icons.group_outlined, 'Total Supplier', '24 Mitra', const Color(0xFF1565C0)),
          const SizedBox(height: 12),
          _buildStatRow(Icons.local_shipping_outlined, 'Pengiriman Aktif', '12 Jadwal', const Color(0xFF1565C0)),
          const SizedBox(height: 12),
          _buildStatRow(Icons.account_balance_wallet_outlined, 'Tagihan Pending', 'Rp 4.2M', const Color(0xFFE65100), isAlert: true),
        ],
      ),
    );
  }

  Widget _buildStatRow(IconData icon, String label, String value, Color color, {bool isAlert = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF0F0F0)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500)),
              Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isAlert ? color : const Color(0xFF1A1A2E))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari nama perusahaan atau kontak...',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFF2F4F7),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildFilterChip(Icons.category_outlined, 'Kategori'),
              const SizedBox(width: 8),
              _buildFilterChip(Icons.sort_rounded, 'Terbaru'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFF0F0F0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: const Color(0xFF1A1A2E)),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumSupplierCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF0F0F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(radius: 24, backgroundColor: Color(0xFF1A1A2E), child: Icon(Icons.language, color: Colors.cyanAccent)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFFE3F2FD), borderRadius: BorderRadius.circular(8)),
                child: const Text('PREMIUM', style: TextStyle(color: Color(0xFF1565C0), fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Global Logistik Nusantara', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Text('Penyedia Utama Perangkat Keras & Terminal POS', style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 24),
          _buildContactInfo('KONTAK PERSON', 'Budi Darmawan', 'Manager Operasional'),
          const SizedBox(height: 16),
          _buildContactInfo('EMAIL & TELEPON', 'budi.d@glonusa.id', '+62 21 5550 1234'),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('STATUS TERMINAL', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              const CircleAvatar(radius: 4, backgroundColor: Colors.blue),
              const SizedBox(width: 4),
              const Text('Online Aktif', style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          const Text('Terakhir update: 2 jam lalu', style: TextStyle(color: Colors.grey, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildContactInfo(String label, String title, String sub) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Text(sub, style: const TextStyle(color: Color(0xFF5E6366), fontSize: 13)),
      ],
    );
  }

  Widget _buildFeaturedSupplierCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF5C59E8),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.verified_user_outlined, color: Colors.white, size: 28),
          const SizedBox(height: 16),
          const Text('TechSupply Asia', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const Text('Distributor Komponen Elektronik', style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 20),
          const Divider(color: Colors.white24),
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=80&h=80&fit=crop'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('PIC', style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold)),
                  Text('Siska Amelia', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('Account Manager', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStandardSupplierCard(String name, String desc, String pic, String phone) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF0F0F0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFFF2F4F7), borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.inventory_2_outlined, color: Colors.grey),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.person_outline, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(pic, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
              const SizedBox(width: 16),
              const Icon(Icons.phone_outlined, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(phone, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            ],
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.more_vert, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadMoreButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text('Tampilkan Lebih Banyak Supplier', style: TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: Color(0xFF1565C0), shape: BoxShape.circle),
            child: const Icon(Icons.add, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  // Widget _buildBottomNav() {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     currentIndex: 2,
  //     selectedItemColor: const Color(0xFF1565C0),
  //     unselectedItemColor: Colors.grey[400],
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'BERANDA'),
  //       BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'ECOMMERCE'),
  //       BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: 'PELANGGAN'),
  //       BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'LAINNYA'),
  //     ],
  //   );
  // }
}