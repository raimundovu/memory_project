import 'package:bikecourier_app/models/delivery_location.dart';
import 'package:bikecourier_app/shared/ui_helpers.dart';
import 'package:bikecourier_app/viewmodels/client/create_end_view_model.dart';
import 'package:bikecourier_app/widgets/busy_button.dart';
import 'package:bikecourier_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class CreateEndView extends StatelessWidget {
  final locationController = TextEditingController();
  final notesController = TextEditingController();
  final DeliveryLocation edittingEnd;

  CreateEndView({Key key, this.edittingEnd}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: CreateEndViewModel(),
      onModelReady: (model) {
        locationController.text = edittingEnd?.location ?? '';
        notesController.text = edittingEnd?.notes ?? '';
        model.setEditting(edittingEnd);
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              verticalSpace(40),
              Text(
                'Información de Destino',
                style: TextStyle(fontSize: 26),
              ),
              verticalSpaceMedium,
              InputField(
                placeholder: 'Dirección de destino',
                controller: locationController,
              ),
              verticalSpaceMedium,
              Text('Notas'),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Notas para el mensajero',
                controller: notesController,
                smallVersion: false,
                additionalNote:
                    'Puntos de referencia, por quién preguntar, etc.',
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BusyButton(
                    title: 'Listo',
                    busy: model.busy,
                    onPressed: () {
                      model.addEnd(
                        location: locationController.text,
                        notes: notesController.text,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}