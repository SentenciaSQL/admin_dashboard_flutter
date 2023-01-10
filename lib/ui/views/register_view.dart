import 'package:admin_dasboard/providers/register_form_provider.dart';
import 'package:admin_dasboard/router/router.dart';
import 'package:admin_dasboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dasboard/ui/buttons/link_text.dart';
import 'package:admin_dasboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: ((context) {

        final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 370),
            child: Form(
              key: registerFormProvider.formKey,
              child: Column(
                children: [
    
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Please enter some text';
                      if (value.length < 3 ) return 'Name must be at least of three characters';
                      
                      return null;
                    },
                    onChanged: (value) => registerFormProvider.name = value,
                    style: const TextStyle(color: Colors.white),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Input name',
                      label: 'Name',
                      icon: Icons.person_outline
                    ),
                  ),
    
                  const SizedBox(height: 20),
    
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Please enter some text';
                      if (!EmailValidator.validate(value)) return 'Please enter a valid email';
                      return null;
                    },
                    onChanged: (value) => registerFormProvider.email = value,
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
                    onChanged: (value) => registerFormProvider.password = value,
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
                    if (registerFormProvider.isValidForm()) {
                      print('Form is valid');
                    }
                  }, text: 'Create Account'),
    
                  const SizedBox(height: 20),
    
                  LinkText(text: 'Login', onPressed: () => Navigator.pushNamed(context, Flurorouter.loginRoute))
                ],
              )
            )
        ))
      );
      }))
    );
  }
}
