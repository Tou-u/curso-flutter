import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:auth/features/products/domain/domain.dart';
import 'package:auth/features/products/infrastructure/infrastructure.dart';
import 'package:auth/features/auth/presentation/providers/providers.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';
  final productsRepository = ProductsRepositoryImpl(
    ProductsDatasourceImpl(accessToken: accessToken),
  );
  return productsRepository;
});
