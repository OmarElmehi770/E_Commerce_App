import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            //spacing: 10,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70,),
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile_img.jpg'),
                radius: 70,
              ),
              SizedBox(height: 10,),
              Text("Omar Elmehi",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
              Text("omar770949@gmail.com",style: TextStyle(fontSize: 15,color:Colors.grey,fontWeight: FontWeight.bold,),),
              SizedBox(height: 50,),
              ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_bag_rounded),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text("Help & Support"),
                leading: Icon(Icons.help),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text("About Us"),
                leading: Icon(Icons.info),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text("Change Theme"),
                leading: Icon(Icons.light_mode_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                    Text("Logout"),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(300, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
