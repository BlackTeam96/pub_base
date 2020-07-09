// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pub_base/pub_base.dart';
// import 'package:pub_base/src/login/under_contruction.dart';
// import 'package:pub_base/src/utils/navigator.dart';

// class PhoneInput extends BasePage {
//   PhoneInput({Key key}) : super(key: key);
//   @override
//   _PhoneInputState createState() => _PhoneInputState();
// }

// class _PhoneInputState extends BaseState<PhoneInput>
//     with BasicPage {
//   final _phoneController = TextEditingController();
//   final _codeController = TextEditingController();

//   String _errorMessage = "";

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   String screenName() => "Phone Input";

//   @override
//   Widget body(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(32),
//       child: Form(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             TextFormField(
//               decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8)),
//                       borderSide: BorderSide(color: Colors.grey[200])),
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8)),
//                       borderSide: BorderSide(color: Colors.grey[300])),
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                   hintText: "Phone"),
//               controller: _phoneController,
//               keyboardType: TextInputType.phone,
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             (_errorMessage == "") ? Text("") : Text(_errorMessage),
//             SizedBox(
//               height: 8,
//             ),
//             Container(
//               width: double.infinity,
//               child: FlatButton(
//                 child: Text("Next"),
//                 textColor: Colors.white,
//                 padding: EdgeInsets.all(16),
//                 onPressed: () {
//                   this.setState(() => {_errorMessage: ""});
//                   final phone = _phoneController.text.trim();
//                   loginUser(phone, context);
//                 },
//                 color: Colors.blue,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   bool showLoading() {
//     return false;
//   }

//   @override
//   AppBar customAppbar() {
//     return null;
//   }

//   Future<bool> loginUser(String phone, BuildContext context) async {
//     FirebaseAuth _auth = FirebaseAuth.instance;

//     _auth.verifyPhoneNumber(
//         phoneNumber: phone,
//         timeout: Duration(seconds: 60),
//         verificationCompleted: (AuthCredential credential) async {
//           Navigator.of(context).pop();

//           AuthResult result = await _auth.signInWithCredential(credential);

//           FirebaseUser user = result.user;

//           if (user != null) {
//             NavigatorUtils.pushToScreen(UnderContruction(), context);
//           } else {
//             print("Error");
//           }
//         },
//         verificationFailed: (AuthException exception) {
//           this.setState(() => {_errorMessage: exception.message});
//           print(exception);
//         },
//         codeSent: (String verificationId, [int forceResendingToken]) {
//           showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (context) {
//                 return AlertDialog(
//                   title: Text("Give the code?"),
//                   content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       TextField(
//                         controller: _codeController,
//                       ),
//                     ],
//                   ),
//                   actions: <Widget>[
//                     FlatButton(
//                       child: Text("Confirm"),
//                       textColor: Colors.white,
//                       color: Colors.blue,
//                       onPressed: () async {
//                         final code = _codeController.text.trim();
//                         AuthCredential credential =
//                             PhoneAuthProvider.getCredential(
//                                 verificationId: verificationId, smsCode: code);

//                         AuthResult result =
//                             await _auth.signInWithCredential(credential);

//                         FirebaseUser user = result.user;

//                         if (user != null) {
//                           NavigatorUtils.pushToScreen(UnderContruction(), context);
//                         } else {
//                           print("Error");
//                         }
//                       },
//                     )
//                   ],
//                 );
//               });
//         },
//         codeAutoRetrievalTimeout: null);
//   }
// }
