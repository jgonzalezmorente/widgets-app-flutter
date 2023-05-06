import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  
  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {

    ScaffoldMessenger.of( context ).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text( 'Hola Mundo' ),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration( seconds: 2 ),
    );

    ScaffoldMessenger.of( context ).showSnackBar( snackbar );

  }

  void openDialog( BuildContext context ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text( '¿Estás seguro?' ),
        content: const Text( 'Enim officia veniam ullamco nostrud nulla eiusmod magna labore tempor ea eu ea enim dolore. Et ut reprehenderit nulla ipsum. Consequat id est ad et culpa. Sit laborum nostrud minim voluptate exercitation occaecat. Officia sit eiusmod id ullamco ea duis culpa consectetur ipsum proident. Quis duis exercitation mollit nisi est incididunt.'),
        actions: [
          TextButton( onPressed: () => context.pop(), child: const Text( 'Cancelar') ),
          FilledButton( onPressed: () => context.pop(), child: const Text( 'Aceptar') )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Snackbars y Diálogos' ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Ullamco amet minim culpa ut non et id non consectetur et do culpa. Minim enim fugiat Lorem do do qui duis quis. Voluptate velit ex nisi esse quis esse duis ad eu. Deserunt sint eu ullamco aliquip occaecat id laboris officia.')
                  ]
                );
              }, 
              child: const Text( 'Licencias udadas')
            ),

            FilledButton.tonal(
              onPressed: () => openDialog( context ), 
              child: const Text( 'Mostrar diálogo' )
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text( 'Mostrar Snackbar' ),
        icon: const Icon( Icons.remove_red_eye_outlined ),
        onPressed: () => showCustomSnackbar( context )        
       ),
    );
  }


}