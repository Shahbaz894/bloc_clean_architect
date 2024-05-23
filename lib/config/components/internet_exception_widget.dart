import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height*.15,),
        const Icon(Icons.cloud_off,
        color: Colors.red,
        size: 50,),
         Padding(padding: EdgeInsets.only(top: 20),
          child: Center(child:
            Text('We are unable to show routes.\nPlease check your data\nconnection',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20),),),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height*.001,),
        ElevatedButton(onPressed: onPress, child: Text(
          'ReTry',style: Theme.of(context).textTheme.bodyLarge,
        ),)
      ],
    );
  }
}
