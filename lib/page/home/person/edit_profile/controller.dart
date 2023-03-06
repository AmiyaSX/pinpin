import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinpin/app/route/route_name.dart';
import 'package:pinpin/model/user_info/user_info.dart';
import 'package:pinpin/page/home/person/controller.dart';


class EditProfileController extends GetxController {

  final personController = Get.find<PPHomePersonController>();
  final UserInfo? userInfo = Get.arguments;


  XFile? pickedFile;
  final imageFile = File("").obs;
  final isShowBottomSheet = false.obs;
  int count = 0;

  void toEditPersonalProfilePage() {
    Get.toNamed(RN.edit_personal_profile, arguments: userInfo);
  }

  void toEditUsernamePage() {
    Get.toNamed(RN.edit_username, arguments: userInfo);
  }

  void toEditLabelsPage() {
    Get.toNamed(RN.edit_labels, arguments: userInfo);
  }

  void onClickShowOrNotButton() {}

  void onChangeAvatar(BuildContext context) async{
    final names = ["选择照片", "拍照"];
    var index = await _showBottomSheet(context, names);
  }

  Future<int?> _showBottomSheet(context, List<String> options) async {

    return showModalBottomSheet<int>(
      backgroundColor: Colors.transparent, // 背景颜色
      isScrollControlled: true, // 滚动控制
      context: context,
      builder: (BuildContext context) { // builder构建弹窗主体内容
        return Container(
          clipBehavior: Clip.antiAlias, // clip是什么？
          decoration: const BoxDecoration( // 修饰颜色和边角
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),// 上面两个边角
              topRight: Radius.circular(20.0),
            ),
          ),
          height: MediaQuery.of(context).size.height / 3.0, // MediaQuery结合上下文获取高度，只是这个高度是谁的？ 屏幕的尺寸
          child: Column(children: [ // Column添加组件
            SizedBox( // 最上面的弹窗主题部分
              height: 50,
              child: Stack(
                textDirection: TextDirection.rtl,
                children: [
                  const Center(
                    child: Text(
                      '底部弹窗',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
            const Divider(height: 1.0), // 分割线
            Expanded(
              child: ListView.builder( // ListView
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(// ListTile作为item
                      title: Text(options[index]),
                      onTap: () async{
                        index == 1 ? await _takePhoto() : await _openGallery();
                      });
                },
                itemCount: options.length,
              ),
            ),
          ]),
        );
      },
    );
  }

  _takePhoto() async {
    pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    imageFile(File(pickedFile!.path));
    // personController.updateAvatar(pickedFile!.path);
  }

  _openGallery() async {
    pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    imageFile(File(pickedFile!.path));
    // personController.updateAvatar(pickedFile!.path);
  }
}