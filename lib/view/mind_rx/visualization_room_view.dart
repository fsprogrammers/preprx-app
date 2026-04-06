import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/components/custom_appbar.dart';
import 'package:preprx/components/custom_gradient_background.dart';
import 'package:preprx/components/custom_spacer.dart';
import 'package:preprx/components/custom_text.dart';
import 'package:preprx/model/mind_rx/mind_rx_models.dart';
import 'package:preprx/utils/app_urls.dart';
import 'package:preprx/utils/app_toast.dart';
import 'package:preprx/utils/app_colors.dart';
import 'package:preprx/view/home/widget/build_card.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:preprx/view_model/auth/auth_view_model.dart';
import 'package:preprx/view_model/mind_rx/mind_rx_view_model.dart';
import 'package:video_player/video_player.dart';

class VisualizationRoomView extends ConsumerStatefulWidget {
  const VisualizationRoomView({super.key});

  @override
  ConsumerState<VisualizationRoomView> createState() =>
      _VisualizationRoomViewState();
}

class _VisualizationRoomViewState extends ConsumerState<VisualizationRoomView> {
  String? get _token =>
      ref.read(authViewModelProvider).loginResponse?.token?.trim();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadVisualizations();
    });
  }

  Future<void> _loadVisualizations() async {
    final ok = await ref
        .read(mindRxViewModelProvider.notifier)
        .loadVisualizations(token: _token);

    if (!mounted || ok) return;

    final error =
        (ref.read(mindRxViewModelProvider).errorMessage ??
                'Failed to load visualizations')
            .replaceFirst('Exception: ', '')
            .replaceFirst('FetchDataException: ', '')
            .trim();
    CustomToast.error(msg: error);
  }

  String _resolveMediaUrl(String rawPath) {
    if (rawPath.trim().isEmpty) return '';

    final cleanPath = rawPath
        .trim()
        .replaceAll("'", '')
        .replaceAll('"', '')
        .replaceAll('`', '')
        .replaceAll('\\\\', '/');

    if (cleanPath.toLowerCase().startsWith('http')) {
      return cleanPath;
    }

    final uploadIndex = cleanPath.indexOf('uploads/');
    if (uploadIndex != -1) {
      final relativePath = cleanPath.substring(uploadIndex);
      return '${AppUrls.baseUrl}/$relativePath';
    }

    final filename = cleanPath.split('/').last;
    return '${AppUrls.baseUrl}/uploads/$filename';
  }

  Future<void> _onPlayPressed(VisualizationItemModel visual) async {
    final mediaUrl = _resolveMediaUrl(visual.mediaUrl);

    if (mediaUrl.isEmpty) {
      CustomToast.warning(msg: 'No media found for this visualization.');
      return;
    }

    if (!mounted) return;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _InAppMediaPlayerSheet(
        mediaUrl: mediaUrl,
        title: visual.title,
        subtitle: visual.subtitle,
        description: visual.description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mindRxState = ref.watch(mindRxViewModelProvider);
    final visualizations = mindRxState.visualizations;

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              verticalSpacer(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: customAppBar(isSearch: false, isBack: true),
              ),
              verticalSpacer(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        // Header Card
                        buildCard(
                          child: Column(
                            children: [
                              customText(
                                text: "Visualization Room",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: AppColors.charcoal,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                              verticalSpacer(height: 8),
                              customText(
                                text:
                                    "Short guided mental journeys to calm your mind.",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.bodytext,
                                textAlign: TextAlign.center,
                                maxLine: 2,
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(height: 24),

                        if (mindRxState.isLoadingVisualizations)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 40.h),
                            child: const CircularProgressIndicator(),
                          )
                        else if (visualizations.isEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.h),
                            child: customText(
                              text:
                                  'No visualizations found. Check back later.',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.bodytext,
                              textAlign: TextAlign.center,
                            ),
                          )
                        else
                          ...visualizations.map((visual) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: _buildJourneyCard(visual: visual),
                            );
                          }),

                        verticalSpacer(height: 120),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJourneyCard({required VisualizationItemModel visual}) {
    final imageUrl = _resolveMediaUrl(visual.thumbnailUrl);

    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(color: const Color(0xFFE8EFF5));
                        },
                      )
                    : Container(color: const Color(0xFFE8EFF5)),
              ),
            ),
            // Dark Gradient Overlay for text readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withValues(alpha: 0.8),
                    Colors.white.withValues(alpha: 0.9),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: customText(
                      text: visual.title,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.charcoal,
                    ),
                  ),
                  verticalSpacer(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                        text: visual.subtitle,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.teal,
                      ),
                      horizontalSpacer(width: 12),
                      customText(
                        text: "Duration: ${visual.duration}",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.charcoal,
                      ),
                    ],
                  ),
                  verticalSpacer(height: 12),
                  Expanded(
                    child: customText(
                      text: visual.description,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.charcoal,
                      textAlign: TextAlign.center,
                      maxLine: 3,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 42.w,
                    height: 42.w,
                    decoration: const BoxDecoration(
                      color: AppColors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(42.r),
                      onTap: () => _onPlayPressed(visual),
                      child: Center(
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 28.sp,
                        ),
                      ),
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

class _InAppMediaPlayerSheet extends StatefulWidget {
  final String mediaUrl;
  final String title;
  final String subtitle;
  final String description;

  const _InAppMediaPlayerSheet({
    required this.mediaUrl,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  State<_InAppMediaPlayerSheet> createState() => _InAppMediaPlayerSheetState();
}

class _InAppMediaPlayerSheetState extends State<_InAppMediaPlayerSheet> {
  VideoPlayerController? _videoController;
  AudioPlayer? _audioPlayer;
  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<Duration>? _durationSub;
  StreamSubscription<PlayerState>? _playerStateSub;

  bool _isLoading = true;
  String? _error;
  Duration _audioPosition = Duration.zero;
  Duration _audioDuration = Duration.zero;
  bool _isAudioPlaying = false;

  bool get _isAudio {
    final uri = Uri.tryParse(widget.mediaUrl);
    final path = (uri?.path ?? widget.mediaUrl).toLowerCase();
    return path.endsWith('.mp3') ||
        path.endsWith('.wav') ||
        path.endsWith('.m4a') ||
        path.endsWith('.aac') ||
        path.endsWith('.ogg') ||
        path.endsWith('.flac');
  }

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _disposePlayers() async {
    _positionSub?.cancel();
    _durationSub?.cancel();
    _playerStateSub?.cancel();
    _positionSub = null;
    _durationSub = null;
    _playerStateSub = null;

    _videoController?.removeListener(_onVideoControllerTick);
    await _videoController?.dispose();
    _videoController = null;

    await _audioPlayer?.dispose();
    _audioPlayer = null;
  }

  Future<void> _initPlayer() async {
    final encodedUrl = Uri.encodeFull(widget.mediaUrl.trim());
    final uri = Uri.tryParse(encodedUrl);

    if (uri == null) {
      setState(() {
        _isLoading = false;
        _error = 'Invalid media URL.';
      });
      return;
    }

    await _disposePlayers();

    setState(() {
      _isLoading = true;
      _error = null;
      _audioPosition = Duration.zero;
      _audioDuration = Duration.zero;
      _isAudioPlaying = false;
    });

    if (_isAudio) {
      await _initAudioPlayer(encodedUrl);
      return;
    }

    await _initVideoPlayer(uri);
  }

  Future<void> _initVideoPlayer(Uri uri) async {
    final controller = VideoPlayerController.networkUrl(uri);

    try {
      await controller.initialize().timeout(const Duration(seconds: 15));
      await controller.setLooping(false);
      await controller.play();

      if (!mounted) {
        await controller.dispose();
        return;
      }

      controller.addListener(_onVideoControllerTick);
      setState(() {
        _videoController = controller;
        _isLoading = false;
      });
    } catch (_) {
      await controller.dispose();
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error =
            'Unable to play this media right now. Please check your internet and try again.';
      });
    }
  }

  Future<void> _initAudioPlayer(String encodedUrl) async {
    final player = AudioPlayer();

    try {
      // Subscribe to streams before playing
      _positionSub = player.onPositionChanged.listen((position) {
        if (!mounted) return;
        setState(() {
          _audioPosition = position;
        });
      });

      _durationSub = player.onDurationChanged.listen((duration) {
        if (!mounted) return;
        setState(() {
          _audioDuration = duration;
        });
      });

      _playerStateSub = player.onPlayerStateChanged.listen((state) {
        if (!mounted) return;
        setState(() {
          _isAudioPlaying = state == PlayerState.playing;
        });
      });

      // Play with timeout protection
      await player
          .play(UrlSource(encodedUrl))
          .timeout(const Duration(seconds: 15));

      if (!mounted) {
        await player.dispose();
        return;
      }

      setState(() {
        _audioPlayer = player;
        _isLoading = false;
      });
    } catch (_) {
      await player.dispose();
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error =
            'Unable to play this audio right now. Please check your internet and try again.';
      });
    }
  }

  void _onVideoControllerTick() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _disposePlayers();
    super.dispose();
  }

  String _formatDuration(Duration value) {
    final totalSeconds = value.inSeconds;
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final safeBottom = MediaQuery.of(context).padding.bottom;

    final hasVideo =
        _videoController != null && _videoController!.value.isInitialized;

    final duration = _isAudio
        ? _audioDuration
        : (hasVideo ? _videoController!.value.duration : Duration.zero);

    final rawPosition = _isAudio
        ? _audioPosition
        : (hasVideo ? _videoController!.value.position : Duration.zero);

    final position = rawPosition > duration ? duration : rawPosition;

    final hasReadyPlayer = _isAudio ? _audioPlayer != null : hasVideo;

    return Container(
      height: MediaQuery.of(context).size.height * 0.82,
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h + safeBottom),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 48.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: const Color(0xFFD5DDE6),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          verticalSpacer(height: 16),
          customText(
            text: widget.title,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColors.charcoal,
          ),
          verticalSpacer(height: 6),
          customText(
            text: widget.subtitle,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.teal,
          ),
          verticalSpacer(height: 16),
          if (_isLoading)
            SizedBox(
              height: 240.h,
              child: const Center(child: CircularProgressIndicator()),
            )
          else if (_error != null || !hasReadyPlayer)
            SizedBox(
              height: 240.h,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    customText(
                      text: _error ?? 'Unable to prepare media.',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.red,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpacer(height: 12),
                    ElevatedButton(
                      onPressed: _initPlayer,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.teal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: customText(
                        text: 'Retry',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else ...[
            if (_isAudio)
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F7FA),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Center(
                  child: Icon(
                    Icons.graphic_eq_rounded,
                    size: 72.sp,
                    color: AppColors.teal,
                  ),
                ),
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: AspectRatio(
                  aspectRatio: _videoController!.value.aspectRatio == 0
                      ? 16 / 9
                      : _videoController!.value.aspectRatio,
                  child: VideoPlayer(_videoController!),
                ),
              ),
            verticalSpacer(height: 14),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 3.h,
                thumbColor: AppColors.teal,
                activeTrackColor: AppColors.teal,
                inactiveTrackColor: AppColors.teal.withValues(alpha: 0.25),
              ),
              child: Slider(
                min: 0,
                max: duration.inMilliseconds <= 0
                    ? 1
                    : duration.inMilliseconds.toDouble(),
                value: position.inMilliseconds
                    .clamp(0, duration.inMilliseconds)
                    .toDouble(),
                onChanged: (value) {
                  final target = Duration(milliseconds: value.toInt());
                  if (_isAudio) {
                    _audioPlayer?.seek(target);
                  } else {
                    _videoController?.seekTo(target);
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: _formatDuration(position),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.bodytext,
                ),
                customText(
                  text: _formatDuration(duration),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.bodytext,
                ),
              ],
            ),
            verticalSpacer(height: 10),
            Center(
              child: CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.teal,
                child: IconButton(
                  onPressed: () {
                    if (_isAudio) {
                      if (_isAudioPlaying) {
                        _audioPlayer?.pause();
                      } else {
                        _audioPlayer?.resume();
                      }
                    } else {
                      final isPlaying =
                          _videoController?.value.isPlaying == true;
                      if (isPlaying) {
                        _videoController?.pause();
                      } else {
                        _videoController?.play();
                      }
                    }
                  },
                  icon: Icon(
                    _isAudio
                        ? (_isAudioPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded)
                        : ((_videoController?.value.isPlaying == true)
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
          verticalSpacer(height: 16),
          customText(
            text: widget.description,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.charcoal,
            maxLine: 5,
          ),
        ],
      ),
    );
  }
}
