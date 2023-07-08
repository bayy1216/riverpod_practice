import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver{

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    print('[Provider Updated] provider:$provider / pv:$previousValue / nv:$newValue');
  }
  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    print('[Provider Add] provider:$provider / value:$value / ');
  }
  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    print('[Provider Diapose] provider:$provider');
  }
}