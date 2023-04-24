import 'package:flutter/material.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedHover(
          curve: Curves.fastOutSlowIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Giriş Yap",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 360,
                child: Form(
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AnimatedHover(
                        size: Size(360, 56),
                        offset: Offset(6, -6),
                        hoverColor: Colors.white,
                        bgColor: Colors.white,
                        border: Border.all(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hoverColor: Colors.white,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Adı Soyadı",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: AnimatedHover(
                          size: Size(360, 56),
                          offset: Offset(6, -6),
                          hoverColor: Colors.white,
                          bgColor: Colors.white,
                          border: Border.all(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hoverColor: Colors.white,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "E-posta",
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimatedHover(
                        size: Size(360, 56),
                        offset: Offset(6, -6),
                        hoverColor: Colors.white,
                        bgColor: Colors.white,
                        border: Border.all(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hoverColor: Colors.white,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Şifre",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24,),
                      AnimatedHover(
                        size: Size(88, 48),
                        curve: Curves.fastOutSlowIn,
                        offset: Offset(6, -6),
                        child: ElevatedButton(
                          
                          onPressed: () {},
                          child: Text("Giriş Yap"),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(88, 48),
                            elevation: 0,
                            backgroundColor: Color(0xff556124),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedHover extends StatefulWidget {
  final Widget child;
  final Size size;
  final Color hoverColor, bgColor;
  final Offset offset;
  final Curve curve;
  final Duration duration;
  final Border border;
  const AnimatedHover({
    super.key,
    required this.child,
    this.size = const Size(440, 440),
    this.bgColor = const Color(0xffe9eff3),
    this.hoverColor = const Color(0xfffbe851),
    this.offset = const Offset(8, -8),
    this.curve = Curves.easeOutBack,
    this.duration = const Duration(milliseconds: 400),
    this.border = const Border(),
  });

  @override
  State<AnimatedHover> createState() => _AnimatedHoverState();
}

class _AnimatedHoverState extends State<AnimatedHover> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: widget.size.height,
          width: widget.size.width,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        AnimatedPositioned(
          duration: widget.duration,
          curve: widget.curve,
          top: _isHover ? widget.offset.dy : 0,
          right: _isHover ? widget.offset.dx : 0,
          child: InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                _isHover = value;
              });
            },
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            child: Container(
              height: widget.size.height,
              width: widget.size.width,
              decoration: BoxDecoration(
                color: _isHover ? widget.hoverColor : widget.bgColor,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: widget.border,
              ),
              child: widget.child,
            ),
          ),
        )
      ],
    );
  }
}
