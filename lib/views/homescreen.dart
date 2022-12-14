import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gdsc_app/utils/constants.dart';
import 'package:gdsc_app/view_model/projects_view_model.dart';
import 'package:gdsc_app/views/profile_screen.dart';

class Homescreen extends StatefulWidget {
  static const homeScreenId = "/homescreen";
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kAltBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                height: 200.0,
                width: size.width,
                padding: const EdgeInsets.only(top: 12.0, right: 5.0),
                decoration: BoxDecoration(
                  color: kHomeUserProfileCard,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Hi, Person",
                        style: kH1TextStyle,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Expanded(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            child: Container(
                              width: (size.width - 16) * 0.45,
                              // height: 50.0,
                              decoration: const BoxDecoration(
                                color: kProfileCardBlue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.elliptical(75, 30),
                                  topRight: Radius.elliptical(120, 100),
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.elliptical(10, 60),
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  // height: 90.0,
                                  // width: 90.0,
                                  margin: const EdgeInsets.only(
                                      left: 12.0,
                                      top: 15.0,
                                      right: 35.0,
                                      bottom: 12.0),
                                  decoration: BoxDecoration(
                                    color: kAltHomeUserProfileCard,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: (size.width - 16) * 0.45,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      "Here's your GDSC account",
                                      style: kH4TextStyle.copyWith(
                                        fontSize: 15.0,
                                      ),
                                      maxLines: 2,
                                    ),
                                    const SizedBox(height: 10.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            ProfileScreen.profileScreenId);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(size.width, 60.0),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(24.0),
                                          ),
                                        ),
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            "Edit Profile",
                                            style: kH4TextStyle.copyWith(
                                                color: Colors.white),
                                            maxLines: 1,
                                          ),
                                          const SizedBox(width: 5.0),
                                          const Icon(Icons.edit_outlined,
                                              size: 24.0),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              AutoSizeText(
                "Featured Projects",
                style: kH1TextStyle,
                maxLines: 1,
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                height: 330.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  primary: true,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: 340.0,
                          width: 275.0,
                          decoration: BoxDecoration(
                            color: kAltHomeUserProfileCard,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        Positioned(
                          bottom: 34.0,
                          right: 12.0,
                          left: 15.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                projectsList[index].projectTitle,
                                style: kH2TextStyle,
                              ),
                              Text(
                                projectsList[index].projectDescription,
                                style: kH4TextStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 20.0);
                  },
                  itemCount: projectsList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
