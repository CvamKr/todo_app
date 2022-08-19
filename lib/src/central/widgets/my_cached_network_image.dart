import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyCachedNetworkImage extends StatelessWidget {
  String imageUrl;
  double circleRadius;
  double height;
  double width;
  EdgeInsets padding;
  BoxFit fit;

  MyCachedNetworkImage(
      {Key? key,
      this.imageUrl =
          "https://previews.123rf.com/images/metelsky/metelsky1809/metelsky180900233/109815470-man-avatar-profile-male-face-icon-vector-illustration-.jpg",
      this.circleRadius = 0,
      this.height = 60,
      this.width = 60,
      this.fit = BoxFit.cover,
      this.padding = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return circleRadius != 0
        ? Padding(
            padding: padding,
            child: CachedNetworkImage(
              // height: height,
              // width: width,
              imageUrl: imageUrl,

              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: circleRadius,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => CircleAvatar(
                radius: circleRadius,
                backgroundColor: Colors.grey,
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: circleRadius,
                backgroundColor: Colors.grey[300],
                child:
                    //
                    const Icon(Icons.error),
                // Image.asset('assets/anonymous.png'),
              ),
            ),
          )
        // : circleRadius == 0
        //     ? buildClipRRectPic()
        //     :

        : Padding(
            padding: padding,
            child: Container(
              // decoration: BoxDecoration(
              //     color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(borderRadius),
                child: CachedNetworkImage(
                  height: height,
                  width: width,

                  // width: double.infinity,

                  fit: BoxFit.cover,
                  imageUrl: imageUrl,
                  // progressIndicatorBuilder: (context, url, downloadProgress) =>
                  //     CircularProgressIndicator(value: downloadProgress.progress),
                  placeholder: (context, url) => Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8)),
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8)),
                    height: height,
                    child: const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          );
  }

  Widget buildClipRRectPic() {
    return Padding(
      padding: padding,
      child: Container(
        // decoration: BoxDecoration(
        //     color: Colors.grey, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(circleRadius),
            child: CachedNetworkImage(
              height: height,
              width: width,

              // width: double.infinity,

              fit: BoxFit.cover,
              imageUrl: imageUrl,
              // progressIndicatorBuilder: (context, url, downloadProgress) =>
              //     CircularProgressIndicator(value: downloadProgress.progress),
              placeholder: (context, url) => Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8)),
                height: double.infinity,
                width: double.infinity,
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8)),
                height: height,
                child: const Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
