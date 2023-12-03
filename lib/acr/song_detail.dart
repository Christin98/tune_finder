import 'package:flutter/foundation.dart';
import 'package:tune_finder/acr/deezer_song_model.dart';
import 'package:tune_finder/acr/margin.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class SongDetailPage extends StatelessWidget {
  final DeezerSongModel? songModel;
  const SongDetailPage([this.songModel]);

  @override
  Widget build(BuildContext context) {
    var ol = songModel?.artist?.id;

    return SizedBox(
      height: 150,
      child: SizedBox(
        width: 50,
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => attempt(
                    incoming: songModel?.album?.link,
                    inbox: songModel?.title,
                  ),
                ),
              );
              if (kDebugMode) {
                print("link opened");
              }
              if (kDebugMode) {
                print(songModel?.artist?.id);
              }
              if (kDebugMode) {
                print("https://www.deezer.com/tr/artist/$ol");
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 85,
                      width: 85,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          //color: Colors.red,
                          color: const Color(0xffEDEDED),
                          borderRadius: BorderRadius.circular(10),
                          image: songModel != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    songModel?.album?.coverMedium ?? '',
                                  ),
                                )
                              : null),
                    ),
                    const XMargin(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.screenWidth(0.42),
                          child: Text(
                            songModel?.title ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const YMargin(10),
                        Text(
                          songModel?.artist?.name ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            color: const Color(0xff727272),
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const YMargin(5),
                        Row(
                          children: [
                            Text(
                              songModel?.album?.title ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                color: const Color(0xffA3A3A3),
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              ' • ${DateTime.parse(songModel?.releaseDate ?? DateTime.now().toIso8601String()).year}',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                color: const Color(0xffA3A3A3),
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/more.png",
                      height: 20,
                    ),
                    const XMargin(30),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class attempt extends StatefulWidget {
  var incoming;
  var inbox;

  attempt({super.key, required this.incoming, this.inbox});

  @override
  _attemptState createState() => _attemptState();
}

// ignore: camel_case_types
class _attemptState extends State<attempt> {
  late final WebViewController _controller;
  DeezerSongModel? songModel;

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
  Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.incoming));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 13, 21, 2),
        title: Text(
          widget.inbox,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          InkWell(
            onTap: () async {
              if (kDebugMode) {
                print(widget.incoming);
              }
            },
            child: const Icon(
              Icons.refresh,
              size: 27,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
