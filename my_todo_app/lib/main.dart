import 'package:flutter/material.dart';
import 'style.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.cyan
      ),
      home: const MyHomeTodo(),
    );
  }
}
class MyHomeTodo extends StatefulWidget {
  const MyHomeTodo({Key? key}) : super(key: key);

  @override
  State<MyHomeTodo> createState() => _MyHomeTodoState();
}
List<String> todos=[];
TextEditingController todoETController=TextEditingController();
GlobalKey<FormState> formKey=GlobalKey<FormState>();
class _MyHomeTodoState extends State<MyHomeTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            isDismissible: false,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                )
            ),
            isScrollControlled: true,
            enableDrag: true,
            builder: (context){
              return SizedBox(
                height: 700,
                child: Padding(
                  padding:const EdgeInsets.all(16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: todoETController,
                          validator: (String? value){
                            if(value?.trim().isEmpty ?? true){
                              return 'Enter New Todo';
                            }
                            return null;
                          },
                          decoration: allInputStyle(),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              todos.add(todoETController.text);
                              setState(() {});
                              todoETController.clear();
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(todos[index]),
          );
        },
      ),
    );
  }
}

