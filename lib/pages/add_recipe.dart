import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_wizard/components/custom_alert_dialog.dart';

class AddRecipe extends StatefulWidget {
  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _ingredientsController = TextEditingController();
  TextEditingController _stepsController = TextEditingController();
  File? _recipeImage;
  // Seçilen alerjenlerin tutulacağı liste
  List<String> selectedAllergens = [];

  Color getColorForCategory(String category) {
    // Kategoriye göre renk belirleme
    switch (category) {
      case 'Deniz Ürünü':
        return Colors.lightBlueAccent;
      case 'Acı':
        return Colors.orange;
      case 'Baharatlı':
        return Colors.redAccent;
      case 'Gluten':
        return Colors.amber;
      default:
        return Colors.green; // Alerjen yok veya diğer durumlar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarif Ekle'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: _recipeImage != null
                  ? Image.file(
                      _recipeImage!,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 80,
                      width: 80,
                      color: Colors.grey[300],
                      child:
                          Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
                    ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Tarif Adı',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _ingredientsController,
              maxLines: 5,
              decoration: InputDecoration(
                  labelText: 'Malzemeler',
                  helperText:
                      'Her malzemeyi virgül ile ayırın. Örn: 1 adet yumurta, 1 su bardağı un'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _stepsController,
              maxLines: 7,
              decoration: InputDecoration(
                  labelText: 'Yapılış',
                  helperText:
                      'Her adımı virgül ile ayırın. Örn: Yumurtayı kırın, Unu ekleyin'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Alerjenler:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              children: [
                _buildAllergenChip('Deniz Ürünü'),
                _buildAllergenChip('Acı'),
                _buildAllergenChip('Baharatlı'),
                _buildAllergenChip('Gluten'),
                _buildAllergenChip('Alerjen Yok')
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _saveRecipe();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Tarifi Kaydet',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _recipeImage = File(pickedFile.path);
      });
    }
  }

  Widget _buildAllergenChip(String category) {
    bool isSelected = selectedAllergens.contains(category);
    Color baseColor = getColorForCategory(category);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedAllergens.remove(category);
          } else {
            selectedAllergens.add(category);
          }
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 600),
            curve: isSelected ? Curves.easeOutBack : Curves.easeInBack,
            decoration: BoxDecoration(
              color: isSelected
                  ? baseColor.withOpacity(0.7)
                  : baseColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text(
              category,
              style: TextStyle(
                  color: isSelected ? Colors.white : baseColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            transform: Matrix4.identity()..scale(isSelected ? 1.05 : 1.0),
          ),
          SizedBox(height: 12.0),
        ],
      ),
    );
  }

  void _saveRecipe() {
    String title = _titleController.text;
    String ingredients = _ingredientsController.text;
    String steps = _stepsController.text;
    bool allergens = selectedAllergens.isNotEmpty;
    
    bool success = title.isNotEmpty && ingredients.isNotEmpty && steps.isNotEmpty && allergens;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          success: success,
          content: success
              ? '$title tarifiniz başarıyla kaydedildi.'
              : 'Tarif kaydedilirken bir hata oluştu.\nLütfen tüm alanları doldurduğunuzdan emin olun.',
          redirectTo:
              null, // İstediğiniz widget'ı buraya ekleyebilirsiniz, eğer bir yönlendirme yapmayacaksanız null bırakabilirsiniz.
        );
      },
    );
  }
}
