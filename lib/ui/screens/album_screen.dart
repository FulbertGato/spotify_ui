import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:spotify_ui/ui/widgets/album_card.dart';
class AlbumScreen extends StatefulWidget {
   final ImageProvider image;

  const AlbumScreen({Key? key, required this.image}) : super(key: key);

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late ScrollController scrollController;
  double imageSize = 0;
  double initialSize = 240;
  double containerHeight = 500;
  double containerinitalHeight = 500;
  double imageOpacity = 1;
  bool showTopBar = false;
   @override
  void initState() {
    imageSize = initialSize;
    scrollController = ScrollController()
      ..addListener(() {
        imageSize = initialSize - scrollController.offset;
        if (imageSize < 0) {
          imageSize = 0;
        }
        containerHeight = containerinitalHeight - scrollController.offset;
        if (containerHeight < 0) {
          containerHeight = 0;
        }
        imageOpacity = imageSize / initialSize;
        if (scrollController.offset > 224) {
          showTopBar = true;
        } else {
          showTopBar = false;
        }
        print(scrollController.offset);
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return Scaffold(
      body: Stack(
        children: [

          Container(
            height: containerHeight,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: Colors.pink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                   opacity: imageOpacity.clamp(0, 1.0),
                   child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.5),
                          offset: Offset(0, 20),
                          blurRadius: 32,
                          spreadRadius: 16,
                        )
                      ],
                      
                    ),
                    child: Image(
                      image: widget.image,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  
                  ),

                ),
                const SizedBox(
                  height: 100,
                ),
              ]
            ),
          ),
          SafeArea(
             child: SingleChildScrollView(
               controller: scrollController,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                   Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                     child: Padding(
                         padding: const EdgeInsets.only(top: 40),
                      child: Column(
                         children: [
                          SizedBox(height: initialSize + 32),
                          Padding(
                             padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: const [
                                    Image(
                                      image: AssetImage('assets/images/logo.png'),
                                      width: 32,
                                      height: 32,
                                    ),
                                    SizedBox(width: 8),
                                    Text("Spotify"), 
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "1,888,132 likes 5h 3m",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                const SizedBox(height: 16),
                                Stack(
                                   clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      children: const [
                                        ImageIcon(
                                          AssetImage('assets/icons/heart.png'),
                                        ),
                                        SizedBox(width: 16),
                                        ImageIcon(
                                          AssetImage('assets/icons/more.png'),
                                        ),
                                      ],
                                    ),
                                  ]
                                ),
                              ]
                            ),
                          ),
                          
                          ]
                      ),
                     ),
                    
                  ),
                  Container(
                    padding: const  EdgeInsets.all(16),
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
                          const SizedBox(height: 32),
                          Text(
                            "You might also like",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCardWidget(
                                size: cardSize,
                                label: "Get Turnt",
                                image: const AssetImage("assets/images/album3.jpg"),
                              ),
                              AlbumCardWidget(
                                size: cardSize,
                                label: "Get Turnt",
                                image: const AssetImage("assets/images/album5.jpg"),
                              ),
                            ],
                          ),
                          ),
                           Padding(
                         padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCardWidget(
                                size: cardSize,
                                label: "Get Turnt",
                                image: const AssetImage("assets/images/album6.jpg")
                              ),
                              AlbumCardWidget(
                                size: cardSize,
                                label: "Get Turnt",
                                image: const AssetImage("assets/images/album9.jpg"),
                              ),
                            ],
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCardWidget(
                                size: cardSize,
                                label: "Get Turnt",
                                image: const AssetImage("assets/images/album10.jpg")
                              ),
                              AlbumCardWidget(
                                size: cardSize,
                                label: "Get Turnt",
                                image: const AssetImage("assets/images/album4.jpg"),
                              ),
                            ],
                          ),
                        ),
                    

                         
                      ],
                    ),
                  ),

                ],
              ),
             ),
          ),
          
        ],
        
      ),

    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,

    //     elevation: 0,
    //     leading: IconButton(
    //       icon: Icon(Icons.arrow_back),
    //       color: Colors.white,
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //     ),
    //     actions: [
    //       IconButton(
    //         icon: Icon(Icons.more_vert),
    //         color: Colors.white,
    //         onPressed: () {},
    //       ),


    //     ],
        



      
    // ),
    );
  }
}