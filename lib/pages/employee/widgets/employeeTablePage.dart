import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/api/callapi.dart';

import 'package:flutter_web_dashboard/models/Employee.dart';
import 'package:flutter_web_dashboard/pages/employee/api_employee/employee_api.dart';
import 'package:flutter_web_dashboard/pages/employee/widgets/addEmployeePage.dart';
import 'package:flutter_web_dashboard/pages/employee/widgets/editEmployeePage.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

class EmployeeTable extends StatefulWidget {
  @override
  _EmployeeTableState createState() => _EmployeeTableState();
}

class _EmployeeTableState extends State<EmployeeTable> {
  List<Employee> _employee = [];
  @override
  void initState() {
    super.initState();
    _getUsers();
  }
  _getUsers() {
    EmployeeService.getEmployees().then((response) {
      if (mounted) {
        setState(() {
          _employee = response;
        });
        print(_employee);
      }
    });
  }

  void deleteData(id)async{
    var res=await CallApi().deleteData('delete-employee/$id');
  }

  // void _ModelAddRole(context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           scrollable: true,
  //           title: Text('Add Role User'),
  //           content: Container(
  //             width: 600,
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Form(
  //                 child: Column(
  //                   children: <Widget>[
  //                     TextFormField(
  //                       controller: cmaNv,
  //                       decoration: InputDecoration(
  //                         labelText: 'Code Employee',
  //                         icon: Icon(Icons.person),
  //                       ),
  //                     ),
  //                     TextFormField(
  //                       controller: cfullname,
  //                       decoration: InputDecoration(
  //                         labelText: 'Full Name',
  //                         icon: Icon(Icons.email),
  //                       ),
  //                     ),
  //                     TextFormField(
  //                       controller: caddressNow,
  //                       decoration: InputDecoration(
  //                         labelText: 'Permanent Address',
  //                         icon: Icon(Icons.message),
  //                       ),
  //                     ),
  //                     TextFormField(
  //                       controller: cadressConact,
  //                       decoration: InputDecoration(
  //                         labelText: 'Address',
  //                         icon: Icon(Icons.person),
  //                       ),
  //                     ),
  //                     TextFormField(
  //                       controller: cphone,
  //                       decoration: InputDecoration(
  //                         labelText: 'Phone',
  //                         icon: Icon(Icons.email),
  //                       ),
  //                     ),
  //                     TextFormField(
  //                       controller: cemail,
  //                       decoration: InputDecoration(
  //                         labelText: 'Email',
  //                         icon: Icon(Icons.message),
  //                       ),
  //                     ),
  //                     TextFormField(
  //                       controller: cbirthday,
  //                       decoration: InputDecoration(
  //                         labelText: 'Birthday',
  //                         icon: Icon(Icons.inbox),
  //                       ),
  //                     ),
  //                     TextFormField(
  //                       controller: csoCmnd,
  //                       decoration: InputDecoration(
  //                         labelText: 'Identity Card',
  //                         icon: Icon(Icons.email),
  //                       ),
  //                     ),
  //                     TextFormField(
  //                       controller: cdayRange,
  //                       decoration: InputDecoration(
  //                         labelText: 'Date of issuance of identity card',
  //                         icon: Icon(Icons.message),
  //                       ),
  //                     ),
  //                     TextFormField(
  //                       controller: caddressRange,
  //                       decoration: InputDecoration(
  //                         labelText: 'Place of issue of identity card',
  //                         icon: Icon(Icons.person),
  //                       ),
  //                     ),
  //                     TextFormField(
  //                       controller: cstartdate,
  //                       decoration: InputDecoration(
  //                         labelText: 'Start working',
  //                         icon: Icon(Icons.email),
  //                       ),
  //                     ),
  //                     TextFormField(
  //                       controller: cendDate,
  //                       decoration: InputDecoration(
  //                         labelText: 'End working date',
  //                         icon: Icon(Icons.message),
  //                       ),
  //                     ),
  //                     SwitchListTile(
  //                         title: Text(cgender ? "Male" : "Female"),
  //                         secondary: Icon(Icons.people),
  //                         value: cgender,
  //                         onChanged: (bool value) {
  //                           setState(() {
  //                             cgender = value;
  //                           });
  //                           Navigator.of(context).pop(); // Line 1
  //                           _ModelAddRole(context); // Line 2
  //                         }),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //           actions: [ElevatedButton(child: Text("Submit"), onPressed: () {
  //             addData();
  //           })],
  //         );
  //       });
  // }

  //End Modal add

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

          child: ListView(
            children: [
              roles(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddEmployee()));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Table roles() {
    return Table(
      border: TableBorder(
        bottom: BorderSide(color: Colors.red, width: 2),
        horizontalInside: BorderSide(color: Colors.red, width: 2),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "ID",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "Full Name",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "Phone",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "Status",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "Acction",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ]),
        for (Employee response_employee in _employee)
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_employee.id}",
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_employee.hoTen}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_employee.dienThoai}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_employee.trangThai ? "On" : "OFF"}",
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Icon(
                        Icons.view_array,
                        color: Colors.white,
                      ),
                    ),
                    onTap: ()
                        // print(row.getCells()[0].value.toString());
                        {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditEmployee(
                                    employee: response_employee,
                                  )));
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                    onTap: ()
                        // print(row.getCells()[0].value.toString());
                        {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditEmployee(
                                    employee: response_employee,
                                  )));
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onTap: ()
                        // print(row.getCells()[0].value.toString());
                        {
                          deleteData(response_employee.id);
                    },
                  ),
                ),
              ],
            )
          ]),
      ],
    );
  }
}
