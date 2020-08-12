import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
           UserAccountsDrawerHeader(
              accountName: Text('guest'),
              accountEmail: Text('guest@email.com'),
              decoration: BoxDecoration(
                color: Color(0xffDC3269),

              ),
            ),

          ListTile(leading: Icon(Icons.alternate_email,color: Color(0xff00A388),),
          title: Text('guest'),
            onTap: (){},
          ),
          ListTile(leading: Icon(Icons.favorite,color: Colors.red,),
            title: Text('interests'),
            onTap: (){},
          ),
          ListTile(leading: Icon(Icons.star,color: Colors.yellow,),
            title: Text('reviews'),
            onTap: (){},
          ),
          ListTile(leading: Icon(Icons.comment,color: Colors.blue,),
            title: Text('comments'),
            onTap: (){},
          ),
          ListTile(leading: Icon(Icons.vpn_key,color: Colors.grey,),
            title: Text('change password'),
            onTap: (){},
          ),
          ListTile(leading: Icon(Icons.exit_to_app,color: Colors.black,),
            title: Text('logout'),
            onTap: (){},
          ),

        ],
      ),
    );
  }
}
