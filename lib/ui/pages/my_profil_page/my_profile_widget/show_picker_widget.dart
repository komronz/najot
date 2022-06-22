import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_image_utils.dart';

class ShowPickerWidget extends StatefulWidget {
  const ShowPickerWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowPickerPageState createState() => _ShowPickerPageState();
}

class _ShowPickerPageState extends State<ShowPickerWidget> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      // final imageTemporary=File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      AppLoggerUtil.e('Failed to pick image: $e');
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
          child: image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  child: Image.file(
                    image!,
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                )
              : SvgPicture.asset(
                  AppImageUtils.useradd,
                  width: 130,
                ),
        ).paddingOnly(top: 25, bottom: 4),
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
