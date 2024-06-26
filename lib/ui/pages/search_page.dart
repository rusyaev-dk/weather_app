import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/provider/weather_provider.dart';
import 'package:weather_app/ui/components/favorite_list.dart';
import 'package:weather_app/ui/style/app_colors.dart';
import 'package:weather_app/ui/style/app_style.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomSearchAppbar(),
      body: SearchBody(),
    );
  }
}

class CustomSearchAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomSearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldWidget(model: model),
            IconButton(
              onPressed: () {
                model.setCurrentCity(context);
              },
              icon: Icon(
                Icons.search_rounded,
                size: 50,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.model,
  });

  final WeatherProvider model;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Expanded(
      child: TextField(
        controller: model.searchController,
        decoration: InputDecoration(
          fillColor: AppColors.cardColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          hintText: 'Поиск...',
        ),
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.gradientColor1,
            AppColors.gradientColor2,
            AppColors.gradientColor3,
            AppColors.gradientColor2,
            AppColors.gradientColor1,
          ],
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 85, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saved Locations',
            style: AppStyle.fontStyle,
          ),
          const SizedBox(height: 25),
          const FavoriteList(),
        ],
      ),
    );
  }
}
