import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rich/widgets/app_bar.dart';
import 'package:rich/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
  bool balanceVisible = true;

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 4.0,
        centerTitle: true,
        title: const AppBarWidget(
          text: 'Profile',
          isBack: false,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/profile/ken_img.png'),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hello Ken',
                      style: TextStyle(
                        color: Color(0xff3a3a3a),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Wrap(
                      children: [
                        const Text('Current balance:',
                          style: TextStyle(
                            color: Color(0xff3a3a3a),
                            fontSize: 12,
                          ),
                        ),
                        Text(balanceVisible ? ' N10,712:00' : '*****',
                          style: const TextStyle(
                            color: Color(0xff0560FA),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                    IconButton(onPressed: (){
                      balanceVisible = !balanceVisible;
                      setState(() {
                      });
                    }, icon: Icon(balanceVisible ? Icons.visibility : Icons.visibility_off, color: const Color(0xff3a3a3a),),)
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Enable dark Mode',
                      style: TextStyle(
                        color: Color(0xff3a3a3a),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CupertinoSwitch(
                      activeColor: Colors.blue,
                      value: false,
                      onChanged: (bool value) {},
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const ProfileWidget(title: 'Edit Profile', subTitle: 'Name, phone no, address, email ...', img: 'assets/profile/profile.png',),
                const ProfileWidget(title: 'Statements & Reports', subTitle: 'Download transaction details, orders, deliveries', img: 'assets/profile/reports.png',),
                InkWell(onTap: ()=> Navigator.of(context).pushNamed('/notification'),child: const ProfileWidget(title: 'Notification Settings', subTitle: 'mute, unmute, set location & tracking setting', img: 'assets/profile/notification.png',)),
                const ProfileWidget(title: 'Card & Bank account settings', subTitle: 'change cards, delete card details', img: 'assets/profile/walet.png',),
                const ProfileWidget(title: 'Referrals', subTitle: 'check no of friends and earn', img: 'assets/profile/referals.png',),
                const ProfileWidget(title: 'About Us', subTitle: 'know more about us, terms and conditions', img: 'assets/profile/map.png',),
                InkWell(onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/onboarding1',
                      (Route<dynamic> route) => false,
                    );
                },
                child: const ProfileWidget(title: 'Log Out', subTitle: '', img: 'assets/profile/log-out.png',),),
                SizedBox(height: 10),
    ],
            ),
          ),
        ),
      ),
    );
  }
}