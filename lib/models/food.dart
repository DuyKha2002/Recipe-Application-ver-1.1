class Food {
  String name;
  String image;
  dynamic cal;
  dynamic time;
  dynamic rate;
  int reviews;
  bool isLiked;
  String? avtUser;
  String? nameUser;
  int servings;
  List<String> ingredients;
  List<String> preparation;
  List<String> description;

  Food({
    this.avtUser,
    this.nameUser,
    required this.name,
    required this.image,
    required this.cal,
    required this.time,
    required this.rate,
    required this.reviews,
    required this.isLiked,
    required this.servings,
    required this.ingredients,
    required this.preparation,
    required this.description,
  });
  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'],
      image: map['image'],
      cal: map['cal'],
      time: map['time'],
      rate: map['rate'],
      reviews: map['reviews'],
      isLiked: map['isLiked'],
      servings: map['servings'],
      ingredients: List<String>.from(map['ingredients']),
      preparation: List<String>.from(map['preparation']),
      description: List<String>.from(map['description']),
      avtUser: map['avtUser'],
      nameUser: map['nameUser'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'cal': cal,
      'time': time,
      'rate': rate,
      'reviews': reviews,
      'isLiked': isLiked,
      'servings': servings,
      'ingredients': ingredients,
      'preparation': preparation,
      'description': description,
      'avtUser': avtUser,
      'nameUser': nameUser,
    };
  }
}

final List<Food> foods = [
  Food(
    name: "Mì Ramen Cay",
    image: "assets/images/ramen-noodles.jpg",
    cal: 120,
    time: 15,
    rate: 4.4,
    reviews: 23,
    isLiked: false,
    servings: 400,
    ingredients: [
      "200g mì ramen",
      "1 muỗng canh nước tương",
      "2 muỗng cà phê tương ớt",
      "1 quả trứng",
      "1 tách nước dùng gà",
      "2 cây hành lá, cắt nhỏ",
      "1 muỗng canh dầu mè",
    ],
    preparation: [
      "Nấu mì ramen theo hướng dẫn trên bao bì.",
      "Trong một tô, kết hợp nước tương và tương ớt.",
      "Đun sôi nước dùng gà và thêm hỗn hợp nước tương.",
      "Thêm mì đã nấu vào nước dùng.",
      "Trên cùng, thêm một quả trứng trứng, hành lá cắt nhỏ và nhỏ dầu mè.",
    ],
    description: [
      "Mì Ramen Cay là một món ăn truyền thống của Nhật Bản, nổi tiếng với hương vị cay nồng và đậm đà.",
      "Mì ramen được nấu chín trong nước dùng gà thơm ngon, kết hợp với hành lá thái nhỏ và một quả trứng trứng thêm vào làm tăng thêm hương vị.",
    ],
    avtUser: 'https://randomuser.me/api/portraits/men/1.jpg',
    nameUser: 'JohnDoe',

  ),
  Food(
    name: "Bít Tết Bò",
    image: "assets/images/beaf-steak.jpg",
    cal: 140,
    time: 25,
    rate: 4.4,
    reviews: 23,
    isLiked: true,
    servings: 500,
    ingredients: [
      "1 miếng thịt bò (500g)",
      "2 muỗng canh dầu olive",
      "2 tép tỏi băm nhỏ",
      "Muối và tiêu vừa đủ",
      "1 nhánh hương",
      "1 muỗng canh bơ",
    ],
    preparation: [
      "Trước khi nướng, hãy làm nóng grill lên nhiệt độ cao.",
      "Nêm gia vị vào thịt với muối, tiêu và tỏi băm.",
      "Rưới dầu olive lên thịt.",
      "Nướng thịt khoảng 5-7 phút trên mỗi mặt.",
      "Thêm hương và bơ vào trong những phút cuối cùng của việc nướng.",
      "Để thịt nghỉ khoảng 5 phút trước khi thưởng thức.",
    ],
    description: [
      "Bít Tết Bò là một món ăn phổ biến được nướng trên grill, thịt bò được nêm gia vị đậm đà và được chế biến để giữ được độ mềm ngon.",
    ],
    avtUser: 'https://randomuser.me/api/portraits/women/1.jpg',
    nameUser: 'JaneSmith'
  ),
  Food(
    name: "Gà Sốt Bơ",
    image: "assets/images/butter-chicken.jpg",
    cal: 130,
    time: 18,
    rate: 4.2,
    reviews: 10,
    isLiked: false,
    servings: 600,
    ingredients: [
      "500g thịt gà, cắt thành miếng nhỏ",
      "2 muỗng canh bơ",
      "1 củ hành tây, băm nhỏ",
      "2 tép tỏi, băm nhỏ",
      "1 muỗng canh gừng, băm nhỏ",
      "1 tách nước cà chua",
      "1 tách kem sữa đặc",
      "2 muỗng canh gia vị garam masala",
      "Muối và tiêu vừa đủ",
      "Rau mùi tươi, để trang trí",
    ],
    preparation: [
      "Nấu chảo bơ trên lửa trung bình.",
      "Thêm hành tây, tỏi và gừng, xào cho đến khi vàng.",
      "Thêm thịt gà và chiên cho đến khi chín vàng.",
      "Khuấy nước cà chua, gia vị garam masala, muối và tiêu.",
      "Sôi trong khoảng 10 phút.",
      "Khuấy vào kem sữa đặc và đun sôi thêm 5 phút nữa.",
      "Trang trí với rau mùi tươi trước khi dùng.",
    ],
    description: [
      "Gà Sốt Bơ là một món ăn ấn độ nổi tiếng với sự hòa quyện hương vị bơ và gia vị garam masala, cùng với hành tây và tỏi thơm ngon.",
    ],
    avtUser: 'https://randomuser.me/api/portraits/men/2.jpg',
    nameUser: 'AliceJohnson'
  ),
  Food(
    name: "Bánh Mì Nướng",
    image: "assets/images/french-toast.jpg",
    cal: 110,
    time: 16,
    rate: 4.6,
    reviews: 90,
    isLiked: true,
    servings: 200,
    ingredients: [
      "4 lát bánh mì",
      "2 quả trứng",
      "1/2 tách sữa",
      "1 muỗng cà phê tinh dầu vani",
      "1/2 muỗng cà phê bột quế",
      "2 muỗng canh bơ",
      "Mật ong, để dùng kèm",
    ],
    preparation: [
      "Đánh tan trứng, sữa, tinh dầu vani và bột quế trong một tô.",
      "Ngâm mỗi lát bánh mì trong hỗn hợp trứng, ngâm cả hai mặt.",
      "Nướng bánh mì trên chảo với lửa vừa cho đến khi vàng.",
      "Dùng kèm mật ong.",
    ],
    description: [
      "Bánh Mì Nướng là một món ăn phổ biến, với sự kết hợp của trứng, sữa và tinh dầu vani, tạo ra một món bánh mì thơm ngon và béo ngậy.",
    ],
    avtUser: 'https://randomuser.me/api/portraits/women/2.jpg',
    nameUser: 'BobBrown'
  ),
  Food(
    name: "Bánh Bao Chiên",
    image: "assets/images/dumplings.jpg",
    cal: 150,
    time: 30,
    rate: 4.0,
    reviews: 76,
    isLiked: false,
    servings: 450,
    ingredients: [
      "200g thịt heo xay nhuyễn",
      "1 tách bắp cải, thái nhỏ",
      "2 tép tỏi, băm nhỏ",
      "1 muỗng canh nước tương",
      "1 muỗng canh dầu mè",
      "1 gói bánh bao",
      "1 muỗng canh dầu ăn",
    ],
    preparation: [
      "Trong một tô, trộn thịt heo xay, bắp cải, tỏi, nước tương và dầu mè.",
      "Đặt một muỗng nhân vào mỗi tờ bánh bao.",
      "Gấp và niêm phong mép.",
      "Đun nóng dầu ăn trong một chảo trên lửa trung bình.",
      "Chiên bánh bao cho đến khi vàng ở mỗi mặt.",
      "Dùng kèm nước tương.",
    ],
    description: [
      "Bánh Bao Chiên là một món ăn chế biến từ nhân thịt heo xay nhuyễn và bắp cải, được bọc trong lớp bánh bao mềm mại và chiên giòn, tạo nên một hương vị đặc biệt.",
    ],
    avtUser: 'https://randomuser.me/api/portraits/men/3.jpg',
    nameUser: 'CharlieDavis'
  ),
  Food(
    name: "Pizza Mexico",
    image: "assets/images/mexican-pizza.jpg",
    cal: 140,
    time: 25,
    rate: 4.4,
    reviews: 23,
    isLiked: false,
    servings: 400,
    ingredients: [
      "1 đế bánh pizza",
      "1/2 tách đậu hủ nướng",
      "1 tách phô mai sợi",
      "1/2 tách salsa",
      "1/2 tách ô liu đen băm",
      "1/2 tách cà chua băm",
      "1/4 tách hành lá băm nhỏ",
      "1/4 tách rau mùi tươi băm nhỏ",
    ],
    preparation: [
      "Tiền nhiệt lò nướng đến 220°C (425°F).",
      "Phết đậu hủ nướng lên đế pizza.",
      "Rắc phô mai sợi lên trên.",
      "Thêm salsa, ô liu đen, cà chua và hành lá.",
      "Nướng trong lò đã được tiền nhiệt trong khoảng 15-20 phút.",
      "Trang trí với rau mùi tươi trước khi thưởng thức.",
    ],
    description: [
      "Pizza Mexico là một phiên bản pizza đặc biệt, với đậu hủ nướng, phô mai sợi và các nguyên liệu như salsa, ô liu đen và rau mùi, mang đến hương vị đậm đà và đa dạng."
    ],
    avtUser: 'https://randomuser.me/api/portraits/women/3.jpg',
    nameUser: 'EveMiller',
  ),
];
