import 'dart:ui';

import 'package:dio/dio.dart';

import 'package:amadis_customer/models/category.dart';
import 'package:amadis_customer/models/order_state.dart';
import 'package:amadis_customer/models/order_type.dart';
import 'package:amadis_customer/models/product.dart';

const kPrimaryColor = Color(0xff053F5E);
const kSecondaryColor = Color(0xff107163);

final dioOptions = Options(validateStatus: (status) {
  return status < 500;
});

const emailRegex =
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

const BASE_URL = 'https://amadis-backend.herokuapp.com/api';

// MODELS
const orderTypes = <OrderType>[
  OrderType(
    id: 1,
    name: 'Pedido al contado',
    description: 'Pedido al contado.',
  ),
  OrderType(
    id: 2,
    name: 'Pedido por consignación',
    description: 'Pedido por consignación.',
  ),
];

const orderStates = <OrderState>[
  OrderState(id: 1, name: 'Confirmada', description: 'Orden confirmada.'),
  OrderState(id: 2, name: 'Cancelada', description: 'Orden cancelada.'),
  OrderState(
      id: 3, name: 'Preparada', description: 'Orden preparada para su envío.'),
  OrderState(id: 4, name: 'En ruta', description: 'Orden en ruta.'),
  OrderState(
      id: 5, name: 'Arribada', description: 'Orden arribada al destino.'),
  OrderState(id: 6, name: 'Cotizada', description: 'Orden cotizada.'),
  OrderState(id: 7, name: 'Completada', description: 'Orden completada.'),
];

const categories = <Category>[
  Category(
    id: 1,
    name: 'Cerveza',
    description: 'Bebida alcoholica.',
  ),
  Category(
    id: 2,
    name: 'Agua',
    description: 'Agua mineral y de mesa.',
  ),
  Category(
    id: 3,
    name: 'Gaseosa',
    description: 'Gaseosa y refresco.',
  ),
];

final products = <Product>[
  Product(
    id: 1,
    name: 'Cristal',
    price: 52.53,
    description: 'Cerveza Cristal',
    category: categories.singleWhere((c) => c.id == 1),
  ),
  Product(
    id: 2,
    name: 'Pilsen Callao',
    price: 57.95,
    description: 'Cerveza Pilsen Callao',
    category: categories.singleWhere((c) => c.id == 1),
  ),
  Product(
    id: 3,
    name: 'Cusqueña',
    price: 62.94,
    description: 'Cerveza Cuzqueña',
    category: categories.singleWhere((c) => c.id == 1),
  ),
];
