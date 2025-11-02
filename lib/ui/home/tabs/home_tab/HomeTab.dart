import 'package:evently_c16/core/resources/AssetsManager.dart';
import 'package:evently_c16/core/resources/ColorsManager.dart';
import 'package:evently_c16/model/User.dart';
import 'package:evently_c16/providers/UserProvider.dart';
import 'package:evently_c16/ui/home/tabs/home_tab/widgets/AllView.dart';
import 'package:evently_c16/ui/home/tabs/home_tab/widgets/BirthdayView.dart';
import 'package:evently_c16/ui/home/tabs/home_tab/widgets/BookClubView.dart';
import 'package:evently_c16/ui/home/tabs/home_tab/widgets/SportView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedTap = 0;
  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(24)
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back ✨",style: TextStyle(
                    color: ColorsManager.lightBackgroundColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                  ),),
                  provider.user==null?
                      Center(child: CircularProgressIndicator(
                        color: Colors.white,
                      ),)
                      :Text(provider.user!.name!,style: TextStyle(
                    color: ColorsManager.lightBackgroundColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24
                  ),),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/map.svg"),
                      SizedBox(width: 4,),
                      Text("Cairo , Egypt",style: TextStyle(
                          color: ColorsManager.lightBackgroundColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                      ),),
                    ],
                  ),
                  SizedBox(height: 8,),
                  TabBar(
                    onTap: (value) {
                      setState(() {
                        selectedTap = value;
                      });
                    },
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      unselectedLabelColor:ColorsManager.lightBackgroundColor ,
                      labelColor: ColorsManager.primaryColor,
                      labelStyle:TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ) ,
                      unselectedLabelStyle:TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ) ,
                      dividerHeight: 0,
                      indicatorColor: Colors.white,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(46),
                        color: Colors.white,
                      ),
                      tabs: [
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(46),
                              border:Border.all(color: ColorsManager.lightBackgroundColor)
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/images/Compass.svg",

                                  colorFilter: ColorFilter.mode(
                                      selectedTap==0?ColorsManager.primaryColor:ColorsManager.lightBackgroundColor,
                                      BlendMode.srcIn),),
                                SizedBox(width: 8,),
                                Text("All")
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(46),
                                border:Border.all(color: ColorsManager.lightBackgroundColor)
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/images/bike.svg",

                                  colorFilter: ColorFilter.mode(selectedTap==1?ColorsManager.primaryColor:ColorsManager.lightBackgroundColor,
                                      BlendMode.srcIn),),
                                SizedBox(width: 8,),
                                Text("Sport")
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16
                          ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(46),
                                border:Border.all(color: ColorsManager.lightBackgroundColor)
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/images/cake.svg",

                                  colorFilter: ColorFilter.mode(selectedTap==2?ColorsManager.primaryColor:ColorsManager.lightBackgroundColor,
                                      BlendMode.srcIn),),
                                SizedBox(width: 8,),
                                Text("Birthday")
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(46),
                                border:Border.all(color: ColorsManager.lightBackgroundColor)
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/images/book-open.svg",

                                  colorFilter: ColorFilter.mode(selectedTap==3?ColorsManager.primaryColor:ColorsManager.lightBackgroundColor,
                                      BlendMode.srcIn),),
                                SizedBox(width: 8,),
                                Text("Book Club")
                              ],
                            ),
                          ),
                        ),
                      ]
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    AllView(),
                    SportView(),
                    BirthdayView(),
                    BookClubView()
                  ]
              ),
            ),
          )

        ],
      ),
    );
  }
}
