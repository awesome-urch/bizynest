import 'package:bizynest/models/category_model.dart';
import 'package:flutter/material.dart';


class ListViewCategories extends StatelessWidget {
  final List<MyCategory> posts;

  ListViewCategories({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget contain1 = Container(
      child: ListView.builder(
          itemCount: posts.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  title: Text(
                    '${posts[position].name}',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    '${posts[position].name}',
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 35.0,
                        child: Text(
                          'User ${posts[position].id}',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () => _onTapItem(context, posts[position]),
                ),
              ],
            );
          }),
    );

    Widget contain2 = Container(
      child: ListView.builder(
          itemCount: posts.length,
          //padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 1.0),
                CheckboxListTile(
                  value: false,
                  onChanged: (value) {
                    //setState(() {
                    //  _termsChecked = value;
                    //});
                  },
                  //subtitle: !_termsChecked
                  //    ? Text(
                  //  'Required',
                  //  style: TextStyle(color: Colors.red, fontSize: 12.0),
                  //)
                  //    : null,
                  title: new Text(
                    '${posts[position].name}',
                    style: TextStyle(color:Colors.white),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                )
              ],
            );
          }),
    );

    return contain2;
  }

  void _onTapItem(BuildContext context, MyCategory post) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text(post.id.toString() + ' - ' + post.name)));
  }
}