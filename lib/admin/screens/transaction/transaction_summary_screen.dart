import 'package:flutter/material.dart';
import 'package:inventoryy/admin/appsidebar/sidebar.dart';

class TransactionSummaryScreen extends StatefulWidget {
  const TransactionSummaryScreen({super.key});

  @override
  State<TransactionSummaryScreen> createState() => _TransactionSummaryScreenState();
}

class _DummyChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1565C0) // Menggunakan brand color Anda
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final path = Path();

    // Titik-titik data (disesuaikan agar mengisi lebar canvas)
    final List<Offset> points = [
      Offset(0, size.height * 0.7),
      Offset(size.width * 0.15, size.height * 0.65),
      Offset(size.width * 0.3, size.height * 0.75),
      Offset(size.width * 0.45, size.height * 0.5),
      Offset(size.width * 0.6, size.height * 0.6),
      Offset(size.width * 0.75, size.height * 0.25), // Puncak
      Offset(size.width * 0.88, size.height * 0.4),
      Offset(size.width, size.height * 0.35),
    ];

    path.moveTo(points[0].dx, points[0].dy);

    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];

      // Smooth Curve menggunakan Bezier
      path.cubicTo(
        p0.dx + (p1.dx - p0.dx) / 2, p0.dy,
        p0.dx + (p1.dx - p0.dx) / 2, p1.dy,
        p1.dx, p1.dy,
      );
    }

    // Efek Gradasi Isi (Fill)
    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1565C0).withOpacity(0.2),
          const Color(0xFF1565C0).withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);

    // Marker Titik Terakhir (Highlight)
    final dotPaint = Paint()
      ..color = const Color(0xFF1565C0)
      ..style = PaintingStyle.fill;
    
    final dotShadowPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(points.last, 6, dotShadowPaint);
    canvas.drawCircle(points.last, 3.5, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TransactionSummaryScreenState extends State<TransactionSummaryScreen> with SingleTickerProviderStateMixin {
  late TabController _timeTabController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _timeTabController = TabController(length: 3, vsync: this);
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    key: _scaffoldKey,
    backgroundColor: const Color(0xFFF8F9FB),
    drawer: AppSidebar(),
    appBar: _buildAppBar(context),
    body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildTimeFilter(),
          _buildMainSalesCard(),
          _buildSecondaryStats(),
          _buildSalesChart(),
          _buildPaymentMethodCard(),
          _buildBusinessInsight(),
          _buildRecentTransactions(),
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
    title: Row(
      children: const [
        Text('POS', style: TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.bold, fontSize: 18)),
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

  Widget _buildTimeFilter() {
    return Container(
      color: const Color(0xFFF8F9FB), 
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Container(
        height: 46,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFEEEFF2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TabBar(
          controller: _timeTabController,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent, 
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
          labelColor: const Color(0xFF1565C0),
          unselectedLabelColor: Colors.grey[600],
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          tabs: const [
            Tab(text: 'Harian'),
            Tab(text: 'Bulanan'),
            Tab(text: 'Tahunan'),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      // Ubah ke warna background body agar tidak terlihat ada potongan putih
      color: const Color(0xFFF8F9FB), 
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'RINGKASAN PERFORMA',
            style: TextStyle(
              color: Color(0xFF1565C0), 
              fontSize: 10, 
              fontWeight: FontWeight.w700, 
              letterSpacing: 1.2
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Rekap Transaksi',
            style: TextStyle(
              fontSize: 28, 
              fontWeight: FontWeight.w900, // Lebih tebal sesuai gambar
              color: Color(0xFF1A1A2E)
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainSalesCard() {
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
              const Text('TOTAL PENJUALAN', style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)),
              Icon(Icons.payments_outlined, color: const Color(0xFF1565C0).withOpacity(0.2), size: 40),
            ],
          ),
          const Text('Rp 142.580.000', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Color(0xFF1565C0))),
          const SizedBox(height: 12),
          Row(
            children: const [
              Icon(Icons.trending_up, color: Color(0xFF2E7D32), size: 16),
              SizedBox(width: 4),
              Text('+12.5% dari kemarin', style: TextStyle(color: Color(0xFF2E7D32), fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1565C0),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
              ),
              child: const Text('Unduh Laporan', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildStatTile('RATA-RATA ORDER', 'Rp 345.000', '412 Transaksi hari ini', const Color(0xFF1565C0)),
          const SizedBox(height: 12),
          _buildStatTile('PRODUK TERLARIS', 'Espresso Arabica', '86 Unit terjual', const Color(0xFFE65100)),
        ],
      ),
    );
  }

  Widget _buildStatTile(String label, String value, String sub, Color accent) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF0F0F0)),
      ),
      child: Row(
        children: [
          Container(width: 4, height: 40, decoration: BoxDecoration(color: accent, borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
              Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              Text(sub, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSalesChart() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), // Lebih bulat agar serasi dengan card lain
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tren Penjualan\nMingguan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Perbandingan performa 7 hari terakhir',
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F4F7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '7 Hari Terakhir',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey[800]),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 140, // Sedikit lebih tinggi untuk visibilitas
            width: double.infinity,
            child: CustomPaint(painter: _DummyChartPainter()),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['SEN', 'SEL', 'RAB', 'KAM', 'JUM', 'SAB', 'MIN']
                .map(
                  (day) => Text(
                    day,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1565C0),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Metode Pembayaran', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildPaymentProgress('QRIS/E-Wallet', 0.65, '65%'),
          _buildPaymentProgress('Kartu Debit', 0.25, '25%'),
          _buildPaymentProgress('Tunai', 0.10, '10%'),
        ],
      ),
    );
  }

  Widget _buildPaymentProgress(String label, double val, String percent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
              Text(percent, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: val, backgroundColor: Colors.white.withOpacity(0.1), valueColor: const AlwaysStoppedAnimation(Colors.white), minHeight: 6),
        ],
      ),
    );
  }

  Widget _buildBusinessInsight() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFFFF7F0), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFFFE0D5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.analytics_outlined, color: Color(0xFFE65100)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Insight Bisnis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFFE65100))),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Color(0xFF1A1A2E), fontSize: 13, height: 1.4),
                    children: const [
                      TextSpan(text: 'Volume transaksi meningkat tajam antara pukul '),
                      TextSpan(text: '16:00 - 19:00', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1565C0))),
                      TextSpan(text: '. Pertimbangkan penambahan staf pada jam tersebut.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTransactions() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Transaksi Terbaru', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              TextButton(onPressed: () {}, child: const Text('Lihat Semua →', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
            ],
          ),
          const Divider(),
          _buildTransactionRow('#TX-90210', '14:20 WIB', 'Andi Wijaya'),
          _buildTransactionRow('#TX-90211', '14:15 WIB', 'Siti Aminah'),
          _buildTransactionRow('#TX-90212', '13:58 WIB', 'Budi Santoso'),
        ],
      ),
    );
  }

  Widget _buildTransactionRow(String id, String time, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(id, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }

  // Widget _buildBottomNav() {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     currentIndex: 2, // Fokus pada tab Pelanggan/Transaksi
  //     selectedItemColor: const Color(0xFF1565C0),
  //     unselectedItemColor: Colors.grey[400],
  //     selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'BERANDA'),
  //       BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'ECOMMERCE'),
  //       BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: 'PELANGGAN'),
  //       BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'LAINNYA'),
  //     ],
  //   );
  // }
}

// Painter sederhana untuk simulasi chart garis
class SimpleChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFF1565C0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    var path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.8, size.width * 0.4, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.2, size.width, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}