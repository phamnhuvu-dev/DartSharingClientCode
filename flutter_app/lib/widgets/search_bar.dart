import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class SearchBar extends StatefulWidget {
  final double height = 40.0;

  const SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.picton_blue),
        borderRadius: BorderRadius.circular(widget.height / 2),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0.0),
                ),
              ),
            ),
            Icon(
              Icons.search,
              color: AppColors.picton_blue,
            ),
          ],
        ),
      ),
    );
  }
}
