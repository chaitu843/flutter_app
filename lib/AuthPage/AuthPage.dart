import 'package:flutter/material.dart';
import '../routes.dart';
class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthPageState();
  }
  
}

class AuthPageState extends State<AuthPage> {
  String _email, _password;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Stack(
      children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('assets/logo/256x256.jpg'),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0,),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (String value) {
                                Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                if (value.isEmpty) return "Email is required";
                                else if(!value.contains(RegExp(pattern))) return "Please Enter a Valid Email Id";
                                else return null;
                              },
                              onSaved: (String email) {
                                setState(() {
                                  _email = email;
                                });
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(icon: Icon(Icons.email), labelText: 'Email'),
                            ),
                            TextFormField(
                              validator: (String value) {
                                if (value.isEmpty)  return "Password is required";
                                else if (value.length < 8) return "Password should contain minimum 8 characters";
                                else return null;
                              },
                              onSaved: (String password) {
                                _password = password;
                              },
                              style: TextStyle(fontWeight: FontWeight.w300),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.security),
                                  labelText: 'Password'),
                            ),
                            // Container(
                            //     padding: EdgeInsets.only(top: 10.0),
                            //     child: showAuthMessage
                            //         ? Text(
                            //              errMsg,
                            //             style: TextStyle(
                            //                 color: Colors.red,
                            //                 fontFamily: "Nunito"),
                            //                 textAlign: TextAlign.center,
                            //           )
                            //         : SizedBox()),
                            Container(
                                width: MediaQuery.of(context).size.width/4,
                                margin: EdgeInsets.only(
                                  top: 40.0,
                                ),
                                child: FlatButton(
                                  color: Theme.of(context).buttonColor,
                                  child: Text(
                                    "Login",
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.0)),
                                  onPressed: () {
                                     Navigator.of(context).pushNamed(Routes.HOME_PAGE);
                                    // // Navigator.of(context).pushNamedAndRemoveUntil(Routes.ADMIN_HOME, (Route route) => route == null);
                                    //  Firestore.instance.collection(Routes.USERS_COLLECTION).document('136428').get().then((onValue){
                                    //    print(onValue.data);
                                    //    Navigator.of(context).pushNamedAndRemoveUntil(Routes.USER_HOME, (Route route) => route == null, arguments: {'user' : onValue.data});
                                    // });
                                    // if (_formKey.currentState.validate()) {
                                    //    _formKey.currentState.save();
                                    // } else print('VAlidation Issue');
                                  //   setState(() {
                                  //         isLoading = true;
                                  //       });
                                  //   FirebaseAuth.instance.signInWithEmailAndPassword(email: _email,password: _passowrd).then((onValue){
                                  //     Firestore.instance.collection(Routes.USERS_COLLECTION).where('emailId',isEqualTo:_email).getDocuments().then((onValue){
                                  //       final Map<String, dynamic> user = onValue.documents[0].data;
                                  //       switch (user['userType']) {
                                  //         case 'user':
                                  //           Navigator.of(context).pushNamedAndRemoveUntil(Routes.USER_HOME, (Route route) => route == null, arguments: {'user' : user});
                                  //           break;
                                  //         case 'admin':
                                  //           Navigator.of(context).pushNamedAndRemoveUntil(Routes.ADMIN_HOME, (Route route) => route == null);
                                  //           break;
                                  //         case 'driver':
                                  //           Navigator.of(context).pushNamedAndRemoveUntil(Routes.DRIVER_HOME, (Route route) => route == null, arguments: {'user' : user});
                                  //           break;
                                  //         default:
                                  //           setState((){
                                  //             isLoading = false;
                                  //             showAuthMessage = true;
                                  //             errMsg = 'Something is Wrong..Please try again';
                                  //           });
                                  //       }
                                  //    });
                                  //   }).catchError((error){
                                  //     setState(() {
                                  //       isLoading = false;
                                  //       showAuthMessage = true;
                                  //       errMsg = error.message; 
                                  //     });
                                  //   });
                                  },
                                )),
                            SizedBox(height: 25.0,),
                            FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.height)),
                                  onPressed: () {
                                       //  Navigator.of(context).pushNamed(Routes.REGISTER_PAGE);
                                  },
                                  child: Text(
                                    "Create an Account?",
                                    style: TextStyle(fontSize: 14.0, decoration: TextDecoration.underline),
                                  ),
                                )
                          ],
                        ),
                      ),
                    ),
                    ],
                ),
                isLoading ? Container(
                  color: Colors.black45,
                  child: Center(child: CircularProgressIndicator(backgroundColor: Colors.transparent,),),) : Container()
      ],
    ),
    );
  }
  
}


/*
 * State is being set on click of login button, provided form is validated. Then call to database should be happened with the state variables, and set isLoading to true.
 * showAuthMessage for the error from database
 * 
 * 
 * 
 * Stack of a column and the loader, column of Image and form, form inturn containing a column of 2 form fields and 2 buttons
*/