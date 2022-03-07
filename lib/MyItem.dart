//@drat=2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'mymodel.dart';





class Parlour extends StatefulWidget {
  const Parlour({Key? key}) : super(key: key);

  @override
  _ParlourState createState() => _ParlourState();
}

class _ParlourState extends State<Parlour> {


  List<ParlourModelClass> _list = [
    ParlourModelClass("Hair Color", false),
    ParlourModelClass("Karatin", false),
    ParlourModelClass("Rebonding", false),
    ParlourModelClass("Wax", false),
    ParlourModelClass("Menicure/Pedicure", false),
    ParlourModelClass("Make Up", false),
    ParlourModelClass("Spa", false),
    ParlourModelClass("Facial", false),
    ParlourModelClass("Hair Cut", false),
    ParlourModelClass("Eyebrow", false),
  ];

  List<ParlourModelClass> selectedItem = [];

  var parlourService;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getParlour();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Parlour Services"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context,index){
              return parlourServiceItem(_list[index].name,_list[index].isSelected,index);
            }
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 100),
        child: SizedBox(
          width: double.infinity,
          child: RaisedButton(
            color: Colors.pink[700],
            child: Text("Order (${selectedItem.length})",style: TextStyle(color: Colors.white),),
            onPressed: () {
            },
          ),
        ),
      ),
    );
  }
  Widget parlourServiceItem(String name, bool isSelected, int index){
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.pink,
        child: Icon(Icons.baby_changing_station_outlined,color: Colors.white,),
      ),
      title: Text(name,style: const TextStyle(fontSize: 18),),
      trailing: isSelected ? Icon(Icons.check_circle,color: Colors.green[700],)
          : const Icon(Icons.check_circle,color: Colors.grey,
      ),
      onTap: (){
        setState(() {
          _list[index].isSelected = !_list[index].isSelected;
          if(_list[index].isSelected == true){
            selectedItem.add(ParlourModelClass(name,true));
            // orderItem.add(ParlourOrderClass(name));
          }else if(_list[index].isSelected==false)
          {
            selectedItem.removeWhere((element) => element.name==_list[index].name);
          }
        });
      },
    );
  }

}
