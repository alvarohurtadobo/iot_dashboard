import 'package:flutter/material.dart';
import 'package:iot_dashboard/common/constants/colors.dart';
import 'package:iot_dashboard/common/constants/sizes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Mock state - no funcionalidad real
  String _selectedLanguage = 'es';
  String _selectedTheme = 'light';

  @override
  Widget build(BuildContext context) {
    const colorFoundations = ColorsFoundations();

    return Scaffold(
      backgroundColor: colorFoundations.backgroundPagePrimary,
      body: Column(
        children: [
          // Header with breadcrumb
          _buildHeader(context),
          
          // Main content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(AppSizes.sizeMd),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 800,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Page Title
                    _buildPageTitle(context),
                    
                    SizedBox(height: AppSizes.sizeMd),
                    
                    // Settings Sections
                    _buildLanguageSection(context),
                    
                    SizedBox(height: AppSizes.sizeMd),
                    
                    _buildThemeSection(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    const colorFoundations = ColorsFoundations();
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.sizeMd,
        vertical: AppSizes.sizeXs,
      ),
      decoration: BoxDecoration(
        color: colorFoundations.backgroundComponentPrimary,
        border: Border(
          bottom: BorderSide(
            color: colorFoundations.borderPrimary,
            width: AppSizes.size1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Logo/Title
          Text(
            'Configuración',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          
          SizedBox(width: AppSizes.sizeMd),
          
          // Breadcrumb
          Row(
            children: [
              _buildBreadcrumbItem(context, 'Dashboard', isActive: false),
              Text(
                ' / ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorFoundations.textTertiary,
                ),
              ),
              _buildBreadcrumbItem(context, 'Configuración', isActive: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumbItem(
    BuildContext context,
    String label, {
    required bool isActive,
  }) {
    const colorFoundations = ColorsFoundations();
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.size2Xs),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: isActive
              ? colorFoundations.textPrimary
              : colorFoundations.textTertiary,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildPageTitle(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.settings,
          size: AppSizes.size44,
          color: ColorsFoundations().interactionPrimary,
        ),
        SizedBox(width: AppSizes.sizeXs),
        Text(
          'Configuración',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageSection(BuildContext context) {
    const colorFoundations = ColorsFoundations();
    
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.sizeMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.language,
                  color: colorFoundations.interactionPrimary,
                  size: AppSizes.size28,
                ),
                SizedBox(width: AppSizes.sizeXs),
                Text(
                  'Idioma',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.sizeXs),
            Text(
              'Selecciona el idioma de la aplicación',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorFoundations.textTertiary,
              ),
            ),
            SizedBox(height: AppSizes.sizeMd),
            Divider(),
            SizedBox(height: AppSizes.sizeMd),
            
            // Language Options
            _buildLanguageOption(
              context,
              'Español',
              'es',
              '🇪🇸',
            ),
            SizedBox(height: AppSizes.sizeXs),
            _buildLanguageOption(
              context,
              'English',
              'en',
              '🇬🇧',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    String label,
    String value,
    String flag,
  ) {
    final colorFoundations = ColorsFoundations();
    final isSelected = _selectedLanguage == value;
    
    return InkWell(
      onTap: () {
        setState(() {
          _selectedLanguage = value;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Idioma cambiado a $label (mock)'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      borderRadius: BorderRadius.circular(AppSizes.size2Xs),
      child: Container(
        padding: EdgeInsets.all(AppSizes.sizeXs),
        decoration: BoxDecoration(
          color: isSelected
              ? colorFoundations.interactionPrimary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.size2Xs),
          border: Border.all(
            color: isSelected
                ? colorFoundations.interactionPrimary
                : colorFoundations.borderPrimary,
            width: AppSizes.size1,
          ),
        ),
        child: Row(
          children: [
            Text(
              flag,
              style: TextStyle(fontSize: AppSizes.size24),
            ),
            SizedBox(width: AppSizes.sizeXs),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected
                      ? colorFoundations.interactionPrimary
                      : colorFoundations.textPrimary,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: colorFoundations.interactionPrimary,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSection(BuildContext context) {
    const colorFoundations = ColorsFoundations();
    
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.sizeMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.palette_outlined,
                  color: colorFoundations.interactionPrimary,
                  size: AppSizes.size28,
                ),
                SizedBox(width: AppSizes.sizeXs),
                Text(
                  'Tema',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.sizeXs),
            Text(
              'Selecciona el tema de la aplicación',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorFoundations.textTertiary,
              ),
            ),
            SizedBox(height: AppSizes.sizeMd),
            Divider(),
            SizedBox(height: AppSizes.sizeMd),
            
            // Theme Options
            Row(
              children: [
                Expanded(
                  child: _buildThemeOption(
                    context,
                    'Claro',
                    'light',
                    Icons.light_mode,
                  ),
                ),
                SizedBox(width: AppSizes.sizeXs),
                Expanded(
                  child: _buildThemeOption(
                    context,
                    'Oscuro',
                    'dark',
                    Icons.dark_mode,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    final colorFoundations = ColorsFoundations();
    final isSelected = _selectedTheme == value;
    
    return InkWell(
      onTap: () {
        setState(() {
          _selectedTheme = value;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Tema cambiado a $label (mock)'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      borderRadius: BorderRadius.circular(AppSizes.size2Xs),
      child: Container(
        padding: EdgeInsets.all(AppSizes.sizeMd),
        decoration: BoxDecoration(
          color: isSelected
              ? colorFoundations.interactionPrimary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.size2Xs),
          border: Border.all(
            color: isSelected
                ? colorFoundations.interactionPrimary
                : colorFoundations.borderPrimary,
            width: AppSizes.size1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: AppSizes.size44,
              color: isSelected
                  ? colorFoundations.interactionPrimary
                  : colorFoundations.textTertiary,
            ),
            SizedBox(height: AppSizes.sizeXs),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected
                    ? colorFoundations.interactionPrimary
                    : colorFoundations.textPrimary,
              ),
            ),
            if (isSelected)
              Padding(
                padding: EdgeInsets.only(top: AppSizes.size2Xs),
                child: Icon(
                  Icons.check_circle,
                  color: colorFoundations.interactionPrimary,
                  size: AppSizes.size20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
