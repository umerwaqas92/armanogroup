import 'package:armanogroup/utills/MyColors.dart';
import 'package:flutter/material.dart';





class MYTextField extends StatefulWidget {


  String label,hint;
  TextInputType inputType;
  Function onSave;
  Function Validator;






  MYTextField(this.label, this.hint, this.inputType,this.onSave,this.Validator);


  @override
  _MYTextFieldState createState() => _MYTextFieldState(this.label, this.hint, this.inputType,this.onSave,this.Validator);
}

class _MYTextFieldState extends State<MYTextField> {


  String label,hint;
  TextInputType inputType;
  Function onSave;
  Function Validator;
  bool isempty=true;



  TextEditingController _controller = TextEditingController();


  _MYTextFieldState(this.label, this.hint, this.inputType,this.onSave,this.Validator);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: TextFormField(
        controller: _controller,
          keyboardType: inputType,


          onSaved:onSave,
          validator:Validator,

          onChanged: (val) {
            setState(() {
              isempty=(val=="");
            });
          },

          decoration: InputDecoration(
            suffixIcon: isempty?null:IconButton(icon:Icon(Icons.clear,color: MyColors.dark_bloe1,),onPressed: (){_controller.clear();setState(() {
              isempty=true;
            });},),


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
