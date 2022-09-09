// // ignore_for_file: file_names, prefer_const_constructors
// // ignore: sort_child_properties_last
// import 'package:bmi_app/result.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/material.dart';
// import '../auth_methods.dart';
// import '../enum.dart';
// import '../calculation.dart';
// import '../result.dart';

// class InputPage extends StatefulWidget {
//   const InputPage({Key? key}) : super(key: key);

//   @override
//   _InputPageState createState() => _InputPageState();
// }

// class _InputPageState extends State<InputPage> {
//   final TextEditingController _controllerHeight = TextEditingController();
//   final TextEditingController _controllerWeight = TextEditingController();
//   final TextEditingController _controllerAge = TextEditingController();
//   final TextEditingController _controllerName = TextEditingController();
//   final TextEditingController _controllerDob = TextEditingController();
//   final TextEditingController _controllerGender = TextEditingController();
//   bool _isLoading = false;
//   final TextEditingController _controllerTime = TextEditingController();
//   final TextEditingController _controllerPass = TextEditingController();
//   // final TextEditingController _controllerIdealWR = TextEditingController();

//   @override
//   void dispose() {
//     super.dispose();
//     // _emailController.dispose();
//     // _passController.dispose();
//   }

//   showSnackBar(String content, BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(content),
//       ),
//     );
//   }

//   double bmires = 0;
//   String bmiAge = 'Age';
//   // double bmires = o;
//   void initState() {
//     Logic l = Logic();
//     // bmires = l.calculateBMI(
//     //   int.parse(_controllerHeight.text),
//     //   int.parse(_controllerWeight.text),
//     // );
//     super.initState();
//   }

//   void signUpUser() async {
//     setState(() {
//       _isLoading = true;
//     });
//     String res = await AuthMethods().signUpUser(
//       gender: _controllerGender.text,
//       height: _controllerHeight.text,
//       weight: _controllerWeight.text,
//       username: _controllerName.text,
//       dob: _controllerDob.text,
//       bmi: bmires.toString(),
//       age: _controllerAge.text,
//       email: _controllerTime.text,
//       password: _controllerTime.text,
//     );

//     setState(() {
//       _isLoading = false;
//     });

//     if (res != 'sucess') {
//       showSnackBar(res, context);
//     }
//   }

//   Widget _submitButton() {
//     return ElevatedButton(
//         // onPressed:
//         //     isLogin ? signInEmailAndPassword : createUserWithEmailAndPassword,
//         onPressed: () => [
//               signUpUser(),
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => ResultPage(
//                           height: double.parse(_controllerHeight.text),
//                           weight: double.parse(_controllerWeight.text),
//                           age: _controllerAge.text,
//                           dob: _controllerDob.text,
//                           gender: _controllerGender.text,
//                           name: _controllerName.text,
//                         )),
//               )
//             ],
//         // onPressed: signUpUser,
//         // () {
//         //   Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //         builder: (context) => ResultPage(
//         //               height: double.parse(_controllerHeight.text),
//         //               weight: double.parse(_controllerWeight.text),
//         //               age: _controllerAge.text,
//         //               dob: _controllerDob.text,
//         //               gender: _controllerGender.text,
//         //               name: _controllerName.text,
//         //             )),
//         //   );
//         // },
//         child: Text('Calculate'
//             // isLogin ? 'Login' : 'Register',
//             ));
//   }

//   Widget _entryField(
//     String title,
//     TextEditingController controller,
//   ) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: title,
//       ),
//     );
//   }

//   // Gender selectedCard = Gender.unSelected;
//   // int sliderValue = 0;
//   // int weight = 40;
//   // int Age = 10;
//   // int height=0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Bmi Calculator'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _entryField('Name', _controllerName),
//             _entryField('Age', _controllerAge),
//             _entryField('Gender', _controllerGender),
//             _entryField('Dob', _controllerDob),
//             _entryField('Height', _controllerHeight),
//             _entryField('Weight', _controllerWeight),
//             _entryField('EMAIL', _controllerTime),
//             _entryField('PASS', _controllerPass),

//             // _entryField('Height', _controllerHeight),
//             // _entryField('Weight', _controllerWeight),
//             // _entryField('Age', _controllerAge),
//             SizedBox(
//               height: 20,
//             ),
//             _submitButton()
//             // _errorMessage(),
//             // _submitButton(),
//             // _loginOrRegisterButton()
//           ],
//         ),
//       ),
//     );

//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text(
//     //       "BMI Calculator",
//     //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//     //     ),
//     //     centerTitle: true,
//     //     backgroundColor: Colors.blueGrey,
//     //     foregroundColor: Colors.white,
//     //   ),
//     //   body: Container(
//     //     color: Colors.black,
//     //     child: Column(
//     //       children: [
//     //         Expanded(
//     //           child: Row(
//     //             children: [
//     //               Expanded(
//     //                 child: GestureDetector(
//     //                   onTap: () {
//     //                     setState(() {
//     //                       selectedCard = Gender.male;
//     //                     });
//     //                   },
//     //                   child: Container(
//     //                     margin: EdgeInsets.all(10),
//     //                     decoration: BoxDecoration(
//     //                       borderRadius: BorderRadius.circular(10),
//     //                       border: Border.all(
//     //                         color: Colors.blueGrey,
//     //                       ),
//     //                       color: selectedCard == Gender.male
//     //                           ? Colors.blueGrey
//     //                           : Colors.black,
//     //                     ),
//     //                     child: Column(
//     //                       mainAxisAlignment: MainAxisAlignment.center,
//     //                       // ignore: prefer_const_literals_to_create_immutables
//     //                       children: [
//     //                         // ignore: prefer_const_constructors
//     //                         Icon(
//     //                           FontAwesomeIcons.mars,
//     //                           color: Colors.white,
//     //                           size: 95,
//     //                         ),
//     //                         SizedBox(
//     //                           height: 10,
//     //                         ),
//     //                         Text(
//     //                           'MALE',
//     //                           style: TextStyle(
//     //                               fontSize: 20,
//     //                               color: Colors.white,
//     //                               fontWeight: FontWeight.bold),
//     //                         ),
//     //                       ],
//     //                     ),
//     //                   ),
//     //                 ),
//     //               ),
//     //               Expanded(
//     //                 child: GestureDetector(
//     //                   onTap: () {
//     //                     setState(() {
//     //                       selectedCard = Gender.female;
//     //                     });
//     //                   },
//     //                   child: Container(
//     //                     margin: EdgeInsets.all(10),
//     //                     decoration: BoxDecoration(
//     //                       borderRadius: BorderRadius.circular(10),
//     //                       color: selectedCard == Gender.female
//     //                           ? Colors.blueGrey
//     //                           : Colors.black,
//     //                       border: Border.all(
//     //                         color: Colors.blueGrey,
//     //                       ),
//     //                     ),
//     //                     child: Column(
//     //                       mainAxisAlignment: MainAxisAlignment.center,
//     //                       // ignore: prefer_const_literals_to_create_immutables
//     //                       children: [
//     //                         // ignore: prefer_const_constructors
//     //                         Icon(
//     //                           FontAwesomeIcons.venus,
//     //                           color: Colors.white,
//     //                           size: 95,
//     //                         ),
//     //                         SizedBox(
//     //                           height: 10,
//     //                         ),
//     //                         Text(
//     //                           'FEMALE',
//     //                           style: TextStyle(
//     //                               fontSize: 20,
//     //                               color: Colors.white,
//     //                               fontWeight: FontWeight.bold),
//     //                         ),
//     //                       ],
//     //                     ),
//     //                   ),
//     //                 ),
//     //               ),
//     //             ],
//     //           ),
//     //         ),
//     //         Expanded(
//     //           child: Row(
//     //             children: [
//     //               Expanded(
//     //                 child: Container(
//     //                     // ignore: sort_child_properties_last
//     //                     child: Column(
//     //                       mainAxisAlignment: MainAxisAlignment.center,
//     //                       // ignore: prefer_const_literals_to_create_immutables
//     //                       children: [
//     //                         Text(
//     //                           'Height',
//     //                           style: TextStyle(
//     //                               color: Colors.white,
//     //                               fontSize: 21,
//     //                               fontWeight: FontWeight.bold),
//     //                         ),
//     //                         Row(
//     //                           mainAxisAlignment: MainAxisAlignment.center,
//     //                           // ignore: prefer_const_literals_to_create_immutables
//     //                           children: [
//     //                             Text(
//     //                               sliderValue.toString(),
//     //                               style: TextStyle(
//     //                                   color: Colors.white, fontSize: 75),
//     //                             ),
//     //                             Text(
//     //                               "cm",
//     //                               style: TextStyle(
//     //                                   color: Colors.blueGrey,
//     //                                   fontSize: 19,
//     //                                   fontWeight: FontWeight.bold),
//     //                             ),
//     //                           ],
//     //                         ),
//     //                         Row(
//     //                           mainAxisAlignment: MainAxisAlignment.center,
//     //                           children: [
//     //                             GestureDetector(
//     //                               onTap: () {
//     //                                 setState(() {
//     //                                   if (sliderValue < 250) {
//     //                                     sliderValue++;
//     //                                   }
//     //                                 });
//     //                               },
//     //                               child: CircleAvatar(
//     //                                 backgroundColor: Colors.blueGrey,
//     //                                 radius: 20,
//     //                                 child: Icon(
//     //                                   FontAwesomeIcons.plus,
//     //                                   color: Colors.white,
//     //                                 ),
//     //                               ),
//     //                             ),
//     //                             Slider(
//     //                               value: sliderValue.toDouble(),
//     //                               min: 0.0,
//     //                               max: 250.0,
//     //                               onChanged: (value) {
//     //                                 setState(() {
//     //                                   sliderValue = value.toInt();
//     //                                 });
//     //                               },
//     //                               inactiveColor: Colors.white,
//     //                               activeColor: Colors.blueGrey,
//     //                             ),
//     //                             GestureDetector(
//     //                               onTap: () {
//     //                                 setState(() {
//     //                                   if (sliderValue > 0) sliderValue--;
//     //                                 });
//     //                               },
//     //                               child: CircleAvatar(
//     //                                 backgroundColor: Colors.blueGrey,
//     //                                 radius: 20,
//     //                                 child: Icon(
//     //                                   FontAwesomeIcons.minus,
//     //                                   color: Colors.white,
//     //                                 ),
//     //                               ),
//     //                             ),
//     //                           ],
//     //                         )
//     //                       ],
//     //                     ),
//     //                     margin: EdgeInsets.all(10),
//     //                     decoration: BoxDecoration(
//     //                       borderRadius: BorderRadius.circular(10),
//     //                       color: Colors.black,
//     //                       border: Border.all(
//     //                         color: Colors.blueGrey,
//     //                       ),
//     //                     )),
//     //               ),
//     //             ],
//     //           ),
//     //         ),
//     //         Expanded(
//     //           child: Row(
//     //             children: [
//     //               Expanded(
//     //                 child: Container(
//     //                     child: Column(
//     //                       mainAxisAlignment: MainAxisAlignment.center,
//     //                       // ignore: prefer_const_literals_to_create_immutables
//     //                       children: [
//     //                         Text(
//     //                           'Weight',
//     //                           style: TextStyle(
//     //                               fontSize: 20,
//     //                               fontWeight: FontWeight.bold,
//     //                               color: Colors.white),
//     //                         ),
//     //                         Text(
//     //                           '$weight',
//     //                           style: TextStyle(
//     //                             fontSize: 60,
//     //                             fontWeight: FontWeight.bold,
//     //                             color: Colors.white,
//     //                           ),
//     //                         ),
//     //                         Row(
//     //                           mainAxisAlignment: MainAxisAlignment.center,
//     //                           // ignore: prefer_const_literals_to_create_immutables
//     //                           children: [
//     //                             GestureDetector(
//     //                               onTap: () {
//     //                                 setState(() {
//     //                                   weight++;
//     //                                 });
//     //                               },
//     //                               child: CircleAvatar(
//     //                                 backgroundColor: Colors.blueGrey,
//     //                                 radius: 25,
//     //                                 child: Icon(
//     //                                   FontAwesomeIcons.plus,
//     //                                   color: Colors.white,
//     //                                 ),
//     //                               ),
//     //                             ),
//     //                             SizedBox(
//     //                               width: 20,
//     //                             ),
//     //                             GestureDetector(
//     //                               onTap: () {
//     //                                 setState(() {
//     //                                   if (weight > 0) weight--;
//     //                                 });
//     //                               },
//     //                               child: CircleAvatar(
//     //                                 backgroundColor: Colors.blueGrey,
//     //                                 radius: 25,
//     //                                 child: Icon(
//     //                                   FontAwesomeIcons.minus,
//     //                                   color: Colors.white,
//     //                                 ),
//     //                               ),
//     //                             ),
//     //                           ],
//     //                         )
//     //                       ],
//     //                     ),
//     //                     margin: EdgeInsets.all(10),
//     //                     decoration: BoxDecoration(
//     //                       borderRadius: BorderRadius.circular(10),
//     //                       color: Colors.black,
//     //                       border: Border.all(
//     //                         color: Colors.blueGrey,
//     //                       ),
//     //                     )),
//     //               ),
//     //               Expanded(
//     //                 child: Container(
//     //                     child: Column(
//     //                       mainAxisAlignment: MainAxisAlignment.center,
//     //                       // ignore: prefer_const_literals_to_create_immutables
//     //                       children: [
//     //                         Text(
//     //                           'Age',
//     //                           style: TextStyle(
//     //                               fontSize: 20,
//     //                               color: Colors.white,
//     //                               fontWeight: FontWeight.bold),
//     //                         ),
//     //                         Text(
//     //                           '$Age',
//     //                           style: TextStyle(
//     //                               fontSize: 60,
//     //                               color: Colors.white,
//     //                               fontWeight: FontWeight.bold),
//     //                         ),
//     //                         Row(
//     //                           mainAxisAlignment: MainAxisAlignment.center,
//     //                           // ignore: prefer_const_literals_to_create_immutables
//     //                           children: [
//     //                             GestureDetector(
//     //                               onTap: () {
//     //                                 setState(() {
//     //                                   Age++;
//     //                                 });
//     //                               },
//     //                               child: CircleAvatar(
//     //                                 backgroundColor: Colors.blueGrey,
//     //                                 radius: 25,
//     //                                 child: Icon(
//     //                                   FontAwesomeIcons.plus,
//     //                                   color: Colors.white,
//     //                                 ),
//     //                               ),
//     //                             ),
//     //                             SizedBox(
//     //                               width: 20,
//     //                             ),
//     //                             GestureDetector(
//     //                               onTap: () {
//     //                                 setState(() {
//     //                                   if (Age > 0) Age--;
//     //                                 });
//     //                               },
//     //                               child: CircleAvatar(
//     //                                 backgroundColor: Colors.blueGrey,
//     //                                 radius: 25,
//     //                                 child: Icon(
//     //                                   FontAwesomeIcons.minus,
//     //                                   color: Colors.white,
//     //                                 ),
//     //                               ),
//     //                             ),
//     //                           ],
//     //                         )
//     //                       ],
//     //                     ),
//     //                     margin: EdgeInsets.all(10),
//     //                     decoration: BoxDecoration(
//     //                       borderRadius: BorderRadius.circular(10),
//     //                       color: Colors.black,
//     //                       border: Border.all(
//     //                         color: Colors.blueGrey,
//     //                       ),
//     //                     )),
//     //               ),
//     //             ],
//     //           ),
//     //         ),
//     //         GestureDetector(
//     //           onTap: () {
//     //             Navigator.push(
//     //               context,
//     //               MaterialPageRoute(
//     //                   builder: (context) => ResultPage(
//     //                         height: sliderValue,
//     //                         weight: weight,
//     //                         age: Age,
//     //                       )),
//     //             );
//     //           },
//     //           child: Container(
//     //             height: 80,
//     //             width: double.infinity,
//     //             color: Colors.blueGrey,
//     //             // ignore: prefer_const_constructors
//     //             child: Center(
//     //               // ignore: prefer_const_constructors
//     //               child: Text(
//     //                 'CALCULATE',
//     //                 // ignore: prefer_const_constructors
//     //                 style: TextStyle(
//     //                   fontWeight: FontWeight.bold,
//     //                   color: Colors.white,
//     //                   fontSize: 30,
//     //                 ),
//     //               ),
//     //             ),
//     //           ),
//     //         )
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }

//   calculateBMI(TextEditingController controllerHeight,
//       TextEditingController controllerWeight) {}
// }
