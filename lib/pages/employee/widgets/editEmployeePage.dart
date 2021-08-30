import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Account.dart';
import 'package:flutter_web_dashboard/models/Employee.dart';
import 'package:flutter_web_dashboard/models/Roles.dart';


class EditEmployee extends StatefulWidget{
  Employee employee;
  EditEmployee({this.employee});
  @override
  _EditEmployeeState createState() => _EditEmployeeState(this.employee);
}

class _EditEmployeeState extends State<EditEmployee>{
  final Employee employee;
  _EditEmployeeState(this.employee);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController cfullname;
  TextEditingController csoCmnd;

  TextEditingController cadressConact;
  TextEditingController cphone ;
  TextEditingController cemail ;
  TextEditingController cstatus ;
  //Start add Level employee
  TextEditingController clevel;
  TextEditingController cgraduationYear ;

  TextEditingController cjobTitle ;
  int cderpartment ;
  int cpars;
  //End
  TextEditingController cbirthday ;
  TextEditingController cstartdate;
  TextEditingController cenddate ;

  bool cgender ;
  void editData()async {
    var data = {
      "ho_ten": cfullname.text,
      "ngay_sinh": cbirthday.text,
      "so_cmnd": csoCmnd.text,
      "gioi_tinh": true,
      "dia_chi_lien_he": cadressConact.text,
      "dien_thoai": cphone.text,
      "email": cemail.text,
      "trinh_do":clevel.text,
      "nam_tot_nghiep": cgraduationYear.text,
      "chuc_danh": cjobTitle.text,
      "ngay_bat_dau_lam": cstartdate.text,
      "ngay_lam_viec_cuoi": cenddate.text,
      "phongban_id":this.cderpartment,
      "bophan_id":this.cpars,
      "trang_thai":true,
    };
    await CallApi().postData(data, 'edit-role/${widget.employee.id}');
  }

  @override
  void initState(){
    super.initState();

    cfullname=TextEditingController(text: widget.employee.hoTen);
    cbirthday=TextEditingController(text: widget.employee.ngaySinh);
    csoCmnd=TextEditingController(text: widget.employee.soCmnd);
    cadressConact=TextEditingController(text: widget.employee.diaChiLienHe);
    cphone=TextEditingController(text: widget.employee.dienThoai);
    cemail=TextEditingController(text: widget.employee.email);
    cgender= widget.employee.gioiTinh ;
    cderpartment= widget.employee.phongbanId;
    cgraduationYear=TextEditingController(text: widget.employee.namTotNghiep);
    cjobTitle=TextEditingController(text: widget.employee.chucDanh);
    clevel=TextEditingController(text: widget.employee.trinhDo);
    cstartdate=TextEditingController(text: widget.employee.ngayBatDauLam);
    cenddate=TextEditingController(text: widget.employee.ngayLamViecCuoi);
    // cstatus=TextEditingController(text: widget.employee.trangThai.toString());

  }
  //Start Edit role form

  //End Edit role Form
  @override
  Widget build(BuildContext context){
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            "Edit Employee",
          ),
          DefaultTabController(
              length: 5, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                ListTile(
                    leading: IconButton(
                      icon: BackButton(),
                      onPressed: () {
                        Navigator.of(context).pop;
                      },
                    )),
                Container(
                  child: TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: 'Information'),
                      Tab(text: 'Level'),
                      Tab(text: 'Files'),
                      Tab(text: 'Labor contract'),
                      Tab(text: 'Decision'),
                    ],
                  ),
                ),
                Container(
                    height: 400, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: cfullname,
                                      decoration: InputDecoration(
                                        labelText: 'Full Name',
                                        icon: Icon(Icons.people),
                                      ),
                                    ),

                                    TextFormField(
                                      controller: cadressConact,
                                      decoration: InputDecoration(
                                        labelText: 'Address*',
                                        icon: Icon(
                                          Icons.home,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: cphone,
                                      decoration: InputDecoration(
                                        labelText: 'Phone',
                                        icon: Icon(Icons.contact_phone),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: cemail,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        icon: Icon(Icons.message),
                                      ),
                                    ),
                                    SwitchListTile(
                                      title: Text(cgender ? "Male" : "Female"),
                                      value: cgender,
                                      onChanged: (bool value) {
                                        setState(() {
                                          cgender = value;
                                        });
                                        print(cgender);
                                      },
                                      // secondary: const Icon(Icons.airplanemode_active),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      controller: cbirthday,
                                      decoration: InputDecoration(
                                        labelText: 'Birth day',
                                        icon: Icon(Icons.card_giftcard),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: cstartdate,
                                      decoration: InputDecoration(
                                        labelText: 'Start Day',
                                        icon: Icon(Icons.card_giftcard),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: csoCmnd,
                                      decoration: InputDecoration(
                                        labelText: 'Identity Card',
                                        icon: Icon(Icons.card_giftcard),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: cenddate,
                                      decoration: InputDecoration(
                                        labelText: 'End Day',
                                        icon: Icon(Icons.call_end),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: clevel,
                                      decoration: InputDecoration(
                                        labelText: 'Level',
                                        icon: Icon(Icons.lock),
                                      ),
                                    ),

                                    TextField(
                                        controller: cgraduationYear,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                        ],
                                        decoration: InputDecoration(
                                            labelText:"Graduation Year",
                                            hintText: "graduation year",
                                            icon: Icon(Icons.school)
                                        )
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: cjobTitle,
                                      decoration: InputDecoration(
                                        labelText: 'Job Titulus',
                                        icon:
                                        Icon(Icons.calendar_today),
                                      ),
                                    ),
                                    TextField(
                                        controller: cgraduationYear,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                        ],
                                        decoration: InputDecoration(
                                            labelText:"Graduation Year",
                                            hintText: "graduation year",
                                            icon: Icon(Icons.phone_iphone)
                                        )
                                    )
                                    // Text(
                                    //   controller: cpars,
                                    //   decoration: InputDecoration(
                                    //     labelText: 'Part Derpartment',
                                    //     icon:
                                    //         Icon(Icons.calendar_today),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 4', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 5', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 5', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ])
                )
              ])
          ),
        ]),
    );
  }
}