import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import 'addtask.dart';

class HomePage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
         child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0)),
        
          child: AppBar(
           

  
  
        backgroundColor: barColor,
        centerTitle: true,
          title: Text('TO DO LIST',
          style: TextStyle(color: Colors.black54),
          ),
        actions: <Widget>[
          popupMenuButton(),
  
        ]
      ),
        ),
        ),
    
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.black54,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask())
        
          
          );
        },
      ),
body: _tasklist(),

    );
  }
  Widget _tasklist() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.check_box_outline_blank),
          title: Text('Städa'),
          trailing: Icon(Icons.delete),
        ),
        ListTile(
          leading: Icon(Icons.check_box_outline_blank),
          title: Text('Träna'),
          trailing: Icon(Icons.delete),
        ),
        ListTile(
            leading: Icon(Icons.check_box_outline_blank),
            title: Text('Plugga'),
             trailing: Icon(Icons.delete),
        ),
        ListTile(
            leading: Icon(Icons.check_box_outline_blank),
            title: Text('Handla'),
            trailing: Icon(Icons.delete),),
      ],
    );
  }
}





Widget popupMenuButton(){
  return PopupMenuButton<String>(
    icon: Icon(Icons.more_vert,size: 30.0, color: Colors.black54,),
    color: Colors.black54,
    itemBuilder: (BuildContext context) =><PopupMenuEntry<String>>[
  
       PopupMenuItem<String>(value: "one_val",
      child: Text ("All"),
    
      ),
      PopupMenuItem<String>(value: "sec_val",
      child: Text ("Done"),
      ),

      PopupMenuItem<String>(value: "three_val",
      child: Text ("Undone"),
      
      )
    ],
  );
}


  
