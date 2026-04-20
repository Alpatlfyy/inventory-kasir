import 'package:flutter/material.dart';
import 'package:inventoryy/admin/appsidebar/sidebar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isCloudSyncEnabled = true;
  bool _isDarkModeEnabled = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
Widget build(BuildContext context) {
  return Scaffold(
    key: _scaffoldKey,drawer: const AppSidebar(), 
    backgroundColor: const Color(0xFFF8F9FB),
    appBar: _buildAppBar(context),
    body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildNavigationMenu(),
          _buildUserListSection(),
          _buildRoleManagementSection(),
          _buildGeneralSettingsSection(),
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
      child: InkWell(
        onTap: () => _scaffoldKey.currentState?.openDrawer(),
        borderRadius: BorderRadius.circular(8),
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
          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=80&h=80&fit=crop'),
        ),
      ),
    ],
  );
}

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pengaturan Sistem',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF1A1A2E)),
          ),
          SizedBox(height: 8),
          Text(
            'Kelola konfigurasi platform, manajemen pengguna, dan hak akses terminal Anda.',
            style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationMenu() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          _buildMenuTile(Icons.person_outline, 'Manajemen Pengguna', isSelected: true),
          _buildMenuTile(Icons.shield_outlined, 'Peran & Izin'),
          _buildMenuTile(Icons.settings_outlined, 'Preferensi Sistem'),
          _buildMenuTile(Icons.receipt_long_outlined, 'Konfigurasi Struk'),
          _buildMenuTile(Icons.notifications_none_rounded, 'Notifikasi'),
        ],
      ),
    );
  }

  Widget _buildMenuTile(IconData icon, String title, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE3F2FD) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? const Color(0xFF1565C0) : const Color(0xFF1A1A2E)),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? const Color(0xFF1565C0) : const Color(0xFF1A1A2E),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        trailing: isSelected ? null : const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  Widget _buildUserListSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF0F0F0)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Daftar Pengguna', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Kelola staf yang memiliki akses', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_add_alt_1, size: 16),
                label: const Text('Tambah Staf', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildUserItem('Budi Santoso', 'budi.s@posarchitect.id', 'ADMIN'),
          _buildUserItem('Siti Aminah', 'siti.a@posarchitect.id', 'KASIR'),
          _buildUserItem('Andi Wijaya', 'andi.w@posarchitect.id', 'INVENTORY'),
        ],
      ),
    );
  }

  Widget _buildUserItem(String name, String email, String role) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          const CircleAvatar(backgroundColor: Color(0xFFF2F4F7), child: Icon(Icons.person, color: Colors.grey)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(email, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFFE3F2FD), borderRadius: BorderRadius.circular(6)),
            child: Text(role, style: const TextStyle(color: Color(0xFF1565C0), fontSize: 10, fontWeight: FontWeight.bold)),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildRoleManagementSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Manajemen Peran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const Text('Tentukan tingkat akses untuk setiap kategori staf', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 16),
          _buildRoleCard(Icons.admin_panel_settings, 'Administrator', 'Akses penuh ke semua fitur, laporan keuangan, dan pengaturan sistem.', ['Edit Harga', 'Laporan Laba']),
          _buildRoleCard(Icons.point_of_sale, 'Kasir', 'Akses terbatas hanya untuk transaksi penjualan dan cetak struk.', ['Proses Bayar', 'Retur Dasar']),
        ],
      ),
    );
  }

  Widget _buildRoleCard(IconData icon, String title, String desc, List<String> tags) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF2F4F7), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF1565C0)),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 8),
          Text(desc, style: const TextStyle(color: Color(0xFF5E6366), fontSize: 13, height: 1.4)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              ...tags.map((tag) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Text(tag, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
              )),
              TextButton(onPressed: () {}, child: const Text('+ Lainnya', style: TextStyle(fontSize: 11))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralSettingsSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pengaturan Umum', 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1A1A2E))
          ),
          const SizedBox(height: 16),
          
          // Implementasi Mata Uang Default
          _buildSettingTile(
            icon: Icons.payments_outlined,
            title: 'Mata Uang Default',
            sub: 'Gunakan Rupiah (IDR) untuk semua transaksi.',
            trailing: const Text(
              'IDR\n(Rp)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1565C0), 
                fontWeight: FontWeight.bold, 
                fontSize: 13,
                height: 1.2
              ),
            ),
          ),
          
          const SizedBox(height: 8),
          
          _buildSettingTile(
            icon: Icons.cloud_sync_outlined,
            title: 'Auto-Sync Cloud',
            sub: 'Sinkronisasi data otomatis setiap 5 menit.',
            trailing: Switch(
              value: _isCloudSyncEnabled,
              onChanged: (val) => setState(() => _isCloudSyncEnabled = val),
              activeColor: const Color(0xFF1565C0),
            ),
          ),
          
          const SizedBox(height: 8),
          
          _buildSettingTile(
            icon: Icons.dark_mode_outlined,
            title: 'Mode Gelap (Dark Mode)',
            sub: 'Sesuaikan tampilan dengan pencahayaan sekitar.',
            trailing: Switch(
              value: _isDarkModeEnabled,
              onChanged: (val) => setState(() => _isDarkModeEnabled = val),
              activeColor: const Color(0xFF1565C0),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi pembantu terintegrasi untuk menangani berbagai jenis trailing widget
  Widget _buildSettingTile({
    required IconData icon, 
    required String title, 
    required String sub, 
    required Widget trailing
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF1565C0).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: const Color(0xFF1565C0), size: 22),
      ),
      title: Text(
        title, 
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1A1A2E))
      ),
      subtitle: Text(
        sub, 
        style: const TextStyle(fontSize: 12, color: Colors.grey, height: 1.3)
      ),
      trailing: Container(
        constraints: const BoxConstraints(minWidth: 50),
        child: trailing,
      ),
    );
  }

  // Widget _buildBottomNav() {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     currentIndex: 3,
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