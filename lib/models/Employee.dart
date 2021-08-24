// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.employee,
    this.total,
  });

  List<Employee> employee;
  int total;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    employee: List<Employee>.from(json["employee"].map((x) => Employee.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "employee": List<dynamic>.from(employee.map((x) => x.toJson())),
    "total": total,
  };
}

class Employee {
  Employee({
    this.id,
    this.maNv,
    this.hoTen,
    this.gioiTinh,
    this.ngaySinh,
    this.soCmnd,
    this.ngayCapCmnd,
    this.noiCapCmnd,
    this.diaChiThuongTru,
    this.diaChiLienHe,
    this.dienThoai,
    this.email,
    this.trinhDo,
    this.truongTotNghiep,
    this.namTotNghiep,
    this.ngayBatDauLam,
    this.ngayLamViecCuoi,
    this.chucDanh,
    this.phongbanId,
    this.bophanId,
    this.chungChi,
    this.hosoId,
    this.trangThai,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String maNv;
  String hoTen;
  bool gioiTinh;
  String ngaySinh;
  String soCmnd;
  String ngayCapCmnd;
  String noiCapCmnd;
  String diaChiThuongTru;
  String diaChiLienHe;
  String dienThoai;
  String email;
  String trinhDo;
  String truongTotNghiep;
  String namTotNghiep;
  String ngayBatDauLam;
  dynamic ngayLamViecCuoi;
  String chucDanh;
  int phongbanId;
  int bophanId;
  dynamic chungChi;
  String hosoId;
  bool trangThai;
  dynamic createdAt;
  dynamic updatedAt;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    maNv: json["ma_nv"],
    hoTen: json["ho_ten"],
    gioiTinh: json["gioi_tinh"],
    ngaySinh: json["ngay_sinh"],
    soCmnd: json["so_cmnd"],
    ngayCapCmnd: json["ngay_cap_cmnd"],
    noiCapCmnd: json["noi_cap_cmnd"],
    diaChiThuongTru: json["dia_chi_thuong_tru"],
    diaChiLienHe: json["dia_chi_lien_he"],
    dienThoai: json["dien_thoai"],
    email: json["email"],
    trinhDo: json["trinh_do"],
    truongTotNghiep: json["truong_tot_nghiep"],
    namTotNghiep: json["nam_tot_nghiep"],
    ngayBatDauLam: json["ngay_bat_dau_lam"],
    ngayLamViecCuoi: json["ngay_lam_viec_cuoi"],
    chucDanh: json["chuc_danh"],
    phongbanId: json["phongban_id"],
    bophanId: json["bophan_id"],
    chungChi: json["chung_chi"],
    hosoId: json["hoso_id"],
    trangThai: json["trang_thai"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ma_nv": maNv,
    "ho_ten": hoTen,
    "gioi_tinh": gioiTinh,
    "ngay_sinh": ngaySinh,
    "so_cmnd": soCmnd,
    "ngay_cap_cmnd": ngayCapCmnd,
    "noi_cap_cmnd": noiCapCmnd,
    "dia_chi_thuong_tru": diaChiThuongTru,
    "dia_chi_lien_he": diaChiLienHe,
    "dien_thoai": dienThoai,
    "email": email,
    "trinh_do": trinhDo,
    "truong_tot_nghiep": truongTotNghiep,
    "nam_tot_nghiep": namTotNghiep,
    "ngay_bat_dau_lam": ngayBatDauLam,
    "ngay_lam_viec_cuoi": ngayLamViecCuoi,
    "chuc_danh": chucDanh,
    "phongban_id": phongbanId,
    "bophan_id": bophanId,
    "chung_chi": chungChi,
    "hoso_id": hosoId,
    "trang_thai": trangThai,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
