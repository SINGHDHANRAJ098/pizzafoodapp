import 'package:food_pizza_hot/model/burger.dart';
List<BurgerModel>getBurger(){
  List<BurgerModel>burger=[];
  BurgerModel burgerModel=new BurgerModel();

  burgerModel.name="Cheese Burger";
  burgerModel.image="images/burger2.png";
  burgerModel.price="\$50";
  burger.add(burgerModel);
  burgerModel= new BurgerModel();


  burgerModel.name="Veggie Burger";
  burgerModel.image="images/burger2.png";
  burgerModel.price="\$20";
  burger.add(burgerModel);
  burgerModel= new BurgerModel();

  return burger;
}