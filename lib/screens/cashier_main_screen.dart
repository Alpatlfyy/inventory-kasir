import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_tab.dart';
import 'customer_tab.dart';
import 'purchase_tab.dart';
import 'produksi_tab.dart';
import 'supplier_tab.dart';
import 'ecommerce_unit_tab.dart';
import 'ecommerce_kategori_tab.dart';
import 'ecommerce_produk_tab.dart';
import 'ecommerce_pesanan_tab.dart';
import 'transaksi_tab.dart';

class CashierMainScreen extends StatefulWidget {
  const CashierMainScreen({super.key});

  @override
  State<CashierMainScreen> createState() => _CashierMainScreenState();
}

class _CashierMainScreenState extends State<CashierMainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  
  void _onNavTapped(int index) {
    if (index == 3) {
      // Tombol 'Lainnya' akan selalu membuka Laci / Drawer
      _scaffoldKey.currentState?.openDrawer();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  
  void _onMenuDrawerTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    if (_selectedIndex >= 3) {
      String titleText = 'Lainnya';
      if (_selectedIndex == 3) titleText = 'Pembelian';
      else if (_selectedIndex == 4) titleText = 'Produksi';
      else if (_selectedIndex == 5) titleText = 'Supplier';
      else if (_selectedIndex == 6) titleText = 'Kelola Unit';
      else if (_selectedIndex == 7) titleText = 'Kategori';
      else if (_selectedIndex == 8) titleText = 'Produk eCommerce';
      else if (_selectedIndex == 9) titleText = 'Pesanan Online';

      List<Widget> actions = [];
      if (_selectedIndex == 3) {
        actions = [
          IconButton(icon: const Icon(Icons.search, color: Colors.black54), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list, color: Colors.black54), onPressed: () {}),
        ];
      } else if (_selectedIndex == 5) {
        actions = [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Tambah Supplier'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A5826),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          )
        ];
      }

      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0F6E31)),
          onPressed: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
        ),
        title: Text(
          titleText,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
        actions: actions,
      );
    }

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF0F6E31)),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: const Text(
        'Organic Concierge',
        style: TextStyle(
          color: Color(0xFF0F6E31),
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: CircleAvatar(
            backgroundColor: Colors.teal[800],
            radius: 16,
            backgroundImage: const NetworkImage(
                'https://ui-avatars.com/api/?name=Julian&background=0D8ABC&color=fff'),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 2:
        return const CustomerTab();
      case 3:
        return const PurchaseTab();
      case 4:
        return const ProduksiTab();
      case 5:
        return const SupplierTab();
      case 6:
        return const EcommerceUnitTab();
      case 7:
        return const EcommerceKategoriTab();
      case 8:
        return const EcommerceProdukTab();
      case 9:
        return const EcommercePesananTab();
      case 1:
        return const TransaksiTab();
      case 0:
      default:
        return const HomeTab();
    }
  }

  Widget? _buildFloatingActionButton() {
    if (_selectedIndex == 2) {
      return Transform.translate(
        offset: const Offset(0, 32),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF0A5826),
          child: const Icon(Icons.person_add_alt_1, color: Colors.white),
        ),
      );
    } else if (_selectedIndex == 3) {
      return Transform.translate(
        offset: const Offset(0, 32),
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: const Color(0xFF0A5826),
          icon: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 20),
          label: const Text('BUAT PESANAN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
        ),
      );
    } else if (_selectedIndex == 4) {
      return Transform.translate(
        offset: const Offset(0, 32),
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: const Color(0xFF0A5826),
          icon: const Icon(Icons.add, color: Colors.white, size: 20),
          label: const Text('Tambah Data Produksi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(context),
      drawer: _selectedIndex >= 3 ? null : AppDrawer(onMenuSelected: _onMenuDrawerTapped),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
      extendBody: true,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onNavTapped: _onNavTapped,
      ),
    );
  }
}
