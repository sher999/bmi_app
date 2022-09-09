// ignore_for_file: file_names, prefer_const_constructors
// ignore: sort_child_properties_last
import 'package:bmi_app/methods/calculation.dart';
import 'package:bmi_app/methods/result.dart';
import 'package:flutter/material.dart';
import '../auth_methods/auth.dart';
import '../auth_methods/auth_methods.dart';
import '../methods/result.dart';
import 'user_list.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _controllerHeight = TextEditingController();
  final TextEditingController _controllerWeight = TextEditingController();
  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerDob = TextEditingController();
  final TextEditingController _controllerGender = TextEditingController();
  bool _isLoading = false;
  final TextEditingController _controllerTime = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final TextEditingController _controllerIdealWR = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controllerTime.dispose();
    _controllerIdealWR.dispose();
    _controllerPass.dispose();
    _controllerGender.dispose();
    _controllerDob.dispose();
    _controllerName.dispose();
    _controllerAge.dispose();
    _controllerWeight.dispose();
    _controllerHeight.dispose();
  }

  showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  double bmires = 0;
  String bmiAge = 'Age';

  void initState() {
    Logic l = Logic();

    super.initState();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      gender: _controllerGender.text,
      height: _controllerHeight.text,
      weight: _controllerWeight.text,
      name: _controllerName.text,
      dob: _controllerDob.text,
      bmi: bmires.toString(),
      age: _controllerAge.text,
      // email: _controllerTime.text,
      // password: _controllerTime.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'sucess') {
      showSnackBar(res, context);
    }
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: () => [
              signUpUser(),
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          height: double.parse(_controllerHeight.text),
                          weight: double.parse(_controllerWeight.text),
                          age: _controllerAge.text,
                          dob: _controllerDob.text,
                          gender: _controllerGender.text,
                          name: _controllerName.text,
                        )),
              )
            ],
        child: Text('Calculate'));
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _sighOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bmi Calculator'),
        actions: [_sighOutButton()],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // _entryField('Name', _controllerName),
              // _entryField('Age', _controllerAge),
              // _entryField('Gender', _controllerGender),
              // _entryField('Dob', _controllerDob),
              // _entryField('Height (meters)', _controllerHeight),
              // _entryField('Weight (kg)', _controllerWeight),
              // _entryField('EMAIL', _controllerTime),
              // _entryField('PASS', _controllerPass),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      controller: _controllerName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Name(John)',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _controllerAge,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Age(22)',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      // obscureText: true,
                      controller: _controllerGender,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Gender(male/female)',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // obscureText: true,
                      controller: _controllerDob,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Dob(10/12/2000)',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // obscureText: true,
                      controller: _controllerHeight,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Height(meters)',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // obscureText: true,
                      controller: _controllerWeight,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Weight(kg)',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _submitButton()
            ],
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            // const DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.blueGrey,
            //   ),
            //   child: Text('Drawer Header'),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            ListTile(
                title: const Text('Add New User'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SignUpSreen()),
                  // );
                }),
            ListTile(
              title: const Text('See All User'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserD()),
                );
              },
            ),
            ListTile(
              title: const Text('Sign Out'),
              onTap: signOut,
            ),
          ],
        ),
      ),
    );
  }

  calculateBMI(TextEditingController controllerHeight,
      TextEditingController controllerWeight) {}
}
