import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  bool rememberMe = false;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
          "SignUP!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32.0,
          ),
        ),
        Text(
          "Please enter your info to signup",
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

  String? _nameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  Widget _buildFormFields() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTitle("Name"),
          _buildCustomField(
            "Please Enter your Name",
            _nameController,
            _nameValidator,
            keyboardType: TextInputType.name,
          ),
          _buildTitle("Email"),
          _buildCustomField(
            'Please Enter your Email',
            _emailController,
            _emailValidator,
            keyboardType: TextInputType.emailAddress,
          ),
          _spaceWidget(20.0),
          _buildTitle("Password"),
          _buildCustomField(
            'Please Enter your Password',
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
        _buildLoginButton(),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Do have an account? Sign in",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return TextButton(
      onPressed: () {},
      child: const Card(
        color: Colors.purple,
        child: SizedBox(
          height: 50.0,
          width: double.infinity,
          child: Center(
            child: Text(
              "Signup",
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
}
