class UrunModel {
  final String baslik;
  final int fiyat;
  final String uid;
  final String resimYolu;
  final int indirimOrani;
  UrunModel(
      {required this.baslik,
      required this.fiyat,
      required this.uid,
      required this.resimYolu,
      required this.indirimOrani});
  factory UrunModel.fromFirestore(Map map, String uid) {
    return UrunModel(
        baslik: map["baslik"],
        fiyat: map["fiyat"],
        uid: uid,
        resimYolu: map["resimUrl"],
        indirimOrani: map["indirimOrani"]);
  }
}
