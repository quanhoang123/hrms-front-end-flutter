import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Department.dart';
import 'package:flutter_web_dashboard/models/File.dart';
import 'package:flutter_web_dashboard/models/Part.dart';
import 'package:flutter_web_dashboard/models/PartEmployee.dart';
import 'package:flutter_web_dashboard/pages/employee/api_employee/employee_api.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  _AddEmployeeState();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //Start infomation employee

  TextEditingController cfullname = TextEditingController();
  TextEditingController csoCmnd = TextEditingController();

  TextEditingController cadressConact = TextEditingController();
  TextEditingController cphone = TextEditingController();
  TextEditingController cemail = TextEditingController();
  TextEditingController cstatus = TextEditingController();
  //Start add Level employee
  TextEditingController clevel = TextEditingController();
  TextEditingController cgraduationYear = TextEditingController();

  TextEditingController cjobTitle = TextEditingController();
  int cderpartment = 0;
  int cpars = 0;
  //End
  TextEditingController cbirthday = TextEditingController();
  TextEditingController cstartdate = TextEditingController();
  TextEditingController cenddate = TextEditingController();

  bool cgender = false;
  void addData() async {
    var data = {
      "ho_ten": cfullname.text,
      "ngay_sinh": cbirthday.text,
      "so_cmnd": csoCmnd.text,
      "gioi_tinh": true,
      "dia_chi_lien_he": cadressConact.text,
      "dien_thoai": cphone.text,
      "email": cemail.text,
      "trinh_do": clevel.text,
      "nam_tot_nghiep": cgraduationYear.text,
      "chuc_danh": cjobTitle.text,
      "ngay_bat_dau_lam": cstartdate.text,
      "ngay_lam_viec_cuoi": cenddate.text,
      "phongban_id": this.cderpartment,
      "bophan_id": this.cpars,
      "trang_thai": true,
    };
    await CallApi().postData(data, 'add-employee');

    Get.offAllNamed(employeesPageRoute);
  }
  //End add infomation employee

  String _selectFile;
  List<FileElement> _file = [];
  _getFile() {
    EmployeeService.getFileAdd().then((response) {
      if (mounted) {
        setState(() {
          _file = response;
        });
      }
    });
  }
  String _selectDepartment=null;
  List<Department> _department_id=[];
  _getDepartment() {
    try{
      EmployeeService.getDepartment().then((response) {
        if (mounted) {
          setState(() {
            _department_id = response;
          });
        }
      });

    }on Exception catch (_) {
      print("throwing new error");
      throw Exception("Error on server");
    }

  }
  String _selectPart;
  List<Part> _part=[];
  _getPartByDepartment() {
    try{
        EmployeeService.getParts(int.parse(_selectDepartment)).then((response) {
          if (mounted) {
            setState(() {
              _part = response;
            });
          }
        print(_part);
        });
    }on Exception catch (_) {
      print("throwing new error");
      throw Exception("Error on server");
    }

  }
  @override
  initState() {
    super.initState();
    _getFile();
    _getDepartment();
    if(_selectDepartment != null ){
      _getPartByDepartment();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
        SizedBox(height: 20.0),
        Text('Add Employee',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
        DefaultTabController(
            length: 5, // length of tabs
            initialIndex: 0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
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
                      height: 450, //height of TabBarView
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: Form(
                        child: TabBarView(
                          children: <Widget>[
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
                                            title: Text(
                                                cgender ? "Male" : "Female"),
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
                                          // InputDatePickerFormField(
                                          //   firstDate: DateTime(2015, 8),
                                          //   lastDate: DateTime(2101),
                                          //   initialDate: cenddate,
                                          //   onDateSubmitted: (date) {
                                          //     setState(() {
                                          //       cenddate = date;
                                          //     });
                                          //   },
                                          // ),
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
                                          TextFormField(
                                            controller: cgraduationYear,
                                            decoration: InputDecoration(
                                              labelText: 'Graduation Year',
                                              icon: Icon(Icons.home),
                                            ),
                                          ),
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
                                              icon: Icon(Icons.calendar_today),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: DropdownButton(
                                              hint: Text("Select Department"),
                                              items: _department_id != null ? _department_id.map(
                                                    (item) => DropdownMenuItem(
                                                      child: Text(item.ten),
                                                      value: item.id.toString(),
                                                ),
                                              ).toList() : Container(),
                                              onChanged: (newVal) {
                                                setState(() {
                                                  _selectDepartment = newVal;
                                                });
                                              },
                                              value: _selectDepartment,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: this._selectDepartment!=null ? Text(_selectPart.toString()): Text("Selec Department"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: DropdownButton(
                                              items: _part.map(
                                                    (item) => DropdownMenuItem<String>(
                                                  child: Text(item.ten),
                                                  value: item.id.toString(),
                                                ),
                                              ).toList(),
                                              onChanged: (newVal) {
                                                setState(() {
                                                  _selectPart = newVal;
                                                });

                                              },
                                              value: _selectPart,

                                            ),
                                          ),
                                          // TextFormField(
                                          //   controller: cderpartment,
                                          //   decoration: InputDecoration(
                                          //     labelText: 'Department',
                                          //     icon: Icon(Icons.card_giftcard),
                                          //   ),
                                          // ),
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
                                child: Text('NO ',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('NO',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('NO',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ))
                ])),
        Container(
          child: ElevatedButton(
              child: Text("Submit"),
              onPressed: () {
                addData();
                Navigator.of(context).pop;
              }),
        )
      ]),
    );
  }
}
