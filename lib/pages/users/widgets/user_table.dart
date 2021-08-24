import 'package:flutter/material.dart';

import 'package:flutter_web_dashboard/models/Account.dart';

import 'package:flutter_web_dashboard/pages/users/service/user_api.dart';
import 'package:flutter_web_dashboard/pages/users/widgets/edit_user_page.dart';


class UserTable extends StatefulWidget {
  @override
  _UserTableState createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  // String name = '';
  List<Account> _users = [];
  // Account response_user;
  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  _getUsers() {
    AccountService.getUsers().then((response) {
      if (mounted) {
        setState(() {
          _users = response;
        });
      }
    });
  }

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
          // _settingModalBottomSheet(context);
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
              "Name",
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
              "Avatar",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "Active",
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
        for (Account response_user in _users)
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_user.id}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_user.name}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_user.email}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Container(
                width: 100,
                height: 100,
                child: Image.network(
                  "${response_user.avatar}",
                  fit: BoxFit.cover,

                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_user.active ? "Kich Hoat" : "Vo Hieu Hoa"}",
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
                              builder: (context) => EditAccount(
                                    user: response_user,
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
                              builder: (context) => EditAccount(
                                    user: response_user,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditAccount(
                                    user: response_user,
                                  )));
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
