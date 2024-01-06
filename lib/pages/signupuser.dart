import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _currentStep = 0;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  List<String> _selectedAllergens = [];
  List<String> _selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white), // Başlık rengi beyaz
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/jpg/bg2.jpg'),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stepper(
            type: StepperType.vertical,
            currentStep: _currentStep,
            onStepContinue: () {
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
                setState(() {
                  _currentStep += 1;
                });
                _completeLogin();
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep -= 1;
                });
              }
            },
            steps: [
              Step(
                title: Text(
                  'Kullanıcı Adı ve Şifre',
                  style: TextStyle(color: Colors.white), // Başlık rengi beyaz
                ),
                content: Column(
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Kullanıcı Adı',
                        labelStyle:
                            TextStyle(color: Colors.white), // Label rengi beyaz
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Şifre',
                        labelStyle:
                            TextStyle(color: Colors.white), // Label rengi beyaz
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
                isActive: _currentStep == 0,
              ),
              Step(
                title: Text(
                  'Alerjen Seçimi',
                  style: TextStyle(color: Colors.white), // Başlık rengi beyaz
                ),
                content: CheckboxList(
                  items: [
                    'Dairy',
                    'Gluten',
                    'Peanut',
                    'Soy',
                    'Egg',
                    'Sea Food',
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
                  'Kategori Seçimi',
                  style: TextStyle(color: Colors.white), // Başlık rengi beyaz
                ),
                content: CheckboxList(
                  items: [
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

  void _completeLogin() {
    print('Seçilen Alerjenler: $_selectedAllergens');
    print('Seçilen Kategoriler: $_selectedCategories');
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
            style: TextStyle(color: Colors.white), // Yazı rengi beyaz
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
