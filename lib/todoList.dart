import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todoModel.dart';

import 'bottomSheet.dart';

class HomePage extends StatelessWidget {
  final TextEditingController task = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TodoModel todos = Provider.of<TodoModel>(context);
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 40),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Todo",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                          backgroundColor: Colors.yellow[200]),
                    ),
                    Text(
                      "ly",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child: ListView.builder(
                      itemCount: todos.allTask.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.09,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 25.0,
                                )
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 32),
                            title: Text(
                              todos.allTask[index].taskTitle,
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: FlatButton(
                              onPressed: () {
                                todos.deleteTask(todos.allTask[index]);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                        );
                      }),
                ),
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[900],
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
                child: BottomSheets(),
              ),
            ));
        },
      ),
    );
  }
}
