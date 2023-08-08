// ignore_for_file: file_names
//
//
// // ignore_for_file: non_constant_identifier_names, prefer_const_constructors, file_names
//
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebasetutorial/Screens/HomeScreen.dart';
// import 'package:firebasetutorial/utils/CustomButton.dart';
// import 'package:flutter/material.dart';
//
// class AddPost extends StatefulWidget {
//   const AddPost({super.key});
//
//   @override
//   State<AddPost> createState() => _AddPostState();
// }
//
// class _AddPostState extends State<AddPost> {
//   bool  loading =false;
//   final TextController = TextEditingController();
//   final FirebaseReference = FirebaseDatabase.instance.ref("Message");
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AddPost'),
//         centerTitle: true,
//         leading: GestureDetector(
//           onTap: (){
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
//           },
//           child: Icon(Icons.arrow_back),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(padding: EdgeInsets.all(20,),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               TextFormField(
//                 maxLines: 4,
//                 controller: TextController,
//                 decoration: InputDecoration(
//                     hintText: 'Enter the text',
//                     suffixIcon: Icon(Icons.edit_document),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     )
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height/1.7,),
//               Custom_Button(
//                   title: 'Add Data',
//                   ontap: (){
//                   FirebaseReference.child("Message").set({
//                     'title' : TextController.text.toString(),
//                      'id' : 1,
//                   });
//                   },
//                   loading: loading)
//             ],
//           ),
//         ),
//         ),
//       ),
//     );
//   }
// }
