import 'package:flutter/material.dart';
import 'package:iot_dashboard/common/constants/colors.dart';
import 'package:iot_dashboard/common/constants/sizes.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

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
              child: Text(
                'Empresa',
                style: Theme.of(context).textTheme.displaySmall,
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
      child: Text(
        'Empresa',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

