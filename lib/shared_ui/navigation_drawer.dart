import 'package:flutter/material.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/util/MockData.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: DrawerHeader(
                  padding: EdgeInsets.all(0),
                  child: Image.network( "https://media.giphy.com/media/w85OYSOzXQaiVzZswl/giphy.gif",fit: BoxFit.cover,),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Transform.translate(
                offset: Offset(0,-24),
                child: ListView.builder(
                    itemBuilder: (context , position){
                      return ListTile(
                          title: Text(MockData.mockData.navMenu[position].title, style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                          ),
                        trailing: Icon(
                          Icons.chevron_right, color: Colors.grey.shade400,
                        ),
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return MockData.mockData.navMenu[position].distance();
                            }
                            )
                            );
                          print(MockData.mockData.navMenu[position]);
                        },
                      );
                    },
                  itemCount: MockData.mockData.navMenu.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
