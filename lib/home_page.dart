
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textControler = TextEditingController();
  bool currentSwitchValue = false;
  double tip = 0;
  int? selectedradio = 0;
  var radioGroupValues ={
    0:"Amazing 20%",
    1:"Good 18%",
    2:"Okay 15%"
  };

   tipCalculation(){
    var costOfService = double.parse(textControler.text??"0");
    if(selectedradio == 0){
      tip=costOfService*0.20;
    }else if(selectedradio == 1){
      tip = costOfService*0.18;
    }else if(selectedradio == 2){
      tip = costOfService*0.15;
    }
    if(currentSwitchValue){
      tip = tip.ceilToDouble();
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tip Time'),
        ),
        body: ListView(
          children: [
            SizedBox(height: 14,),
            ListTile(
              leading: Icon(Icons.store),
              title: TextField(
                controller: textControler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Cost of Service"
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dinner_dining),
              title: Text("How was the service"),
            ),
            //Lista radio buttons
            Column(
              mainAxisSize: MainAxisSize.min,
              children: radioGroupValues.entries.map((element) => 
              ListTile(
                leading: Radio(
                  value: element.key, 
                  groupValue: selectedradio, 
                  onChanged: (int? currentselectedRadio){
                    //
                    selectedradio = currentselectedRadio;
                    setState(() {
                      
                    });
                  },),
                  title: Text("${element.value}"),
              ),
              ).toList(),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("Round tip?"),
              trailing: Switch(
                value: currentSwitchValue,
                 onChanged: (switchChanged){
                   //
                   currentSwitchValue = switchChanged;
                   setState(() {
                     
                   });
                 }
                )
              ),            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: MaterialButton(onPressed: (){
                tipCalculation();
                setState(() {
                  
                });
              }, 
              child: Text("Calculate", style: TextStyle(
                color: Colors.grey[200],

              ),),
              color: Colors.green,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Tip amount : \$${tip.toStringAsFixed(2)}")),
              
            ),
            
          ],
        ),
      );
  }
}