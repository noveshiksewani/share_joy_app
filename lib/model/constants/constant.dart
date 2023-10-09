import 'package:share_joy/model/classes/categories_model.dart';
import 'package:share_joy/model/enums/enums.dart';
import 'package:share_joy/model/classes/products_model.dart';

class Constants {
  static final imageList = [
    "assets/images/home_images/image_1.png",
    "assets/images/home_images/image_3.png",
    "assets/images/home_images/image_2.png",
    "assets/images/home_images/image_4.png",
  ];

  static final categoryList = {
    Categories(
        categoryImage: "assets/images/categories/wedding.png",
        categoryName: ProductCategory.wedding),
    Categories(
        categoryImage: "assets/images/categories/baby_shower.png",
        categoryName: ProductCategory.babyShower),
    Categories(
        categoryImage: "assets/images/categories/house_warming.jpg",
        categoryName: ProductCategory.houseWarming),
    Categories(
        categoryImage: "assets/images/categories/graduation.png",
        categoryName: ProductCategory.graduation),
    Categories(
        categoryImage: "assets/images/categories/anniversary.jpg",
        categoryName: ProductCategory.anniversary),
    Categories(
        categoryImage: "assets/images/categories/bday.png",
        categoryName: ProductCategory.birthday)
  };

  static final productList = {
    Product(
        id: 1,
        image: "assets/images/product_type/wg_1.png",
        name: "Personalized Couple Cup",
        price: "3000",
        canBePersonalized: true,
        productType: ProductCategory.wedding,
        description:
            "Black and white, yin and yang, male and female; opposites but complementary. Here is a set that represents this concept of different yet similar. The wooden black tray contains a hugging salt and pepper shaker set. a black mug for him and a white mug for her. Personalize the mugs with names."),
    Product(
        id: 2,
        image: "assets/images/product_type/wg_2.png",
        name: "Couple-Wedding Ornament Set",
        price: "4200",
        canBePersonalized: true,
        productType: ProductCategory.wedding,
        description:
            "This unique keepsake wedding ornament gift set will be cherished for a lifetime by any happy couple. The set includes 3 hand-drawn/painted glass Christmas bulbs and is guaranteed to be a stand-out gift for weddings, bridal showers, engagements or anniversaries!"),
    Product(
        id: 3,
        image: "assets/images/product_type/wg_3.png",
        name: "Engraved decor plate",
        price: "5090",
        canBePersonalized: true,
        productType: ProductCategory.wedding,
        description: "High-quality ceramic plate with custom digital print"),
    Product(
        id: 4,
        image: "assets/images/product_type/a_1.png",
        name: "Couples Photo Plaque",
        price: "1500",
        canBePersonalized: true,
        productType: ProductCategory.anniversary,
        description:
            "Personalized Engraved Marriage Gifts for Couples Photo Plaque (8 x 6 inches)"),
    Product(
        id: 5,
        image: "assets/images/product_type/a_2.png",
        name: "Personalized Couple Cup",
        price: "1200",
        canBePersonalized: true,
        productType: ProductCategory.anniversary,
        description:
            "The Set of 2 Personalized Mugs for a Cute Couple makes the best gift to any of the love birds you know. Both the muhs have a heart-shaped handle with red and light pink color. The size of the mug is 3.8in X 3.2in made up of ceramic material. Shop now."),
    Product(
        id: 6,
        image: "assets/images/product_type/a_3.png",
        name: "Gift Bucket",
        price: "4990",
        canBePersonalized: true,
        productType: ProductCategory.anniversary,
        description:
            "Stylish 10 year anniversary gift for friends. You may select this present for a friend who is celebrating 10 years wedding or engagement anniversary, and you can make their anniversary occasion a more elegant atmosphere."),
    Product(
        id: 7,
        image: "assets/images/product_type/b_1.png",
        name: "Foldable Bath Tub - Pink",
        price: "1923",
        canBePersonalized: false,
        productType: ProductCategory.babyShower,
        description:
            "Adopt environmental protection material, PP+TPR+ABS. Safe and healthy, non-toxic and odorless. SAFE AND SECURE: Vertical embracing design, long-lasting lock temperature, giving the baby a full range of warmth. Stand to wash, sit to wash, free to switch. Foldable design, save space:Slit, wall, toilet or hanging on the wall, free to store. Easy to carry, baby could enjoy own bath tub anytime anywhere. EASY TO CLEAN :Drain plug for quick, complete water drainage."),
    Product(
        id: 8,
        image: "assets/images/product_type/b_2.png",
        name: "3-In-1 Stroller",
        price: "10000",
        canBePersonalized: false,
        productType: ProductCategory.babyShower,
        description:
            "Stylish Stroller Pram with Multi Function lets your baby sit comfortably and feel safe to experience new sounds, movements, colours and shapes around the world. Perfection to follow the highest safety standards, comforting rhythmic motion experienced by the baby being in Stroller. Its sky view high ground clearance gives the baby enjoyable ride. Feather soft seat for that extra pampering for the baby. Detachable bassinet that can be put in the car too. Steel ball bearings to make the ride jerk free with double shock absorption spring system. Adjustable handle to fine-tune the height as per your requirement. Perfection and luxury to the next level."),
    Product(
        id: 9,
        image: "assets/images/product_type/b_3.png",
        name: "Baby Blanket",
        price: "990",
        canBePersonalized: false,
        productType: ProductCategory.babyShower,
        description:
            "Brandonn brings this Soft Baby Blanket. These hooded baby blankets are ideal for 0-6-month-old babies. These blankets can be used in all seasons which fulfils the daily needs of the child and keeps him/her warm and protected. The material Is Very Very Soft. Made of double layered ultra soft Flannel fabric, this set of wearable blankets is the best option for your baby."),
    Product(
        id: 10,
        image: "assets/images/product_type/bd_1.png",
        name: "Hand Bag - Pink",
        price: "1923",
        canBePersonalized: false,
        productType: ProductCategory.birthday,
        description:
            "Transform into a modern fashionable with this extraordinary satchel by Metro. Add this to your collection and watch it become your go-to companion. This satchel has a top Zip/Flap closure for safety. This handbag has a spacious compartments that will provide you plenty of storage space for keeping phone, portable charger, keys, hairbrush, wallet, sunglasses etc."),
    Product(
        id: 11,
        image: "assets/images/product_type/bd_2.png",
        name: "Wallet - Blue",
        price: "10000",
        canBePersonalized: false,
        productType: ProductCategory.birthday,
        description:
            "RFID Protected 100% Genuine High Quality Mens Blue Leather Wallet"),
    Product(
        id: 12,
        image: "assets/images/product_type/bd_3.png",
        name: "Bike Toy",
        price: "19900",
        canBePersonalized: false,
        productType: ProductCategory.birthday,
        description:
            "A safe to use, pull back, and convertible to free wheel, toy Bike. with realistic alloy wheel design. No battery required. Converting the bike from pull back to free wheel is very easy, can be done using small tool available with the Toy. When changed to free wheel, the side stand can be used & then again can be changed back to pull back action using 2 side wheels"),
    Product(
        id: 13,
        image: "assets/images/product_type/hw_1.jpg",
        name: "Homesake® Lamp",
        price: "923",
        canBePersonalized: false,
        productType: ProductCategory.houseWarming,
        description:
            "Designed with the traditional classic style, this captivating unique table lamp is a great lighting fixture to add a beautiful and natural element to any room."),
    Product(
        id: 14,
        image: "assets/images/product_type/hw_2.jpg",
        name: "Wonderland - Set of 4 Monk",
        price: "2300",
        canBePersonalized: false,
        productType: ProductCategory.houseWarming,
        description:
            "Wonderland presents beautiful 4 monks sitting peacefully on a branch and praying. These praying monks are made of resin and are hand made and hand painted."),
    Product(
        id: 15,
        image: "assets/images/product_type/hw_3.jpg",
        name: "Dekorworm Modern Large Wall Clock",
        price: "3960",
        canBePersonalized: false,
        productType: ProductCategory.houseWarming,
        description:
            "Wonderland presents beautiful 4 monks sitting peacefully on a branch and praying. These praying monks are made of resin and are hand made and hand painted."),
    Product(
        id: 16,
        image: "assets/images/product_type/g_1.png",
        name: "Congrats 3D Illusion Lamp Wooden",
        price: "923",
        canBePersonalized: false,
        productType: ProductCategory.graduation,
        description:
            " Acrylic frames are a plastic-type material that is harder to break than glass. It allows shipping with ease and doesn’t have to worry about the product being damaged."),
    Product(
        id: 17,
        image: "assets/images/product_type/g_2.png",
        name: "Graduation Coffee Mug",
        price: "2300",
        canBePersonalized: false,
        productType: ProductCategory.graduation,
        description:
            "his superior quality idea set is personalized for graduates or new job gift for wome. Inspirational congrats gift for daughter sister and friend who graduated in 2023. A thoughtful present for her, Graduation Gift, High School Graduation Gift, College Graduation Gift on Birthday, Graduation, Thanksgiving, Christmas, or just send as a surprise gift for that special one in your life to let her know you care about her."),
    Product(
        id: 18,
        image: "assets/images/product_type/g_3.png",
        name: "Personalised Graduate Male Caricature",
        price: "3960",
        canBePersonalized: false,
        productType: ProductCategory.graduation,
        description:
            "Personalised Graduate Male Caricature (9*8inches) A Fabulous Gift For Someone Who Has Graduated. Celebrate The Milestone With This Personalised Caricature. The Caricature Can Be Placed On A Table As A Decor Piece. It Will Always Remind The Recipient Of Cherishable Memories Of His Graduation Whenever His Eyes Will See The Caricature."),
  };
}
