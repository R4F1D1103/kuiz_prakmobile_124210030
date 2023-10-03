import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: _isBookmarked ? Colors.white : null,
      ),
      onPressed: () {
        setState(() {
          _isBookmarked = !_isBookmarked;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isBookmarked ? 'Berhasil menambahkan ke favorit.' : 'Berhasil menghapus dari favorit.'),
            backgroundColor : _isBookmarked ? Colors.lightGreen : Colors.red,
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
  }
}