part of '../pages/home_screen.dart';

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({
    Key? key,
    required this.size,
    required this.animationController,
    required this.sequenceAnimation,
  }) : super(key: key);

  final Size size;
  final AnimationController animationController;
  final SequenceAnimation sequenceAnimation;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2,
      floating: false,
      pinned: true,
      snap: false,
      forceElevated: false,
      expandedHeight: size.width * .6,
      collapsedHeight: size.width * .15,
      toolbarHeight: size.width * .15,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: LayoutBuilder(
        builder: (context, boxConstraints) {
          if ((boxConstraints.maxHeight - MediaQuery.of(context).padding.top) <
              size.width * .3) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
          return AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Stack(
                children: [
                  CacheImage(
                    width: size.width,
                    height: size.width * .7,
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(
                        1 - (sequenceAnimation['isOpen'].value) as double,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    end: size.width * .025,
                    top: size.width * .125,
                    child: CacheImage(
                      imageUrl:
                          'https://static.remove.bg/remove-bg-web/a8b5118d623a6b3f4b7813a78c686de384352145/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png',
                      height: size.width * .1,
                      width: size.width * .1,
                      shape: BoxShape.circle,
                    ),
                  ),
                  PositionedDirectional(
                    start: size.width * .035,
                    top: size.width * .135,
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 500),
                      style: AppTextStyles.styleWeight700(
                          color: sequenceAnimation['isOpen'].value == 1
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          fontSize: size.width * .06),
                      child: Text(
                        'Home',
                      ),
                    ),
                  ),
                  AnimatedPositionedDirectional(
                    duration: const Duration(milliseconds: 125),
                    bottom: size.width * .02,
                    // top: sequenceAnimation['isOpen'].value != 1
                    //     ? size.width * .03
                    //     : 0,
                    end: sequenceAnimation['startPosition'].value,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: sequenceAnimation['isOpen'].value == 1
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          width: .5,
                        ),
                        borderRadius: sequenceAnimation['isOpen'].value > .5
                            ? BorderRadius.circular(25)
                            : BorderRadius.circular(100000000),
                        color: Colors.white,
                      ),
                      width: sequenceAnimation['width'].value,
                      height: sequenceAnimation['isOpen'].value == 1
                          ? size.width * .12
                          : size.width * .1,
                      padding: sequenceAnimation['isOpen'].value == 1
                          ? EdgeInsets.all(size.width * .025)
                          : EdgeInsets.zero,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (sequenceAnimation['isOpen'].value == 1)
                              const Spacer(flex: 1),
                            Icon(
                              TrippoIcons.search,
                              color: Theme.of(context).primaryColor,
                              size: size.width * .055,
                            ),
                            if (sequenceAnimation['isOpen'].value == 1) ...[
                              const Spacer(flex: 1),
                              Text(
                                'Where are you going?',
                                style: AppTextStyles.styleWeight500(
                                  fontSize: size.width * .035,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              const Spacer(flex: 8),
                            ]
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
