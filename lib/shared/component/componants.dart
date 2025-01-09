import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


// Widget buildTaskItem(Map model,context) => Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: Row(
//     children: [
//       CircleAvatar(
//         backgroundColor: Colors.blue,
//         radius: 40,
//         child: Text("${model['time']}",style: TextStyle(color: Colors.white),),
//       ),
//       SizedBox(
//         width: 20,
//       ),
//       Expanded(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('${model['title']}',
//               style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold),
//             ),
//             Text('${model['date']}',style: TextStyle(color: Colors.grey),),
//           ],
//         ),
//       ),
//       SizedBox(
//         width: 20,
//       ),
//       IconButton(
//           onPressed: (){
//             AppCubit.get(context).updateData(
//                 status: 'done', id: model['id']);
//           },
//           icon: Icon(Icons.check_box,color: Colors.green,)),
//       IconButton(
//           onPressed: (){
//             AppCubit.get(context).updateData(
//                 status: 'archive', id: model['id']);
//           },
//           icon: Icon(Icons.archive_outlined,color: Colors.black12,)),
//     ],
//   ),
// );
Widget buildArticleItem(article)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text('${article['title']}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,

                ),
              ),
              Text('${article['publishedAt']}',
                style: TextStyle(
                  color:Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
Widget myDivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0, ),
  child: Container(
    width:double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget defualtFormField({
  required TextEditingController controller,
  required Function  validate,
  required var suffix,
  required var prefix ,
  required var lable ,
  required var TextInputType ,
})=>TextFormField(
  validator:validate(),
  keyboardType:TextInputType ,
  controller: controller ,
  decoration:InputDecoration(
    label:Text(lable),
    prefix:Icon(prefix),
    suffix:Icon(suffix) ,
    border: OutlineInputBorder(),
  ),
);
Widget defualtTextButton(
{
  required var  function,
  required String  text,
})=>TextButton(
  onPressed:function,
  child: Text(
      text.toUpperCase(),
  ),);

void navigateTo(context,widget)=>Navigator.push(
    context,MaterialPageRoute(builder: (context)=>widget()));

void navigateAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(
    context,MaterialPageRoute(builder: (context)=>widget()),
  (Route<dynamic>route)=>false
);

void showToast({
  required String text,
  required ToastState state,
})=> Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 20
);
enum ToastState{SUCCESS,ERORR,WARNIG}
Color chooseToastColor(ToastState state)
{
  Color color;
  switch(state)
  {
    case ToastState.SUCCESS:
      color = Colors.green;
             break;
    case ToastState.ERORR:
      color = Colors.red;
         break;
    case ToastState.WARNIG:
      color = Colors.amber;
        break;
  }
  return color;
}