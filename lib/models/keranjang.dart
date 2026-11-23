import 'produk.dart';
import 'transaksi.dart';

class Keranjang {
  final List<Produk> isi = [];
  final Map<String, int> jumlahPerProduk = {};

  void tambah(Produk produk, {int jumlah = 1}) {
    if (!jumlahPerProduk.containsKey(produk.kode)) {
      isi.add(produk);
      jumlahPerProduk[produk.kode] = jumlah;
    } else {
      jumlahPerProduk[produk.kode] =
          jumlahPerProduk[produk.kode]! + jumlah;
    }
  }

  void kosongkan() {
    isi.clear(); // Produk TIDAK ikut terhapus dari katalog
    jumlahPerProduk.clear();
  }

  Transaksi checkout() {
    final transaksi =
    Transaksi('TRX${DateTime.now().millisecondsSinceEpoch}');

    for (final produk in isi) {
      transaksi.tambahItem(
        produk,
        jumlahPerProduk[produk.kode] ?? 0,
      );
    }

    kosongkan();
    return transaksi;
  }
}