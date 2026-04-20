import 'package:flutter/material.dart';
import 'package:inventoryy/admin/appsidebar/sidebar.dart';

class EmployeeManagementScreen extends StatefulWidget {

  @override
  State<EmployeeManagementScreen> createState() => _EmployeeManagementScreenState();
}

class _EmployeeManagementScreenState extends State<EmployeeManagementScreen> {
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
Widget build(BuildContext context) {
  return Scaffold(
    key: _scaffoldKey,
    backgroundColor: const Color(0xFFF8F9FB),
    drawer: const AppSidebar(), 
    appBar: _buildAppBar(context),
    body: Stack(
      children: [
        ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _buildHeaderSection(),
            _buildEmployeeList(),
            _buildTeamSummaryCard(),
            const SizedBox(height: 100),
          ],
        ),
        Positioned(
          top: 130,
          right: 0,
          child: _buildAddEmployeeButton(),
        ),
      ],
    ),
  );
}

  // Tambahkan parameter BuildContext context
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false, // Memastikan title tetap di kiri
    leading: IconButton(
      // 2. TRIGGER UNTUK MEMBUKA SIDEBAR
      icon: const Icon(Icons.grid_view_rounded, color: Color(0xFF1565C0)),
      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
    ),
    titleSpacing: 0, // Mengurangi jarak antara leading icon dan title
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
          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=80'),
        ),
      ),
    ],
  );
}

  Widget _buildHeaderSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ADMINISTRASI SISTEM', 
            style: TextStyle(color: Color(0xFF1565C0), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
          const SizedBox(height: 8),
          const Text('Manajemen Pegawai', 
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF1A1A2E))),
          const SizedBox(height: 8),
          const Text('Kelola akses, posisi, dan informasi kontak seluruh tim operasional Anda dalam satu tempat.',
            style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.4)),
          const SizedBox(height: 24),
          // Search Bar
          Container(
            height: 48,
            margin: const EdgeInsets.only(right: 120), // Memberi ruang untuk button sticky
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: 'Cari nama atau posisi...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddEmployeeButton() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0D47A1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _scaffoldKey.currentState?.openDrawer(),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.person_add_alt_1, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text('Tambah\nPegawai', 
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold, height: 1.1)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmployeeList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          _buildEmployeeCard(
            'Sarah Johnson', 'Head of Operations', 'SUPERVISOR', 
            const Color(0xFFBF360C), 'sarah.j@posarch.com', '+62 812-3456-7890', 
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150'
          ),
          _buildEmployeeCard(
            'David Chen', 'System Administrator', 'ADMIN', 
            const Color(0xFF3949AB), 'david.admin@posarch.com', '+62 811-9876-5432', 
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150'
          ),
          _buildEmployeeCard(
            'Amira Putri', 'Senior Cashier - Branch A', 'KASIR', 
            const Color(0xFF3949AB), 'amira.p@posarch.com', '+62 815-4433-2211', 
            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150'
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeCard(String name, String pos, String role, Color roleColor, String email, String phone, String img) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(img)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: roleColor, borderRadius: BorderRadius.circular(8)),
                          child: Text(role, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Text(pos, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 32, color: Color(0xFFF0F0F0)),
          Row(
            children: [
              const Icon(Icons.email_outlined, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(email, style: const TextStyle(fontSize: 13, color: Color(0xFF1A1A2E))),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.phone_outlined, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(phone, style: const TextStyle(fontSize: 13, color: Color(0xFF1A1A2E))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSummaryCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF2962FF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ringkasan Tim', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Anda memiliki total 24 pegawai aktif bulan ini. Pertumbuhan tim meningkat 15% dari kuartal lalu.',
            style: TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildSummaryStat('12', 'ADMIN/SUPER'),
              const SizedBox(width: 32),
              _buildSummaryStat('38', 'KASIR/STAFF'),
              const Spacer(),
              const CircleAvatar(
                backgroundColor: Color(0xFF0D47A1),
                child: Icon(Icons.add, color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.trending_up, color: Colors.white, size: 18),
                SizedBox(width: 8),
                Text('EFISIENSI TIM +12.4%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryStat(String val, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(val, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 9, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Widget _buildBottomNav() {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     currentIndex: 2, // Sesuai gambar: Aktif di menu PELANGGAN
  //     selectedItemColor: const Color(0xFF1565C0),
  //     unselectedItemColor: Colors.grey,
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'BERANDA'),
  //       BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'ECOMMERCE'),
  //       BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: 'PELANGGAN'),
  //       BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'LAINNYA'),
  //     ],
  //   );
  // }
}