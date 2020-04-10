import 'package:armanogroup/utills/MyColors.dart';
import 'package:flutter/material.dart';





class MYTextFieldPassword extends StatefulWidget {


  String label,hint;
  TextInputType inputType;
  Function onSave;
  Function Validator;






  MYTextFieldPassword(this.label, this.hint, this.inputType,this.onSave,this.Validator);


  @override
  _MYTextFieldPassword createState() => _MYTextFieldPassword(this.label, this.hint, this.inputType,this.onSave,this.Validator);
}

class _MYTextFieldPassword extends State<MYTextFieldPassword> {


  String label,hint;
  TextInputType inputType;
  Function onSave;
  Function Validator;
  bool showing=false;



  TextEditingController _controller = TextEditingController();


  _MYTextFieldPassword(this.label, this.hint, this.inputType,this.onSave,this.Validator);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: TextFormField(
          controller: _controller,
          keyboardType: inputType,

          onSaved:onSave,
          obscureText: !showing,
          validator:Validator,



          decoration: InputDecoration(
            suffixIcon: showing?IconButton(icon: Icon(Icons.clear,color: MyColors.dark_bloe1,),onPressed: (){
              showing=false;
              setState(() {

              });
            },)


                :IconButton(icon:Icon(Icons.remove_red_eye,color: MyColors.dark_bloe1,),onPressed: (){
              showing=true;
                  setState(() {

              }

            );},),


            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: MyColors.dark_bloe1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: MyColors.background_red)),


            labelText: label,
            hintText: hint,

          )
      ),
    );
  }
}
