import 'produk.dart';

mixin DiskonMixin on Produk {
  double persenPromo = 0;

  double get hargaPromo => harga - (harga * persenPromo / 100);
}

class ProdukPromo extends Produk with DiskonMixin {
  ProdukPromo(
    super.kode,
    super.nama,
    super.kategori,
    super.harga,
    super.stok, {
    double persenPromo = 0,
  }) {
    this.persenPromo = persenPromo;
  }

  ProdukPromo.baru(
    String kode,
    String nama,
    String kategori,
    double harga, {
    double persenPromo = 0,
  }) : this(kode, nama, kategori, harga, 0, persenPromo: persenPromo);

  ProdukPromo.restok(
    String kode,
    String nama,
    String kategori,
    double harga,
    int stokAwal, {
    double persenPromo = 0,
  }) : this(kode, nama, kategori, harga, stokAwal, persenPromo: persenPromo);

  @override
  double hitungPajak() => hargaPromo * 0.10;
}