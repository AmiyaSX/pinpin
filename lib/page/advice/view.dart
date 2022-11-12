import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpin/app/theme/app_theme.dart';
import 'package:pinpin/component/header/blue_static_header.dart';
import 'package:pinpin/component/stateful_button/pp_common_text_button.dart';
import 'package:pinpin/component/widget_extensions/ext.dart';

import 'controller.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final controller = Get.find<AdviceController>();

    const personSignature = Text(
      "啊对对对",
      style: AppTheme.headline8,
      textAlign: TextAlign.left,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );

    final profile = DecoratedBox(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.white, boxShadow: [AppTheme.shadow]),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.8,
        child: TextField(
          style: AppTheme.headline7,
          textAlign: TextAlign.left,
          maxLines: 5,
          controller: controller.etController,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );

    return Scaffold(
        body: InkWell(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            highlightColor: Colors.transparent,// 去除水波纹
            splashColor: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PPNavigationBar(title: "建议与反馈"),
                const Padding(padding: EdgeInsets.only(bottom: 20)),

                profile.sized(width: 354, height: 191),

                const Padding(padding: EdgeInsets.only(bottom: 260)),
                PPCommonTextButton(
                  title: '提交',
                  onPressed: () {
                    Get.back();
                  },
                ),
                const Spacer()
              ],
            )
        )
    );
  }
}
