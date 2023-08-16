import 'package:client/app/controller/repositories/home/about/about_repository.dart';
import 'package:client/app/controller/services/home/about/about_service.dart';
import 'package:client/app/views/store/home/about/about_controller.dart';
import 'package:get_it/get_it.dart';

import '../controller/client/http_client.dart';
import '../controller/repositories/auth/password_reset/confirm_request_repository.dart';
import '../controller/repositories/auth/password_reset/reset_request_repository.dart';
import '../controller/repositories/auth/sign_in_repository.dart';
import '../controller/repositories/auth/sign_up_repository.dart';
import '../controller/repositories/home/budget/create_budget_repository.dart';
import '../controller/repositories/home/budget/state_repository.dart';
import '../controller/repositories/introduction/entry_repository.dart';
import '../controller/repositories/introduction/introduction_repository.dart';
import '../controller/services/auth/password_reset/confirm_request_service.dart';
import '../controller/services/auth/password_reset/reset_request_service.dart';
import '../controller/services/auth/sign_in_service.dart';
import '../controller/services/auth/sign_up_service.dart';
import '../controller/services/home/budget/create_budget_service.dart';
import '../controller/services/home/budget/state_service.dart';
import '../controller/services/introduction/entry_service.dart';
import '../controller/services/introduction/intro_service.dart';
import '../views/store/auth/password_reset/confirm_request_controller.dart';
import '../views/store/auth/password_reset/reset_request_controller.dart';
import '../views/store/auth/sign_in_controller.dart';
import '../views/store/auth/sign_up_controller.dart';
import '../views/store/home/budget/create_budget_controller.dart';
import '../views/store/home/budget/state_controller.dart';
import '../views/store/home/config/config_controller.dart';
import '../views/store/home/drawer/drawer_controller.dart';
import '../views/store/home/home_controller.dart';
import '../views/store/introduction/entry_controller.dart';
import '../views/store/introduction/intro_controller.dart';
import '../views/store/password_visible.dart';
import '../views/store/theme/theme_controller.dart';
import 'local_storage.dart';

final getIt = GetIt.instance;

void setupProviders() {
  // Registra a Factory do HTTP Client
  getIt.registerFactory<MyHttpClient>(
    () => MyHttpClient(),
  );

  // Registra o Singleton do Shared Preference
  getIt.registerSingleton<SharedPreferenceService>(
    SharedPreferenceService(),
  );

  // Registra o Singleton do Controlador, Serviço e o Repositório da Intro
  getIt.registerLazySingleton<IntroController>(
    () => IntroController(getIt(), getIt()),
  );

  getIt.registerLazySingleton<IntroService>(
    () => IntroService(introductionRepository: getIt()),
  );

  getIt.registerLazySingleton<IntroductionRepository>(
    () => IntroductionRepository(myHttpClient: getIt()),
  );

  // Registra o Singleton do Controlador, Serviço e o Repositório da Entry
  getIt.registerLazySingleton<EntryController>(
    () => EntryController(getIt(), getIt()),
  );

  getIt.registerLazySingleton<EntryService>(
    () => EntryService(entryRepository: getIt()),
  );

  getIt.registerLazySingleton<EntryRepository>(
    () => EntryRepository(myHttpClient: getIt()),
  );

  // Registra o Singleton do Controlador, Serviço e o Repositório do SignIn
  getIt.registerLazySingleton<SignInController>(
    () => SignInController(getIt(), getIt()),
  );

  getIt.registerLazySingleton<SignInService>(
    () => SignInService(signInRepository: getIt()),
  );

  getIt.registerLazySingleton<SignInRepository>(
    () => SignInRepository(myHttpClient: getIt()),
  );

  // Registra o Singleton do Controlador, Serviço e o Repositório do SignUp
  getIt.registerFactory<SignUpController>(
    () => SignUpController(getIt()),
  );

  getIt.registerFactory<SignUpService>(
    () => SignUpService(signUpService: getIt()),
  );

  getIt.registerFactory<SignUpRepository>(
    () => SignUpRepository(myHttpClient: getIt()),
  );

  // Registra o Singleton do Controlador, Serviço e o Repositório da Home
  getIt.registerLazySingleton<HomeController>(
    () => HomeController(getIt()),
  );

  // Registra o Singleton do Controlador, Serviço e o Repositório da Requisição de Troca de Senha
  getIt.registerLazySingleton<PasswordRequestResetController>(
    () => PasswordRequestResetController(getIt()),
  );

  getIt.registerLazySingleton<PasswordResetRequestService>(
    () => PasswordResetRequestService(passwordResetRequestRepository: getIt()),
  );

  getIt.registerLazySingleton<PasswordResetRequestRepository>(
    () => PasswordResetRequestRepository(myHttpClient: getIt()),
  );

  // Registra o Singleton do Controlador, Serviço e o Repositório da Confirmação de Troca de Senha
  getIt.registerLazySingleton<PasswordConfirmRequestController>(
    () => PasswordConfirmRequestController(getIt()),
  );

  getIt.registerLazySingleton<PasswordConfirmRequestService>(
    () => PasswordConfirmRequestService(passwordConfirmRequestRepository: getIt()),
  );

  getIt.registerLazySingleton<PasswordConfirmRequestRepository>(
    () => PasswordConfirmRequestRepository(myHttpClient: getIt()),
  );

  // Registra o Singleton do Controlador, Serviço e o Repositório da Requisição dos Estados
  getIt.registerLazySingleton<StateController>(
    () => StateController(getIt()),
  );

  getIt.registerLazySingleton<StateService>(
    () => StateService(stateRepository: getIt()),
  );

  getIt.registerLazySingleton<StateRepository>(
    () => StateRepository(myHttpClient: getIt()),
  );

  // Registra o Singleton do Controlador, Serviço e o Repositório da Criação do Orçamento
  getIt.registerLazySingleton<CreateBudgetController>(
    () => CreateBudgetController(getIt(), getIt()),
  );

  getIt.registerLazySingleton<CreateBudgetService>(
    () => CreateBudgetService(createBudgetRepository: getIt()),
  );

  getIt.registerLazySingleton<CreateBudgetRepository>(
    () => CreateBudgetRepository(myHttpClient: getIt()),
  );

  // Registra o Singleton do Controlador, Serviço e o Repositório do Sobre
  getIt.registerLazySingleton<AboutController>(
    () => AboutController(aboutService: getIt()),
  );

  getIt.registerLazySingleton<AboutService>(
    () => AboutService(aboutRepository: getIt()),
  );

  getIt.registerLazySingleton<AboutRepository>(
    () => AboutRepository(myHttpClient: getIt()),
  );

  // Registra o Factory do Controlador da Visibilidade da Senha
  getIt.registerFactory<PasswordVisibleController>(
    () => PasswordVisibleController(),
  );

  //
  getIt.registerLazySingleton<ThemeController>(
    () => ThemeController(getIt()),
  );

  getIt.registerSingleton<MyDrawerController>(
    MyDrawerController(getIt(), getIt()),
  );

  getIt.registerLazySingleton<ConfigController>(
    () => ConfigController(getIt()),
  );
}