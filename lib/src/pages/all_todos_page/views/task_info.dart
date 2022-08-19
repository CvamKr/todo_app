import 'package:flutter/material.dart';

import '../../../central/authentication/authentication_provider.dart';
import '../../../central/widgets/my_icon_btn.dart';
import '../../../central/widgets/my_sized_box.dart';
import '../../../central/widgets/my_text.dart';
import 'package:provider/provider.dart';

import '../../../central/widgets/my_cached_network_image.dart';

class TaskInfo extends StatelessWidget {
  const TaskInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.1,
      color: Colors.grey,
      child: Stack(
        children: <Widget>[
          MyCachedNetworkImage(
            padding: EdgeInsets.zero,
            imageUrl: "https://wallpapercave.com/wp/wp4286413.jpg",
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3.1,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 32, 0, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.sort,
                      size: 32,
                      color: Colors.white.withOpacity(.8),
                    ),
                    myText(
                        txt: "Your\nThings",
                        color: Colors.white.withOpacity(.8),
                        fontSize: 32),
                    myText(
                        txt: "Aug 18, 2022",
                        color: Colors.white.withOpacity(.5))
                  ],
                ),
              ),
              const Spacer(),
              buildInfo(context)
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black.withOpacity(.3),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                // color: Colors.grey,
                child: myIconBtn(
                  onPressed: () {
                    context.read<AuthenticationProvider>().signOut(context);
                  },
                  icon: Icons.logout,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: <Widget>[
                buildtaskTypeInfo("24", "Personal"),
                myW(16),
                buildtaskTypeInfo("32", "Business"),
              ],
            ),
            myH(40),
            percentInfo(),
          ]),
    );
  }

  Widget buildtaskTypeInfo(taskCount, taskType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        myText(txt: taskCount, color: Colors.white, fontSize: 20),
        myH(2),
        myText(txt: taskType, color: Colors.white.withOpacity(.5), fontSize: 12)
      ],
    );
  }

  Widget percentInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        MyCachedNetworkImage(
          circleRadius: 10,
          imageUrl:
              "https://i.pinimg.com/originals/84/19/d4/8419d4ae13f86f040204f83ed6da3d0d.png",
        ),
        myW(10),
        myText(
            txt: "65% done", fontSize: 12, color: Colors.white.withOpacity(.4))
      ],
    );
  }
}
