import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/provider/weather_provider.dart';
import 'package:weather_app/ui/style/app_colors.dart';
import 'package:weather_app/ui/style/app_style.dart';

class WeekDayItems extends StatelessWidget {
  const WeekDayItems({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 17),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.6),
        borderRadius: BorderRadius.circular(24),
      ),
      child: SizedBox(
        height: 150,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            return DayItem(
              day: model.date[i],
              icon: model.setDailyIcons(i),
              dayTemp: model.setDailyTemp(i),
              windSpeed: '${model.setDailyWindSpeed(i)} km/h',
            );
          },
          separatorBuilder: (context, i) => const SizedBox(width: 30),
          itemCount: model.date.length - 1,
        ),
      ),
    );
  }
}

class DayItem extends StatelessWidget {
  const DayItem({
    super.key,
    required this.day,
    required this.dayTemp,
    required this.icon,
    required this.windSpeed,
  });

  final String day, icon, windSpeed;
  final int dayTemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          day,
          style: AppStyle.fontStyle.copyWith(
            color: AppColors.dayColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        //Заменить на Image()
        Image.network(icon),
        const SizedBox(height: 7),
        Text(
          '$dayTemp °',
          style: AppStyle.fontStyle.copyWith(
            fontSize: 16,
            color: AppColors.dayColor,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          windSpeed,
          style: AppStyle.fontStyle.copyWith(
            fontSize: 16,
            color: AppColors.dayColor,
          ),
        ),
      ],
    );
  }
}
