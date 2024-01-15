import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_wizard/components/custom_alert_dialog.dart';
import 'package:recipe_wizard/components/text_field.dart';
import 'package:recipe_wizard/pages/bottom_navigation.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _currentStep = 0;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  List<String> _selectedAllergens = [];
  List<String> _selectedCategories = [];

  void handleStepContinue() {
    if (_currentStep == 0) {
      if (_usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        setState(() {
          _currentStep += 1;
        });
      }
    } else if (_currentStep == 1) {
      setState(() {
        _currentStep += 1;
      });
    } else if (_currentStep == 2) {
      _completeLogin();
    }
  }

  void _completeLogin() {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _selectedAllergens.isNotEmpty &&
        _selectedCategories.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            success: true,
            content:
                "Kullanıcı kaydı başarılı! Anasayfaya yönlendiriliyorsunuz.",
            redirectTo: BottomNavigation(),
          );
        },
      );
    } else {
      // Show an error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            success: false,
            content: "Lütfen Tüm Alanları Doldurduğunuzdan Emin Olun!",
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white), // Başlık rengi beyaz
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stepper(
            stepIconBuilder: (stepIndex, stepState) =>
                Icon(Icons.person, color: Colors.white),
            type: StepperType.vertical,
            currentStep: _currentStep,
            onStepContinue: handleStepContinue,
            onStepCancel: () => setState(() => _currentStep -= 1),
            steps: [
              Step(
                title: const Text(
                  'Kullanıcı Bilgileri (Tüm alanları doldurunuz.)',
                  style: TextStyle(color: Colors.black), // Başlık rengi beyaz
                ),
                content: Column(
                  children: [
                    const SizedBox(height: 10),
                    CustomTextField(
                      label: 'Kullanıcı Adı',
                      controller: _usernameController,
                    ),
                    CustomTextField(
                      label: 'İsim',
                      controller: _nameController,
                    ),
                    CustomTextField(
                      label: 'Soyisim',
                      controller: _surnameController,
                    ),
                    CustomTextField(
                      label: 'Email',
                      controller: _emailController,
                    ),
                    CustomTextField(
                      label: 'Şifre',
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    CustomTextField(
                      label: 'Şifre Tekrar',
                      controller: _passwordConfirmController,
                      obscureText: true,
                    ),
                  ],
                ),
                isActive: _currentStep == 0,
              ),
              Step(
                title: Text(
                  'Alerjen Seçimi (En az 1 tane seçiniz.)',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins()
                          .fontFamily), // Başlık rengi beyaz
                ),
                content: CheckboxList(
                  items: const [
                    'Dairy',
                    'Gluten',
                    'Peanut',
                    'Soy',
                    'Egg',
                    'Sea Food',
                    'No Allergies'
                  ],
                  selectedItems: _selectedAllergens,
                  onChanged: (List<String> selectedItems) {
                    setState(() {
                      _selectedAllergens = selectedItems;
                    });
                  },
                ),
                isActive: _currentStep == 1,
              ),
              Step(
                title: Text(
                  'Kategori Seçimi (En az 1 tane seçiniz.)',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins()
                          .fontFamily), // Başlık rengi beyaz
                ),
                content: CheckboxList(
                  items: const [
                    'Kahvaltı',
                    'Akşam Yemeği',
                    'Atıştırmalık',
                    'Tatlı',
                    'Salata',
                    'Çorba',
                    'Vejetaryen',
                  ],
                  selectedItems: _selectedCategories,
                  onChanged: (List<String> selectedItems) {
                    setState(() {
                      _selectedCategories = selectedItems;
                    });
                  },
                ),
                isActive: _currentStep == 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckboxList extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;
  final ValueChanged<List<String>> onChanged;

  CheckboxList({
    required this.items,
    required this.selectedItems,
    required this.onChanged,
  });

  @override
  _CheckboxListState createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.items.map((item) {
        return CheckboxListTile(
          title: Text(
            item,
            style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
          ),
          value: widget.selectedItems.contains(item),
          onChanged: (bool? value) {
            setState(() {
              if (value != null) {
                if (value) {
                  widget.selectedItems.add(item);
                } else {
                  widget.selectedItems.remove(item);
                }
                widget.onChanged(widget.selectedItems);
              }
            });
          },
        );
      }).toList(),
    );
  }
}
