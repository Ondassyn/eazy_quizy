import 'package:eazy_quizy/data/auth/repository/auth_repository_impl.dart';
import 'package:eazy_quizy/data/auth/source/auth_firebase_service.dart';
import 'package:eazy_quizy/data/message/repository/message.dart';
import 'package:eazy_quizy/data/message/source/message_firebase_service.dart';
import 'package:eazy_quizy/domain/auth/repository/auth.dart';
import 'package:eazy_quizy/domain/auth/usecases/get_ages.dart';
import 'package:eazy_quizy/domain/auth/usecases/get_user.dart';
import 'package:eazy_quizy/domain/auth/usecases/is_logged_in.dart';
import 'package:eazy_quizy/domain/auth/usecases/send_password_reset_email.dart';
import 'package:eazy_quizy/domain/auth/usecases/signin.dart';
import 'package:eazy_quizy/domain/auth/usecases/signup.dart';
import 'package:eazy_quizy/domain/message/repository/message.dart';
import 'package:eazy_quizy/domain/message/usecases/get_messages.dart';
import 'package:eazy_quizy/domain/message/usecases/push_message.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<MessageFirebaseService>(MessageFirebaseServiceImpl());

  // Repositories

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<MessageRepository>(MessageRepositoryImpl());

  // Usecases

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<SendPasswordResetEmailUseCase>(
      SendPasswordResetEmailUseCase());

  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());

  sl.registerSingleton<GetMessagesUseCase>(GetMessagesUseCase());
  sl.registerSingleton<PushMessageUseCase>(PushMessageUseCase());
}
