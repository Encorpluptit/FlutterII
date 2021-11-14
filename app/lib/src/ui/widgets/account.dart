import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/src/blocs/account/account_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';

class AccountView extends StatefulWidget {
  final bool loggedIn;
  final String username;
  const AccountView({Key? key, required this.loggedIn, required this.username})
      : super(key: key);

  @override
  State createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if (widget.loggedIn) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.blue.shade900])),
                  child: SizedBox(
                    width: double.infinity,
                    height: height,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.account_circle,
                            size: 150,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            widget.username,
                            style: const TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 50),
                          InkWell(
                              onTap: () {
                                Provider.getBloc<AccountBloc>()
                                    .dispatch(AccountClickOnLogOutEvent());
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: const Offset(2, 4),
                                        blurRadius: 5,
                                        spreadRadius: 2)
                                  ],
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.blue,
                                      Colors.blue.shade900,
                                    ],
                                  ),
                                ),
                                child: const Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              )),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.blue,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'MyMovie',
                  style: GoogleFonts.portLligatSans(
                    textStyle: Theme.of(context).textTheme.headline1,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: () {
                Provider.getBloc<AccountBloc>()
                    .dispatch(AccountClickOnLogInEvent());
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 13),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.blue,
                          offset: Offset(2, 4),
                          blurRadius: 8,
                          spreadRadius: 2)
                    ],
                    color: Colors.white),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Provider.getBloc<AccountBloc>()
                    .dispatch(AccountClickOnRegisterEvent());
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 13),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                // ignore: prefer_const_constructors
                child: Text(
                  'Register now',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }
  }
}
