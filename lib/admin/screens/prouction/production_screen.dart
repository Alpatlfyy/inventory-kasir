import 'package:flutter/material.dart';
import 'package:inventoryy/admin/appsidebar/sidebar.dart';

class ProductionCenterScreen extends StatefulWidget {

  @override
  State<ProductionCenterScreen> createState() => _ProductionCenterScreenState();
}

class _ProductionCenterScreenState extends State<ProductionCenterScreen> {
  int _activeTab = 0;
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
          _buildTabNavigator(),
          if (_activeTab == 0) ...[
            _buildProductionCard(
              'Paket Premium Artisan',
              '#PRD-2023-089',
              '24 Okt 2023',
              '1,250',
              'Unit',
              'SELESAI',
              const Color(0xFFE8EAF6),
              const Color(0xFF3F51B5),
            ),
            _buildProductionCard(
              'Serum Konsentrat v2',
              '#PRD-2023-090',
              '25 Okt 2023',
              '500',
              'Ltr',
              'SEDANG BERJALAN',
              const Color(0xFFE65100),
              Colors.white,
              isFullBackground: true,
            ),
            _buildProductionCard(
              'Material Dasar Grade A',
              '#PRD-2023-091',
              '26 Okt 2023',
              '3,000',
              'Kg',
              'TERJADWAL',
              const Color(0xFFEEEEEE),
              Colors.black54,
            ),
            _buildRawMaterialStatus(),
            _buildWeeklySummary(),
          ] else 
            const Center(child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Text('Data Bahan Baku Terintegrasi'),
            )),
          const SizedBox(height: 40),
        ],
      ),
    ),
  );
}

// Tambahkan parameter BuildContext context
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false, // Branding tetap konsisten di kiri
    leading: IconButton(
      // 2. TRIGGER UNTUK MEMBUKA SIDEBAR
      icon: const Icon(Icons.grid_view_rounded, color: Color(0xFF1565C0)),
      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
    ),
    titleSpacing: 0, // Merapatkan teks dengan icon menu
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
          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=80&h=80&fit=crop'),
        ),
      ),
    ],
  );
}

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('MANAJEMEN OPERASIONAL', 
            style: TextStyle(color: Color(0xFF1565C0), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
          const SizedBox(height: 8),
          const Text('Pusat Produksi', 
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF1A1A2E))),
          const SizedBox(height: 8),
          const Text('Pantau alur kerja produksi dan ketersediaan bahan baku dalam satu dashboard terintegrasi.',
            style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.4)),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline, size: 20),
              label: const Text('Tambah Produksi', style: TextStyle(fontWeight: FontWeight.bold)),
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

  Widget _buildTabNavigator() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildTabItem(0, 'Aktivitas\nProduksi'),
          _buildTabItem(1, 'Data Bahan\nBaku'),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label) {
    bool isActive = _activeTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _activeTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isActive ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))] : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              color: isActive ? const Color(0xFF1565C0) : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductionCard(String title, String id, String date, String qty, String unit, String status, Color statusBg, Color statusText, {bool isFullBackground = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF0F0F0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50, height: 50,
                decoration: BoxDecoration(color: const Color(0xFF1A1A2E), borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.precision_manufacturing_outlined, color: Colors.cyanAccent, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: const Color(0xFFF2F4F7), borderRadius: BorderRadius.circular(8)),
                          child: Text(id, style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.calendar_today, size: 12, color: Color(0xFF1565C0)),
                        const SizedBox(width: 4),
                        Text(date, style: const TextStyle(fontSize: 11, color: Color(0xFF1565C0), fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('KUANTITAS', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(qty, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                      const SizedBox(width: 4),
                      Text(unit, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: isFullBackground ? BorderRadius.circular(30) : BorderRadius.circular(8),
                ),
                child: Text(status, style: TextStyle(color: statusText, fontWeight: FontWeight.w900, fontSize: 11)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRawMaterialStatus() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF2962FF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Status Bahan Baku', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              const Icon(Icons.inventory_2_outlined, color: Colors.white, size: 20),
            ],
          ),
          const SizedBox(height: 24),
          _buildMaterialProgress('Polimer K-40', 0.82, '82%'),
          const SizedBox(height: 20),
          _buildMaterialProgress('Esensial Konsentrat', 0.34, '34%'),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.white70, size: 14),
              const SizedBox(width: 8),
              const Expanded(child: Text('Segera lakukan pengadaan untuk Esensial Konsentrat', 
                style: TextStyle(color: Colors.white70, fontSize: 11))),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text('Lihat Inventaris', style: TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialProgress(String label, double value, String percent) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 13)),
            Text(percent, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: value,
          backgroundColor: Colors.white.withOpacity(0.2),
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          minHeight: 6,
          borderRadius: BorderRadius.circular(10),
        ),
      ],
    );
  }

  Widget _buildWeeklySummary() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('RINGKASAN MINGGUAN', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
          const SizedBox(height: 20),
          _buildSummaryItem(Icons.trending_up, 'Efisiensi Produksi', '+12.4%', const Color(0xFF1565C0)),
          const SizedBox(height: 16),
          _buildSummaryItem(Icons.timer_outlined, 'Waktu Henti', '1.2 Jam', const Color(0xFFE65100)),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(IconData icon, String label, String value, Color iconColor) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  // Widget _buildBottomNav() {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     currentIndex: 2,
  //     selectedItemColor: const Color(0xFF1565C0),
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'BERANDA'),
  //       BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'ECOMMERCE'),
  //       BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: 'PELANGGAN'),
  //       BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'LAINNYA'),
  //     ],
  //   );
  // }
}