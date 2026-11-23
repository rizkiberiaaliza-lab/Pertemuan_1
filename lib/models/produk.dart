abstract class Produk {
  final String kode;
  String nama;
  String kategori;
  double _harga;
  int _stok;
  bool tersedia;

  Produk(
      this.kode,
      this.nama,
      this.kategori,
      double harga,
      int stok,
      )   : _harga = harga,
        _stok = stok,
        tersedia = stok > 0;

  // Constructor produk baru (stok awal 0)
  Produk.baru(
      this.kode,
      this.nama,
      this.kategori,
      double harga,
      )   : _harga = harga,
        _stok = 0,
        tersedia = false;

  // Constructor produk dengan stok awal
  Produk.restok(
      this.kode,
      this.nama,
      this.kategori,
      double harga,
      int stokAwal,
      )   : _harga = harga,
        _stok = stokAwal,
        tersedia = stokAwal > 0;

  // Getter harga
  double get harga => _harga;

  // Setter harga
  set harga(double nilai) {
    if (nilai < 0) {
      throw ArgumentError('Harga tidak boleh negatif');
    }
    _harga = nilai;
  }

  // Getter stok
  int get stok => _stok;

  // Setter stok
  set stok(int nilai) {
    if (nilai < 0) {
      throw ArgumentError('Stok tidak boleh negatif');
    }
    _stok = nilai;
    tersedia = _stok > 0;
  }

  String tampilkanInfo(String prefix) =>
      '$prefix$nama - Rp${harga.toStringAsFixed(0)}';

  void tambahStok(int jumlah, [String? catatan]) {
    stok += jumlah;
    if (catatan != null) {
      print('Catatan restok: $catatan');
    }
  }

  void aturDiskon({required double persen, String? alasan}) {
    if (persen < 0 || persen > 100) {
      throw ArgumentError('Persen diskon harus antara 0 dan 100');
    }

    harga = harga - (harga * persen / 100);
    print(
      'Diskon $persen% diterapkan${alasan != null ? ' ($alasan)' : ''}',
    );
  }

  String cetakStruk({bool includeDiskon = false}) {
    final buffer = StringBuffer()
      ..writeln('$nama ($kategori)')
      ..writeln('Harga: Rp${harga.toStringAsFixed(0)}')
      ..writeln('Stok tersisa: $stok');

    return buffer.toString();
  }
}