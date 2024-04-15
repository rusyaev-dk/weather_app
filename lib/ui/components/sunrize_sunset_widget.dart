import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/provider/weather_provider.dart';
import 'package:weather_app/ui/resources/app_icons.dart';
import 'package:weather_app/ui/style/app_colors.dart';
import 'package:weather_app/ui/style/app_style.dart';

class SunriseSunsetWidget extends StatelessWidget {
  const SunriseSunsetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.6),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RowItemsWidget(
            icon: AppIcons.sunrise,
            text: 'Sunrise ${model.setSunRise()}',
          ),
          RowItemsWidget(
            icon: AppIcons.sunset,
            text: 'Sunset ${model.setSunSet()}',
          ),
        ],
      ),
    );
  }
}

class RowItemsWidget extends StatelessWidget {
  const RowItemsWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  final String icon, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          color: AppColors.white,
          theme: SvgTheme(
            currentColor: Colors.red,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: AppStyle.fontStyle.copyWith(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
