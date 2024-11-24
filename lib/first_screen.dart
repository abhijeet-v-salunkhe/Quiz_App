import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mcq/provider/switch_screen_provider.dart";

class FirstScreen extends ConsumerWidget {
  const FirstScreen({super.key});
  // final void Function() startQuize;

  @override
  Widget build(context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/mcq_flutter.png",
              width: 300, color: const Color.fromARGB(200, 254, 254, 254)),
          const SizedBox(height: 50),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 221, 166, 228),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 25),
          OutlinedButton.icon(
            onPressed: () {
              ref
                  .read(switchScreenProvider.notifier)
                  .switchScreen("Questions-Screen");
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_forward),
            label: const Text(
              "Start Quize",
            ),
          )
        ],
      ),
    );
  }
}
