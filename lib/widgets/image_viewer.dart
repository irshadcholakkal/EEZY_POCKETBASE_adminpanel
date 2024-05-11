import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageDisplayWidget extends StatefulWidget {
  final String imageBaseUrl;
  final String collectionId;
  final String productId;
  final List<String> imageFilename;
  final double? width;
  final double? height;
  //final int imageIndex;

  const ImageDisplayWidget({
    Key? key,
    required this.imageBaseUrl,
    required this.collectionId,
    required this.productId,
    required this.imageFilename,
   // required this.imageIndex,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _ImageDisplayWidgetState createState() => _ImageDisplayWidgetState();
}

class _ImageDisplayWidgetState extends State<ImageDisplayWidget> {
  Uint8List? memoryImageBytes;
  

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        '${widget.imageBaseUrl}${widget.collectionId}/${widget.productId}/${widget.imageFilename[0]}';
    final double imageWidth = widget.width ?? 100.0; // Default width if not provided
    final double imageHeight = widget.height ?? 100.0; // Default height if not provided

    return Container(
      width: imageWidth,
      height: imageHeight,
      child: memoryImageBytes != null
          ? Image.memory(
              memoryImageBytes!,
              fit: BoxFit.cover,
            )
          : Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
    );
  }

  // Example method to simulate updating the image. In a real app, you might trigger this through user interaction.
  void updateImage(Uint8List newImageBytes) {
    setState(() {
      memoryImageBytes = newImageBytes;
    });
  }
}