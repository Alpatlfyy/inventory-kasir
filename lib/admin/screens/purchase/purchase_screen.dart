import 'package:flutter/material.dart';
import 'package:inventoryy/admin/appsidebar/sidebar.dart';
import 'widgets/incoming_goods_card.dart';
import 'widgets/purchase_order_item.dart';
import 'widgets/procurement_stat_card.dart';

class PurchaseScreen extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[50],
      // 1. Integrasi Sidebar
      drawer: const AppSidebar(), 
      appBar: _buildAppBar(context), 
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero Header ───────────────────────────────────────
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Manajemen Pembelian',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Kelola stok masuk dan pesanan pengadaan\ndari satu tempat.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Buat Pesanan Baru',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4169E1),
                        elevation: 6,
                        shadowColor: const Color(0xFF4169E1).withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Barang Masuk ──────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.inbox_outlined,
                        color: Color(0xFF4169E1),
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Barang Masuk',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4169E1).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'UPDATE: HARI INI',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4169E1),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const IncomingGoodsCard(
                    iconUrl: 'https://images.unsplash.com/photo-1447933601403-0c6688de566e?auto=format&fit=crop&q=80&w=200',
                    iconBgColor: Color(0xFFE8EEFF),
                    name: 'Biji Kopi Arabika 1kg',
                    vendor: 'Java Highlands',
                    quantity: '48',
                    unit: 'Unit',
                    receivedDate: '24 OKT',
                  ),
                  const IncomingGoodsCard(
                    iconUrl: 'https://images.unsplash.com/photo-1550583724-b2692b85b150?auto=format&fit=crop&q=80&w=200',
                    iconBgColor: Color(0xFFE8EEFF),
                    name: 'Susu Oat (Oat Milk)',
                    vendor: 'Farm Fresh Co.',
                    quantity: '120',
                    unit: 'Liter',
                    receivedDate: '23 OKT',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Pesanan Pembelian ─────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.receipt_long_outlined, color: Color(0xFF4169E1), size: 22),
                      SizedBox(width: 8),
                      Text(
                        'Pesanan Pembelian',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'MENUNGGU KONFIRMASI',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey[500], letterSpacing: 0.8),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2)),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const PurchaseOrderItem(
                            poNumber: 'PO-#99201',
                            description: 'Gula Cair (50kg)',
                            date: '25 Okt',
                          ),
                          Divider(height: 1, color: Colors.grey[100]),
                          const PurchaseOrderItem(
                            poNumber: 'PO-#99185',
                            description: 'Mesin Giling Baru',
                            date: '24 Okt',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Statistik Pengadaan ───────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STATISTIK PENGADAAN',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey[500], letterSpacing: 0.8),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      ProcurementStatCard(
                        value: 'Rp 12.5M',
                        label: 'BULAN INI',
                        backgroundColor: Color(0xFFE8EEFF),
                        textColor: Color(0xFF4169E1),
                      ),
                      SizedBox(width: 12),
                      ProcurementStatCard(
                        value: '14 PO',
                        label: 'SEDANG DIPROSES',
                        backgroundColor: Color(0xFFFFEEE8),
                        textColor: Color(0xFFFF6B35),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Logistic Banner ───────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Image.network(
                      'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?auto=format&fit=crop&q=80&w=800',
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Text(
                        'Pusat logistik kami beroperasi 24/7 untuk\nmemastikan kelancaran stok Anda.',
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
      titleSpacing: 0,
      title: Row(
        children: const [
          Text(
            'POS',
            style: TextStyle(color: Color(0xFF4169E1), fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            'Architect',
            style: TextStyle(color: Color(0xFF1A1A2E), fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&q=80&w=400',
            ),
          ),
        ),
      ],
    );
  }
}