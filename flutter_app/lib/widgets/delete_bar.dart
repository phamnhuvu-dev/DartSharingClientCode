import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class DeleteBar extends StatefulWidget {
  final ValueGetter<void> onTapDelete;
  final ValueGetter<void> onTapCancel;

  const DeleteBar({Key key, this.onTapDelete, this.onTapCancel})
      : super(key: key);

  @override
  _DeleteBarState createState() => _DeleteBarState();
}

class _DeleteBarState extends State<DeleteBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: widget.onTapCancel,
                child: Text(
                  "CANCEL",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: widget.onTapDelete,
              child: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
