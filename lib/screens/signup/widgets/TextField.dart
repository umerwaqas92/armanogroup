import 'package:armanogroup/utills/MyColors.dart';
import 'package:flutter/material.dart';





class MYTextField extends StatefulWidget {


  String label,hint;
  TextInputType inputType;
  Function onSave;
  Function Validator;
  int maxlines=1;
  String text;

  TextEditingController _controller = TextEditingController();





  MYTextField(this.label, this.hint, this.inputType,this.onSave,this.Validator,this.maxlines,this.text);




  @override
  _MYTextFieldState createState() => _MYTextFieldState(this.label, this.hint, this.inputType,this.onSave,this.Validator,this.maxlines,_controller,text);
}

class _MYTextFieldState extends State<MYTextField> {


  String label,hint;
  TextInputType inputType;
  Function onSave;
  Function Validator;
  bool isempty=true;
  int maxlines=1;
  TextEditingController _controller ;
  String text;







  _MYTextFieldState(this.label, this.hint, this.inputType,this.onSave,this.Validator,this.maxlines,this._controller,this.text);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.value=TextEditingValue(text: text);
    setState(() {

    });
  }




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
          maxLines: maxlines,
          textAlign: TextAlign.start,



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
