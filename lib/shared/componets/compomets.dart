

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news/modules/web_veiw/web_view.dart';

Widget buildArticleItem(model,context) => InkWell(
  onTap: (){
    navigationTo(context, WebViews(model['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image: DecorationImage(

                fit: BoxFit.cover,

                image: NetworkImage('${model['urlToImage']}')

            ),

          ),

        ),

        const SizedBox(width: 15.0,),

        Expanded(

          child: SizedBox(

            height: 120.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                  child: Text(

                      '${model['title']}',

                      style: Theme.of(context).textTheme.bodyText1,

                      maxLines: 4,

                      overflow: TextOverflow.ellipsis

                  ),

                ),

                Text(

                  '${model['publishedAt']}',

                  style: const TextStyle(

                      fontSize: 25.0,

                      fontWeight: FontWeight.w500,

                      color: Colors.grey

                  ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);


Widget articleBuilder(list,context) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index],context),
    separatorBuilder: (context, index) => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.black12,
    ),
    itemCount: list.length,
  ),
  fallback: (context) => const Center(child: CircularProgressIndicator()),
);


Widget defulteButton({
  onTap,
  required TextInputType type,
  required String label,
  required IconData prefix,
  required TextEditingController controller,
  IconData? suffix,
  bool isPassword = false,
  bool isClickable = true,
  onChanged,
  validate,
  suffixPassword,
}) => TextFormField(
  obscureText: isPassword,
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: (value){},
  validator: validate,
  onChanged: onChanged,
  onTap: onTap,
  enabled: isClickable,
  decoration: InputDecoration(
    suffixIcon: suffix != null ? IconButton(
      icon: Icon(suffix),
      onPressed: suffixPassword,) : null,
    labelText: label,
    border: const OutlineInputBorder(),
    prefixIcon: Icon(prefix),
  ),
);


void navigationTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => widget
    )
);