import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce/src/core/di/injection_container.dart';
import 'package:ecommerce/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:ecommerce/src/features/profile/presentation/bloc/profile_event.dart';
import 'package:ecommerce/src/features/profile/presentation/bloc/profile_state.dart';
import 'package:ecommerce/src/features/profile/presentation/widgets/profile_header.dart';
import 'package:ecommerce/src/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:ecommerce/src/core/widgets/loading_widget.dart';
import 'package:ecommerce/src/core/widgets/error_widget.dart' as app_error;

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>()..add(const ProfileEvent.loadProfile()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) => _handleMenuAction(context, value),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: 8),
                      Text('Edit Profile'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'settings',
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 8),
                      Text('Settings'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(failure.message),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              passwordChanged: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Password changed successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const AppLoadingWidget(),
              loading: () => const AppLoadingWidget(),
              loaded: (user) => _buildProfileContent(context, user),
              updating: () => const AppLoadingWidget(),
              updated: (user) => _buildProfileContent(context, user),
              uploadingImage: () => const AppLoadingWidget(),
              imageUploaded: (imageUrl) => const AppLoadingWidget(),
              changingPassword: () => const AppLoadingWidget(),
              passwordChanged: () => const AppLoadingWidget(),
              deleting: () => const AppLoadingWidget(),
              deleted: () => const AppLoadingWidget(),
              error: (failure) => app_error.AppErrorWidget(failure: failure),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, user) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProfileBloc>().add(const ProfileEvent.refreshProfile());
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Header
          ProfileHeader(user: user),
          const SizedBox(height: 24),

          // Profile Information Section
          _buildSectionHeader('Account Information'),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ProfileMenuItem(
                  icon: Icons.person_outline,
                  title: 'Personal Information',
                  subtitle: 'Name, email, phone',
                  onTap: () => _navigateToEditProfile(context),
                ),
                const Divider(height: 1),
                ProfileMenuItem(
                  icon: Icons.location_on_outlined,
                  title: 'Address',
                  subtitle: user.address ?? 'Add your address',
                  onTap: () => _navigateToEditProfile(context),
                ),
                const Divider(height: 1),
                ProfileMenuItem(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  subtitle: 'Update your password',
                  onTap: () => _showChangePasswordDialog(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // App Settings Section
          _buildSectionHeader('App Settings'),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ProfileMenuItem(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  subtitle: 'Manage your notifications',
                  onTap: () => context.goNamed('settings'),
                ),
                const Divider(height: 1),
                ProfileMenuItem(
                  icon: Icons.security_outlined,
                  title: 'Privacy & Security',
                  subtitle: 'Manage your privacy settings',
                  onTap: () => context.goNamed('settings'),
                ),
                const Divider(height: 1),
                ProfileMenuItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  subtitle: 'Get help and contact support',
                  onTap: () => _showSupportOptions(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Account Actions Section
          _buildSectionHeader('Account Actions'),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ProfileMenuItem(
                  icon: Icons.logout,
                  title: 'Log Out',
                  subtitle: 'Sign out of your account',
                  textColor: Colors.red,
                  onTap: () => _showLogoutDialog(context),
                ),
                const Divider(height: 1),
                ProfileMenuItem(
                  icon: Icons.delete_forever,
                  title: 'Delete Account',
                  subtitle: 'Permanently delete your account',
                  textColor: Colors.red,
                  onTap: () => _showDeleteAccountDialog(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }

  void _handleMenuAction(BuildContext context, String action) {
    switch (action) {
      case 'edit':
        _navigateToEditProfile(context);
        break;
      case 'settings':
        context.goNamed('settings');
        break;
    }
  }

  void _navigateToEditProfile(BuildContext context) {
    // TODO: Navigate to edit profile page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit Profile feature coming soon!')),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    // TODO: Implement change password dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Change Password feature coming soon!')),
    );
  }

  void _showSupportOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Help & Support',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email Support'),
              subtitle: const Text('support@ecommerce.com'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Open email app
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone Support'),
              subtitle: const Text('+1-800-SUPPORT'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Open phone app
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('FAQ'),
              subtitle: const Text('Frequently Asked Questions'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to FAQ page
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to permanently delete your account? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<ProfileBloc>().add(const ProfileEvent.deleteProfile());
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
