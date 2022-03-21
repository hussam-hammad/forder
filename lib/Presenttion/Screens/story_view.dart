// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flashorder/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class StoryViewScreen extends StatelessWidget {
  final StoryController controller = StoryController();
  StoryViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.pink,
          title: Text("العروض والقصص"),
          centerTitle: true,
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Container(
                  height: Get.height,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: StoryView(
                      controller: controller,
                      storyItems: [
                        StoryItem.text(
                          title:
                              "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
                          backgroundColor: Colors.orange,
                          roundedTop: true,
                        ),
                        StoryItem.inlineImage(
                          controller: controller,
                          url:
                              "https://image.ibb.co/gCZFbx/Banku-and-tilapia.jpg",
                          caption: Text(
                            "أقوى العروض من مطعم أرارات",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.black54,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        StoryItem.inlineImage(
                          url:
                              "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
                          controller: controller,
                          caption: Text(
                            "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
                            style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.black54,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        StoryItem.inlineImage(
                          url:
                              "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                          controller: controller,
                          caption: Text(
                            "Hektas, sektas and skatad",
                            style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.black54,
                              fontSize: 17,
                            ),
                          ),
                        )
                      ],
                      onStoryShow: (s) {},
                      onComplete: () {
                        Get.back();
                      },
                      progressPosition: ProgressPosition.top,
                      repeat: false,
                      inline: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MoreStories()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(8))),
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "المزيد من العروضس",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المزيد من العروض"),
      ),
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title: "I guess you'd love to see more of our food. That's great.",
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: "Nice!\n\nTap to continue.",
            backgroundColor: Colors.red,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageImage(
            url:
                "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            caption: "Still sampling",
            controller: storyController,
          ),
          StoryItem.pageImage(
              url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
              caption: "Working with gifs",
              controller: storyController),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side2",
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {},
        onComplete: () {
          Get.back();
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
