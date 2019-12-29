import 'package:flutter/material.dart';

enum Page { dashboard , manage}

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey ;

  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();

  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Row(
          children: <Widget>[

            Expanded(
                child: FlatButton.icon(
                    onPressed: (){
                      setState(() => _selectedPage = Page.dashboard );
                    },
                    icon: Icon(Icons.dashboard , color: _selectedPage == Page.dashboard ? active :notActive),
                    label: Text("Dashboard")
                ),
            ),

            Expanded(
              child: FlatButton.icon(
                  onPressed: (){
                    setState(() => _selectedPage = Page.manage );
                  },
                  icon: Icon(Icons.sort , color: _selectedPage == Page.manage ? active :notActive),
                  label: Text("Manage")
              ),
            ),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: _loadScreen(),
    );
  }


  Widget _loadScreen() {
    switch( _selectedPage ){
      case Page.dashboard:
        return Column(
          children: <Widget>[
            ListTile(

              subtitle: FlatButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.attach_money , size: 30 , color: Colors.green,),
                  label: Text('12,100' , textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0 ,color: Colors.green ),)
              ),
              title: Text("Revenue" , textAlign: TextAlign.center,style: TextStyle(fontSize: 24.0 ,color: Colors.grey ),),
            ),

            Expanded(
              child: GridView( // grid 2 f row(children ) ==> dir ta 100 padding ayssatafhom 2 f row
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                ),

                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(

                        title: FlatButton.icon(
                            onPressed: null,
                            icon: Icon(Icons.people_outline ,size: 15,),
                            label: Text('Users' ,style: TextStyle(fontSize: 10.0 ),)
                        ),
                        subtitle: Text('7' ,
                          textAlign: TextAlign.center,style: TextStyle(fontSize: 50.0 ,color: active ),)
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(

                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.category,size: 15,),
                              label: Text('Categories',style: TextStyle(fontSize: 10.0 ),)
                          ),
                          subtitle: Text('23' ,
                            textAlign: TextAlign.center,style: TextStyle(fontSize: 50.0 ,color: active ),)
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(

                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.track_changes,size: 15,),
                              label: Text('Products',style: TextStyle(fontSize: 10.0 ),)
                          ),
                          subtitle: Text('120' ,
                            textAlign: TextAlign.center,style: TextStyle(fontSize: 50.0 ,color: active ),)
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(

                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.tag_faces,size: 15,),
                              label: Text('Solds',style: TextStyle(fontSize: 10.0 ),)
                          ),
                          subtitle: Text('13' ,
                            textAlign: TextAlign.center,style: TextStyle(fontSize: 50.0 ,color: active ),)
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(

                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.shopping_cart,size: 15,),
                              label: Text('Orders',style: TextStyle(fontSize: 10.0 ),)
                          ),
                          subtitle: Text('5' ,
                            textAlign: TextAlign.center,style: TextStyle(fontSize: 50.0 ,color: active ),)
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(

                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.close,size: 15,),
                              label: Text('Return',style: TextStyle(fontSize: 10.0 ),)
                          ),
                          subtitle: Text('0' ,
                            textAlign: TextAlign.center,style: TextStyle(fontSize: 50.0 ,color: active ),)
                      ),
                    ),
                  ),

                ],
              ),

            ),

          ],
        );
        break;
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add product"),
              onTap: (){},
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("Products List"),
              onTap: (){},
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text("Add Category"),
              onTap: (){
                _categoryAlert();
              },
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.category),
              title: Text("Category list"),
              onTap: (){},
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text("Add brand"),
              onTap: (){
                _brandAlert();
              },
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("brand list"),
              onTap: (){},
            ),
            Divider(),
          ],
        );
        break;
      default:
        return Container();
    }
  }

  void _categoryAlert() {
    var alert = new AlertDialog(
      key: _categoryFormKey, //to keep track of the state of the form
      content: TextFormField(
        controller: categoryController,
        validator: (value){
          if (value.isEmpty ){
            return 'category cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "add category"
        ),
      ),
      actions: <Widget>[
        FlatButton.icon(onPressed: (){}, icon:Icon(Icons.add), label: Text("Add")),
        FlatButton.icon(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.close), label: Text("Cancel"))
      ],
    );

    showDialog(context: context , builder: (_) => alert);
  }

  void _brandAlert() {
    var alert = new AlertDialog(
      key: _brandFormKey, //to keep track of the state of the form
      content: TextFormField(
        controller: categoryController,
        validator: (value){
          if (value.isEmpty ){
            return 'brand cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: "add brand"
        ),
      ),
      actions: <Widget>[
        FlatButton.icon(onPressed: (){}, icon:Icon(Icons.add), label: Text("Add")),
        FlatButton.icon(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.close), label: Text("Cancel"))
      ],
    );

    showDialog(context: context , builder: (_) => alert);
  }


}



