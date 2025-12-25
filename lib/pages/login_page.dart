import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_dashboard/common/constants/colors.dart';
import 'package:iot_dashboard/common/constants/sizes.dart';
import 'package:iot_dashboard/data/models/auth/login_request.dart';
import 'package:iot_dashboard/domain/bloc/auth/auth_bloc.dart';
import 'package:iot_dashboard/domain/bloc/auth/auth_event.dart';
import 'package:iot_dashboard/domain/bloc/auth/auth_state.dart';
import 'package:iot_dashboard/router/app_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
            LoginRequested(
              LoginRequest(
                email: _emailController.text.trim(),
                password: _passwordController.text,
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const colorFoundations = ColorsFoundations();

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          context.go(AppRoutes.dashboard);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

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
                          child: Form(
                            key: _formKey,
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
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Correo electrónico',
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  enabled: !isLoading,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingresa tu correo';
                                    }
                                    if (!value.contains('@')) {
                                      return 'Correo inválido';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: AppSizes.sizeXs),

                                // Password field
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    labelText: 'Contraseña',
                                    prefixIcon: Icon(Icons.lock_outlined),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscurePassword
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscurePassword = !_obscurePassword;
                                        });
                                      },
                                    ),
                                  ),
                                  obscureText: _obscurePassword,
                                  textInputAction: TextInputAction.done,
                                  enabled: !isLoading,
                                  onFieldSubmitted: (_) => _handleLogin(),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor ingresa tu contraseña';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: AppSizes.size2Xs),

                                // Forgot password
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: isLoading ? null : () {},
                                    child: Text('¿Olvidaste tu contraseña?'),
                                  ),
                                ),
                                SizedBox(height: AppSizes.sizeXs),

                                // Login button
                                ElevatedButton(
                                  onPressed: isLoading ? null : _handleLogin,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: AppSizes.sizeXs),
                                    child: isLoading
                                        ? SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                            ),
                                          )
                                        : Text('Iniciar Sesión'),
                                  ),
                                ),
                                SizedBox(height: AppSizes.sizeXs),

                                // Sign up link
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('¿No tienes una cuenta? '),
                                    TextButton(
                                      onPressed: isLoading
                                          ? null
                                          : () => context.push(AppRoutes.signup),
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
              ),
            ],
          ),
        );
      },
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

