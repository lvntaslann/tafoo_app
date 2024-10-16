import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Mobil/Pages/sharecar/share_car_provider.dart';

class AddImageWidget extends StatefulWidget {
  const AddImageWidget({
    super.key,
  });

  @override
  State<AddImageWidget> createState() => _AddImageWidgetState();
}

class _AddImageWidgetState extends State<AddImageWidget> {
  bool isCameraImage = false;
  void onTap() async {
    setState(() {
      isCameraImage = !isCameraImage;
    });
    final saveData = Provider.of<CarShareProvider>(context, listen: false);
    await saveData.saveCarData(isCameraImage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Container(
        width: 330,
        height: 250,
        decoration: BoxDecoration(
          color: Color(0XFFD9D9D9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset("assets/images/camera.png",width: 50,height: 50,),
            IconButton(
                onPressed: onTap,
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 50,
                )),
            SizedBox(height: 10),
            Text(
              "YA DA",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            //Image.asset("assets/images/galery.png",width: 50,height: 50,),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 50,
                )),
            SizedBox(height: 10),
            Text(
              "Görsel Ekle",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
