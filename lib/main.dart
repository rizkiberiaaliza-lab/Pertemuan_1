import 'models/models.dart';

void main() {
  // Membuat produk makanan
  final nasiGoreng = ProdukMakanan.restok(
    'P001',
    'Nasi Goreng',
    15000,
    10,
  );

  // Membuat produk minuman
  final esTehManis = ProdukMinuman.restok(
    'P002',
    'Es Teh Manis',
    5000,
    10,
    dingin: true,
  );

  // Membuat keranjang
  final keranjang = Keranjang();

  keranjang.tambah(nasiGoreng, jumlah: 2);
  keranjang.tambah(esTehManis, jumlah: 2);

  // Membuat kasir dan memproses transaksi
  final kasir = Kasir('Budi');
  final transaksi = kasir.layani(keranjang);

  print('Jumlah produk dalam keranjang: ${transaksi.items.length}');
  print('Total Harga: ${transaksi.totalHarga}');

  print(
    'Menu: ${nasiGoreng.nama} -> '
        'Rp${nasiGoreng.harga.toStringAsFixed(0)}',
  );

  print(
    'Menu: ${esTehManis.nama} -> '
        'Rp${esTehManis.harga.toStringAsFixed(0)}'
        '${esTehManis.dingin ? ' (dingin)' : ''}',
  );
}