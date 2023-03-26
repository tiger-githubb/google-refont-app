import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        children: [
          _appBar(),
          _googleIcon(),
        ],
      )),
    );
  }

  Widget _appBar() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, left: 40.w, right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _menu(),
          Row(
            children: [
              _darkMode(),
              SizedBox(
                width: 15.w,
              ),
              _userinfo(),
            ],
          )
        ],
      ),
    );
  }

  Widget _menu() {
    return SvgPicture.asset('assets/vectors/menu-de-puntos.svg');
  }

  Widget _darkMode() {
    return FlutterSwitch(
      width: 48.0,
      height: 27.0,
      valueFontSize: 12.0,
      toggleSize: 30.0,
      value: _switchValue,
      padding: 2,
      inactiveColor: const Color(0xffD2D9EA),
      inactiveIcon: SizedBox(
        width: 6.w,
        child: SvgPicture.asset('assets/vectors/moon.svg'),
      ),
      activeIcon: SizedBox(
        width: 6.w,
        child: SvgPicture.asset('assets/vectors/moon.svg'),
      ),
      activeColor: const Color.fromARGB(255, 255, 197, 116),
      onToggle: (val) {
        setState(() {
          _switchValue = val;
        });
      },
    );
  }

  Widget _userinfo() {
    return Container(
      width: 140.w,
      height: 50.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0ffe38ef),
            blurRadius: 50,
            offset: Offset(
              0.0,
              2.0,
            ),
          ),
        ],
      ),
      child: Padding(
          padding: EdgeInsets.only(right: 15.w, left: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Image(image: AssetImage('assets/images/logo-circle.png')),
              Text(
                'Tiger',
                style:
                    TextStyle(color: const Color(0xff596A91), fontSize: 20.sp),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: const Color(0xff596A91),
                size: 28.sp,
              )
            ],
          )),
    );
  }

  Widget _googleIcon() {
    return Container(
      margin: EdgeInsets.only(top: 70.h),
      child: SvgPicture.asset('assets/vectors/google.svg'),
    );
  }
}
