class ListContract {
  ListContract({
    this.id,
    this.nhansuId,
    this.maHd,
    this.ten,
    this.loaihopdongId,
    this.ngayKy,
    this.ngayCoHieuLuc,
    this.ngayHetHieuLuc,
    this.luongCanBan,
    this.luongTroCap,
    this.luongHieuQua,
    this.trangThai,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int nhansuId;
  String maHd;
  String ten;
  int loaihopdongId;
  String ngayKy;
  String ngayCoHieuLuc;
  String ngayHetHieuLuc;
  String luongCanBan;
  String luongTroCap;
  String luongHieuQua;
  bool trangThai;
  dynamic createdAt;
  dynamic updatedAt;

  factory ListContract.fromJson(Map<String, dynamic> json) => ListContract(
    id: json["id"],
    nhansuId: json["nhansu_id"],
    maHd: json["ma_hd"],
    ten: json["ten"],
    loaihopdongId: json["loaihopdong_id"],
    ngayKy: json["ngay_ky"],
    ngayCoHieuLuc: json["ngay_co_hieu_luc"],
    ngayHetHieuLuc: json["ngay_het_hieu_luc"],
    luongCanBan: json["luong_can_ban"],
    luongTroCap: json["luong_tro_cap"],
    luongHieuQua: json["luong_hieu_qua"],
    trangThai: json["trang_thai"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nhansu_id": nhansuId,
    "ma_hd": maHd,
    "ten": ten,
    "loaihopdong_id": loaihopdongId,
    "ngay_ky": ngayKy,
    "ngay_co_hieu_luc": ngayCoHieuLuc,
    "ngay_het_hieu_luc": ngayHetHieuLuc,
    "luong_can_ban": luongCanBan,
    "luong_tro_cap": luongTroCap,
    "luong_hieu_qua": luongHieuQua,
    "trang_thai": trangThai,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}