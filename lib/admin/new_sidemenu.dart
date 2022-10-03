import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:protalent_eksad/admin/client/client_dashboard.dart';
import 'package:protalent_eksad/admin/contact/contactList.dart';
import 'package:protalent_eksad/admin/dashboard/desc_talent.dart';
import 'package:protalent_eksad/admin/dashboard/main_dashboard.dart';
import 'package:protalent_eksad/admin/master_data/master_data.dart';
import 'package:protalent_eksad/admin/pages/pages_dashboard.dart';
import 'package:protalent_eksad/admin/setting_dashboard.dart';
import 'package:protalent_eksad/admin/sosmed_dashboard.dart';
import 'package:protalent_eksad/firebase/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) * 2;
    final double itemWidth = size.width / 1.65;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        leadingWidth: 230,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          child: Container(
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo/protalent.png'),
                    fit: BoxFit.fill)),
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(
              Icons.remove_red_eye,
            ),
            label: const Text(
              'Site Online',
            ),
          ),
          TextButton.icon(
            onPressed: () {
              context.read<FirebaseAuthMethods>().signOut(context);
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(
              Icons.output,
            ),
            label: const Text(
              'Logout',
              style: TextStyle(),
            ),
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            showToggle: true,
            controller: page,
            // onDisplayModeChanged: (mode) {
            //   print(mode);
            // },
            style: SideMenuStyle(
              openSideMenuWidth: 220,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[50],
              selectedColor: Colors.blue[100],
              selectedTitleTextStyle: const TextStyle(color: Colors.black),
              selectedIconColor: Colors.black,
              unselectedIconColor: Colors.black87,
              unselectedTitleTextStyle: const TextStyle(color: Colors.black87),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              backgroundColor: Colors.blueAccent[200],
            ),
            title: Column(
              children: [
                // ConstrainedBox(
                //   constraints: const BoxConstraints(
                //     maxHeight: 150,
                //     maxWidth: 150,
                //   ),
                //   child: Image.asset(
                //     'assets/logo/medapp-logo.png',
                //   ),
                // ),
                // const Divider(
                //   indent: 8.0,
                //   endIndent: 8.0,
                // ),
                Container(
                  height: 20,
                )
              ],
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Protalent By Eksad',
                style: TextStyle(fontSize: 15),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Dashboard',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: const Icon(Icons.home),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Settings',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: const Icon(Icons.settings),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Pages',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: const Icon(Icons.file_copy),
              ),
              // SideMenuItem(
              //   priority: 3,
              //   title: 'Master Data',
              //   onTap: () {
              //     page.jumpToPage(3);
              //   },
              //   icon: const Icon(Icons.table_rows),
              // ),
              SideMenuItem(
                priority: 3,
                title: 'Client',
                onTap: () {
                  page.jumpToPage(3);
                },
                icon: const Icon(Icons.person),
              ),
              // SideMenuItem(
              //   priority: 5,
              //   title: 'Talent Management',
              //   onTap: () {
              //     page.jumpToPage(5);
              //   },
              //   icon: const Icon(Icons.people_alt),
              // ),
              SideMenuItem(
                priority: 4,
                title: 'Social Media',
                onTap: () {
                  page.jumpToPage(4);
                },
                icon: const Icon(Icons.phone_android),
              ),
              SideMenuItem(
                priority: 5,
                title: 'Contact List',
                onTap: () {
                  page.jumpToPage(5);
                },
                icon: const Icon(Icons.contact_phone),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                MainDashboard(
                  all: GridView.count(
                    childAspectRatio: (itemWidth / itemHeight),
                    controller: ScrollController(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 50,
                    children: [
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Bagas",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Qori",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Faid",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Fahrur",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Budi",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Jay",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Rizki",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Tohap",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Manik",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Arham",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Fikri",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Maharani",
                          gender: "Female",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                    ],
                  ),
                  available: GridView.count(
                    childAspectRatio: (itemWidth / itemHeight),
                    controller: ScrollController(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 50,
                    children: [
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Bagas",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Qori",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Faid",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Fahrur",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Budi",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Jay",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Rizki",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Tohap",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Manik",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Arham",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Fikri",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Maharani",
                          gender: "Female",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                    ],
                  ),
                  hired: GridView.count(
                    childAspectRatio: (itemWidth / itemHeight),
                    controller: ScrollController(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 50,
                    children: [
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Bagas",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Qori",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Faid",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Fahrur",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Budi",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Jay",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Rizki",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Tohap",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Manik",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Arham",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Fikri",
                          gender: "Male",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          jumpDetailTalent();
                        },
                        child: Profil(
                          name: "Maharani",
                          gender: "Female",
                          age: "26",
                          exp: "5",
                          skill1: "Java",
                          skill2: "Flutter",
                          skill3: "Quarkus",
                          numSkill: "7",
                          salary: "10.000.000",
                          lastExp: "Java Developer",
                          lastPosition: "Backend Developer",
                          lastCompany: "EKSAD",
                          berapaLama: "Feb 2020 - Juni 2024",
                        ),
                      ),
                    ],
                  ),
                ),
                SettingDashboard(),
                PagesDashboard(),
                //MasterData(),
                UserControl(),
                //TalentManagements(),
                SosmedDashboard(),
                contactList(),
                SelectTalent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void jumpDetailTalent() => page.jumpToPage(8);
}
