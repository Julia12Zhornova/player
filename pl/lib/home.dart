import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Albums',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AlbumsPage(),
    );
  }
}
class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});
  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}
class _AlbumsPageState extends State<AlbumsPage> {
  final titles = ["Название 1", "Название 2", "Название 3", "Название 4",
    "Название 5", "Название 6", "Название 7", "Название 8","Название 9"];
  final subtitles = [
    "Исполнитель 1",
    "Исполнитель 2",
    "Исполнитель 3",
    "Исполнитель 4",
    "Исполнитель 5",
    "Исполнитель 6",
    "Исполнитель 7",
    "Исполнитель 8",
    "Исполнитель 9"
  ];
  final icons = ['res/p.jpg', 'res/p.jpg', 'res/p.jpg','res/p.jpg','res/p.jpg','res/p.jpg','res/p.jpg','res/p.jpg','res/p.jpg',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 9,
              itemBuilder: (context, index){
                return Card(
                    child: ListTile(
                      title: Text(titles[index]),
                      subtitle: Text(subtitles[index]),
                      leading: Image(image: AssetImage(icons[index])),
                      onTap: ()=>{
                        //Navigation.push()
                      },
                    )
                );
              },
            )),
      ),
    );
  }
}