// Directory Structure Guide
// 
// The application uses the following file organization:
//
// lib/
// ├── main.dart (Entry point - initializes app with theme)
// ├── burc_listesi.dart (Main list page with GridView & search)
// ├── burc_item.dart (List item card widget)
// ├── burc_detay.dart (Detail page with hero animation & parallax)
// ├── app_theme_config.dart (Theme configuration - Light & Dark modes)
// ├── zodiac_colors_theme.dart (Color system for all 12 zodiac signs)
// ├── zodiac_card_widget.dart (Custom card widget for grid items)
// ├── custom_app_bar_widget.dart (Custom gradient AppBar widget)
// ├── model/
// │   └── burc.dart (Burc data model with colorKey field)
// └── data/
//     └── strings.dart (Constants: zodiac names, colors, details)
//
// File Mappings (Long names for clarity):
// - app_theme_config.dart ← Should be in lib/theme/app_theme.dart
// - zodiac_colors_theme.dart ← Should be in lib/theme/zodiac_colors.dart
// - zodiac_card_widget.dart ← Should be in lib/widgets/zodiac_card.dart
// - custom_app_bar_widget.dart ← Should be in lib/widgets/custom_app_bar.dart
//
// Note: Due to Flutter directory creation limitations, files are prefixed
// with module names for organization. The structure is logically organized
// as above with clear import paths.

void _documentationOnly() {
  // This file is for documentation purposes only
}
