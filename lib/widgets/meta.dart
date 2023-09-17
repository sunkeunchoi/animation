import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Meta extends StatelessWidget {
  const Meta({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SvgPicture.string(
        """<?xml version="1.0" encoding="utf-8"?>
<svg xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:cc="http://creativecommons.org/ns#" width="948" height="191">
<desc>Logo of Meta Platforms -- Graphic created by Detmar Owen</desc>
<defs>
<linearGradient id="Grad_Logo1" x1="61" y1="117" x2="259" y2="127" gradientUnits="userSpaceOnUse">
<stop style="stop-color:#0064e1" offset="0"/>
<stop style="stop-color:#0064e1" offset="0.4"/>
<stop style="stop-color:#0073ee" offset="0.83"/>
<stop style="stop-color:#0082fb" offset="1"/>
</linearGradient>
<linearGradient id="Grad_Logo2" x1="45" y1="139" x2="45" y2="66" gradientUnits="userSpaceOnUse">
<stop style="stop-color:#0082fb" offset="0"/>
<stop style="stop-color:#0064e0" offset="1"/>
</linearGradient>
</defs>
<path id="Logo0" style="fill:#0081fb" d="m31.06,125.96c0,10.98 2.41,19.41 5.56,24.51 4.13,6.68 10.29,9.51 16.57,9.51 8.1,0 15.51-2.01 29.79-21.76 11.44-15.83 24.92-38.05 33.99-51.98l15.36-23.6c10.67-16.39 23.02-34.61 37.18-46.96 11.56-10.08 24.03-15.68 36.58-15.68 21.07,0 41.14,12.21 56.5,35.11 16.81,25.08 24.97,56.67 24.97,89.27 0,19.38-3.82,33.62-10.32,44.87-6.28,10.88-18.52,21.75-39.11,21.75l0-31.02c17.63,0 22.03-16.2 22.03-34.74 0-26.42-6.16-55.74-19.73-76.69-9.63-14.86-22.11-23.94-35.84-23.94-14.85,0-26.8,11.2-40.23,31.17-7.14,10.61-14.47,23.54-22.7,38.13l-9.06,16.05c-18.2,32.27-22.81,39.62-31.91,51.75-15.95,21.24-29.57,29.29-47.5,29.29-21.27,0-34.72-9.21-43.05-23.09-6.8-11.31-10.14-26.15-10.14-43.06z"/>
<path id="Logo1" style="fill:url(#Grad_Logo1)" d="m24.49,37.3c14.24-21.95 34.79-37.3 58.36-37.3 13.65,0 27.22,4.04 41.39,15.61 15.5,12.65 32.02,33.48 52.63,67.81l7.39,12.32c17.84,29.72 27.99,45.01 33.93,52.22 7.64,9.26 12.99,12.02 19.94,12.02 17.63,0 22.03-16.2 22.03-34.74l27.4-.86c0,19.38-3.82,33.62-10.32,44.87-6.28,10.88-18.52,21.75-39.11,21.75-12.8,0-24.14-2.78-36.68-14.61-9.64-9.08-20.91-25.21-29.58-39.71l-25.79-43.08c-12.94-21.62-24.81-37.74-31.68-45.04-7.39-7.85-16.89-17.33-32.05-17.33-12.27,0-22.69,8.61-31.41,21.78z"/>
<path id="Logo2" style="fill:url(#Grad_Logo2)" d="m82.35,31.23c-12.27,0-22.69,8.61-31.41,21.78-12.33,18.61-19.88,46.33-19.88,72.95 0,10.98 2.41,19.41 5.56,24.51l-26.48,17.44c-6.8-11.31-10.14-26.15-10.14-43.06 0-30.75 8.44-62.8 24.49-87.55 14.24-21.95 34.79-37.3 58.36-37.3z"/>
<path id="Text" style="fill:#192830" d="m347.94,6.04h35.93l61.09,110.52 61.1-110.52h35.15v181.6h-29.31v-139.18l-53.58,96.38h-27.5l-53.57-96.38v139.18h-29.31z
m285.11,67.71c-21.02,0-33.68,15.82-36.71,35.41h71.34c-1.47-20.18-13.11-35.41-34.63-35.41z
m-65.77,46.57c0-41.22 26.64-71.22 66.28-71.22 38.99,0 62.27,29.62 62.27,73.42v8.05h-99.49c3.53,21.31 17.67,35.67 40.47,35.67 18.19,0 29.56-5.55 40.34-15.7l15.57,19.07c-14.67,13.49-33.33,21.27-56.95,21.27-42.91,0-68.49-31.29-68.49-70.56z
m164.09-43.97h-26.98v-24h26.98v-39.69h28.28v39.69h40.99v24h-40.99v60.83c0,20.77 6.64,28.15 22.96,28.15 7.45,0 11.72-.64 18.03-1.69v23.74c-7.86,2.22-15.36,3.24-23.48,3.24-30.53,0-45.79-16.68-45.79-50.07z
m188.35,23.34c-5.68-14.34-18.35-24.9-36.97-24.9-24.2,0-39.69,17.17-39.69,45.14 0,27.27 14.26,45.27 38.53,45.27 19.08,0 32.7-11.1 38.13-24.91z
m28.28,87.95h-27.76v-18.94c-7.76,11.15-21.88,22.18-44.75,22.18-36.78,0-61.36-30.79-61.36-70.95 0-40.54 25.17-70.83 62.92-70.83 18.66,0 33.3,7.46 43.19,20.63v-17.38h27.76z"/>
</svg>
    """,
        height: 20,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
