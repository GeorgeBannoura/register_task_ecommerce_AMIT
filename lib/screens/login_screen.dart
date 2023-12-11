import 'package:flutter/material.dart';
import 'package:register_screen_task_2/controllers/navigation_controller.dart';
import 'package:register_screen_task_2/screens/register_screen.dart';
import 'package:register_screen_task_2/screens/verification_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  bool rememberMe = false;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getWelcomeSection(),
              _spaceWidget(20.0),
              _welcomeImage(),
              _spaceWidget(20.0),
              _buildFormFields(),
              _buildBottomSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _spaceWidget(double height) {
    return SizedBox(height: height);
  }

  Widget _getWelcomeSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome Back!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32.0,
          ),
        ),
        Text(
          "Login to your existing account",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }

  Widget _welcomeImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/ecommerce.png",
          width: 80.0,
        ),
      ],
    );
  }

  String? _emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    return null;
  }

  String? _passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  Widget _buildFormFields() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTitle("Email Address"),
          _buildCustomField(
            'e.g name@example.com',
            _emailController,
            _emailValidator,
            keyboardType: TextInputType.emailAddress,
          ),
          _spaceWidget(20.0),
          _buildTitle("Password"),
          _buildCustomField(
            'e.g ****************',
            _passwordController,
            _passwordValidator,
            keyboardType: TextInputType.visiblePassword,
            isObsecure: true,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomField(String hintText, TextEditingController controller,
      String? Function(String?) validator,
      {required TextInputType keyboardType, bool isObsecure = false}) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 5,
      child: TextFormField(
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        ),
        keyboardType: keyboardType,
        obscureText: isObsecure,
        controller: controller,
        validator: (value) {
          return validator(value);
        },
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Row(
      children: [
        Text(
          title,
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Column(
      children: <Widget>[
        _rememberMeForgotPass(),
        _buildLoginButton(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/images/google.png', width: 30.0),
              onPressed: () {},
            ),
            const SizedBox(width: 20.0),
            IconButton(
              icon: Image.asset('assets/images/facebook.png', width: 30.0),
              onPressed: () {},
            ),
          ],
        ),
        _spaceWidget(20.0),
        TextButton(
          onPressed: () {
            NavigationController.navigateTo(context, RegisterScreen());
          },
          child: const Text(
            "Don't have an account? Sign Up",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return TextButton(
      onPressed: () {
        NavigationController.navigateTo(context, const VerificationScreen());
      },
      child: const Card(
        color: Colors.purple,
        child: SizedBox(
          height: 50.0,
          width: double.infinity,
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _rememberMeForgotPass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Checkbox(
              value: widget.rememberMe,
              onChanged: (bool? value) {
                setState(() {
                  widget.rememberMe = value!;
                });
              },
            ),
            const Text('Remember me'),
          ],
        ),
        const Text('Forgot Password'),
      ],
    );
  }
}
