import 'package:financeapp/data/i.dart';

List<money> getter_top(){  
  money snap_food=money();
  snap_food.time='jane 30,2022';
  snap_food.image='snap-food.png';
  snap_food.buy=true;
  snap_food.fee='-\$100';
  snap_food.name='Snap food';
  money snap=money();
  snap.image='cre.png';
  snap.time='today';
  snap.buy=true;
  snap.fee="-\$60";
  snap.name='Transfer';
  return[snap_food,snap];
}