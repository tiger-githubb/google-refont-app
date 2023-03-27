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
  final List<String> _servicesIconName = [
    'youtube',
    'gmail',
    'google-drive',
    'google-meet',
    'google-translate'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
            child: ListView(
              children: [
                _appBar(),
                _googleIcon(),
                _searchField(),
                _voice(),
                _services(),
                _setting(),
                _footer()
              ],
            ),
        ),
      ),
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

  Widget _searchField() {
    return Container(
      margin: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
      child: Material(
        elevation: 10,
        shadowColor: const Color(0xffBFC4DD).withOpacity(0.18),
        borderRadius: BorderRadius.circular(50),
        child: TextField(
          style:
              const TextStyle(height: 1.9, color: Colors.black, fontSize: 18),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
            filled: true,
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 30.sp,
              color: const Color(0xff4285F4),
            ),
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: Color(0xffA4ADC1),
            ),
            hintText: 'Recherche Google',
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _voice() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.h),
          height: 130.w,
          width: 130.w,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xffEBF3FF))),
          child: Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xffEBF3FF))),
            child: Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xffEBF3FF))),
              child: Center(
                child: SvgPicture.asset('assets/vectors/voice-recorder.svg'),
              ),
            ),
          ),
        ),
        const Text(
          "Ton assistant vocal ...",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w300, fontSize: 20),
        ),
      ],
    );
  }

  Widget _services() {
    return SizedBox(
      height: 110.h,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 10.w,
        ),
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 60.w,
              width: 60.w,
              child: Center(
                child: SvgPicture.asset(
                    'assets/vectors/' + _servicesIconName[index] + '.svg'),
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffE3E8EF),
                    blurRadius: 50, // has the effect of softening the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      2.0, // vertical, move down 10
                    ),
                  )
                ],
              ));
        },
        itemCount: _servicesIconName.length,
      ),
    );
  }

  Widget _setting() {
    return Container(
      margin: EdgeInsets.only(left: 40.w, right: 40.w, top: 60.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info,
            size: 30.sp,
          ),
          SizedBox(
            width: 20.w,
          ),
          Icon(
            Icons.settings,
            size: 30.sp,
          ),
          SizedBox(
            width: 20.w,
          ),
          Container(
            width: 170.w,
            height: 55.h,
            decoration: BoxDecoration(
                color: const Color(0xffE3E8EF),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffE3E8EF),
                    blurRadius: 50, // has the effect of softening the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      2.0, // vertical, move down 10
                    ),
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.only(right: 15.w, left: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'English',
                    style: TextStyle(
                        color: const Color(0xff596A91), fontSize: 13.sp),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 35.sp,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _footer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Privacy',
                style:
                    TextStyle(color: const Color(0xff596A91), fontSize: 14.sp),
              ),
              Text(
                'Conditions',
                style:
                    TextStyle(color: const Color(0xff596A91), fontSize: 14.sp),
              ),
              Text(
                'Preference',
                style:
                    TextStyle(color: const Color(0xff596A91), fontSize: 14.sp),
              )
            ],
          ),
        ),
      ],
    );
  }
}
