import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src/app_module.dart';
import 'src/modules/home/domain/enums/media_type_enum.dart';
import 'src/modules/home/presentation/pages/home/widgets/media_display_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const url =
        'https://apod.nasa.gov/apod/image/2503/JupiterCyclones_Juno_960.jpg';
    return const MaterialApp(
      home: Scaffold(
        body: MediaDisplayWidget(mediaType: MediaTypeEnum.image, url: url),
      ),
    );
  }
}
