import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/local_storage/storage_manager.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../../shared_widgets/circle_container_with_name.dart';
import '../../../../shared_models/profile_model.dart';

class EaserProfileScreen extends StatelessWidget {
  const EaserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Stack(
            children: [
              CircleContainerWithName(
                name: StorageManager.getFullName()!,
                width: 60.h,
                height: 60.h,
                borderColor: AppColors.greenColor,
                borderWidth: 3.r,
                fontSize: 20,
              ),
              /* CircleImageWithBorder(
                url: 'https://freepngimg.com/thumb/man/10-man-png-image.png',
                width: 60.h,
                height: 60.h,
                borderColor: AppColors.greenColor,
                borderWidth: 3.r,
              ),
              Positioned(
                  bottom: 0.h,
                  right: 0.w,
                  child: CustomBadgeEdit(
                    onPress: () {},
                  )), */
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            StorageManager.getFullName()!,
            style: AppTextStyles.paragraphRobotoMedium,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            StorageManager.getEmail()!,
            style: AppTextStyles.paragraph3Roboto,
          ),
          SizedBox(
            height: 21.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: easerProfileOptions.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemBuilder: (BuildContext context, int index) {
                ProfileOptionModel option = easerProfileOptions[index];
                return CustomListTileCardWidget(
                  isLastItem: index == easerProfileOptions.length,
                  onPress: () {
                    if (option.screenName == Routes.loginScreen) {
                      RoutingProvider.pushNamedAndRemoveAllBack(
                          routeName: option.screenName);
                      /* Provider.of<MainProvider>(context, listen: false)
                          .changeActiveScreen(0); */
                      StorageManager.removeUserData();
                    } else {
                      RoutingProvider.pushNamed(routeName: option.screenName);
                    }
                  },
                  title: option.title,
                  trailingIcon: option.isTrailingIcon,
                  iconName: option.iconName,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
