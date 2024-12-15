import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:netflix_app/screens/auth/service/auth_service.dart';
import 'package:netflix_app/screens/auth/widgets/auth_button.dart';
import 'package:netflix_app/screens/auth/widgets/text_field.dart';
import 'package:netflix_app/screens/home/presentation/screens/main_screen.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _authService = AuthService();
  bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      setState(() => _isLoading = true);

      try {
        final values = _formKey.currentState!.value;
        await _authService.signIn(
          values['email'] as String,
          values['password'] as String,
        );

        if (mounted) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString().trim())),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.red],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/netflix.png', height: 200,width: 200,),
                    const SizedBox(height: 48),
                    NetflixTextField(
                      name: 'Email',
                      labelText: 'Email'.trim(),
                      keyboardType: TextInputType.emailAddress,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    NetflixTextField(
                      name: 'Password',
                      labelText: 'Password'.trim(),
                      obscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                      ]),
                    ),
                    const SizedBox(height: 24),
                    NetflixButton(
                      onPressed: _isLoading ? null : _login,
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text('Sign In'.trim()),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      ),
                      child: Text(
                        'Create Account'.trim(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
