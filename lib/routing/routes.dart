const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const accountsPageDisplayName = "Users";
const accountsPageRoute = "/users";

const employeesPageDisplayName = "Employee";
const employeesPageRoute = "/employee";

const postsPageDisplayName = "Posts";
const postsPageRoute = "/posts";

const candidatesPageDisplayName = "Candidates";
const candidatesPageRoute = "/candidates";

const rolesPageDisplayName = "Permission";
const rolesPageRoute = "/permission";


const authenticationPageDisplayName = "Active";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}



List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  MenuItem(accountsPageDisplayName, accountsPageRoute),
  MenuItem(employeesPageDisplayName, employeesPageRoute),

  MenuItem(postsPageDisplayName, postsPageRoute),
  MenuItem(candidatesPageDisplayName, candidatesPageRoute),
  MenuItem(rolesPageDisplayName, rolesPageRoute),
  MenuItem(authenticationPageDisplayName, authenticationPageRoute),

];
