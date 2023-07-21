import 'package:flutter/material.dart';
import 'package:spartan_mobile/repository/auth_repo.dart';
import 'package:spartan_mobile/utils/colors.dart';
import 'package:spartan_mobile/widgets/toast/toast_alert.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  Map<String, dynamic> _user = {};

  @override
  void initState(){
    getFirstData();
    super.initState();
  }

  void getFirstData() async {
    await getUser();
  }

  Future<void> getUser() async {
    await AuthRepo.instance.getSession("user").then((value) {
      setState((){
        _user = value;
      });
    });
  }

  void navigation(String routeName) {
    if(_user['role'] == 1) {
      Navigator.of(context).pushNamed(routeName);
    }else{
      ToastAlert.instance.showMessage(customMessage: true, customMessageText: "Hanya yang berwenang");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Container(
            padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
            decoration: BoxDecoration(
              color: bgWhite,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 50,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                const Text("Rekap Data", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 40,),
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: ((){
                            navigation("/report_presence");
                          }),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: bgLightTransparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Image.asset("assets/images/icon/note.png")
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Text("Absensi", style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        )
                    ),
                    Expanded(
                        child: GestureDetector(
                          onTap: ((){
                            navigation("/report_permission");
                          }),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: bgLightTransparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Image.asset("assets/images/icon/soldier.png")
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Text("Perizinan", style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 35,),
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: ((){
                            navigation("/report_vehicle_van_permission");
                          }),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: bgLightTransparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Image.asset("assets/images/icon/armored-van.png")
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Text("Ranpur", style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        )
                    ),
                    Expanded(
                        child: GestureDetector(
                          onTap: ((){
                            navigation("/report_vehicle_permission");
                          }),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: bgLightTransparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Image.asset("assets/images/icon/armored-vehicle.png")
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Text("Angkutan", style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 35,),
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: ((){
                            navigation("/report_armory");
                          }),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: bgLightTransparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Image.asset("assets/images/icon/barracks.png")
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Text("Gudang Senjata", style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        )
                    ),
                    Expanded(
                        child: GestureDetector(
                          onTap: ((){
                            navigation("/report_logistics");
                          }),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: bgLightTransparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Image.asset("assets/images/icon/backpack.png")
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Text("Logistik", style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
