import 'package:flutter/material.dart';
import 'login_page.dart';

class Login2 extends StatefulWidget{
  const Login2({Key? key}) : super(key:key);

  @override
  State<Login2> createState() => _Login2State();

}
class _Login2State extends State<Login2>
{ var _val2 = false; //chechbox
  String? _str1 ; //RadioListTile
  bool r1=false; //email
  bool r2=false; //sms
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child : Column(
            children:  [
              SizedBox(height: 55,),
              //Login Verification
              Text('Login Verification',
              style : TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xFF06061C),
              )),
              SizedBox(height: 25,),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25,10,25,10),
                  child: Text('To continue logging in we need you to complete one of the following:',
                  textAlign: TextAlign.center,
                  style : TextStyle(
                    fontSize: 20,
                  )),
                ),
              ),
                SizedBox(height:25 ,),

              RadioListTile(
                title: Text("Verification code via email"),
                activeColor: Color(0xFF06061C),
                value: "email",
                groupValue: _str1,
                onChanged: ((value) {
                  setState(() {
                    _str1 = value.toString();
                    r1=true;
                    r2=false;
                  });
                }),
              ),
              RadioListTile(
                title: Text("Verification code via SMS"),
                activeColor: Color(0xFF06061C),
                value: "SMS",
                groupValue: _str1,
                onChanged: ((value) {
                  setState(() {
                    _str1 = value.toString();
                    r1=false;
                    r2=true;
                  });
                }),
              ),



          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(60,0,25,10),
            child: responsivetext() , // responsive text according to the option selected.

          ),

          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:60),
                child: Container(
                        decoration: BoxDecoration(
                          color:const Color(0xFF06061C),
                          border: Border.all(color:const Color(0xFF06061C), ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 50,
                        width : 125,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF06061C),
                            ),
                            child: const Text('Send Code',
                            style: TextStyle(fontSize: 16,
                            ),),
                            onPressed: () {
                              
                            },
                          ),
                        
                    ),
              ),
            ],
          ),
            
          SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: Row(
                  children: [
                    Transform.scale(
                        scale: 1.3,
                        child: Checkbox( //only check box
                            activeColor: Color(0xFF06061C),
                            value: _val2, //unchecked
                            onChanged: (bool? value){
                              //value returned when checkbox is clicked
                              setState(() {
                                _val2 = value!;
                              });
                            }
                        )
                    ),
                    Text(
                        "   Remember this device",
                        style: TextStyle(fontSize: 15.0,color:Color(0xFF06061C),fontWeight: FontWeight.bold, ),

                    ),],),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50,0,25,10),
                      child: Text(
                        'Don\'t select this option if you are using a public computer.',
                        textAlign: TextAlign.left,
                        style: TextStyle(

                          color: Colors.grey[700],
                          fontSize: 15,
                        ),
                      ),
                    ),
              SizedBox(height: 80,),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor:  Colors.white,
                ),
                child: const Text('Return to Login',
                  style: TextStyle(fontSize: 15,color: Colors.deepPurpleAccent,
                  ),),
                onPressed: () {
                  Navigator. of(context). push(MaterialPageRoute(builder: (context)=>LoginPage()));
                },
              ),
          ],
        ),
      ),);


  }
  Widget responsivetext(){
    if(r1){
      return Text('We will be sending a code on your email that can be entered to verify the accout.',
      textAlign: TextAlign.left,
                    style: TextStyle(
        
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),);
    }
    else if(r2){
      return Text("We will be sending a code on your mobile phone which can be entered to verify the account",
      textAlign: TextAlign.left,
                    style: TextStyle(
        
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),);
    }
    else return Text('Select one of the above options for account verification ',
    textAlign: TextAlign.left,
                    style: TextStyle(
        
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),);
  }
}