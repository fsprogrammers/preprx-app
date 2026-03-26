// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:retro_route/utils/app_colors.dart';
// import 'package:retro_route/utils/app_routes.dart';
// import 'package:retro_route/view_model/auth_view_model/login_view_model.dart';

// /// Provider to track if user is in guest mode
// final isGuestModeProvider = StateProvider<bool>((ref) => false);

// /// Helper class for authentication related utilities
// class AuthHelper {
//   /// Check if user is logged in
//   static bool isLoggedIn(WidgetRef ref) {
//     final authState = ref.read(authNotifierProvider);
//     return authState.value?.success == true && 
//            authState.value?.data?.token != null &&
//            authState.value!.data!.token.isNotEmpty;
//   }

//   /// Get the current user's token (returns null if not logged in)
//   static String? getToken(WidgetRef ref) {
//     final authState = ref.read(authNotifierProvider);
//     if (authState.value?.success == true) {
//       return authState.value?.data?.token;
//     }
//     return null;
//   }

//   /// Get the current user's ID (returns null if not logged in)
//   static String? getUserId(WidgetRef ref) {
//     final authState = ref.read(authNotifierProvider);
//     if (authState.value?.success == true) {
//       return authState.value?.data?.user.id;
//     }
//     return null;
//   }

//   /// Check if action requires login and show dialog if not logged in
//   /// Returns true if user is logged in, false if guest
//   static bool requireLogin({
//     required BuildContext context,
//     required WidgetRef ref,
//     String? message,
//   }) {
//     if (isLoggedIn(ref)) {
//       return true;
//     }

//     showLoginRequiredDialog(
//       context: context,
//       message: message ?? 'Please sign up to continue',
//     );
//     return false;
//   }

//   /// Show a dialog prompting user to log in
//   static void showLoginRequiredDialog({
//     required BuildContext context,
//     String? message,
//   }) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         title: Row(
//           children: [
//             Icon(
//               Icons.login_rounded,
//               color: AppColors.primary,
//             ),
//             const SizedBox(width: 8),
//             const Text(
//               'Signup Required',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//         content: Text(
//           message ?? 'Please sign up to access this feature.',
//           style: TextStyle(
//             fontSize: 15,
//             color: Colors.grey[700],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text(
//               'Cancel',
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               goRouter.push(AppRoutes.register);
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.primary,
//               foregroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text(
//               'Sign Up',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
