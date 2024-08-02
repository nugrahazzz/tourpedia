import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';

class AddRatingBottomSheet extends StatefulWidget {
  final Function(double rating, String review) onSubmit;

  const AddRatingBottomSheet({super.key, required this.onSubmit});

  @override
  _AddRatingBottomSheetState createState() => _AddRatingBottomSheetState();
}

class _AddRatingBottomSheetState extends State<AddRatingBottomSheet> {
  double userRating = 0.0;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: EmojiFeedback(
                    onChanged: (index) {
                      setState(() {
                        userRating = index.toDouble();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: reviewController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        'Berikan pendapatmu mengenai destinasi wisata ini',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onSubmit(userRating, reviewController.text);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 12.0),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: const Text('SEND REVIEW'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
