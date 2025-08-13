import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

class LoggerObserver extends ProviderObserver {
  LoggerObserver({required this.logger});

  final Logger logger;

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger.info(
      'Provider added: ${provider.name ?? provider.runtimeType}, Value: $value',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    logger.warning(
      'Provider disposed: ${provider.name ?? provider.runtimeType}',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.info(
      'Provider updated: ${provider.name ?? provider.runtimeType}, Previous Value: $previousValue, New Value: $newValue',
    );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.severe(
      'Provider failed: ${provider.name ?? provider.runtimeType}, Error: $error',
      stackTrace,
    );
  }
}
