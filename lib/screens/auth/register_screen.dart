import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:netflix_app/screens/auth/service/auth_service.dart';
import 'package:netflix_app/screens/auth/widgets/auth_button.dart';
import 'package:netflix_app/screens/auth/widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _authService = AuthService();
  bool _isLoading = false;

  Future<void> _register() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      setState(() => _isLoading = true);
      
      try {
        final values = _formKey.currentState!.value;
        await _authService.register(
          values['email'] as String,
          values['password'] as String,
        );
        
      
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString().trim())),
          );
          Fluttertoast.showToast(msg: "Registerd successfully"); // Show Flutter toast.
          

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                    Text(
                      'Create Account'.trim(),
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 48),
                    NetflixTextField(
                      name: 'email',
                      labelText: 'email'.trim(),
                      keyboardType: TextInputType.emailAddress,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    NetflixTextField(
                      name: 'password',
                      labelText: 'password'.trim(),
                      obscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    NetflixTextField(
                      name: 'confirmPassword',
                      labelText: 'confirm Password'.trim(),
                      obscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        (value) {
                          if (value != _formKey.currentState?.fields['password']?.value) {
                            return 'passwordsDoNotMatch'.trim();
                          }
                          return null;
                        },
                      ]),
                    ),
                    const SizedBox(height: 24),
                    NetflixButton(
                      onPressed: _isLoading ? null : _register,
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text('Register'.trim()),
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