class Decision {
  Decision({
    this.id,
    this.nhansuId,
    this.maQd,
    this.loaiquyetdinhId,
    this.ngayKy,
    this.canCu,
    this.noiNhan,
    this.tongThuNhapCu,
    this.tongThuNhapMoi,
    this.luongCoBanMoi,
    this.luongTroCapMoi,
    this.luongHieuQuaMoi,
    this.noiDungKyLuat,
    this.batDauKl,
    this.ketThucKl,
    this.lyDo,
    this.chucVuCu,
    this.chucVuMoi,
    this.boPhanCu,
    this.boPhanMoi,
    this.chucVuHienTai,
    this.trangThai,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int nhansuId;
  String maQd;
  int loaiquyetdinhId;
  String ngayKy;
  String canCu;
  String noiNhan;
  dynamic tongThuNhapCu;
  dynamic tongThuNhapMoi;
  dynamic luongCoBanMoi;
  dynamic luongTroCapMoi;
  dynamic luongHieuQuaMoi;
  dynamic noiDungKyLuat;
  dynamic batDauKl;
  dynamic ketThucKl;
  dynamic lyDo;
  dynamic chucVuCu;
  dynamic chucVuMoi;
  dynamic boPhanCu;
  dynamic boPhanMoi;
  dynamic chucVuHienTai;
  int trangThai;
  dynamic createdAt;
  dynamic updatedAt;

  factory Decision.fromJson(Map<String, dynamic> json) => Decision(
    id: json["id"],
    nhansuId: json["nhansu_id"],
    maQd: json["ma_qd"],
    loaiquyetdinhId: json["loaiquyetdinh_id"],
    ngayKy: json["ngay_ky"],
    canCu: json["can_cu"],
    noiNhan: json["noi_nhan"],
    tongThuNhapCu: json["tong_thu_nhap_cu"],
    tongThuNhapMoi: json["tong_thu_nhap_moi"],
    luongCoBanMoi: json["luong_co_ban_moi"],
    luongTroCapMoi: json["luong_tro_cap_moi"],
    luongHieuQuaMoi: json["luong_hieu_qua_moi"],
    noiDungKyLuat: json["noi_dung_ky_luat"],
    batDauKl: json["bat_dau_kl"],
    ketThucKl: json["ket_thuc_kl"],
    lyDo: json["ly_do"],
    chucVuCu: json["chuc_vu_cu"],
    chucVuMoi: json["chuc_vu_moi"],
    boPhanCu: json["bo_phan_cu"],
    boPhanMoi: json["bo_phan_moi"],
    chucVuHienTai: json["chuc_vu_hien_tai"],
    trangThai: json["trang_thai"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nhansu_id": nhansuId,
    "ma_qd": maQd,
    "loaiquyetdinh_id": loaiquyetdinhId,
    "ngay_ky": ngayKy,
    "can_cu": canCu,
    "noi_nhan": noiNhan,
    "tong_thu_nhap_cu": tongThuNhapCu,
    "tong_thu_nhap_moi": tongThuNhapMoi,
    "luong_co_ban_moi": luongCoBanMoi,
    "luong_tro_cap_moi": luongTroCapMoi,
    "luong_hieu_qua_moi": luongHieuQuaMoi,
    "noi_dung_ky_luat": noiDungKyLuat,
    "bat_dau_kl": batDauKl,
    "ket_thuc_kl": ketThucKl,
    "ly_do": lyDo,
    "chuc_vu_cu": chucVuCu,
    "chuc_vu_moi": chucVuMoi,
    "bo_phan_cu": boPhanCu,
    "bo_phan_moi": boPhanMoi,
    "chuc_vu_hien_tai": chucVuHienTai,
    "trang_thai": trangThai,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}



class TypeDecision {
  TypeDecision({
    this.id,
    this.ten,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String ten;
  dynamic createdAt;
  dynamic updatedAt;

  factory TypeDecision.fromJson(Map<String, dynamic> json) => TypeDecision(
    id: json["id"],
    ten: json["ten"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ten": ten,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
