class ProductResponce {
  int ?id ;
  String ?title ;
  String ?slug ;
  int ?price ;
  String ?description ;
  List<dynamic>?images ;

  ProductResponce(this.id,this.title,this.slug,this.price,this.description,this.images);

  ProductResponce.fromJson( Map<String,dynamic>json ){
    id=json["id"];
    title=json["title"];
    slug=json["slug"];
    price=json["price"];
    description=json["description"];
    images=json["images"];
  }
}