import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  AnalyticsService._();
  static final AnalyticsService I = AnalyticsService._();

  final FirebaseAnalytics _ga = FirebaseAnalytics.instance;

  // ========= Navegação =========
  Future<void> screen(String name, {String screenClass = 'Flutter'}) async {
    await _ga.logScreenView(screenName: name, screenClass: screenClass);
  }

  // ========= Onboarding / Auth =========
  Future<void> signUp({String method = 'password'}) async {
    await _ga.logSignUp(signUpMethod: method);
  }

  Future<void> login({String method = 'password'}) async {
    await _ga.logLogin(loginMethod: method);
  }

  Future<void> logout() async {
    await _ga.logEvent(name: 'logout');
  }

  // ========= Navegação chave =========
  Future<void> selectItem({
    required String itemId,
    required String itemName,
    String? itemCategory,
  }) async {
    await _ga.logSelectItem(
      itemListId: itemCategory ?? 'default',
      itemListName: itemCategory ?? 'default',
      items: [
        AnalyticsEventItem(itemId: itemId, itemName: itemName, itemCategory: itemCategory),
      ],
    );
  }

  Future<void> search(String term) async {
    await _ga.logSearch(searchTerm: term);
  }

  // ========= Monetização =========
  Future<void> addToCart({
    required String itemId,
    required String itemName,
    double price = 0,
    String currency = 'BRL',
    int quantity = 1,
  }) async {
    await _ga.logAddToCart(
      currency: currency,
      value: price * quantity,
      items: [
        AnalyticsEventItem(
          itemId: itemId,
          itemName: itemName,
          price: price,
          quantity: quantity,
        ),
      ],
    );
  }

  Future<void> beginCheckout({double value = 0, String currency = 'BRL'}) async {
    await _ga.logBeginCheckout(value: value, currency: currency);
  }

  Future<void> purchase({
    required double value,
    String currency = 'BRL',
    String? transactionId,
  }) async {
    await _ga.logPurchase(
      value: value,
      currency: currency,
      transactionId: transactionId,
    );
  }

  // ========= Assinaturas =========
  Future<void> trialStart({String plan = 'default'}) async {
    await _ga.logEvent(name: 'trial_start', parameters: {'plan': plan});
  }

  Future<void> subscribe({String plan = 'default', double price = 0, String currency = 'BRL'}) async {
    await _ga.logEvent(name: 'subscribe', parameters: {
      'plan': plan,
      'value': price,
      'currency': currency,
    });
  }

  Future<void> subscriptionRenew({String plan = 'default'}) async {
    await _ga.logEvent(name: 'subscription_renew', parameters: {'plan': plan});
  }

  Future<void> subscriptionCancel({String plan = 'default', String? reason}) async {
    await _ga.logEvent(name: 'subscription_cancel', parameters: {
      'plan': plan,
      if (reason != null) 'reason': reason,
    });
  }

  // ========= Usuário / propriedades =========
  Future<void> setUserId(String userId) async => _ga.setUserId(id: userId);
  Future<void> setUserProperty({required String name, required String value}) async =>
      _ga.setUserProperty(name: name, value: value);

  // ========= Erros =========
  Future<void> logError({
    required String code,
    required String message,
    String? screen,
  }) async {
    await _ga.logEvent(name: 'error', parameters: {
      'code': code,
      'message': message,
      if (screen != null) 'screen': screen,
    });
  }
}
