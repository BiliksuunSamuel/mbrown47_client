import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class chat extends StatelessWidget{

  final String _dummyProfilePictureURL = "https://images.pexels.com/photos/853151/pexels-photo-853151.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  final String _dummyUserName = "Dummy User";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).backgroundColor,
          statusBarBrightness: MediaQuery.of(context).platformBrightness == Brightness.light? Brightness.light:Brightness.dark,
          statusBarIconBrightness: MediaQuery.of(context).platformBrightness == Brightness.dark? Brightness.light:Brightness.dark,
        ),
        title: ListTile(
          contentPadding: const EdgeInsets.all(0.0),
          dense: true,
          horizontalTitleGap: 5.0,
          leading: Container(
            width: 35.0,
            height: 35.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                    image: NetworkImage(_dummyProfilePictureURL),
                    fit: BoxFit.cover)),
          ),
          title: AutoSizeText(
            _dummyUserName,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18.0,),
            maxLines: 1,
          ),
        ),
        titleTextStyle: const TextStyle(color: Colors.white),
        iconTheme: IconThemeData(
            color: Theme.of(context).textTheme.bodyText1?.color
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leadingWidth: 30.0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Divider(
              height: 0.0,
              thickness: 0.5,
              color: Colors.grey,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
            ),
            splashColor: Theme.of(context).primaryColor,
            splashRadius: 20.0,)
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: FractionalOffset.center,
            child: Text("Chat content appears here.", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12.0)),

            //Use Colors.grey.shade900 for incoming message bubble, Colors.grey.shade700 for outgoing

          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
              decoration: BoxDecoration(
                color: MediaQuery.of(context).platformBrightness == Brightness.light? Colors.grey.shade100 : Colors.grey.shade900,
                borderRadius: BorderRadius.circular(50.0)
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: MediaQuery.of(context).platformBrightness == Brightness.light? Colors.white : Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(100.0)
                    ),
                    child: InkWell(
                      onTap: (){},
                        child: Icon(Icons.photo_camera_rounded,
                          color: MediaQuery.of(context).platformBrightness == Brightness.light? Colors.black : Colors.grey,
                          size: 20.0,)),
                  ),
                  suffixIcon: Container(
                    width: MediaQuery.of(context).size.width/4,
                    margin: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){},
                          child:  Icon(Icons.emoji_emotions_outlined,
                            color: MediaQuery.of(context).platformBrightness == Brightness.light? Colors.black : Colors.grey,
                            size: 20.0,),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: (){},
                          child:  Icon(Icons.send_outlined, color: Theme.of(context).primaryColor, size: 24.0,),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  hintText: "Message",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
                  isDense: true,
                  border: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                maxLines: null,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          )
        ],
      ),
    );
  }

}