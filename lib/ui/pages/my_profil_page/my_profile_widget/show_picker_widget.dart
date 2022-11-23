import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../../../data/localization/locale_keys.g.dart';

class ShowPickerWidget extends StatefulWidget {
  ShowPickerWidget(
      {required this.width,
      required this.height,
      required this.image,
      required this.color,
      required this.imageSelect,
        this.imageFile,
      this.radius = 75,
      this.padding = 0});

  final double width;
  final double height;
  final String image;
  final Color color;
  final double radius;
  final double padding;
  final Function imageSelect;
  final File? imageFile;

  @override
  _ShowPickerPageState createState() => _ShowPickerPageState();
}

class _ShowPickerPageState extends State<ShowPickerWidget> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagePermanent = await saveImagePermanently(image.path);
      await widget.imageSelect(imagePermanent);
      setState(() {
        this.image = imagePermanent;
      });
    } on PlatformException catch (e) {
    }
  }
  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SafeArea(
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.color,
          ),
          child: widget.imageFile != null
              ? Container(
                  child: ClipRRect(
                    child: Image.file(
                      widget.imageFile!,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(widget.radius),
                  ),
                )
              : SvgPicture.asset(
                  widget.image,
                ).paddingAll(widget.padding),
        ),
      ),
      onTap: () {
        _showPicker(context);
      },
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title:
                        AppWidgets.textLocale(text: LocaleKeys.photo_library),
                    onTap: () {
                      pickImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: AppWidgets.textLocale(text: LocaleKeys.camera),
                  onTap: () {
                    pickImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
