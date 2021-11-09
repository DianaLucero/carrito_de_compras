import 'dart:html';

import 'package:flutter/material.dart';

class CatalogModel{
  static List<String> itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'CallBack',
    'Closure',
    'Automata',
    'Bit Shift',
    'Marine'
  ];

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 50;

  Item(this.id, this.name)

  : color = Colors.primaries[id % Colors.primaries.length];

  @override 
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
  
}