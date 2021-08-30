import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/account/accounts.dart';


import 'package:flutter_web_dashboard/pages/account/widgets/account_table.dart';
import 'package:flutter_web_dashboard/pages/canndidate/candidate_page.dart';
import 'package:flutter_web_dashboard/pages/employee/employee_page.dart';

import 'package:flutter_web_dashboard/pages/employee/widgets/employeeTablePage.dart';
import 'package:flutter_web_dashboard/pages/roles/roles_page.dart';
import 'package:flutter_web_dashboard/pages/roles/widgets/role_table.dart';
import 'package:flutter_web_dashboard/pages/overview/overview.dart';

import 'package:flutter_web_dashboard/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case accountsPageRoute:
      return _getPageRoute(AccountPage());
    case employeesPageRoute:
      return _getPageRoute(EmployeePage());
    case candidatesPageRoute:
      return _getPageRoute(CandidatePage());
    case rolesPageRoute:
      return _getPageRoute(RolesPage());
    default:
      return _getPageRoute(OverviewPage());

  }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}