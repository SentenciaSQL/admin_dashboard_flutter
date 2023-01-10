import 'package:admin_dasboard/providers/auth_provider.dart';
import 'package:admin_dasboard/providers/login_form_provider.dart';
import 'package:admin_dasboard/router/router.dart';
import 'package:admin_dasboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dasboard/ui/buttons/link_text.dart';
import 'package:admin_dasboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {

        final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);

        return Container(
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 370),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: loginFormProvider.formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Please enter some text';
                      if (!EmailValidator.validate(value)) return 'Please enter a valid email';
                      return null;
                    },
                    onChanged: (value) => loginFormProvider.email = value,
                    style: const TextStyle(color: Colors.white),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Phone, email or username',
                      label: 'Phone, email or username',
                      icon: Icons.email_outlined
                    ),
                  ),
    
                  const SizedBox(height: 20),
    
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Please enter some text';
                      if (value.length < 6 ) return 'Password must be at least of six characters';
                      
                      return null;
                    },
                    onChanged: (value) => loginFormProvider.password = value,
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: CustomInputs.loginInputDecoration(
                      hint: '********',
                      label: 'Password',
                      icon: Icons.lock_outline
                    ),
                  ),
    
                  const SizedBox(height: 20),
    
                  CustomOutlinedButton(onPressed: () {
                    if (!loginFormProvider.isValidForm()) return;

                    authProvider.login(loginFormProvider.email, loginFormProvider.password);
    
                    // loginFormProvider.isloading = true;
    
                    // Future.delayed(const Duration(seconds: 2), () {
                    //   loginFormProvider.isloading = false;
                    //   Navigator.pushReplacementNamed(context, Flurorouter.dashboardRoute);
                    // });
                  }, text: 'Login'),
    
                  const SizedBox(height: 20),
    
                  LinkText(text: 'New Account', onPressed: () => Navigator.pushNamed(context, Flurorouter.registerRoute))
                ],
              )
            )
        ))
      );
      },)
    );
  }
}
