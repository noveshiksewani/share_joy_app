import 'package:flutter/material.dart';

class ButtonDesign extends StatelessWidget{
  final String type;
  final String name;
  final Widget? icon;
  final Function() callback;
  const ButtonDesign({super.key, required this.type, required this.name, this.icon, required this.callback});
   
  @override
  Widget build(BuildContext context) {
    Widget button()
  {
   switch(type){
    case "icon":
      return  ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade50),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.only(
                                      left: 25,
                                      right: 25,
                                      top: 10,
                                      bottom: 10)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                            ),
                            icon: icon!,
                            onPressed: callback,
                            label: Text(
                              name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ));
      default:
         return ElevatedButton(onPressed: callback.call(), child: const Text("Add"));                      
   } 
  }

    return button();

  }
  }