import 'dart:async'; // Import untuk penggunaan async dan await

// Kelas MenuItem untuk merepresentasikan item di menu
class MenuItem {
  String name;
  double price;

  MenuItem(this.name, this.price);
}

// Kelas Order untuk menyimpan data pemesanan
class Order {
  List<Map<String, dynamic>> items = [];

  // Fungsi untuk menambah item ke pesanan
  void addItem(MenuItem item, int quantity) {
    items.add({'item': item, 'quantity': quantity});
    print("${quantity}x ${item.name} berhasil ditambahkan ke pesanan.");
  }

  // Fungsi untuk menghitung total harga pesanan
  double calculateTotal() {
    double total = 0;
    for (var entry in items) {
      MenuItem item = entry['item'];
      int quantity = entry['quantity'];
      total += item.price * quantity;
    }
    return total;
  }
}

// Kelas Restaurant untuk mengelola warung cireng
class WarungBiru {
  List<MenuItem> menu;

  WarungBiru(this.menu);

  // Fungsi untuk menampilkan menu
  void showMenu() {
    print("Daftar Menu Warung Biru:");
    for (var item in menu) {
      print("${item.name} - Rp${item.price}");
    }
  }

  // Fungsi untuk memproses pesanan secara async
  Future<void> processOrder(Order order) async {
    print("Memproses pesanan...");
    await Future.delayed(Duration(seconds: 2)); // Simulasi waktu proses
    double total = order.calculateTotal();
    print("Pesanan selesai diproses. Total: Rp${total.toStringAsFixed(2)}");
  }
}

void main() async {
  // Membuat beberapa item menu
  MenuItem ayamGoreng = MenuItem("Ayam Goreng", 5500);
  MenuItem ayamCrispy = MenuItem("Ayam Crispy", 5000);
  MenuItem sosisGoreng = MenuItem("Sosis Goreng", 2000);

  // Membuat warung Biru dan menambahkan menu
  WarungBiru warungBiru = WarungBiru([ayamGoreng, ayamCrispy, sosisGoreng]);

  // Menampilkan menu
  warungBiru.showMenu();

  // Membuat pesanan
  Order order = Order();
  order.addItem(ayamGoreng, 5); // Pesan 3 ayamGoreng
  order.addItem(ayamCrispy, 3); // Pesan 2 ayamCrispy
  order.addItem(sosisGoreng, 4); // Pesan 4 sosisGoreng

  // Memproses pesanan
  await warungBiru.processOrder(order);
}
