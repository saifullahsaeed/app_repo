import 'package:flutter/material.dart';

class DashBoardCard extends StatefulWidget {
  const DashBoardCard(
      {Key? key, required this.items, required this.cardTitle, this.onPressed})
      : super(key: key);

  final int items;
  final String cardTitle;
  final VoidCallback? onPressed;

  @override
  State<DashBoardCard> createState() => _DashBoardCardState();
}

class _DashBoardCardState extends State<DashBoardCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.0,
      height: 180.0,
      child: Card(
        color: const Color.fromARGB(255, 233, 241, 245),
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Center(
            child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.blueGrey.shade100)),
          onPressed: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset("assets/google-docs (2).png", width: 69.0),
                const SizedBox(height: 10.0),
                Text(
                  widget.cardTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 26, 25, 25),
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                  ),
                ),
                const SizedBox(height: 3.0),
                Text(
                  "${widget.items} Items",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 8, 137, 154),
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
