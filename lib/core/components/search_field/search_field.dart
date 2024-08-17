import 'package:clean_arch_movie_flutter/presentation/controllers/search/search_cubit.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _textCont = TextEditingController();

  @override
  void dispose() {
    _textCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 8, 13, 0),
      child: Form(
        child: TextFormField(
          controller: _textCont,
          cursorColor: Colors.white,
          cursorWidth: 1.0,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white.withOpacity(0.65),
              ),
          onChanged: (title) {
            context.read<SearchCubit>().updateQuery(title);
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(14)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 62, 62, 62),
                ),
                borderRadius: BorderRadius.circular(18)),
            prefixIcon: Icon(
              FluentIcons.search_16_filled,
              color: Colors.grey[600],
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                _textCont.clear();
                context.read<SearchCubit>().updateQuery('');
              },
              child: Icon(
                Icons.clear_rounded,
                color: Colors.red[400],
              ),
            ),
            hintText: 'Search for Movies, Series...',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withOpacity(0.2),
                ),
          ),
        ),
      ),
    );
  }
}
