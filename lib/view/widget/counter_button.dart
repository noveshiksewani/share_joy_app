import 'package:flutter/material.dart';
import 'package:share_joy/controller/counter_controller.dart';
import 'package:share_joy/controller/db_controller.dart';
import 'package:share_joy/model/classes/basket_model.dart';

class CounterButton extends StatefulWidget {
  final Function(bool) callback;
  final Cart cart;
  
  const CounterButton(
      {super.key,
      required this.cart,
      required this.callback});

  @override
  State<StatefulWidget> createState() => CounterButtonState();
}

class CounterButtonState extends State<CounterButton> {
  final DBController _controller=DBController();
  late CounterController _counterController;
  @override
  Widget build(BuildContext context) {
     _counterController=CounterController(widget.cart.quantity);
    return Container(
        width: 100,
        height: 40,
        margin: const EdgeInsets.all(9),
        color: Colors.pink.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                _counterController.increment();
                await _controller.incAndDecQuantityInCart(
                    "increase", widget.cart.id);
                     widget.callback(true);
              },
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(( _counterController.counter).toString()),
            )),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () async {
                if (_counterController.counter > 1) {
                   _counterController.decrement();
                  await _controller.incAndDecQuantityInCart(
                      "decrease", widget.cart.id);
                } else {
                  await _controller.deleteDataById(widget.cart.id,widget.cart.id);
                }
                 widget.callback(true);
              },
            ),
          ],
        ));
  }
}
