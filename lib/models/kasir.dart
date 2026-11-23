import 'keranjang.dart';
import 'transaksi.dart';

class Kasir {
  final String nama;

  Kasir(this.nama);

  // Keranjang hanya dipinjam lewat parameter
  Transaksi layani(Keranjang keranjang) {
    return keranjang.checkout();
  }
}