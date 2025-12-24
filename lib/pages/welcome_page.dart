import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_dashboard/common/constants/colors.dart';
import 'package:iot_dashboard/common/constants/sizes.dart';
import 'package:iot_dashboard/router/app_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const colorFoundations = ColorsFoundations();

    return Scaffold(
      backgroundColor: colorFoundations.backgroundPagePrimary,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppSizes.sizeMd),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 800),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo or Title
                      Icon(
                        Icons.dashboard,
                        size: AppSizes.size100,
                        color: colorFoundations.interactionPrimary,
                      ),
                      SizedBox(height: AppSizes.sizeMd),
                      
                      Text(
                        'IoT Dashboard',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppSizes.sizeXs),
                      
                      Text(
                        'Panel de administración para gestión de dispositivos IoT',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: colorFoundations.textTertiary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppSizes.size5Xl),
                      
                      // Features or welcome content
                      _buildFeatures(context),
                      SizedBox(height: AppSizes.size5Xl),
                      
                      // CTA Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => context.push(AppRoutes.login),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.sizeMd,
                                vertical: AppSizes.sizeXs,
                              ),
                            ),
                            child: Text('Iniciar Sesión'),
                          ),
                          SizedBox(width: AppSizes.sizeXs),
                          OutlinedButton(
                            onPressed: () => context.push(AppRoutes.signup),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.sizeMd,
                                vertical: AppSizes.sizeXs,
                              ),
                            ),
                            child: Text('Registrarse'),
                          ),
                        ],
                      ),
                    ],
                  ),
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => context.push(AppRoutes.login),
            child: Text('Iniciar Sesión'),
          ),
          SizedBox(width: AppSizes.size2Xs),
          ElevatedButton(
            onPressed: () => context.push(AppRoutes.signup),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.sizeMd,
                vertical: AppSizes.size2Xs,
              ),
            ),
            child: Text('Registrarse'),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatures(BuildContext context) {
    const colorFoundations = ColorsFoundations();
    
    final features = [
      _FeatureItem(
        icon: Icons.devices,
        title: 'Gestión de Dispositivos',
        description: 'Monitorea y gestiona todos tus dispositivos IoT desde un solo lugar',
      ),
      _FeatureItem(
        icon: Icons.analytics,
        title: 'Análisis en Tiempo Real',
        description: 'Visualiza datos y métricas de tus dispositivos en tiempo real',
      ),
      _FeatureItem(
        icon: Icons.security,
        title: 'Seguro y Confiable',
        description: 'Protección de datos con estándares de seguridad empresariales',
      ),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features.map((feature) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.sizeXs),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(AppSizes.sizeMd),
                  decoration: BoxDecoration(
                    color: colorFoundations.interactionTertiary,
                    borderRadius: BorderRadius.circular(AppSizes.sizeMd),
                  ),
                  child: Icon(
                    feature.icon,
                    size: AppSizes.size44,
                    color: colorFoundations.interactionPrimary,
                  ),
                ),
                SizedBox(height: AppSizes.sizeXs),
                Text(
                  feature.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSizes.size2Xs),
                Text(
                  feature.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorFoundations.textTertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _FeatureItem {
  final IconData icon;
  final String title;
  final String description;

  _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}

