import 'package:flutter/material.dart';
import 'package:kuiz_124210030/bookmark.dart';
//import 'package:pokemon/bookmark.dart';
import 'package:kuiz_124210030/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class detail extends StatefulWidget {
  const detail({super.key, required this.dataBuku});

  final DataBuku dataBuku;

  @override
  State<detail> createState() => _detailState();
}
class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(widget.dataBuku.title)
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: <Widget>[
          BookmarkButton(),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.dataBuku.imageLink)
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Judul Buku           :',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  widget.dataBuku.title,
                  style: TextStyle(
                    color: Colors.yellow[900],
                    fontSize: 20,
                  ),
                ),
              ],
              ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Pengarang            :',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  widget.dataBuku.author,
                  style: TextStyle(
                    color: Colors.yellow[900],
                    fontSize: 20,
                  ),
                ),
              ],
             ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Tahun Terbit         :',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                widget.dataBuku.year.toString(),
                style: TextStyle(
                  color: Colors.yellow[900],
                  fontSize: 20,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Negara                  :',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                widget.dataBuku.country,
                style: TextStyle(
                  color: Colors.yellow[900],
                  fontSize: 20,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Bahasa                  :',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                widget.dataBuku.language,
                style: TextStyle(
                  color: Colors.yellow[900],
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Jumlah Halaman :',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                widget.dataBuku.pages.toString(),
                style: TextStyle(
                  color: Colors.yellow[900],
                  fontSize: 20,
                ),
              ),
            ],
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launcher(widget.dataBuku.link);
        },
        tooltip: 'Open Web',
        child: Icon(Icons.open_in_browser_outlined),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Future<void> _launcher(String url) async{
    final Uri _url = Uri.parse(url);
    if(!await launchUrl(_url)){
      throw Exception("gagal membuka url : $_url");
    }
  }
}
