import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspace/components/custom_prompt_modal_bottom_sheet.dart';
import 'package:newspace/main.dart';
import 'package:newspace/usecase/on_logout.dart';
import 'package:newspace/utils/constants.dart';
import 'package:newspace/views/profile/profile_controller.dart';
import 'package:newspace/views/saved_articles/saved_articles_view.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  @override
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Your Porto Account', style: newspaceTitleStyle,),
                const SizedBox(height: 24,),
                SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Center(
                          child: CircleAvatar(
                            maxRadius: 45,
                          ),
                        )
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userData.value.name ?? 'N/A', style: newspaceArticleTitleStyleX,),
                            Text(userData.value.email ?? 'N/A', style: newspaceArticleSubTitleStyleX,),
                            Text(userData.value.city ?? 'N/A', style: newspaceArticleSubTitleStyleX,),
                          ],
                        )
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24,),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 0.5, color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Account Settings', style: newspaceTitleStyle,),
                      const Divider(height: 8,indent: 4, endIndent: 4, color: Colors.grey, thickness: 0.5,),
                      ListTile(
                        title: const Text('Manage Saved Articles', style: newspaceWelcomeStyle,),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () => Get.to(()=>SavedArticleView()),
                      ),
                      const Divider(height: 8,indent: 4, endIndent: 4, color: Colors.grey, thickness: 0.5,),
                      ListTile(
                        title: const Text('Clear Image Cache', style: newspaceWelcomeStyle,),
                        trailing: const Icon(Icons.recycling),
                        onTap: () => controller.clearImageCache(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => CustomPromptModalBottomSheet(
                context: context, 
                title: "Are you sure you want to log out?",
                leftOption: "Cancel", 
                rightOption: "Yes", 
                leftOnTap: ()=> Get.back(), 
                rightOnTap: ()=> OnLogout(), 
                highlight: true
              ),
              child: Container(
                height: 48,
                width: Get.width,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.onError,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Center(
                  child: Text('Log Out', style: TextStyle(
                    color: Get.theme.colorScheme.error
                  ),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}