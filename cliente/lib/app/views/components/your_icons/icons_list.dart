part of 'your_icons_icons.dart';

enum YourIcons {
  // Social
  instagram._('instagram'),

  // Time
  clock._('clock'),
  calendar._('calendar'),

  // Location
  location._('location'),
  earth._('earth'),

  // Support
  infoCircle._('info-circle'),

  // Finance
  bank._('bank'),
  briefcase._('briefcase'),
  candleChart._('candle-chart'),
  cardIn._('card-in'),
  cardOff._('card-off'),
  cardOut._('card-out'),
  cardOutlineOff._('card-outline-off'),
  cardOutline._('card-outline'),
  cardScan._('card-scan'),
  card._('card'),
  cardsStack._('cards-stack'),
  gem._('gem'),
  metalBar._('metal-bar'),
  moneyConvertRub._('money-convert-rub'),
  moneyConvertUsd._('money-convert-usd'),
  moneyIn._('money-in'),
  moneyOut._('money-out'),
  money._('money'),
  safeCell._('safe-cell'),
  safeVault._('safe-vault'),
  wallet._('wallet'),

  // Communication
  call._('call'),
  mail._('mail'),
  chat._('chat'),

  // Security
  certificate._('certificate'),
  eyeOff._('eye-off'),
  eyeOpen._('eye-open'),
  faceIdAlt._('face-id-alt'),
  faceId._('face-id'),
  fingerprint._('fingerprint'),
  lockClosed._('lock-closed'),
  lockOpen._('lock-open'),
  lockPasswordClosed._('lock-password-closed'),
  lockPasswordOpen._('lock-password-open'),

  // User
  userAdd._('user-add'),
  userCircle._('user-circle'),
  userClose._('user-close'),
  userGroup._('user-group'),
  userRect._('user-rect'),
  userRemove._('user-remove'),
  user._('user'),

  // Interface
  bookmarkAdd._('bookmark-add'),
  bookmarkEemove._('bookmark-remove'),
  bookmark._('bookmark'),
  bookmarks._('bookmarks'),
  checkMedium._('check-m'),
  check._('check'),
  cross._('cross'),
  documentAlt._('document-alt'),
  document._('document'),
  downloadMedium._('download-M'),
  downloadSmall._('download-S'),
  download._('download'),
  heart._('heart'),
  lightning._('lightning'),
  qrcode._('qrcode'),
  search._('search'),
  settings._('settings'),
  shoppingBag._('shopping-bag'),
  trash._('trash'),
  zoomIn._('zoom-in'),
  zoomOut._('zoom-out'),
  home._('home'),
  exit._('exit'),
  apps._('apps');

  const YourIcons._(
    this.name,
  );

  /// Nome do arquivo na pasta assets.
  final String name;
}
