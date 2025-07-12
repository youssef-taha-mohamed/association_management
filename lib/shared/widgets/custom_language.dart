import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management/core/extension/extension_helper.dart';
import 'package:management/l10n/l10n.dart';
import 'dart:math' show cos, sin, pi;
import '../../../../../shared/cubits/language/language_cubit.dart';
import '../../../../../shared/widgets/main_text.dart';

class LanguageSelectorSection extends StatefulWidget {
  const LanguageSelectorSection({super.key});

  @override
  State<LanguageSelectorSection> createState() =>
      _LanguageSelectorSectionState();
}

class _LanguageSelectorSectionState extends State<LanguageSelectorSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  int _selectedIndex = 0;
  bool _isExpanded = false;

  final List<Map<String, dynamic>> _languages = const [
    {'code': 'ar', 'flag': 'eg', 'name': 'العربية', 'color': Color(0xFF1E88E5)},
    {'code': 'en', 'flag': 'gb', 'name': 'English', 'color': Color(0xFF43A047)},
    {
      'code': 'fr',
      'flag': 'fr',
      'name': 'Français',
      'color': Color(0xFFE53935),
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getFlagEmoji(String flagCode) {
    return String.fromCharCode(
      (0x1F1E6 + flagCode.codeUnitAt(0) - 'a'.codeUnitAt(0)),
    ) +
        String.fromCharCode(
          (0x1F1E6 + flagCode.codeUnitAt(1) - 'a'.codeUnitAt(0)),
        );
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _selectLanguage(int index) {
    setState(() {
      _selectedIndex = index;
      _isExpanded = false;
      _controller.reverse();
    });
    context.read<LanguageCubit>().saveLanguageCode(_languages[index]['code']);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // زر اللغة مع الأيقونة والنص
        InkWell(
          onTap: _toggleExpanded,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.language, size: 24),
                8.pw,
                MainText(context.l10n.language, fontWeight: FontWeight.bold),
                // const SizedBox(width: 8),
                // Text(
                //   _getFlagEmoji(_languages[_selectedIndex]['flag']),
                //   style: const TextStyle(fontSize: 18),
                // ),
                // const SizedBox(width: 4),
                // MainText(
                //   _languages[_selectedIndex]['name'],
                //   color: _languages[_selectedIndex]['color'],
                //   fontWeight: FontWeight.w500,
                // ),
                4.pw,
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 20,
                ),
              ],
            ),
          ),
        ),

        if (_isExpanded)
          SizedBox(
            height: 180,
            width: 300,
            // height: MediaQuery.of(context).size.height * 0.4,
            // width: MediaQuery.of(context).size.width*.7,
            // margin: const EdgeInsets.only(top: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // عرض جميع اللغات في مواقع ثابتة
                ...List.generate(_languages.length, (index) {
                  // تحديد مواقع ثابتة لكل لغة بغض النظر عن اللغة المختارة
                  double x = 0;
                  double y = 0;

                  // التحقق من كود اللغة مباشرة لتحديد موقعها
                  String languageCode = _languages[index]['code'];

                  if (languageCode == 'en') {
                    // الإنجليزية دائمًا على اليسار
                    x = -90;
                    y = 60;
                  } else if (languageCode == 'fr') {
                    // الفرنسية دائمًا على اليمين
                    x = 90;
                    y = 60;
                  } else if (languageCode == 'ar') {
                    // العربية دائمًا في المنتصف
                    x = 0;
                    y = 100;
                  }

                  // للغة المحددة، نغير فقط المظهر وليس الموقع
                  bool isSelected = (index == _selectedIndex);

                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final scale = _scaleAnimation.value;

                      return Positioned(
                        left: 150 + (x * scale) - 32,
                        top: 1 + (y * scale) - 40,
                        child: Transform.scale(
                          scale: scale,
                          child: GestureDetector(
                            onTap: () => _selectLanguage(index),
                            child: Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: _languages[index]['color']
                                        .withOpacity(isSelected ? 0.5 : 0.2),
                                    blurRadius: isSelected ? 15 : 10,
                                    spreadRadius: isSelected ? 4 : 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                spacing: 2,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MainText(
                                    _getFlagEmoji(_languages[index]['flag']),
                                    fontSize: isSelected ? 24 : 22,
                                  ),
                                  MainText(
                                    _languages[index]['name'],
                                    fontSize: isSelected ? 12 : 11,
                                    fontWeight:
                                    isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: _languages[index]['color'],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
      ],
    );
  }
}