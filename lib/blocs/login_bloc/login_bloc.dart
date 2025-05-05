import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/blocs/login_bloc/login_event.dart';
import 'package:movies_app/blocs/login_bloc/login_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final String apiKey = '8bbedc03888f259d8c626b8577322dd8'; // Replace with your TMDB API key

  AuthBloc() : super(AuthInitialState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLoginEvent) {
      yield AuthLoadingState();
      try {
        // Step 1: Get the request token
        final requestTokenResponse = await http.get(Uri.parse('https://api.themoviedb.org/3/authentication/token/new?api_key=$apiKey'));
        if (requestTokenResponse.statusCode == 200) {
          final requestToken = json.decode(requestTokenResponse.body)['request_token'];

          // Step 2: Validate with login
          final loginResponse = await http.post(
            Uri.parse('https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=$apiKey'),
            body: json.encode({
              'username': event.username,
              'password': event.password,
              'request_token': requestToken,
            }),
            headers: {'Content-Type': 'application/json'},
          );

          if (loginResponse.statusCode == 200) {
            final loginData = json.decode(loginResponse.body);
            final loginToken = loginData['request_token'];

            // Step 3: Create a session
            final sessionResponse = await http.post(
              Uri.parse('https://api.themoviedb.org/3/authentication/session/new?api_key=$apiKey'),
              body: json.encode({'request_token': loginToken}),
              headers: {'Content-Type': 'application/json'},
            );

            if (sessionResponse.statusCode == 200) {
              final sessionData = json.decode(sessionResponse.body);
              final sessionId = sessionData['session_id'];

              yield AuthSuccessState(sessionId);
            } else {
              yield AuthFailureState('Failed to create session');
            }
          } else {
            yield AuthFailureState('Invalid credentials');
          }
        } else {
          yield AuthFailureState('Failed to get request token');
        }
      } catch (e) {
        yield AuthFailureState('Error: $e');
      }
    } else if (event is AuthRegisterEvent) {
      yield AuthFailureState('Please register on the TMDB website.');
    }
  }
}
