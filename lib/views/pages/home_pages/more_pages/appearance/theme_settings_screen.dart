// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class ThemeSettingsScreen extends StatelessWidget {
//   const ThemeSettingsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final themeController = ThemeController.to;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Настройки темы'),
//       ),
//       body: GetBuilder<ThemeController>(
//         builder: (_) => ListView(
//           children: [
//             RadioListTile<ThemeMode>(
//               title: const Text('Светлая тема'),
//               value: ThemeMode.light,
//               groupValue: themeController.themeMode,
//               onChanged: (value) {
//                 if (value != null) {
//                   themeController.changeThemeMode(value);
//                 }
//               },
//             ),
//             RadioListTile<ThemeMode>(
//               title: const Text('Темная тема'),
//               value: ThemeMode.dark,
//               groupValue: themeController.themeMode,
//               onChanged: (value) {
//                 if (value != null) {
//                   themeController.changeThemeMode(value);
//                 }
//               },
//             ),
//             RadioListTile<ThemeMode>(
//               title: const Text('Системная тема'),
//               subtitle: const Text('Применяется тема устройства'),
//               value: ThemeMode.system,
//               groupValue: themeController.themeMode,
//               onChanged: (value) {
//                 if (value != null) {
//                   themeController.changeThemeMode(value);
//                 }
//               },
//             ),
//             const Divider(),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton.icon(
//                 icon: Icon(themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode),
//                 label: Text('Переключить на ${themeController.isDarkMode ? 'светлую' : 'темную'} тему'),
//                 onPressed: () => themeController.toggleTheme(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
