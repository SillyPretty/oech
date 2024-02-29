import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

 bool balanceVisible = true;

class _WalletPageState extends State<WalletPage> {
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
          text: 'Wallet',
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
                const SizedBox(height: 20),
                Container(padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 10),
                  decoration: const BoxDecoration(color: Color(0xffCFCFCF),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      const Text('Top Up'),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        methodCard('Bank'),
                        methodCard('Transfer'),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/addpayment');
                          },
                          child: methodCard('Card'),
                        ),
                      ],),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Transaction History', style: TextStyle(color: Color(0xff3a3a3a), fontSize: 20, fontWeight: FontWeight.w500,),),
                const SizedBox(height: 20),
                const OperationCardWidget(sum: '-N3,000.00', name: 'Delivery fee', date: 'July 7, 2022', color: false,),
                const OperationCardWidget(sum: 'N2,000.00', name: 'Lalalalala', date: 'July 4, 2022', color: true,),
                const OperationCardWidget(sum: '-N3,000.00', name: 'Third Delivery', date: 'July 1, 2022', color: false,),
                const OperationCardWidget(sum: 'N1,000.00', name: 'Another One', date: 'June 27, 2022', color: true,),
                const OperationCardWidget(sum: 'N2,500.00', name: 'Experts Are The Best', date: 'June 23, 2022', color: true,),
                const OperationCardWidget(sum: '-N3,000.00', name: 'Delivery fee', date: 'June 17, 2022', color: false,),
                const OperationCardWidget(sum: '-N3,000.00', name: 'Delivery fee', date: 'July 7, 2022', color: false,),
                const OperationCardWidget(sum: 'N2,000.00', name: 'Lalalalala', date: 'July 4, 2022', color: true,),
                const OperationCardWidget(sum: '-N3,000.00', name: 'Third Delivery', date: 'July 1, 2022', color: false,),
                const OperationCardWidget(sum: 'N1,000.00', name: 'Another One', date: 'June 27, 2022', color: true,),
                const OperationCardWidget(sum: 'N2,500.00', name: 'Experts Are The Best', date: 'June 23, 2022', color: true,),
                const OperationCardWidget(sum: '-N3,000.00', name: 'Delivery fee', date: 'June 17, 2022', color: false,),
                const OperationCardWidget(sum: '-N3,000.00', name: 'Delivery fee', date: 'July 7, 2022', color: false,),
                const OperationCardWidget(sum: 'N2,000.00', name: 'Lalalalala', date: 'July 4, 2022', color: true,),
                const OperationCardWidget(sum: '-N3,000.00', name: 'Third Delivery', date: 'July 1, 2022', color: false,),
                const OperationCardWidget(sum: 'N1,000.00', name: 'Another One', date: 'June 27, 2022', color: true,),
                const OperationCardWidget(sum: 'N2,500.00', name: 'Experts Are The Best', date: 'June 23, 2022', color: true,),
                const OperationCardWidget(sum: '-N3,000.00', name: 'Delivery fee', date: 'June 17, 2022', color: false,),
              ],
        ),
      ),
    ),
      ),
    );
  }

  Column methodCard(String name) {
    return Column(
                      children: [
                        Image.asset('assets/walet/${name.toLowerCase()}.png'),
                        const SizedBox(height: 5),
                        Text(name, style: const TextStyle(color: Color(0xff3A3A3A), fontSize: 12,),),
                      ],
                    );
  }
}

class OperationCardWidget extends StatelessWidget {
  final String sum;
  final String name;
  final String date; 
  final bool color;
  const OperationCardWidget({
    super.key,
    required this.sum,
    required this.name,
    required this.date,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0,2),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.15),
          )
        ]
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sum, style: TextStyle(color: color ? const Color(0xff35B369) : const Color(0xffed3a3a), fontSize: 16, fontWeight: FontWeight.w500,),),
              const SizedBox(height: 3),
              Text(name, style: const TextStyle(color: Color(0xff3a3a3a), fontSize: 12, fontWeight: FontWeight.w500,),),
            ],
          ),
          const Spacer(),
          Text(date, style: const TextStyle(color: Color(0xffa7a7a7), fontSize: 12,),),

        ],
      ),
    );
  }
}