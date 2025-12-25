import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_dashboard/common/constants/colors.dart';
import 'package:iot_dashboard/common/constants/sizes.dart';
import 'package:iot_dashboard/router/app_router.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.sizeMd),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Registrarse',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppSizes.sizeMd),
                          Text(
                            'Funcionalidad de registro próximamente',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: colorFoundations.textTertiary,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppSizes.sizeMd),
                          ElevatedButton(
                            onPressed: () => context.go(AppRoutes.welcome),
                            child: Text('Volver'),
                          ),
                        ],
                      ),
                    ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () => context.go(AppRoutes.welcome),
            icon: Icon(Icons.arrow_back),
            label: Text('Volver'),
          ),
        ],
      ),
    );
  }
}

