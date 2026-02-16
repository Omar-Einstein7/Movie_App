import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/theme/theme_cubit.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/domain/auth/usecases/logout.dart';
import 'package:movie_app/presentation/auth/pages/signin.dart';
import 'package:movie_app/service_locator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildProfileMenu(context),
            const SizedBox(height: 24),
            _buildLogoutButton(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 80, bottom: 40),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 2),
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://ui-avatars.com/api/?name=User+Name&background=E21221&color=fff&size=150',
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Movie Lover',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'user@example.com',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildMenuItem(
            context,
            icon: Icons.person_outline,
            title: 'Edit Profile',
            onTap: () {},
          ),
          _buildMenuItem(
            context,
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            onTap: () {},
          ),
          _buildMenuItem(
            context,
            icon: Icons.language,
            title: 'Language',
            trailing: Text(
              'English',
              style: TextStyle(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            onTap: () {},
          ),
          _buildMenuItem(
            context,
            icon: Icons.dark_mode_outlined,
            title: 'Dark Mode',
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                context.read<ThemeCubit>().updateTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
              activeThumbColor: AppColors.primary,
            ),
            onTap: () {},
          ),
          _buildMenuItem(
            context,
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.secondaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing:
            trailing ??
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () async {
            await sl<LogoutUseCase>().call();
            if (context.mounted) {
              AppNavigator.pushAndRemove(context, SigninScreen());
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.primary,
            elevation: 0,
            side: const BorderSide(color: AppColors.primary, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Logout',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
