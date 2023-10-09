class CounterController  {
   int currentCounter;
CounterController(this.currentCounter);

  int get counter => currentCounter;
  void increment() => ++currentCounter;
  void decrement() => --currentCounter;
}