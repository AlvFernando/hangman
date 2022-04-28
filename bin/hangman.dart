//this is code of game hangman
import 'dart:io';
import 'dart:math';

String getAnimal(){
  var animals = ["lion","tiger","rabbit","elephant","shark","otter","axolotl","snake","camel","antelope"];
  var rng = new Random();
  var getAnimal = animals[rng.nextInt(10)];
  return getAnimal;
}

List<String> updateAnswer(String character, List<String> answer, String animal, int animalLength){
  for(var i=0;i<animalLength;i++){
    if(character == animal[i]){
      answer[i] = character;
    }
  }
  return answer;
}

int check(String charAnswer, String animalName, int length){
  for(var i=0;i<length;i++){
    if(charAnswer == animalName[i]){
      return 0;
      break;
    }
  }
  return 1;
}

void initiateDisplay(int length,int lifePoint,[String? charAnswer, String? animalName,List<String>? answer]){
  if(charAnswer == null || animalName == null || answer == null){
    print("==============================");
    print("Welcome to the Hangman Game");
    print("Life Point : $lifePoint");
    for(var i=0;i<length;i++){
      if(length-1 == i){
        print("_");
      }else{
        stdout.write("_ ");
      }
    }
    print("Please input the letter for the name of an animal");
  }else{
    print("==============================");
    print("Life Point : $lifePoint");
    for(var i=0;i<length;i++){
      if(answer[i]== ""){
        stdout.write("_ ");
      }else{
        stdout.write(answer[i]+" ");
      }
    }
    print("");
    print("Please input the letter for the name of an animal");
  }
}

void main(){
  var animal = getAnimal();
  var animalLength = animal.length;
  var lifePoint = 6;
  var answer = List.filled(animalLength, "");

  initiateDisplay(animalLength,lifePoint);

  while(lifePoint>0 && answer.join() != animal){
    String? character = stdin.readLineSync()!; // -> ? dan ! untuk nullcheck
    var flag = check(character,animal,animalLength);
    if(flag==1){
      lifePoint -= flag;
      print("Wrong Answer!!");
    }else{
      answer = updateAnswer(character,answer,animal,animalLength);
      print("Correct!");
    }
    initiateDisplay(animalLength,lifePoint,character,animal,answer);
  }
  print("==============================");
  print("Game over :)");
  print("==============================");
}