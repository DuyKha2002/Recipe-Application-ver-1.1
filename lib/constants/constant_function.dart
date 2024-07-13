import 'dart:convert';
import 'package:http/http.dart' as http;


class ConstantFunction{

  static Future<List<Map<String,dynamic>>> getResponse(String findRecipe)async{
    String id = 'b78e0067';
    String key = '9b63079ec12323ea4b1af7b6432b42e3';
// https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=591-722&health=alcohol-free
    String api='http://api.edamam.com/search?q=$findRecipe&app_id=$id&app_key=$key&from=0&to=20&calories=591-722&health=alcohol-free';
    final response = await http.get(Uri.parse(api));
    List<Map<String,dynamic>> recipe=[];
    if(response.statusCode==200){
      var data=jsonDecode(response.body);

      if(data['hits']!=null){
        for(var hit in data['hits']){
          recipe.add(hit['recipe']);
        }
      }
      return recipe;
    }
    return recipe;
  }

}