
import 'package:food_pizza_hot/model/pizza.dart';


List<PizzaModel>getPizza(){
  List<PizzaModel>pizza=[];
  PizzaModel pizzaModel=new PizzaModel();

  pizzaModel.name="Cheese Pizza";
  pizzaModel.image="images/pizza4.png";
  pizzaModel.price="\$50";
  pizza.add(pizzaModel);
  pizzaModel= new PizzaModel();

  pizzaModel.name="Cheese Pizza";
  pizzaModel.image="images/pizza4.png";
  pizzaModel.price="\$50";
  pizza.add(pizzaModel);
  pizzaModel= new PizzaModel();

  pizzaModel.name=" Tandoori Pizza";
  pizzaModel.image="images/pizza3.png";
  pizzaModel.price="\$65";
  pizza.add(pizzaModel);
  pizzaModel= new PizzaModel();

  pizzaModel.name=" Tandoori Pizza";
  pizzaModel.image="images/pizza3.png";
  pizzaModel.price="\$65";
  pizza.add(pizzaModel);
  pizzaModel= new PizzaModel();


   return pizza;
}