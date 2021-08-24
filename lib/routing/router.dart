import 'package:flutter/material.dart';


import 'package:flutter_web_dashboard/pages/account/widgets/account_table.dart';

import 'package:flutter_web_dashboard/pages/employee/widgets/employeeTablePage.dart';
import 'package:flutter_web_dashboard/pages/roles/widgets/role_table.dart';
import 'package:flutter_web_dashboard/pages/overview/overview.dart';

import 'package:flutter_web_dashboard/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case accountsPageRoute:
      return _getPageRoute(AccountTable());
    case employeesPageRoute:
      return _getPageRoute(EmployeeTable());
    case postsPageRoute:
      return _getPageRoute(RolesTable());
    case candidatesPageRoute:
      return _getPageRoute(AccountTable());
    case rolesPageRoute:
      return _getPageRoute(RolesTable());


    default:
      return _getPageRoute(OverviewPage());

  }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}