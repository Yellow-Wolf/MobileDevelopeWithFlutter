@override
Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return Scaffold(
    backgroundColor: Colors.grey,
    appBar: AppBar(
      title: Text(
        'Lab 3',
        style: TextStyle(fontSize: 18),
      ),
    ),
    body: AnimatedContainer(
      margin: EdgeInsets.all(20),
      duration: Duration(milliseconds: 450),
      width: screenWidth,
      height: _expanded ? screenHeight : 100,
      color: Colors.indigo,
      child: Column(
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: Colors.yellow,
            child: InkWell(
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Click to Expand',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Icon(_expanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}




------------



Widget changeShapes(double width) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        color: Colors.white,
        height: 150,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isCircleLeft = !_isCircleLeft;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _isCircleLeft
                  ? Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              )
                  : Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              const SizedBox(width: 60),
              _isCircleLeft
                  ? Container(
                width: 50,
                height: 50,
                color: Colors.red,
              )
                  : Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}