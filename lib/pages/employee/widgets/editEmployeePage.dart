import 'package:flutter/material.dart';
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

  TextEditingController cmaNv;
  TextEditingController  cfullname;
  TextEditingController cbirthday;
  TextEditingController csoCmnd;
  TextEditingController  caddressNow;
  TextEditingController cadressConact;
  TextEditingController cphone;
  TextEditingController  cemail;
  TextEditingController cdayRange;// ngày cấp chứng minh nhân dân
  TextEditingController  caddressRange; //nơi cấp chứng minh nhân dân
  TextEditingController cstartdate; //ngày bắt đầu làm việc
  TextEditingController cendDate; //ngay cuoi lam viec
  TextEditingController  cstatus;

  // void editData()async {
  //   var data = {
  //     'name': cmaNv.text,
  //     'display_name': cfullname.text,
  //     'description': cbirthday.text,
  //     'name': csoCmnd.text,
  //     'display_name': caddressNow.text,
  //     'description': cadressConact.text,
  //     'name': cmaNv.text,
  //     'display_name': cphone.text,
  //     'description': cemail.text,
  //     'name': cgender,
  //     'display_name': cdayRange.text,
  //     'description': cdescription.text,
  //     'name': cmaNv.text,
  //     'display_name': cdisplayName.text,
  //     'description': cdescription.text,
  //   };
  //   var res = await CallApi().postData(data, 'edit-role/${widget.role.id}');
  // }

  @override
  void initState(){
    super.initState();
    cmaNv=TextEditingController(text: widget.employee.maNv);
    cfullname=TextEditingController(text: widget.employee.hoTen);
    cbirthday=TextEditingController(text: widget.employee.ngaySinh);
    csoCmnd=TextEditingController(text: widget.employee.soCmnd);
    caddressNow=TextEditingController(text: widget.employee.diaChiThuongTru);
    cadressConact=TextEditingController(text: widget.employee.diaChiLienHe);
    cphone=TextEditingController(text: widget.employee.dienThoai);
    cemail=TextEditingController(text: widget.employee.email);
    // cgender=TextEditingController(text: widget.employee.gioiTinh as String);
    cdayRange=TextEditingController(text: widget.employee.ngayCapCmnd);
    caddressRange=TextEditingController(text: widget.employee.noiCapCmnd);
    cstartdate=TextEditingController(text: widget.employee.ngayBatDauLam);
    cendDate=TextEditingController(text: widget.employee.ngayLamViecCuoi);
    // cstatus=TextEditingController(text: widget.employee.trangThai.toString());

  }
  //Start Edit role form

  //End Edit role Form
  @override
  Widget build(BuildContext context){
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 20.0),
          Text('Edit Employee', textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
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
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cmaNv,
                                decoration: InputDecoration(
                                    hintText: "Enter username", labelText: "Enter username"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cfullname,
                                decoration: InputDecoration(
                                    hintText: "Enter password", labelText: "Enter email"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: caddressNow,
                                decoration: InputDecoration(
                                    hintText: "Enter password", labelText: "Enter password"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cadressConact,
                                decoration: InputDecoration(
                                    hintText: "Enter username", labelText: "Enter username"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cphone,
                                decoration: InputDecoration(
                                    hintText: "Enter password", labelText: "Enter email"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cemail,
                                decoration: InputDecoration(
                                    hintText: "Enter password", labelText: "Enter password"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cbirthday,
                                decoration: InputDecoration(
                                    hintText: "Enter username", labelText: "Enter username"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cbirthday,
                                decoration: InputDecoration(
                                    hintText: "Enter password", labelText: "Enter email"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: csoCmnd,
                                decoration: InputDecoration(
                                    hintText: "Enter password", labelText: "Enter password"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cdayRange,
                                decoration: InputDecoration(
                                    hintText: "Enter username", labelText: "Enter username"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: caddressRange,
                                decoration: InputDecoration(
                                    hintText: "Enter password", labelText: "Enter email"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cstartdate,
                                decoration: InputDecoration(
                                    hintText: "Enter password", labelText: "Enter password"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cendDate,
                                decoration: InputDecoration(
                                    hintText: "Enter username", labelText: "Enter username"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cstatus,
                                decoration: InputDecoration(
                                    hintText: "Enter password", labelText: "Enter email"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 2', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                    ])
                )
              ])
          ),
        ]),
    );
  }
}