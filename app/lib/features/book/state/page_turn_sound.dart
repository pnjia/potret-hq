import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

/// Path aset suara buka halaman, relatif terhadap `assets/` (prefix bawaan
/// `AudioCache`). Tercatat di data/sounds.json.
const String pageTurnSoundAsset = 'sounds/page-turn-placeholder.wav';

/// Suara buka halaman. Antarmuka supaya tes bisa memakai versi senyap.
abstract class PageTurnSound {
  Future<void> prepare();
  void play();
  Future<void> dispose();
}

/// Tanpa suara (tes, atau bila pemutar gagal disiapkan).
class SilentPageTurnSound implements PageTurnSound {
  @override
  Future<void> prepare() async {}

  @override
  void play() {}

  @override
  Future<void> dispose() async {}
}

/// Implementasi `audioplayers` mode low-latency (Android: SoundPool).
///
/// Fokus audio `mixWithOthers`: suara halaman tidak menghentikan musik yang
/// sedang diputar pengguna.
class AudioPlayersPageTurnSound implements PageTurnSound {
  AudioPlayer? _player;
  bool _ready = false;

  @override
  Future<void> prepare() async {
    try {
      final player = AudioPlayer();
      await player.setAudioContext(
        AudioContextConfig(focus: AudioContextConfigFocus.mixWithOthers)
            .build(),
      );
      await player.setPlayerMode(PlayerMode.lowLatency);
      await player.setReleaseMode(ReleaseMode.stop);
      await player.setSource(AssetSource(pageTurnSoundAsset));
      _player = player;
      _ready = true;
    } catch (e) {
      // Prototipe: animasi tetap jalan tanpa suara.
      debugPrint('Suara buka halaman tidak siap: $e');
    }
  }

  @override
  void play() {
    final player = _player;
    if (!_ready || player == null) return;
    unawaited(
      player.stop().then((_) => player.resume()).catchError((Object e) {
        debugPrint('Suara buka halaman gagal diputar: $e');
      }),
    );
  }

  @override
  Future<void> dispose() async {
    _ready = false;
    await _player?.dispose();
    _player = null;
  }
}
