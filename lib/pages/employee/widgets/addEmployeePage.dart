import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/api/callapi.dart';
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
  TextEditingController cderpartment = TextEditingController();
  TextEditingController cpars = TextEditingController();
  //End

  DateTime cbirthday = DateTime.now();
  DateTime cstartdate=DateTime.now();
  DateTime cenddate=DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: cbirthday,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != cbirthday)
      setState(() {
        cbirthday = picked;
      });
  }


  bool cgender = false;
  void addData() async {
    var data = {
      "ho_ten": cfullname.text,
      "ngay_sinh": cbirthday,
      "so_cmnd": csoCmnd.text,
      "gioi_tinh": cgender,
      "dia_chi_lien_he": cadressConact.text,
      "dien_thoai": cphone.text,
      "email": cemail.text,
      "trinh_do":clevel.text,
      "nam_tot_nghiep": cgraduationYear.text,
      "chuc_danh": cjobTitle.text,
      "ngay_bat_dau_lam": cstartdate,
      "ngay_lam_viec_cuoi": cenddate,
      "phongban_id":1,
      "bophan_id":1,
      "hoso_id":"",
    };
    var res = await CallApi().postData(data, 'add-employee');
    print(res);
    if (res) {
      Get.offAllNamed(employeesPageRoute);
    }
  }
  //End add infomation employee



  @override
  initState() {
    super.initState();
    cbirthday = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
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
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            InputDatePickerFormField(
                                              firstDate: DateTime(2015, 8),
                                              lastDate: DateTime(2101),
                                              initialDate: cbirthday,
                                              onDateSubmitted: (date) {
                                                setState(() {
                                                  cbirthday = date;
                                                });
                                              },
                                            ),
                                            TextFormField(
                                              controller: csoCmnd,
                                              decoration: InputDecoration(
                                                labelText: 'Identity Card',
                                                icon: Icon(Icons.card_giftcard),
                                              ),
                                            ),

                                            InputDatePickerFormField(
                                              firstDate: DateTime(2015, 8),
                                              lastDate: DateTime(2101),
                                              initialDate: cstartdate,
                                              onDateSubmitted: (date) {
                                                setState(() {
                                                  cstartdate = date;
                                                });
                                              },
                                            ),
                                            InputDatePickerFormField(
                                              firstDate: DateTime(2015, 8),
                                              lastDate: DateTime(2101),
                                              initialDate: cenddate,
                                              onDateSubmitted: (date) {
                                                setState(() {
                                                  cenddate = date;
                                                });
                                              },
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
                                        width: 100,
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
                                                labelText: 'Part Derpartment',
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
            child: ElevatedButton(child: Text("Submit"), onPressed: () {addData()}),
          )
        ]),

    );
  }
}
