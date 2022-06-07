import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/complaintp.dart';

const kTextStyle = TextStyle(fontWeight: FontWeight.w500, fontSize: 16);

class ComplaintCard extends StatefulWidget {
  const ComplaintCard(
      {Key? key,
      this.complaintCategory,
      this.subCategory,
      this.complaintNature,
      this.date,
      this.description,
      this.userName,
      this.complaintId,
      this.buttonText,
      this.onPressed,
      this.imageUrl,
      this.onTapViewFile})
      : super(key: key);

  final String? userName;
  final String? complaintId;
  final String? complaintCategory;
  final String? subCategory;
  final String? complaintNature;
  final String? date;
  final String? description;
  final String? buttonText;
  final VoidCallback? onPressed;
  final String? imageUrl;
  final VoidCallback? onTapViewFile;

  @override
  State<ComplaintCard> createState() => _ComplaintCardState();
}

class _ComplaintCardState extends State<ComplaintCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username: ${widget.userName}',
                          style: kTextStyle.copyWith(fontSize: 16),
                        ),
                        Text(
                          'ID: ${widget.complaintId}',
                          style: kTextStyle.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Consumer<ComplaintP>(
                          builder: (context, complaintP, child) {
                            return TextButton(
                              onPressed: () {
                                complaintP.deleteComplaint(
                                    widget.complaintId as String);
                              },
                              child: Text('View Complaints'),
                            );
                          },
                        );
                      },
                      child: Text(
                        '${widget.buttonText}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 10, 108, 237))),
                    )
                  ]),
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('File: '),
                            TextButton(
                                onPressed: widget.onTapViewFile,
                                child: const Text('View File'))
                          ],
                        ),
                        Text(
                          'Complaint Category:  ${widget.complaintCategory}',
                          style: kTextStyle,
                        ),
                        Text(
                          'Sub-Category: ${widget.subCategory}',
                          style: kTextStyle,
                        ),
                        Text(
                          'Complaint Nature: ${widget.complaintNature}',
                          style: kTextStyle,
                        ),
                        Text(
                          'Date: ${widget.date}',
                          style: kTextStyle,
                        ),
                        Text(
                          'Description: ${widget.description}',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
