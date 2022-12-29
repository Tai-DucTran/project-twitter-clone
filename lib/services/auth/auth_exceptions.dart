// Auth Exceptions - Login View
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

// Auth Exceptions - Register View
class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

// generic exceptions
class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
