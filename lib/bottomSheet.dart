import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todoModel.dart';

class BottomSheets extends StatelessWidget {
  final TextEditingController task = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TodoModel todos = Provider.of<TodoModel>(context);
    return Container(
      color: Color(0xff757575),
      child:Container(
        padding: EdgeInsets.only(bottom: 100),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 300,
                  child: TextField(controller: task, autofocus: true,
                  decoration: InputDecoration(hintText: "Add todos"),
                  )),
                SizedBox(height: 30,),
                SizedBox(width: 300, height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      todos.addTask(Task(taskTitle: task.text));
                      task.clear();
                      Navigator.pop(context);
                    },
                    color: Colors.blue[900],
                    child: Text("Add Task",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        
    );
  }
}