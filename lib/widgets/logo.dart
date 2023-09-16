import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SvgPicture.string(
        """<?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE svg  PUBLIC '-//W3C//DTD SVG 20010904//EN'  'http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd'>
    <svg width="24pt" height="24pt" version="1.0" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
    <metadata>Created by potrace 1.16, written by Peter Selinger 2001-2019</metadata>
    <g transform="translate(0 24) scale(.011215 -.011215)">
    <path d="m927 1945c-261-38-433-158-551-387-52-101-106-351-106-494 0-95 33-299 63-394 41-125 150-284 243-352 62-46 180-101 264-124 92-24 376-24 472 0 188 48 341 170 419 333 32 65 33 73 33 188 0 114-1 124-31 187-39 83-101 151-186 202-62 38-65 42-77 95-22 100-32 125-71 186-64 100-177 155-320 155-119 0-204-32-293-111-20-17-36-37-36-45 0-7 27-32 60-54 63-43 78-43 110-5 26 31 83 48 161 48 100 1 157-30 194-103 41-80 44-78-117-77-107 1-157-3-197-16-109-34-176-89-222-183-64-132 6-303 153-369 58-27 73-29 178-29 103 0 121 2 170 26 108 51 181 143 213 269 8 29 19 55 24 56 16 6 91-73 109-114 10-24 17-66 17-113 0-63-4-84-28-132-50-102-130-167-276-226-14-5-69-16-122-22-107-14-253-2-337 26-246 84-377 289-396 623-15 275 43 486 173 630 61 68 173 131 278 156 76 18 282 19 355 1 212-52 337-161 419-367l22-56 64 18c36 10 70 21 75 24 23 14-20 128-87 233-91 142-202 225-388 291-96 33-291 45-428 26zm357-925c22-8 24-13 19-47-10-68-52-150-92-177-96-65-220-60-293 14-29 29-38 46-38 71 0 63 48 115 130 140 37 11 244 11 274-1z"/>
    </g>
    </svg>
    """,
        height: 42,
        width: 42,
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
