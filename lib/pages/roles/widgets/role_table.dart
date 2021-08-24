import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/api/callapi.dart';

import 'package:flutter_web_dashboard/models/Roles.dart';
import 'package:flutter_web_dashboard/pages/roles/Service/api_role.dart';
import 'package:flutter_web_dashboard/pages/roles/widgets/edit_role_page.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

class RolesTable extends StatefulWidget {
  @override
  _RolesTableState createState() => _RolesTableState();
}

class _RolesTableState extends State<RolesTable> {
  List<Role> _role = [];

  @override
  void initState() {
    super.initState();
    _getRoles();

  }

  _getRoles() {
    RolesService.getRoles().then((response) {
      if (mounted) {
        setState(() {
          _role = response;
        });
        print(_role);
      }
    });
  }

//Function add role
  void addData() async {
    var data = {
      "name": cname.text,
      "display_name": cdisplay_name.text,
      "description": cdescription.text
    };
    var res = await CallApi().postData(data, 'store-role');
    print(res);
    if (res) {
      Get.offAllNamed(rolesPageRoute);
    }
  }

  void deleteData(id)async{
    var res=await CallApi().deleteData('delete-role/$id');
  }

  TextEditingController cdisplay_name =  TextEditingController();
  TextEditingController cname =  TextEditingController();
  TextEditingController cdescription =  TextEditingController();

  void _ModelAddRole(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Add Role User'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
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
                      controller: cdisplay_name,
                      decoration: InputDecoration(
                        labelText: 'Display Name',
                        icon: Icon(Icons.email),
                      ),
                    ),
                    TextFormField(
                      controller: cdescription,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        icon: Icon(Icons.message),
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
                "Grouping and Delegating Data",
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
              "Display Name",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "Description",
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
        for (Role response_role in _role)
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_role.id}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_role.name}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_role.displayName}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_role.description}",
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
                              builder: (context) => DetailRoles(
                                role: response_role,
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
                              builder: (context) => DetailRoles(
                                    role: response_role,
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
                              deleteData(response_role.id);
                              Get.offAllNamed(rolesPageRoute);
                            },
                          ),
                          MaterialButton(
                            child: Text("CANCEL"),
                            onPressed: () {},
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
