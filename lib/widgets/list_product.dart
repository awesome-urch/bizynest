import 'package:bizynest/constants.dart';
import 'package:bizynest/models/product_model.dart';
import 'package:flutter/material.dart';



class ListViewProducts extends StatelessWidget {
  final List<Product> posts;

  ListViewProducts({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget contain01 = GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: posts.length,
      itemBuilder: (context, position) {
        return Card(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //Image.network(AppConstants.BASE_WEBSITE + posts[position].pphoto),
              ListTile(
                //leading: Icon(Icons.album),
                title: Text('${posts[position].pname}'),
                subtitle: Text('${posts[position].store_uid}'),
              ),
              ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
                    /*FlatButton(
                      child: Text('BUY TICKETS'),
                      onPressed: () { },
                    ),*/
                    FlatButton(
                      child: Text('Negotiate'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

    Widget contain0 = GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: posts.length,
      itemBuilder: (context, position) {
        return Image.network(AppConstants.BASE_WEBSITE + posts[position].pphoto);
      },
    );

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
                    '${posts[position].pname}',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    '${posts[position].pprice}',
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
                          'User ${posts[position].product_id}',
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
                    '${posts[position].pname}',
                    style: TextStyle(color:Colors.white),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                )
              ],
            );
          }),
    );

    return contain01;
  }

  void _onTapItem(BuildContext context, Product post) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text(post.product_id.toString() + ' - ' + post.pname)));
  }
}