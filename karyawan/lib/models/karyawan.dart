//class models

class Karyawan {
  final String nama;
  final int umur;
  final Alamat alamat;
  final List<String> hobi;

  Karyawan(
      {required this.nama,
      required this.umur,
      required this.alamat,
      required this.hobi});
}

class Alamat {
  final String jalan;
  final String kota;
  final String provinsi;

  Alamat({required this.jalan, required this.kota, required this.provinsi});
}
