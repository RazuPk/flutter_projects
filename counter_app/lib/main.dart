import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const CounterApp(),
    );
  }
}
class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

mySnackBar(message,context){
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
  );
}
int count=0;
class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter App'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            if(count>0){
              count--;
            }else{
              mySnackBar('Min value exceed!', context);
            }
            setState(() {});
          },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: (){
              count++;
              setState(() {});
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Count Number:',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
            Text(count.toString(),style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

