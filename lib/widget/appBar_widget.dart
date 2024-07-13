import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final bool? centerTitle;

  final List<Widget>? actions;

  final Function()? onTap;

  final PreferredSizeWidget? bottom;

  final bool automaticallyImplyLeading;
  const AppBarWidget({
    Key? key,
    required this.title,
    this.centerTitle = false,
    this.actions,
    this.bottom,
    this.automaticallyImplyLeading = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
      ),
      centerTitle: centerTitle,
      leading: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: const Padding(
          padding:  EdgeInsets.all(12),
          child:  Icon(Icons.arrow_back_ios),
        ),
      ),
      actions: actions ?? [],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  bool get wantKeepAlive => true;
}
