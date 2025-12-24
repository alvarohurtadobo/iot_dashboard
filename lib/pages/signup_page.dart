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
                            'Crear Cuenta',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppSizes.sizeXs),
                          Text(
                            'Completa el formulario para registrarte',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: colorFoundations.textTertiary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppSizes.sizeMd),
                          
                          // Name field
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Nombre completo',
                              prefixIcon: Icon(Icons.person_outlined),
                            ),
                          ),
                          SizedBox(height: AppSizes.sizeXs),
                          
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
                              helperText: 'Mínimo 8 caracteres',
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: AppSizes.sizeXs),
                          
                          // Confirm password field
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Confirmar contraseña',
                              prefixIcon: Icon(Icons.lock_outlined),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: AppSizes.sizeXs),
                          
                          // Terms and conditions checkbox
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                              Expanded(
                                child: Text(
                                  'Acepto los términos y condiciones',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSizes.sizeXs),
                          
                          // Sign up button
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement signup logic
                              context.go(AppRoutes.dashboard);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: AppSizes.sizeXs),
                              child: Text('Registrarse'),
                            ),
                          ),
                          SizedBox(height: AppSizes.sizeXs),
                          
                          // Login link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('¿Ya tienes una cuenta? '),
                              TextButton(
                                onPressed: () => context.push(AppRoutes.login),
                                child: Text('Iniciar Sesión'),
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
              ElevatedButton(
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

