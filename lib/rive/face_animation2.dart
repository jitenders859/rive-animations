import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class FaceAnimation2 extends StatefulWidget {
  const FaceAnimation2({Key? key}) : super(key: key);

  @override
  _FaceAnimation2State createState() => _FaceAnimation2State();
}

class _FaceAnimation2State extends State<FaceAnimation2> {
  SMIInput<double>? _inputSad;
  SMIInput<double>? _inputHappy;
  SMIInput<double>? _inputSurprise;
  SMIInput<double>? _inputSmile;
  SMIInput<double>? _inputNatural;
  SMIInput<double>? _inputEyeClose;
  SMIInput<double>? _inputIdol;

  late RiveAnimationController _controller;

  Artboard? _riveArtboard;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    rootBundle.load('assets/face_animation.riv').then(
      (data) async {
        final file = RiveFile.import(data);

        print(file.artboards);

        final artboard = file.mainArtboard;
        final controller =
            StateMachineController.fromArtboard(artboard, 'State Machine 1');
        print(controller);
        if (controller != null) {
          controller.inputs.any((element) {
            print(element.name);
            return true;
          });
          print('controller 1');
          artboard.addController(controller);
          _inputSad = controller.findInput('sad');
          _inputHappy = controller.findInput('happy');
          _inputSurprise = controller.findInput('Surprise');
          _inputSmile = controller.findInput('Smile');
          _inputNatural = controller.findInput('Natural');
          _inputEyeClose = controller.findInput('eye_close');
          _inputIdol = controller.findInput('Idol');
          print(_inputSad!.value);
          print(_inputHappy!.value);
          print(_inputSurprise!.value);
          print(_inputSmile!.value);
          print(_inputNatural!.value);
          print(_inputEyeClose!.value);
          print(_inputIdol!.value);
        }
        // state = state.copyWith(artboard: artboard);
        setState(() => _riveArtboard = artboard);
        pose();
      },
    );
  }

  void pose() {
    // _inputHappy?.value = 0;
    // _inputSad?.value = 0;
    // _inputSurprise?.value = 0;
    // _inputSmile?.value = 0;
    _inputNatural?.value = 0;
    // _inputEyeClose?.value = 0;
    _inputIdol?.value = 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Face Animation'),
      ),
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Column(
                children: [
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: Rive(
                      artboard: _riveArtboard!,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'press for progress...',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Text(
                          "Sad",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: _inputSad!.value,
                            min: 0,
                            max: 101,
                            label: _inputSad!.value.round().toString(),
                            onChanged: (double value) {
                              _inputSad!.value = value;
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Text(
                          "Happy",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: _inputHappy!.value,
                            min: 0,
                            max: 101,
                            label: _inputHappy!.value.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _inputHappy!.value = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Text(
                          "Suprise",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: _inputSurprise!.value,
                            min: 0,
                            max: 101,
                            label: _inputSurprise!.value.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _inputSurprise!.value = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Text(
                          "Smile",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: _inputSmile!.value,
                            min: 0,
                            max: 101,
                            label: _inputSmile!.value.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _inputSmile!.value = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Text(
                          "Eye close",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: _inputEyeClose!.value,
                            min: 0,
                            max: 101,
                            label: _inputEyeClose!.value.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _inputEyeClose!.value = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
