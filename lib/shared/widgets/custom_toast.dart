import 'package:flutter/material.dart';
import '../enum/toast_state.dart';

class ToastConfig {
  final String message;
  final ToastType type;
  final Duration duration;
  final VoidCallback? onTap;
  final bool dismissible;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  const ToastConfig({
    required this.message,
    this.type = ToastType.info,
    this.duration = const Duration(seconds: 3),
    this.onTap,
    this.dismissible = true,
    this.actionLabel,
    this.onActionPressed,
  });
}

class ToastService {
  static void show(BuildContext context, ToastConfig config) {
    final overlay = Overlay.of(context);
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => _ToastOverlay(
        config: config,
        onDismiss: () => overlayEntry?.remove(),
      ),
    );

    overlay.insert(overlayEntry);

    if (config.duration != Duration.zero) {
      Future.delayed(config.duration, () {
        overlayEntry?.remove();
      });
    }
  }

  static void showSuccess(
      BuildContext context,
      String message, {
        Duration? duration,
        VoidCallback? onTap,
        String? actionLabel,
        VoidCallback? onActionPressed,
      }) {
    show(
      context,
      ToastConfig(
        message: message,
        type: ToastType.success,
        duration: duration ?? const Duration(seconds: 3),
        onTap: onTap,
        actionLabel: actionLabel,
        onActionPressed: onActionPressed,
      ),
    );
  }

  static void showError(
      BuildContext context,
      String message, {
        Duration? duration,
        VoidCallback? onTap,
        String? actionLabel,
        VoidCallback? onActionPressed,
      }) {
    show(
      context,
      ToastConfig(
        message: message,
        type: ToastType.error,
        duration: duration ?? const Duration(seconds: 4),
        onTap: onTap,
        actionLabel: actionLabel,
        onActionPressed: onActionPressed,
      ),
    );
  }

  static void showWarning(
      BuildContext context,
      String message, {
        Duration? duration,
        VoidCallback? onTap,
        String? actionLabel,
        VoidCallback? onActionPressed,
      }) {
    show(
      context,
      ToastConfig(
        message: message,
        type: ToastType.warning,
        duration: duration ?? const Duration(seconds: 4),
        onTap: onTap,
        actionLabel: actionLabel,
        onActionPressed: onActionPressed,
      ),
    );
  }

  static void showInfo(
      BuildContext context,
      String message, {
        Duration? duration,
        VoidCallback? onTap,
        String? actionLabel,
        VoidCallback? onActionPressed,
      }) {
    show(
      context,
      ToastConfig(
        message: message,
        type: ToastType.info,
        duration: duration ?? const Duration(seconds: 3),
        onTap: onTap,
        actionLabel: actionLabel,
        onActionPressed: onActionPressed,
      ),
    );
  }
}

class _ToastOverlay extends StatefulWidget {
  final ToastConfig config;
  final VoidCallback onDismiss;

  const _ToastOverlay({
    required this.config,
    required this.onDismiss,
  });

  @override
  State<_ToastOverlay> createState() => _ToastOverlayState();
}

class _ToastOverlayState extends State<_ToastOverlay> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _dismiss() async {
    await _controller.reverse();
    widget.onDismiss();
  }

  Color _getBackgroundColor() {
    switch (widget.config.type) {
      case ToastType.success:
        return const Color(0xFF1E4620);
      case ToastType.error:
        return const Color(0xFF621B16);
      case ToastType.warning:
        return const Color(0xFF663C00);
      case ToastType.info:
        return const Color(0xFF0C457D);
    }
  }

  IconData _getIcon() {
    switch (widget.config.type) {
      case ToastType.success:
        return Icons.check_circle_outline;
      case ToastType.error:
        return Icons.error_outline;
      case ToastType.warning:
        return Icons.warning_amber;
      case ToastType.info:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Transform.translate(
              offset: Offset(0, _animation.value * 100),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Material(
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: widget.config.onTap ?? (widget.config.dismissible ? _dismiss : null),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: _getBackgroundColor(),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: _getBackgroundColor().withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _getIcon(),
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                widget.config.message,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            if (widget.config.actionLabel != null) ...[
                              const SizedBox(width: 12),
                              TextButton(
                                onPressed: widget.config.onActionPressed,
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                child: Text(
                                  widget.config.actionLabel!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                            if (widget.config.dismissible && widget.config.actionLabel == null) ...[
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: _dismiss,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}