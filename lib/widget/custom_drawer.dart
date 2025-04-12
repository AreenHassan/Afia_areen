
import 'package:flutter/material.dart';

import '../color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(

      width: 270,
      child: Column(
        children: [
           const UserAccountsDrawerHeader(
          
          accountName: Text("MAHMOUD"),
          accountEmail: Text("MAHMOUD@gmile.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('images/Afia1.PNG',),
          ),
          decoration: BoxDecoration(
            color:Appcolor.maincolor,
          ),
                        ),
         
        
      
          ListTile(
            leading: const Icon(Icons.person,color: Appcolor.maincolor,size: 30,),
            title: const Text('Profile',style: TextStyle(color: Appcolor.border,fontSize: 18,fontWeight: FontWeight.bold),),
            onTap: () {
          
            
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout,color: Appcolor.maincolor,size: 30,),
            title: const Text('Log Out',style: TextStyle(color: Appcolor.border,fontSize: 18,fontWeight: FontWeight.bold)),
            onTap: () {
              
         
            },
          ),
        ],
      ),
    );
  }
}
