import 'package:flutter/material.dart';

class AddRecipe extends StatefulWidget {
  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _ingredientsController = TextEditingController();
  TextEditingController _stepsController = TextEditingController();

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
                      child: Text('Tarifi Kaydet'),
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
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
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
          ),
        ),
        transform: Matrix4.identity()..scale(isSelected ? 1.05 : 1.0),
      ),
    );
  }

  void _saveRecipe() {
    String title = _titleController.text;
    String ingredients = _ingredientsController.text;
    String steps = _stepsController.text;
    bool allergens = selectedAllergens.isNotEmpty;
    bool success = true; // Başarılı durumu kontrolü

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: success &&
                  title.isNotEmpty &&
                  ingredients.isNotEmpty &&
                  steps.isNotEmpty & allergens
              ? Colors.green[400]
              : Colors.red[400],
          title: Row(
            children: [
              success &&
                      title.isNotEmpty &&
                      ingredients.isNotEmpty &&
                      steps.isNotEmpty & allergens
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 30.0,
                    )
                  : Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: 30.0,
                    ),
              SizedBox(width: 8.0),
              Text(
                success &&
                        title.isNotEmpty &&
                        ingredients.isNotEmpty &&
                        steps.isNotEmpty & allergens
                    ? 'Harika!'
                    : 'Hay Aksi!',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          content: Text(
            success &&
                    title.isNotEmpty &&
                    ingredients.isNotEmpty &&
                    steps.isNotEmpty & allergens
                ? '$title tarifiniz başarıyla kaydedildi.'
                : 'Tarif kaydedilirken bir hata oluştu.\nLütfen tüm alanları doldurduğunuzdan emin olun.',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }
}
