import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Globe extends StatelessWidget {
  const Globe({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      """<?xml version="1.0" encoding="UTF-8"?>
<svg version="1.1" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
<path d="m36.575 9.587c-10.713 3.427-20.11 11.676-25.236 22.152-3.498 7.151-4.359 20.239-1.89 28.734 3.429 11.796 11.393 20.818 23.128 26.201 5.148 2.362 7.232 2.724 15.923 2.772 9.225 0.05 10.521-0.193 16.723-3.131 23.644-11.2 31.799-39.022 17.592-60.015-4.301-6.355-9.641-11.018-16.57-14.466-5.362-2.669-7.574-3.164-15.5-3.468-6.512-0.25-10.701 0.111-14.17 1.221m8.457 7.879c-2.39 2.544-6.246 12.378-5.395 13.756 0.265 0.428 4.504 0.778 9.422 0.778 10.01 0 9.884 0.124 7.371-7.251-1.688-4.954-5.479-9.749-7.708-9.749-0.755 0-2.416 1.11-3.69 2.466m-15.231 3.788c-4.252 3.041-9.801 8.782-9.801 10.14 0 1.243 11.06 0.618 11.399-0.644 0.184-0.687 1.057-3.701 1.939-6.696s1.468-5.581 1.303-5.746-2.343 1.161-4.84 2.946m34.637 4.246 2.036 6.5h5.263c2.895 0 5.263-0.268 5.263-0.596 0-2.642-10.584-12.404-13.449-12.404-0.775 0-0.486 2.119 0.887 6.5m-48.445 16.017c-1.099 2.893-1.299 10.738-0.363 14.233 0.552 2.059 1.192 2.25 7.524 2.25h6.921l-0.287-9.25-0.288-9.25-6.257-0.298c-5.945-0.283-6.306-0.168-7.25 2.315m22.697-1.767c-1.143 2.006-1.698 8.709-1.096 13.249l0.672 5.066 10.617-0.283 10.617-0.282 0.293-8.414c0.211-6.057-0.069-8.645-1-9.235-1.622-1.029-19.522-1.119-20.103-0.101m28.977-0.083c-0.367 0.366-0.667 4.641-0.667 9.5v8.833h6.893c7.982 0 8.107-0.141 8.107-9.148 0-8.762-0.87-9.852-7.869-9.852-3.188 0-6.098 0.3-6.464 0.667m-46.782 28.117c1.939 3.624 12.516 12.148 13.657 11.007 0.204-0.204-0.456-3.053-1.468-6.331l-1.84-5.96-5.68-0.302c-5.3-0.281-5.612-0.175-4.669 1.586m18.729 0.966c2.78 11.724 8.23 16.296 13.111 11 1.856-2.014 5.275-10.3 5.275-12.785 0-0.552-4.069-0.965-9.519-0.965h-9.519l0.652 2.75m25.815 0c-0.335 1.513-1.063 4.243-1.618 6.067-0.556 1.824-0.753 3.575-0.438 3.889 1.188 1.188 13.459-9.611 13.586-11.956 0.023-0.412-2.425-0.75-5.44-0.75-5.165 0-5.516 0.159-6.09 2.75" fill="#10100f" fill-rule="evenodd"/>
</svg>""",
      width: 24,
      height: 24,
    );
  }
}