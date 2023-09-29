import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/authentication/authentication.dart';
import 'package:youapp/login/login.dart';
import 'package:youapp/home/home.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  // ignore: library_private_types_in_public_api
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool _noPictProfile = true;
  bool _expandAbout = false;
  bool _expandInterest = false;

  Future<void> _onSubmitted() async {
    print('submit about');

    setState(() {
      _expandAbout = !_expandAbout;
    });
  }

  @override
  Widget build(BuildContext context) {
    final email = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.email,
    );
    final username = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.username,
    );
    final name = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.name,
    );
    final birthday = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.birthday,
    );
    DateTime? dob = DateFormat('yyyy/MM/DD').parse(birthday!);
    var today = DateTime.now();
    final difference = today.difference(dob).inDays;
    final age = (difference / 365).floor();

    final horoscope = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.horoscope,
    );
    final height = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.height,
    );
    final weight = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.weight,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(9, 20, 26, 1),
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 10),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage())),
        ),
        title: Text('@$username'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontFamily: 'Inter-Bold'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_vert),
              )),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(9, 20, 26, 1),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(
                  top: 80,
                )),
                _noPictProfile
                    ? Stack(
                        children: <Widget>[
                          Container(
                            height: 190,
                            margin: const EdgeInsets.only(left: 8, right: 8),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/no-banner.jpg"),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(right: 20, top: 0),
                            child: IconButton(
                              padding: const EdgeInsets.only(left: 10),
                              iconSize: 14,
                              icon: const Icon(Icons.edit, color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  _noPictProfile = !_noPictProfile;
                                });
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 160),
                            child: Text(
                              '@$username',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Inter-Bold',
                              ),
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        children: <Widget>[
                          Container(
                            height: 190,
                            margin: const EdgeInsets.only(left: 8, right: 8),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage("assets/images/banner.jpg"),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          Container(
                            height: 190,
                            margin: const EdgeInsets.only(left: 8, right: 8),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(0, 0, 0, 0.7),
                                    Color.fromRGBO(0, 0, 0, 0),
                                    Color.fromRGBO(0, 0, 0, 1)
                                  ]),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(right: 20, top: 0),
                            child: IconButton(
                              padding: const EdgeInsets.only(left: 10),
                              iconSize: 14,
                              icon: const Icon(Icons.edit, color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  _noPictProfile = !_noPictProfile;
                                });
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 90),
                            child: Text(
                              '@$username, $age',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Inter-Bold',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 115),
                            child: const Text(
                              'Male',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 140, left: 20),
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(28, 32, 28, 1),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Text(
                              '$horoscope',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Inter-SemiBold',
                              ),
                            ),
                          ),
                        ],
                      ),
                const Padding(
                    padding: EdgeInsets.only(
                  top: 20,
                )),
                Stack(
                  children: <Widget>[
                    Container(
                      height: _expandAbout ? 600 : 155,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(14, 25, 31, 1),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 30, top: 13),
                      child: _expandAbout
                          ? GestureDetector(
                              onTap: () {
                                // context
                                //     .read<AboutBloc>()
                                //     .add(const AboutSubmitted());
                                _onSubmitted();
                              },
                              child: const Text(
                                'Save & Update',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 215, 0, 1),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            )
                          : IconButton(
                              padding: const EdgeInsets.only(left: 10, top: 0),
                              iconSize: 14,
                              icon: const Icon(Icons.edit, color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  _expandAbout = !_expandAbout;
                                });
                                print(_expandAbout);
                              },
                            ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 28, top: 13),
                      child: const Text(
                        'About',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter-Bold',
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(left: 28, top: 50, right: 28),
                      child: _expandAbout
                          ? BlocProvider(
                              create: (context) {
                                return AboutBloc(
                                  authenticationRepository: RepositoryProvider
                                      .of<AuthenticationRepository>(context),
                                );
                              },
                              child: const AboutForm(),
                            )
                          : birthday == '' ||
                                  name == '' ||
                                  horoscope == '' ||
                                  height == '' ||
                                  weight == ''
                              ? const Text(
                                  'Add in your your to help others know you better',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.55),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                  ),
                                )
                              : Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      alignment: Alignment.centerLeft,
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'Birthday : ',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Inter',
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.33)),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '$birthday',
                                              style: const TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 13,
                                                  fontFamily: 'Inter-Medium',
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      alignment: Alignment.centerLeft,
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'Horoscope : ',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Inter',
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.33)),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '$horoscope',
                                              style: const TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 13,
                                                  fontFamily: 'Inter-Medium',
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      alignment: Alignment.centerLeft,
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'Heigh : ',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Inter',
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.33)),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '$horoscope CM',
                                              style: const TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 13,
                                                  fontFamily: 'Inter-Medium',
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      alignment: Alignment.centerLeft,
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'Weight : ',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Inter',
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.33)),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '$weight KG',
                                              style: const TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 13,
                                                  fontFamily: 'Inter-Medium',
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                    ),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(
                  top: 20,
                )),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 120,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(14, 25, 31, 1),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 20, top: 0),
                      child: IconButton(
                        padding: const EdgeInsets.only(left: 10, top: 0),
                        iconSize: 14,
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 28, top: 13),
                      child: const Text(
                        'Interest',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter-Bold',
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(left: 28, top: 63, right: 28),
                      child: const Text(
                        'Add in your interest to find a better match',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.55),
                          fontSize: 14,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(
                  top: 20,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
