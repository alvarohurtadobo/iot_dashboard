import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_dashboard/common/constants/colors.dart';
import 'package:iot_dashboard/common/constants/sizes.dart';
import 'package:iot_dashboard/router/app_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                            'Iniciar Sesión',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppSizes.sizeXs),
                          Text(
                            'Ingresa tus credenciales para acceder',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: colorFoundations.textTertiary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppSizes.sizeMd),
                          
                          // Email field
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Correo electrónico',
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: AppSizes.sizeXs),
                          
                          // Password field
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              prefixIcon: Icon(Icons.lock_outlined),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: AppSizes.size2Xs),
                          
                          // Forgot password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text('¿Olvidaste tu contraseña?'),
                            ),
                          ),
                          SizedBox(height: AppSizes.sizeXs),
                          
                          // Login button
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement login logic
                              context.go(AppRoutes.dashboard);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: AppSizes.sizeXs),
                              child: Text('Iniciar Sesión'),
                            ),
                          ),
                          SizedBox(height: AppSizes.sizeXs),
                          
                          // Sign up link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('¿No tienes una cuenta? '),
                              TextButton(
                                onPressed: () => context.push(AppRoutes.signup),
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
          Row(
            children: [
              TextButton(
                onPressed: () => context.push(AppRoutes.login),
                child: Text('Iniciar Sesión'),
              ),
              SizedBox(width: AppSizes.size2Xs),
              OutlinedButton(
                onPressed: () => context.push(AppRoutes.signup),
                child: Text('Registrarse'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

