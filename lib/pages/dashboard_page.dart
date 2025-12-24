import 'package:flutter/material.dart';
import 'package:iot_dashboard/common/constants/colors.dart';
import 'package:iot_dashboard/common/constants/sizes.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    const colorFoundations = ColorsFoundations();
    print('DashboardPage build');

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
                  maxWidth: 1400,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Page Title
                    _buildPageTitle(context),
                    
                    SizedBox(height: AppSizes.sizeMd),
                    
                    // Charts and Statistics Row
                    _buildChartsAndStatsRow(context),
                    
                    SizedBox(height: AppSizes.sizeMd),
                    
                    // Events History
                    _buildEventsHistory(context),
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
            'Dashboard Overview',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          
          SizedBox(width: AppSizes.sizeMd),
          
          // Breadcrumb
          Row(
            children: [
              _buildBreadcrumbItem(context, 'Dashboard', isActive: true),
            ],
          ),
          
          const Spacer(),
          
          // Header actions
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          SizedBox(width: AppSizes.size2Xs),
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {},
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
    return Text(
      'Dashboard Overview',
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildChartsAndStatsRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Charts Section (Left)
        Expanded(
          flex: 2,
          child: _buildChartsSection(context),
        ),
        
        SizedBox(width: AppSizes.sizeMd),
        
        // Statistics Section (Right)
        Expanded(
          flex: 1,
          child: _buildStatisticsSection(context),
        ),
      ],
    );
  }

  Widget _buildChartsSection(BuildContext context) {
    const colorFoundations = ColorsFoundations();
    
    return Column(
      children: [
        // Main Chart Card
        Card(
          child: Container(
            padding: EdgeInsets.all(AppSizes.sizeMd),
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Device Activity Over Time',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: AppSizes.sizeMd),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorFoundations.backgroundPageSecondary,
                      borderRadius: BorderRadius.circular(AppSizes.size2Xs),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.show_chart,
                            size: AppSizes.size60,
                            color: colorFoundations.interactionPrimary,
                          ),
                          SizedBox(height: AppSizes.sizeXs),
                          Text(
                            'Chart Visualization',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: colorFoundations.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        SizedBox(height: AppSizes.sizeXs),
        
        // Secondary Charts Row
        Row(
          children: [
            Expanded(
              child: _buildMiniChartCard(
                context,
                'Temperature',
                Icons.thermostat,
                '24°C',
              ),
            ),
            SizedBox(width: AppSizes.sizeXs),
            Expanded(
              child: _buildMiniChartCard(
                context,
                'Humidity',
                Icons.water_drop,
                '65%',
              ),
            ),
            SizedBox(width: AppSizes.sizeXs),
            Expanded(
              child: _buildMiniChartCard(
                context,
                'Pressure',
                Icons.compress,
                '1013 hPa',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMiniChartCard(
    BuildContext context,
    String title,
    IconData icon,
    String value,
  ) {
    const colorFoundations = ColorsFoundations();
    
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.sizeXs),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: AppSizes.size20,
                  color: colorFoundations.interactionPrimary,
                ),
                SizedBox(width: AppSizes.size2Xs),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.size2Xs),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSizes.size4),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: colorFoundations.backgroundPageSecondary,
                borderRadius: BorderRadius.circular(AppSizes.size4),
              ),
              child: Center(
                child: Icon(
                  Icons.trending_up,
                  size: AppSizes.size24,
                  color: colorFoundations.statusSuccessPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsSection(BuildContext context) {
    const colorFoundations = ColorsFoundations();
    
    return Column(
      children: [
        _buildStatCard(
          context,
          'Total Devices',
          '127',
          Icons.devices,
          colorFoundations.interactionPrimary,
        ),
        SizedBox(height: AppSizes.sizeXs),
        _buildStatCard(
          context,
          'Active Devices',
          '98',
          Icons.check_circle,
          colorFoundations.statusSuccessPrimary,
        ),
        SizedBox(height: AppSizes.sizeXs),
        _buildStatCard(
          context,
          'Alerts',
          '5',
          Icons.warning,
          colorFoundations.statusWarningPrimary,
        ),
        SizedBox(height: AppSizes.sizeXs),
        _buildStatCard(
          context,
          'Offline',
          '24',
          Icons.error_outline,
          colorFoundations.statusDangerPrimary,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color iconColor,
  ) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.sizeMd),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(AppSizes.sizeXs),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.size2Xs),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: AppSizes.size28,
              ),
            ),
            SizedBox(width: AppSizes.sizeXs),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsHistory(BuildContext context) {
    const colorFoundations = ColorsFoundations();
    final events = [
      _EventData('Device #42 connected', '2 minutes ago', Icons.link, colorFoundations.statusSuccessPrimary),
      _EventData('Temperature alert in Zone A', '15 minutes ago', Icons.warning, colorFoundations.statusWarningPrimary),
      _EventData('Device #18 disconnected', '1 hour ago', Icons.link_off, colorFoundations.statusDangerPrimary),
      _EventData('Data sync completed', '2 hours ago', Icons.sync, colorFoundations.statusInfoPrimary),
      _EventData('System backup started', '3 hours ago', Icons.backup, colorFoundations.interactionPrimary),
    ];
    
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.sizeMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Events',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('View All'),
                ),
              ],
            ),
            SizedBox(height: AppSizes.sizeXs),
            Divider(),
            SizedBox(height: AppSizes.sizeXs),
            ...events.map((event) => _buildEventItem(context, event)),
          ],
        ),
      ),
    );
  }

  Widget _buildEventItem(BuildContext context, _EventData event) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.size2Xs),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.size2Xs),
            decoration: BoxDecoration(
              color: event.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSizes.size2Xs),
            ),
            child: Icon(
              event.icon,
              color: event.color,
              size: AppSizes.size20,
            ),
          ),
          SizedBox(width: AppSizes.sizeXs),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  event.time,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EventData {
  final String title;
  final String time;
  final IconData icon;
  final Color color;

  _EventData(this.title, this.time, this.icon, this.color);
}

