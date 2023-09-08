import 'package:camera/camera.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});
  static Route<List<XFile>?> route() => MaterialPageRoute<List<XFile>?>(builder: (context) => const CameraScreen());
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> with WidgetsBindingObserver {
  late CameraController _cameraController;
  bool _hasPermission = false;
  bool _isCameraInitialized = false;
  bool _isSelfieMode = false;
  late final List<CameraDescription> _cameras;
  late FlashMode _flashMode;
  Future<bool> checkPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final microphonePermission = await Permission.microphone.request();
    final photosPermission = await Permission.photos.request();

    final cameraDenied = cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final microphoneDenied = microphonePermission.isDenied || microphonePermission.isPermanentlyDenied;
    final photosDenied = photosPermission.isDenied || photosPermission.isPermanentlyDenied;
    final hasPermission = !cameraDenied && !microphoneDenied && !photosDenied;
    setState(() {
      _hasPermission = hasPermission;
    });
    return hasPermission;
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    if (_isSelfieMode) return;
    await _cameraController.setFlashMode(newFlashMode);
    setState(() {
      _flashMode = newFlashMode;
    });
  }

  Future<void> prepareCamera() async {
    _cameraController = CameraController(
      _isSelfieMode ? _cameras[1] : _cameras[0],
      ResolutionPreset.max,
    );
    await _cameraController.initialize();
    await _cameraController.prepareForVideoRecording();
    setState(() {
      _flashMode = _cameraController.value.flashMode;
      _isCameraInitialized = _cameraController.value.isInitialized;
    });
  }

  Future<void> initializePermissionAndCamera() async {
    final hasPermissions = await checkPermissions();
    if (hasPermissions) {
      _cameras = await availableCameras();
      await prepareCamera();
    } else {
      if (!mounted) return;
      // await showDialog(
      //   barrierColor: Theme.of(context).colorScheme.surface,
      //   barrierDismissible: false,
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: const Text("Access required"),
      //     content: const Text(
      //       "To use Nomad Coder Study App, allow Camera and Microphone access.",
      //     ),
      //     actions: [
      //       TextButton(
      //         onPressed: () => openAppSettings(),
      //         child: const Text("Open settings"),
      //       ),
      //     ],
      //   ),
      // );
    }
  }

  void openLibrary() {
    ImagePicker()
        .pickMultiImage(
      requestFullMetadata: true,
    )
        .then((images) {
      if (!mounted) return;
      Navigator.of(context).pop(images);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initializePermissionAndCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (!_isCameraInitialized) await initializePermissionAndCamera();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        if (!_hasPermission || !_isCameraInitialized) break;
        _cameraController.dispose();
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.transparent,
        color: Colors.black,
        child: Row(
          children: [
            const Spacer(
              flex: 2,
            ),
            Flexible(
              child: Text(
                "Camera",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
            Flexible(
              child: GestureDetector(
                onTap: openLibrary,
                child: Text(
                  "Library",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _hasPermission && _isCameraInitialized
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.black,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: CameraPreview(
                        _cameraController,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 30,
                    left: 20,
                    child: Icon(
                      FluentIcons.ios_arrow_ltr_24_filled,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              _setFlashMode(_flashMode == FlashMode.off ? FlashMode.auto : FlashMode.off);
                            },
                            child: Icon(
                              _flashMode == FlashMode.off
                                  ? FluentIcons.flash_off_24_regular
                                  : FluentIcons.flash_auto_24_regular,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _cameraController.takePicture().then(
                                    (image) => Navigator.of(context).pop([image]),
                                  );
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const SizedBox(
                                  height: 96,
                                  width: 96,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    strokeWidth: 4,
                                    value: 0,
                                  ),
                                ),
                                Container(
                                  height: 82,
                                  width: 82,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isSelfieMode = !_isSelfieMode;
                              });
                              prepareCamera();
                            },
                            child: Icon(
                              _isSelfieMode
                                  ? FluentIcons.camera_switch_24_filled
                                  : FluentIcons.camera_switch_24_regular,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Theme.of(context).colorScheme.onSurface,
              ),
            ),
    );
  }
}
