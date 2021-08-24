import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Account.dart';
import 'package:flutter_web_dashboard/models/Employee.dart';
import 'package:flutter_web_dashboard/models/Roles.dart';
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
  TextEditingController cmaNv = TextEditingController();
  TextEditingController cfullname = TextEditingController();
  TextEditingController cbirthday = TextEditingController();
  TextEditingController csoCmnd = TextEditingController();
  TextEditingController caddressNow = TextEditingController();
  TextEditingController cadressConact = TextEditingController();
  TextEditingController cphone = TextEditingController();
  TextEditingController cemail = TextEditingController();
  // TextEditingController cgender = TextEditingController();
  TextEditingController cdayRange =
      TextEditingController(); // ngày cấp chứng minh nhân dân
  TextEditingController caddressRange =
      TextEditingController(); //nơi cấp chứng minh nhân dân
  TextEditingController cstartdate =
      TextEditingController(); //ngày bắt đầu làm việc
  TextEditingController cendDate = TextEditingController(); //ngay cuoi lam viec
  TextEditingController cstatus = TextEditingController();

  bool cgender = false;
  void addData() async {
    var data = {
      "ma_nv": cmaNv.text,
      "ho_ten": cfullname.text,
      "ngay_sinh": cbirthday.text,
      "so_cmnd": csoCmnd.text,
      "gioi_tinh": cgender,
      "dia_chi_thuong_tru": caddressNow.text,
      "dia_chi_lien_he": cadressConact.text,
      "dien_thoai": cphone.text,
      "email": cemail.text,
      "ngay_cap_cmnd": cdayRange.text,
      "noi_cap_cmnd": caddressRange.text,
      "ngay_bat_dau_lam": cstartdate.text,
      "ngay_lam_viec_cuoi": cendDate.text,
    };
    var res = await CallApi().postData(data, 'add-employee');
    print(res);
    if (res) {
      Get.offAllNamed(employeesPageRoute);
    }
  }
  //End add infomation employee

  //Start add Level employee
  TextEditingController clevel = TextEditingController();
  TextEditingController cschool = TextEditingController();
  TextEditingController cgraduationYear = TextEditingController();
  TextEditingController clibellum = TextEditingController();
  TextEditingController cjobTitulus = TextEditingController();
  TextEditingController cderpartment = TextEditingController();
  TextEditingController cpars = TextEditingController();

  //End

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Grouping and Delegating'),
      ),
      body: Container(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                Widget>[
          SizedBox(height: 20.0),
          Text('Edit Employee',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
          DefaultTabController(
              length: 5, // length of tabs
              initialIndex: 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
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
                        height: 700, //height of TabBarView
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey, width: 0.5))),
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
                                              controller: cmaNv,
                                              decoration: InputDecoration(
                                                labelText: 'Code Employee',
                                                icon: Icon(Icons.lock),
                                                // focusedBorder: OutlineInputBorder(
                                                //   borderSide: BorderSide( color: Colors.red),
                                                //   borderRadius: BorderRadius.circular(15),
                                                // ),
                                              ),
                                            ),
                                            TextFormField(
                                              controller: cfullname,
                                              decoration: InputDecoration(
                                                labelText: 'Full Name',
                                                icon: Icon(Icons.people),
                                              ),
                                            ),
                                            TextFormField(
                                              controller: caddressNow,
                                              decoration: InputDecoration(
                                                labelText: 'Permanent Address',
                                                icon: Icon(Icons.home),
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
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller: cbirthday,
                                              decoration: InputDecoration(
                                                labelText: 'Birthday',
                                                icon:
                                                    Icon(Icons.calendar_today),
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
                                              controller: cdayRange,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Date of issuance of identity card',
                                                icon:
                                                    Icon(Icons.calendar_today),
                                              ),
                                            ),
                                            TextFormField(
                                              controller: caddressRange,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Place of issue of identity card',
                                                icon: Icon(Icons.home),
                                              ),
                                            ),
                                            TextFormField(
                                              controller: cstartdate,
                                              decoration: InputDecoration(
                                                labelText: 'Start working',
                                                icon:
                                                    Icon(Icons.calendar_today),
                                              ),
                                            ),
                                            TextFormField(
                                              controller: cendDate,
                                              decoration: InputDecoration(
                                                labelText: 'End working date',
                                                icon:
                                                    Icon(Icons.calendar_today),
                                              ),
                                            ),
                                            SwitchListTile(
                                                title: Text(cgender
                                                    ? "Male"
                                                    : "Female"),
                                                secondary: Icon(Icons.people),
                                                value: cgender,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    cgender = value;
                                                  });
                                                }),
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
                                                // focusedBorder: OutlineInputBorder(
                                                //   borderSide: BorderSide( color: Colors.red),
                                                //   borderRadius: BorderRadius.circular(15),
                                                // ),
                                              ),
                                            ),
                                            TextFormField(
                                              controller: cschool,
                                              decoration: InputDecoration(
                                                labelText: 'Grauation School',
                                                icon: Icon(Icons.people),
                                              ),
                                            ),
                                            TextFormField(
                                              controller: cgraduationYear,
                                              decoration: InputDecoration(
                                                labelText: 'Graduation Year',
                                                icon: Icon(Icons.home),
                                              ),
                                            ),
                                            TextFormField(
                                              controller: clibellum,
                                              decoration: InputDecoration(
                                                labelText: 'Clibellum',
                                                icon: Icon(
                                                  Icons.home,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller: cjobTitulus,
                                              decoration: InputDecoration(
                                                labelText: 'Job Titulus',
                                                icon:
                                                    Icon(Icons.calendar_today),
                                              ),
                                            ),
                                            TextFormField(
                                              controller: cderpartment,
                                              decoration: InputDecoration(
                                                labelText: 'Department',
                                                icon: Icon(Icons.card_giftcard),
                                              ),
                                            ),
                                            TextFormField(
                                              controller: cpars,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Part Derpartment',
                                                icon:
                                                    Icon(Icons.calendar_today),
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
                                child: Center(
                                  child: Text('Display Tab 3',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text('Display Tab 4',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text('Display Tab 5',
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
            child: ElevatedButton(child: Text("Submit"), onPressed: () {}),
          )
        ]),
      ),
    );
  }
}
