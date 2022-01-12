class PriceEntity {
  final String price;
  final String brand;
  final String model;
  final int year;
  String? id;

  //Variavel apenas adicionada porque na api não possui link de imagem para os carros
  final String urlImage =
      "https://assinecarlm.com.br/wp-content/uploads/2019/07/carro1.png";

  PriceEntity(
      {this.id,required this.price,
      required this.brand,
      required this.model,
      required this.year});
}
