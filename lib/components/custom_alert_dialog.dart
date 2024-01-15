import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAlertDialog extends StatefulWidget {
  final bool success;
  final String content;
  final Widget? redirectTo;

  const CustomAlertDialog({
    required this.success,
    required this.content,
    this.redirectTo,
  });

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );

    // Animasyonu başlat
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AlertDialog(
        backgroundColor:
            widget.success ? Colors.green[400] : Colors.red[400],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                widget.success
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
                SizedBox(width: 10.0),
                Text(
                  widget.success ? 'Harika !' : 'Hay Aksi !',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              widget.content,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            style: TextButtonTheme.of(context).style!.copyWith(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                ),
            onPressed: () {
              _animationController.reverse();
              // Animasyon tamamlandığında dialog penceresini kapat
              _animationController.addStatusListener((status) {
                if (status == AnimationStatus.dismissed) {
                  Navigator.pop(context);
                  if (widget.success && widget.redirectTo != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => widget.redirectTo!,
                      ),
                    );
                  }
                }
              });
            },
            child: Text(
              'Tamam',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
