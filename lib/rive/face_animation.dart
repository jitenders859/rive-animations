import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class FaceAnimation extends StatefulWidget {
  const FaceAnimation({Key? key}) : super(key: key);

  @override
  _FaceAnimationState createState() => _FaceAnimationState();
}

class _FaceAnimationState extends State<FaceAnimation> {
  SMIInput<double>? _inputSad;
  SMIInput<double>? _inputHappy;
  SMIInput<double>? _inputSurprise;
  SMIInput<double>? _inputSmile;
  SMIInput<double>? _inputNatural;
  SMIInput<double>? _inputEyeClose;

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

        final artboard = file.mainArtboard;
        final controller =
            StateMachineController.fromArtboard(artboard, 'State Machine 1');
        if (controller != null) {
          controller.inputs.any((element) {
            return true;
          });
          artboard.addController(controller);
          _inputSad = controller.findInput('sad');
          _inputHappy = controller.findInput('happy');
          _inputSurprise = controller.findInput('Surprise');
          _inputSmile = controller.findInput('Smile');
          _inputNatural = controller.findInput('Natural');
          _inputEyeClose = controller.findInput('eye_close');
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfefefe),
      appBar: AppBar(
        title: const Text('Face Animation'),
      ),
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(20.0),
                      height: double.infinity,
                      width: double.infinity,
                      child: Rive(
                        artboard: _riveArtboard!,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'slide for progress...',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  RiveSliderWidget(
                    title: "Sad",
                    sliderValue: _inputSad!.value,
                    onChanged: (double value) {
                      _inputSad!.value = value;
                      setState(() {});
                    },
                  ),
                  RiveSliderWidget(
                    title: "Happy",
                    sliderValue: _inputHappy!.value,
                    onChanged: (double value) {
                      setState(() {
                        _inputHappy!.value = value;
                      });
                    },
                  ),
                  RiveSliderWidget(
                    title: "Suprise",
                    sliderValue: _inputSurprise!.value,
                    onChanged: (double value) {
                      setState(() {
                        _inputSurprise!.value = value;
                      });
                    },
                  ),
                  RiveSliderWidget(
                    title: "Smile",
                    sliderValue: _inputSmile!.value,
                    onChanged: (double value) {
                      setState(() {
                        _inputSmile!.value = value;
                      });
                    },
                  ),
                  RiveSliderWidget(
                    title: "Eye close",
                    sliderValue: _inputEyeClose!.value,
                    onChanged: (double value) {
                      setState(() {
                        _inputEyeClose!.value = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
      ),
    );
  }
}

class RiveSliderWidget extends StatelessWidget {
  const RiveSliderWidget(
      {Key? key,
      required this.title,
      this.height = 36,
      this.marginTop = 10,
      required this.sliderValue,
      required this.onChanged})
      : super(key: key);

  final String title;
  final double height;
  final double marginTop;
  final double sliderValue;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(top: marginTop),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Slider(
              value: sliderValue,
              min: 0,
              max: 101,
              label: sliderValue.round().toString(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
