import 'package:flutter/material.dart';
import 'homep.dart';
import 'profile.dart';


class NavDrawer extends StatefulWidget {

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(65.0, 40, 60, 40),
              child: Text(
                'Welcome!',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.indigo[900],
                )),


          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context)
            .push(MaterialPageRoute<Null>(builder: (BuildContext context) {

              return Profile();
            },))
          },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}





class Custom extends StatefulWidget {
  @override
  _CustomState createState() => _CustomState();
}

class _CustomState extends State<Custom> {
int _selectedIndex = 0;
static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
final List<Widget> _widgetOptions = <Widget>[
  HomePage(),
  Text(
     'Assignmnet',
     style: optionStyle,
  ),
  Profile(),
];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {

    Map val = ModalRoute.of(context).settings.arguments;
    print(val);
    String as=val['as'];
    String uid=val['uid'];
    print(as);

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        
      
      title: const Text('Flutterfly Teams', style: TextStyle(fontSize: 25.0,),),
      centerTitle: true,
      backgroundColor: Colors.indigo[900],
        actions: <Widget>[
          if (as== 'teacher') Padding(
              padding: EdgeInsets.only(left:0.0 ,right: 0.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/chart', arguments: {'uid': val['uid'],'as':as});
                },
                child: IconButton(
                  icon:  Icon(Icons.graphic_eq),

                  onPressed: () {
                    Navigator.pushNamed(context, '/chart', arguments: {'uid': val['uid'],'as':as});
                    //   Navigator.push(
                    //   context,
                    //   // MaterialPageRoute(builder: (context) => Mathvideos()),
                    // );
                  },
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 2.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile', arguments: {'uid': val['uid'],'as':as});
                },
                child: IconButton(
                  icon:  Icon(Icons.supervised_user_circle),

                  onPressed: () {
                    Navigator.pushNamed(context, '/profile', arguments: {'uid': val['uid'],'as':as});
                    //   Navigator.push(
                    //   context,
                    //   // MaterialPageRoute(builder: (context) => Mathvideos()),
                    // );
                  },
                ),
              )
          ),
        ],
    ),
    body: Center(
      child: _widgetOptions.elementAt(_selectedIndex),
    ),
    
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.grey[200],
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          
          
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          title: Text('Assignment'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          title: Text('Quiz'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.indigo[900],
      onTap: _onItemTapped,
    ),

    );
  }
} 