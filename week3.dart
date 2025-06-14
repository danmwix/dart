// Abstract class to define the blueprint for animals (Abstraction)
abstract class Animal {
  // Private variable for encapsulation
  int _energy;

  // Constructor with default energy
  Animal(this._energy);

  // Getter for controlled access (Encapsulation)
  int get energy => _energy;

  // Method to reduce energy (Encapsulation)
  void useEnergy(int amount) {
    if (_energy >= amount) {
      _energy -= amount;
      print('$runtimeType used $amount energy. Remaining energy: $_energy');
    } else {
      print('$runtimeType is too tired!');
    }
  }

  // Abstract method to be implemented by subclasses (Abstraction)
  void makeSound();

  // Common method for all animals
  void eat() {
    _energy += 10;
    print('$runtimeType is eating. New energy: $_energy');
  }
}

// Subclass inheriting from Animal (Inheritance)
class Elephant extends Animal {
  Elephant(int energy) : super(energy);

  // Override makeSound (Polymorphism)
  @override
  void makeSound() {
    print('Elephant trumpets: Tooooot!');
    useEnergy(5);
  }
}

// Subclass inheriting from Animal (Inheritance)
class Snake extends Animal {
  Snake(int energy) : super(energy);

  // Override makeSound (Polymorphism)
  @override
  void makeSound() {
    print('Snake hisses: Sssssss!');
    useEnergy(3);
  }
}

void main() {
  // Create instances of Elephant and Snake
  final elephant = Elephant(50);
  final snake = Snake(30);

  print('🎉 Welcome to the Dart Zoo Adventure! 🐍');

  // Demonstrate Encapsulation
  print('\n🔒 Encapsulation in Action:');
  print('Elephant initial energy: ${elephant.energy}');
  elephant.useEnergy(20);
  elephant.eat();
  print('Snake initial energy: ${snake.energy}');
  snake.useEnergy(40); // Too tired!

  // Demonstrate Inheritance and Polymorphism
  print('\n🌳 Inheritance & 🎭 Polymorphism in Action:');
  elephant.makeSound(); // Unique sound for Elephant
  snake.makeSound(); // Unique sound for Snake

  // Demonstrate Abstraction
  print('\n🎨 Abstraction in Action:');
  print('All animals must implement makeSound, but each does it differently!');
  elephant.makeSound();
  snake.makeSound();

  print('\n🎉 Zoo Adventure Complete! 🚀');
}