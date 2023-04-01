import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../common/asset/assets.gen.dart';
import '../../../core/extension/context_extension.dart';
import '../viewmodel/viewmodel/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: buildScaffoldBody,
    );
  }

  Widget buildScaffoldBody(BuildContext context, ProfileViewModel viewModel) {
    //todo const
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: context.dynamicWidth(0.1),
                    backgroundImage:
                        Image.asset(Assets.image.profilePicture.path).image),
                context.mediumWidthtSizedBoxSpace,
                Text(
                  "Salih Burak Demirci",
                  style: context.textTheme.titleLarge,
                ),
              ],
            ),
            context.mediumHeightSizedBoxSpace,
            const Divider(),
            Expanded(
              child: ListView(children: [
                GestureDetector(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text("My Account"),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.language),
                  title: Text("Language"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.mobile_friendly),
                  title: Text("Manage Premium"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.help),
                  title: Text("Help & FAQs"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    viewModel.logout();
                  },
                  child: const ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Delete My Account"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
                const Divider()
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
