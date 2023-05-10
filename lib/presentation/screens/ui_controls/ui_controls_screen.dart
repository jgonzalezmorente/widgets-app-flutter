import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const name = 'ui_control_screen';

  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransporation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;


  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adiciones'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransporation'),
          children: [
            RadioListTile(
                title: const Text('By Car'),
                subtitle: const Text('Viajar por carro'),
                value: Transportation.car,
                groupValue: selectedTransporation,
                onChanged: (value) => setState(() {
                      selectedTransporation = Transportation.car;
                    })),
            RadioListTile(
                title: const Text('By Boat'),
                subtitle: const Text('Viajar por barco'),
                value: Transportation.boat,
                groupValue: selectedTransporation,
                onChanged: (value) => setState(() {
                      selectedTransporation = Transportation.boat;
                    })),
            RadioListTile(
                title: const Text('By Plane'),
                subtitle: const Text('Viajar por avión'),
                value: Transportation.plane,
                groupValue: selectedTransporation,
                onChanged: (value) => setState(() {
                      selectedTransporation = Transportation.plane;
                    })),
            RadioListTile(
                title: const Text('By Submarine'),
                subtitle: const Text('Viajar por submarino'),
                value: Transportation.submarine,
                groupValue: selectedTransporation,
                onChanged: (value) => setState(() {
                      selectedTransporation = Transportation.submarine;
                    })),
          ],
        ),

        CheckboxListTile(
          title: const Text( 'Desayuno?' ),
          value: wantsBreakfast, 
          onChanged: ( value ) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          })
        ),
        CheckboxListTile(
          title: const Text( 'Almuerzo?' ),
          value: wantsLunch, 
          onChanged: ( value ) => setState(() {
            wantsLunch = !wantsLunch;
          })
        ),
        CheckboxListTile(
          title: const Text( 'Cena?' ),
          value: wantsDinner, 
          onChanged: ( value ) => setState(() {
            wantsDinner = !wantsDinner;
          })
        ),        

      ],
    );
  }
}
