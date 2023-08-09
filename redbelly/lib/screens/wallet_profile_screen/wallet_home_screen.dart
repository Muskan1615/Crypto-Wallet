import 'dart:ui';
import 'package:flutter/material.dart';
import '/screens/wallet_profile_screen/token_bnb_screen.dart';
import '/screens/wallet_profile_screen/import_account_screen.dart';
import '/screens/wallet_profile_screen/create_account_screen.dart';
import '/screens/wallet_profile_screen/change_account_screen.dart';
import '/screens/wallet_profile_screen/network_screen.dart';
import 'widgets/token.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/text_theme.dart';

class WalletHomeScreen extends StatefulWidget {
  final bool? showCreateAccountScreen;
  final bool? showImportAccountScreen;
  const WalletHomeScreen({
    super.key,
    this.showCreateAccountScreen,
    this.showImportAccountScreen,
  });

  @override
  State<WalletHomeScreen> createState() => _WalletHomeScreenState();
}

class _WalletHomeScreenState extends State<WalletHomeScreen>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  bool showNetworkScreen = false;
  bool showChangeAccountScreen = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (showNetworkScreen ||
                showChangeAccountScreen ||
                widget.showCreateAccountScreen == true ||
                widget.showImportAccountScreen == true)
            ? const Color(0x99222531)
            : null,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 100, left: 16),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showChangeAccountScreen = true;
                  });
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/profile_pic3.jpg'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -3,
                      right: -8,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: primarySwatch[5]),
                        child: Center(
                          child: Image.asset(
                            'images/change.png',
                            width: 17,
                            height: 17,
                            color: primarySwatch,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Etherium Main',
              style: textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            IconButton(
              splashRadius: null,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: const Icon(
                Icons.expand_more_rounded,
              ),
              onPressed: () {
                setState(() {
                  showNetworkScreen = true;
                });
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 54,
                      bottom: 24,
                    ),
                    child: ShaderMask(
                      shaderCallback: (bounds) => Gradients.customShader(
                        bounds,
                        Gradients.gradient6,
                      ),
                      child: Text(
                        '9.2362 ETH',
                        style: textTheme.displaySmall,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "\$16,858.15  ",
                      style: textTheme.bodySmall!.copyWith(
                          fontSize: 18,
                          color: surfaceSwatch[4],
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: "+0.7%",
                          style: textTheme.bodySmall!.copyWith(
                              color: onPrimarySwatch[5],
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                  ),
                  child: Wrap(
                    spacing: 10,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(12)),
                          backgroundColor:
                              MaterialStatePropertyAll(surfaceSwatch[21]),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(110, 48)),
                          textStyle:
                              MaterialStatePropertyAll(textTheme.titleSmall),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'images/sent.png',
                              color: primarySwatch,
                            ),
                            const Text(
                              'Sent',
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(12)),
                          backgroundColor:
                              MaterialStatePropertyAll(surfaceSwatch[21]),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(145, 48)),
                          textStyle:
                              MaterialStatePropertyAll(textTheme.titleSmall),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'images/receive.png',
                              color: primarySwatch,
                            ),
                            const Text(
                              'Receive',
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(12)),
                          backgroundColor:
                              MaterialStatePropertyAll(surfaceSwatch[21]),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(105, 48)),
                          textStyle:
                              MaterialStatePropertyAll(textTheme.titleSmall),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'images/buy.png',
                              color: primarySwatch,
                            ),
                            const Text(
                              'Buy',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: primarySwatch,
                    labelStyle: textTheme.titleMedium,
                    unselectedLabelColor: surfaceSwatch[13],
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: const EdgeInsets.only(bottom: 8),
                    tabs: const [
                      SizedBox(
                        width: 90,
                        child: Tab(text: 'Token'),
                      ),
                      SizedBox(
                        width: 130,
                        child: Tab(text: 'Collectibles'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 500,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView(
                        padding: const EdgeInsets.symmetric(
                            vertical: 32, horizontal: 40),
                        children: [
                          TokenListView(
                             showTrailingIcon: false,
                            leading: 'images/binance.png',
                            title: 'Binance Coin',
                            subtitle1: '\$226.69   ',
                            subtitle2: '+2%',
                            subtitle2Color: onPrimarySwatch[5],
                            trailing1: '19.2371 BNB',
                            trailing2: '',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const TokenBNBScreen();
                                  },
                                ),
                              );
                            },
                          ),
                          TokenListView(
                             showTrailingIcon: false,
                            leading: 'images/usdc.png',
                            title: 'USD Coin',
                            subtitle1: '\$1.00   ',
                            subtitle2: '+4.3%',
                            subtitle2Color: onPrimarySwatch[5],
                            trailing1: '92,3 USDC',
                            trailing2: '',
                          ),
                          TokenListView(
                             showTrailingIcon: false,
                            leading: 'images/synthetix.png',
                            leadingColor: primarySwatch[5],
                            title: 'Synthetix',
                            subtitle1: '\$20.83   ',
                            subtitle2: '-1.3%',
                            subtitle2Color: errorSwatch[5],
                            trailing1: '42.74 SNX',
                            trailing2: '',
                          ),
                        ],
                      ),
                      const Center(child: Text('Collectibles Tab Content')),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(16)),
                      foregroundColor:
                          MaterialStatePropertyAll(secondarySwatch[5]),
                      fixedSize: const MaterialStatePropertyAll(Size(180, 56)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                        ),
                        Text(
                          '  Add Tokens',
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          if (showNetworkScreen)
            WillPopScope(
              onWillPop: () async {
                setState(() {
                  showNetworkScreen = false;
                });
                return false;
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showNetworkScreen = false;
                        });
                      },
                      child: const Stack(
                        children: [
                          ModalBarrier(
                            color: Color(0x99222531),
                            dismissible: true,
                          ),
                        ],
                      ),
                    ),
                    const NetworkScreen(),
                  ],
                ),
              ),
            ),
          if (showChangeAccountScreen)
            WillPopScope(
              onWillPop: () async {
                setState(() {
                  showChangeAccountScreen = false;
                });
                return false;
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showChangeAccountScreen = false;
                        });
                      },
                      child: const Stack(
                        children: [
                          ModalBarrier(
                            color: Color(0x99222531),
                            dismissible: true,
                          ),
                        ],
                      ),
                    ),
                    const ChangeAccountScreen(),
                  ],
                ),
              ),
            ),
          if (widget.showCreateAccountScreen == true)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Stack(
                      children: [
                        ModalBarrier(
                          color: Color(0x99222531),
                          dismissible: true,
                        ),
                      ],
                    ),
                  ),
                  const CreateAccountScreen(),
                ],
              ),
            ),
          if (widget.showImportAccountScreen == true)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Stack(
                      children: [
                        ModalBarrier(
                          color: Color(0x99222531),
                          dismissible: true,
                        ),
                      ],
                    ),
                  ),
                  const ImportAccountScreen(),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: (showNetworkScreen ||
              showChangeAccountScreen ||
              widget.showCreateAccountScreen == true ||
              widget.showImportAccountScreen == true)
          ? null
          : BottomNavigationBar(
              backgroundColor: surfaceSwatch[24],
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              unselectedItemColor: surfaceSwatch[12],
              unselectedFontSize: 14,
              selectedLabelStyle: textTheme.labelLarge!.copyWith(
                foreground: Paint()
                  ..shader = Gradients.customShader(
                      const Rect.fromLTWH(0.0, 0.0, 150.0, 200.0),
                      Gradients.gradient2),
              ),
              unselectedLabelStyle:
                  textTheme.labelLarge!.copyWith(color: surfaceSwatch[12]),
              items: [
                BottomNavigationBarItem(
                  icon: currentIndex == 0
                      ? ShaderMask(
                          shaderCallback: (bounds) => Gradients.customShader(
                            bounds,
                            Gradients.gradient2,
                          ),
                          child: const Icon(Icons.wallet_outlined),
                        )
                      : const Icon(Icons.wallet_outlined),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 1
                      ? ShaderMask(
                          shaderCallback: (bounds) => Gradients.customShader(
                            bounds,
                            Gradients.gradient2,
                          ),
                          child:
                              const Icon(Icons.swap_horizontal_circle_outlined),
                        )
                      : const Icon(Icons.swap_horizontal_circle_outlined),
                  label: 'Swap',
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 2
                      ? ShaderMask(
                          shaderCallback: (bounds) => Gradients.customShader(
                            bounds,
                            Gradients.gradient2,
                          ),
                          child: const Icon(Icons.settings_outlined),
                        )
                      : const Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ],
            ),
    );
  }
}
