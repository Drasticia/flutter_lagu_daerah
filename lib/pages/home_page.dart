import 'package:flutter/material.dart';
import 'package:flutter_lagu_daerah/models/hoyovers.dart';
import 'package:flutter_lagu_daerah/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color((0xFFf7fff7)),
      appBar: AppBar(
        title: const Text(
          'Lagu Hololive',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        elevation: 4,
        backgroundColor: const Color((0xFF1A535C)),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context){
                return DetailPage(hoyovers: laguHoyoversList[index],);
              }));
            },
            child: Card(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              color: const Color((0xFF4ecdc4)),
              child: ListTile(
                title: Text(
                  laguHoyoversList[index].judulLagu,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ), 
                subtitle: Text(
                  '${laguHoyoversList[index].penyanyi} - ${laguHoyoversList[index].album}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 69, 69, 69)
                  ),
                ),
                leading: Image.network(
                  laguHoyoversList[index].foto, 
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        itemCount: laguHoyoversList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context){
            return AlertDialog(
              backgroundColor: const Color((0xFFf7fff7)),
              title: const Text(
                'Tambah Lagu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Judul Lagu',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Penyanyi'
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Album'
                    ),
                  )
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 174, 12, 0)
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color((0xFF4ecdc4)),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black
                    ),
                  )
                ),
              ]
            );
          });
        },
        backgroundColor: const Color((0xFF1A535C)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
