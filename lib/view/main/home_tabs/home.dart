import 'package:flutter/material.dart';
import 'package:newsapp/other/EnumConstant.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';
import 'package:newsapp/util/MockData.dart';
import 'package:newsapp/view/main/about.dart';
import 'package:newsapp/view/main/home_tabs/popular.dart';
import 'whats_new.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  TabController _tabController;
  PopOutMenu _selection;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0 ,length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(EXPLORE),
        centerTitle: false,
        actions: [
          _popOutMenu(context),
        ],
        bottom: TabBar(
          isScrollable: false,
          indicatorColor: Colors.black38,
          tabs: [
            Tab(text: WHATSNEW,),
            Tab(text: POPULAR,),
          ],
          controller: _tabController,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          children: [
            WhatsNew(),
            Popular(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }


  //todo create popupMenu
  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(itemBuilder: (context){
      return [
        PopupMenuItem(
            value: PopOutMenu.ABOUT,
            child: Text('About')
        ),
        PopupMenuItem(
            value: PopOutMenu.HELP,
            child: Text('Share')
        ),
      ];
    }, onSelected: (PopOutMenu menu ){
        setState(() {
          if(menu == PopOutMenu.ABOUT){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AboutApp();
            }
            )
            );
          }else{

          }
          _selection = menu;
          MockData.logger.v("selection is $menu");
        });
    },
    icon: Icon(Icons.more_vert),
    );
  }


}
