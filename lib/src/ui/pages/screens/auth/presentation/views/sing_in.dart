import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/domain/blocs/all_lessons_bloc/all_lessons_bloc.dart';
import 'package:edu/src/domain/blocs/all_modules_bloc/all_modules_bloc.dart';
import 'package:edu/src/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:edu/src/domain/blocs/auth_bloc/auth_event.dart';
import 'package:edu/src/domain/blocs/auth_bloc/auth_state.dart';
import 'package:edu/src/domain/blocs/top_users_bloc/top_users_bloc.dart';
import 'package:edu/src/domain/blocs/user_bloc/user_bloc.dart';
import 'package:edu/src/domain/models/form_status.dart';
import 'package:edu/src/ui/pages/routes/app_routes.dart';
import 'package:edu/src/ui/pages/screens/auth/presentation/widgets/button_container.dart';
import 'package:edu/src/ui/pages/screens/auth/presentation/widgets/formatters.dart';
import 'package:edu/src/ui/pages/screens/auth/presentation/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'forgot_password.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    _phoneController.text = "+998 (";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 70.h),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 65.w),
                  child: Image.asset(CommonAssets.rivojLogo),
                ),
                10.verticalSpace,
                Center(
                  child: Text(
                    "Akkauntga kirish",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26.w,
                    ),
                  ),
                ),
                37.verticalSpace,
                Text(
                  "Telefon raqam",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.verticalSpace,
                TextFieldContainer(
                  keyBoardType: TextInputType.phone,
                  action: TextInputAction.next,
                  controller: _phoneController,
                  maskTextInputFormatter: Formatters.phoneFormatter,
                  hintText: "Telefon raqamingizni kiriting",
                ),
                30.verticalSpace,
                Text(
                  "Parol",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.verticalSpace,
                TextFieldContainer(
                  keyBoardType: TextInputType.text,
                  controller: _passwordController,
                  isObscureText: true,
                  hintText: "Parol",
                  action: TextInputAction.done,
                  focusNode: focusNode,
                ),
                const Spacer(),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) async {
                    if (state.status == FormStatus.error) {
                      Fluttertoast.showToast(msg: state.errorMessage);
                    }
                    if (state.status == FormStatus.success) {
                      context.read<AllModulesBloc>().add(GetAllModules());
                      context.read<UserBloc>().add(GetUserData());
                      context.read<TopUsersBloc>().add(GetTopUsers());
                      await Future.delayed(const Duration(seconds: 1), () {
                        context.read<AllLessonsBloc>().add(
                              GetModuleLessonsEvent(
                                  moduleId: context
                                      .read<AllModulesBloc>()
                                      .state
                                      .allModules[0]
                                      .moduleId),
                            );
                      });
                      if (!context.mounted) return;
                      context.go(Routes.home);
                    }
                  },
                  builder: (context, state) {
                    return ButtonContainer(
                      title: "Kirish",
                      borderRadius: 12,
                      fontSize: 25,
                      isLoading: state.status == FormStatus.loading,
                      onTap: () async {
                        context.read<AuthBloc>().add(
                              LoginEvent(
                                  phoneNumber: _phoneController.text,
                                  password: _passwordController.text),
                            );
                      },
                    );
                  },
                ),
                32.verticalSpace,
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ForgotPassword()));
                    },
                    child: Text(
                      "Parolni unutdingizmi?",
                      style: TextStyle(fontSize: 22.w, color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
