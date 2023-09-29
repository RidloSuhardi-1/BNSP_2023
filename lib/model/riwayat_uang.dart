class RiwayatUang {
  int? id;
  String? tanggal;
  String? jenis;
  int? nominal;
  String? keterangan;

  RiwayatUang(
      {this.id, this.tanggal, this.jenis, this.nominal, this.keterangan});

  factory RiwayatUang.fromJson(Map<String, dynamic> json) {
    return RiwayatUang(
        id: json['id'],
        tanggal: json['tanggal'],
        jenis: json['jenis'],
        nominal: json['nominal'],
        keterangan: json['keterangan']);
  }

  Map<String, dynamic> toMap() {
    var map = {
      'tanggal': tanggal,
      'jenis': jenis,
      'nominal': nominal,
      'keterangan': keterangan
    };
    if (id != null) map['id'] = id;
    return map;
  }
}
