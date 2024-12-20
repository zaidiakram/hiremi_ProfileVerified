import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremi/widgets/CircularProgress.dart';
import 'package:hiremi/widgets/customBottomNavbar.dart';
import 'package:hiremi/widgets/divider_line.dart';

class ProfileVerificationPage extends StatefulWidget {
  @override
  _ProfileVerificationPageState createState() =>
      _ProfileVerificationPageState();
}

class _ProfileVerificationPageState extends State<ProfileVerificationPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // bool? _isDifferentlyAbled = false;
  String? _isDifferentlyAbled = 'No';
  int _selectedIndex = 0;
  bool _isFormValid = true;

  final TextEditingController _birthStateController = TextEditingController();
  final TextEditingController _birthCityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  void dispose() {
    _birthStateController.dispose();
    _birthCityController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onContinuePressed() {
    if (formKey.currentState?.validate() == true &&
        _isDifferentlyAbled != null) {
      setState(() {
        _isFormValid = true;
      });
      // All validations passed, proceed with form submission
      print('Form is valid');
    } else {
      setState(() {
        _isFormValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(screenWidth * 0.015),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffECF5FF),
            ),
            //  height: screenWidth * 0.09,
            //  width: screenWidth * 0.09,
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ),
        title: Text(
          'Review & Verify Your Profile',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14 * fontScale,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: screenWidth * 0.02,
                top: screenHeight * 0.01,
                child: CircleAvatar(
                  radius: screenWidth * 0.02,
                  backgroundColor: const Color(0xffDBE4FF),
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: const Color(0xff0F3CC9),
                      fontSize: 10 * fontScale,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.24,
                child: const Circularprogress(progress: 25),
              ),
              SizedBox(height: screenHeight * 0.01),
              horizontalLine(context),
              SizedBox(height: screenHeight * 0.01),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Text(
                    'Personal Information',
                    style: GoogleFonts.poppins(
                      fontSize: 20 * fontScale,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff0F3CC9),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _birthStateController,
                        decoration: InputDecoration(
                          labelText: 'Birth State',
                          hintText: 'eg: West Bengal',
                          labelStyle: GoogleFonts.poppins(
                            color: const Color(0xff0F3CC9),
                            fontSize: 14 * fontScale,
                            fontWeight: FontWeight.w600,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xff0056D6)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: TextFormField(
                        controller: _birthCityController,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'Birth City',
                          hintText: 'eg: Kolkata',
                          labelStyle: GoogleFonts.poppins(
                            color: const Color(0xff0F3CC9),
                            fontSize: 14 * fontScale,
                            fontWeight: FontWeight.w600,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xff0056D6)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Are you differently abled?',
                                labelStyle: GoogleFonts.poppins(
                                  color: const Color(0xff0F3CC9),
                                  fontSize: 12 * fontScale,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Color(0xff0056D6)),
                                ),
                                prefixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio<String>(
                                      value: 'No',
                                      groupValue: _isDifferentlyAbled,
                                      activeColor: const Color(0xff0F3CC9),
                                      onChanged: (value) {
                                        setState(() {
                                          _isDifferentlyAbled = value;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'No',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio<String>(
                                      value: 'Yes',
                                      groupValue: _isDifferentlyAbled,
                                      activeColor: const Color(0xff0F3CC9),
                                      onChanged: (value) {
                                        setState(() {
                                          _isDifferentlyAbled = value;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Yes',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.03,
                                    ),
                                  ],
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: TextFormField(
                           controller: _pincodeController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            labelText: 'Current Pincode',
                            hintText: 'eg: 502032',
                            labelStyle: GoogleFonts.poppins(
                              color: const Color(0xff0F3CC9),
                              fontSize: 14 * fontScale,
                              fontWeight: FontWeight.w600,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xff0056D6)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else if (value.length != 6) {
                              return 'Pincode must be 6 digits';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!_isFormValid)
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    ' Required fields are incomplete.\n Fill them out to move forward. ',
                    style: GoogleFonts.poppins(color: Color(0xffC90F0F),fontSize: 14,fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              SizedBox(height: screenHeight * 0.08),
              ElevatedButton(
                onPressed: _onContinuePressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0F3CC9),
                  minimumSize: Size(screenWidth * 0.7, screenHeight * 0.06),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.poppins(
                    fontSize: 14 * fontScale,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
    );
  }
}
