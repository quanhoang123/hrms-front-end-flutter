//
// import 'dart:convert';
// import 'package:flutter_web_dashboard/api/callapi.dart';
// import 'package:flutter_web_dashboard/models/Account.dart';
// import 'package:intl/intl.dart';
//
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//
// import 'package:flutter_web_dashboard/constants/style.dart';
// class JsonDataGrid extends StatefulWidget {
//   @override
//   _JsonDataGridState createState() => _JsonDataGridState();
// }
//
// class _JsonDataGridState extends State<JsonDataGrid> {
//    _JsonDataGridSource jsonDataGridSource;
//   List<Account> accountList=[];
//   //Fetch accountList
//      Future getStudentList() async {
//       final response =  await CallApi().getData('account');
//       // print(response.body);
//       var list = json.decode(response.body).cast<Map<String, dynamic>>();
//       accountList =
//       await list.map<Account>((json) => Account.fromJson(json)).toList();
//       jsonDataGridSource = _JsonDataGridSource(accountList);
//       print(list);
//       return accountList;
//     }
//   List<GridColumn> getColumns() {
//     List<GridColumn> columns;
//     columns = ([
//       GridColumn(
//         columnName: 'id',
//         minimumWidth: 100,
//         label: Container(
//           padding: EdgeInsets.all(8),
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'ID',
//             overflow: TextOverflow.clip,
//             softWrap: true,
//           ),
//         ),
//       ),
//
//       GridColumn(
//         columnName: 'name',
//         minimumWidth: 300 ,
//         label: Container(
//           padding: EdgeInsets.all(8),
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Name',
//             overflow: TextOverflow.clip,
//             softWrap: true,
//           ),
//         ),
//       ),
//       GridColumn(
//         columnName: 'email',
//         minimumWidth: 300,
//         label: Container(
//           padding: EdgeInsets.all(8),
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Email',
//             overflow: TextOverflow.clip,
//             softWrap: true,
//           ),
//         ),
//       ),
//       GridColumn(
//         columnName: 'avatar',
//         minimumWidth: 300,
//         label: Container(
//           padding: EdgeInsets.all(8),
//           alignment: Alignment.centerLeft,
//           child: Text('Avatar'),
//         ),
//       ),
//       GridColumn(
//         columnName: 'active',
//         minimumWidth: 100,
//         label: Container(
//           padding: EdgeInsets.all(8),
//           alignment: Alignment.centerLeft,
//           child: Text('Active'),
//         ),
//       ),
//       GridColumn(
//         columnName: 'created_at',
//         minimumWidth: 100,
//         label: Container(
//           padding: EdgeInsets.all(8),
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Created_at',
//             overflow: TextOverflow.clip,
//             softWrap: true,
//           ),
//         ),
//       ),
//       GridColumn(
//         columnName: 'updated_at',
//         minimumWidth: 100,
//         label: Container(
//           padding: EdgeInsets.all(8),
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Update_at',
//             overflow: TextOverflow.clip,
//             softWrap: true,
//           ),
//         ),
//       ),
//       GridColumn(
//         columnName: 'edit',
//         minimumWidth: 200,
//         label: Container(
//           padding: EdgeInsets.all(8),
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Action',
//             overflow: TextOverflow.clip,
//             softWrap: true,
//           ),
//         ),
//       ),
//     ]);
//     return columns;
//   }
//   @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: active.withOpacity(.4), width: .5),
//         boxShadow: [
//           BoxShadow(
//               offset: Offset(0, 6),
//               color: lightGrey.withOpacity(.1),
//               blurRadius: 12)
//         ],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: const EdgeInsets.all(16),
//       margin: EdgeInsets.only(bottom: 30),
//         child: Center(
//               child: FutureBuilder(
//
//                   future: getStudentList(),
//                   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//                     return snapshot.hasData
//                         ? SfDataGrid(
//                         source: jsonDataGridSource, columns: getColumns())
//                         : Center(
//                       child: CircularProgressIndicator(
//                         strokeWidth: 3,
//                       ),
//                     );
//                   })),
//
//     );
//
//   }
// }
//
//
// class _JsonDataGridSource extends DataGridSource {
//   _JsonDataGridSource(this.accountList) {
//     buildDataGridRow();
//   }
//
//   List<DataGridRow> dataGridRows = [];
//   List<Account> accountList = [];
//
//   void buildDataGridRow() {
//     dataGridRows = accountList.map<DataGridRow>((dataGridRow) {
//       return DataGridRow(
//           cells: [
//               DataGridCell<int>(
//                   columnName: 'id', value: dataGridRow.id),
//               DataGridCell<String>(
//                   columnName: 'name', value: dataGridRow.name),
//               DataGridCell<String>(
//                   columnName: 'email', value: dataGridRow.email),
//               DataGridCell<String>(
//                   columnName: 'avatar', value: dataGridRow.avatar),
//               DataGridCell<bool>(
//                   columnName: 'active', value: dataGridRow.active ),
//               DataGridCell<DateTime>(
//                   columnName: 'created_at', value: dataGridRow.created),
//               DataGridCell<DateTime>(
//                   columnName: 'updated_at', value: dataGridRow.updated),
//             ]);
//           }).toList(growable: false);
//   }
//
//   @override
//   List<DataGridRow> get rows => dataGridRows;
//
//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(cells: [
//       Container(
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.all(8.0),
//         child: Text(
//           row.getCells()[0].value.toString(),
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       Container(
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.all(8.0),
//         child: Text(
//           row.getCells()[1].value,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       Container(
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.all(8.0),
//         child: Text(
//           row.getCells()[2].value.toString(),
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       Container(
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.all(8.0),
//         child: Image.network(
//           row.getCells()[3].value.toString(),
//
//         ),
//       ),
//       Container(
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.all(8.0),
//         child: Text(
//           row.getCells()[4].value ? "Kich Hoat" : "Vo Hieu Hoa",
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       Container(
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.all(8.0),
//         child: Text(
//           DateFormat('MM/dd/yyyy').format(row.getCells()[5].value).toString(),
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       Container(
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.all(8.0),
//         child: Text(
//           DateFormat('MM/dd/yyyy').format(row.getCells()[6].value).toString(),
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//
//       Row(
//         children:  <Widget>[
//           Expanded(
//             child: GestureDetector(
//               child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.blueGrey,
//                       borderRadius: BorderRadius.all(
//                           Radius.circular(10)
//                       )
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(Icons.edit,color: Colors.white,),
//                       Text('Edit',style: TextStyle(color: Colors.white),
//                       )
//                     ],
//                   )
//               ),
//               onTap: () {
//
//                 },
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Expanded(
//             child: GestureDetector(
//               child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.blueGrey,
//                       borderRadius: BorderRadius.all(
//                           Radius.circular(10)
//                       )
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(Icons.delete,color: Colors.white,),
//                       Text('Delete',style: TextStyle(color: Colors.white),
//                       )
//                     ],
//                   )
//               ),
//               onTap: () {
//                 print('execute jobs');
//               },
//             ),
//           ),
//         ],
//       )
//     ]);
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Account.dart';


import 'package:flutter_web_dashboard/pages/account/network/account_service.dart';
import 'package:flutter_web_dashboard/pages/account/widgets/account_edit.dart';


import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

class AccountTable extends StatefulWidget {
  @override
  _AccountTableState createState() => _AccountTableState();
}

class _AccountTableState extends State<AccountTable> {
  List<Account> _account = [];

  @override
  void initState() {
    super.initState();
    _getRoles();
  }

  _getRoles() {
    AccountService.getAccounts().then((response) {
      if (mounted) {
        setState(() {
          _account = response;
        });

      }
    });
  }

//Function add role
  void addData() async {
    var data = {
      "name": cname.text,
      "email": cemail.text,
      "password": cpassword.text
    };
    var res = await CallApi().postData(data, 'add-account');

    if(res != null){
      print('Thanh cong');
      Get.offAllNamed(accountsPageRoute);
    }

  }

  void deleteData(id)async{
    var res=await CallApi().deleteData('delete-role/$id');
  }

  TextEditingController cname =  TextEditingController();
  TextEditingController cemail =  TextEditingController();
  TextEditingController cpassword =  TextEditingController();

  void _ModelAddRole(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Add Account'),
            content: Container(
              width: 500,
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: cname,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        icon: Icon(Icons.person),
                      ),
                    ),
                    TextFormField(
                      controller: cemail,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),

                      ),
                    ),
                    TextFormField(
                      controller: cpassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        icon: Icon(Icons.password),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    addData();
                  })
            ],
          );
        });
  }
  // End Add role function


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              Text(
                "Account Data",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              roles(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _ModelAddRole(context);
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
              "NAME",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "Email",
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
        for (Account res_account in _account)
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${res_account.id}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${res_account.name}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${res_account.email}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${res_account.active ? "Kich Hoat" : "Vo Hieu Hoa"}",
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
                              builder: (context) => EditAccount(
                                account: res_account,
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
                      AlertDialog alertDialog = new AlertDialog(
                        content: Text("Bạn có thực sự muốn xóa?"),
                        actions: [
                          MaterialButton(
                            child: Text("OK DELETE"),
                            onPressed: () {
                              deleteData(res_account.id);
                              Get.offAllNamed(rolesPageRoute);
                            },
                          ),
                          MaterialButton(
                            child: Text("CANCEL"),
                            onPressed: () { Navigator.of(context).pop;},
                          ),
                        ],
                      );
                      showDialog(builder: (context) => alertDialog, context: context);
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
