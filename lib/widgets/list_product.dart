import 'package:bizynest/constants.dart';
import 'package:bizynest/models/product_model.dart';
import 'package:flutter/material.dart';



class ListViewProducts extends StatelessWidget {
  final List<Product> posts;
  static const _navIconSize = 18.0;

  ListViewProducts({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    Widget contain01 = GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        /*childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 4),*/
        childAspectRatio: (itemWidth / itemHeight)
      ),
      itemCount: posts.length,
      itemBuilder: (context, position) {
        return SizedBox(
          //height: 600,
          child:Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisSize: MainAxisSize.min, //Image.network(AppConstants.BASE_WEBSITE + posts[position].pphoto)
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                /*Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(AppConstants.BASE_WEBSITE + posts[position].pphoto,
                      fit: BoxFit.contain,
                      //height: 500.0,
                    )
                )
              ),*/
                Expanded(
                  child: Image.network(
                    AppConstants.BASE_WEBSITE + posts[position].pphoto,
                    fit: BoxFit.cover, // add this
                    //height: 100,
                  ),
                ),
                //Image.network(AppConstants.BASE_WEBSITE + posts[position].pphoto),
                /*Container(
                  //padding: EdgeInsets.all(4.0),
                  child: Align(
                    alignment: Alignment(-30,0),
                    child: ListTile(
                      //leading: Icon(Icons.album),
                      title: Text('${posts[position].pname}'),
                      subtitle: Text('${posts[position].store_uid}'),
                    ),
                  ),
                ),*/
                Container(
                  padding: EdgeInsets.all(4.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("${posts[position].pname}",style: TextStyle(fontSize: 16.0 )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("${posts[position].store_uid}",style: TextStyle(color: AppConstants.appBlue, )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("₦${posts[position].pprice}",style: TextStyle(color: AppConstants.appPurple, )),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.thumb_up,
                              size: _navIconSize,
                            ),
                            Text(
                                '${posts[position].likes}',
                                style: TextStyle(fontSize: 12.0, )
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye,
                              size: _navIconSize,
                            ),
                            Container(
                                child: Text(
                                    '${posts[position].views}',
                                    style: TextStyle(fontSize: 12.0,)
                                )
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Icon(
                              Icons.chat_bubble,
                              size: _navIconSize,
                                color: AppConstants.appPurple
                            ),
                            Container(
                                child: Text(
                                    'Negotiate',
                                    style: TextStyle(fontSize: 12.0, color: AppConstants.appPurple,)
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )

                /*ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
                    //FlatButton(
                    //  child: Text('BUY TICKETS'),
                    //  onPressed: () { },
                    //),
                    FlatButton(
                      child: Text('Negotiate'),
                      onPressed: () { *//* ... *//* },
                    ),
                  ],
                ),
              ),*/

              ],
            ),
          )
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