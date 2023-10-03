
import 'package:flutter/material.dart';
import 'package:kuiz_124210030/data_buku.dart';
import 'package:kuiz_124210030/detailpage.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text('Data Buku')
            ),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: listBuku.length,
              itemBuilder: (context, index) {
                final DataBuku dataBuku = listBuku[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => detail(dataBuku: dataBuku)));
                  },
                  child: Card(
                    child: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Image(
                            image: NetworkImage(dataBuku.imageLink),
                            height: 450,

                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          dataBuku.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),));
  }
  Future<void> _launcher(String url) async{
    final Uri _url = Uri.parse(url);
    if(!await launchUrl(_url)){
      throw Exception("gagal membuka url : $_url");
    }
  }
}