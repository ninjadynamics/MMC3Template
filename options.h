
#ifndef OPTIONS_H
#define OPTIONS_H

#ifndef A12_INVERSION
  #define A12_INVERSION 0
#endif

#ifndef MOUSE_READ_FROM_PORT
  #define MOUSE_READ_FROM_PORT 1
#endif
#ifndef MOUSE_CONFIG_SENSITIVITY
  #define MOUSE_CONFIG_SENSITIVITY 0
#endif
#ifndef MOUSE_X_MINIMUM
  #define MOUSE_X_MINIMUM 0
#endif
#ifndef MOUSE_X_MAXIMUM
  #define MOUSE_X_MAXIMUM 0
#endif
#ifndef MOUSE_Y_MINIMUM
  #define MOUSE_Y_MINIMUM 0
#endif
#ifndef MOUSE_Y_MAXIMUM
  #define MOUSE_Y_MAXIMUM 0
#endif

// Make it easier for C tooling to inspect the mouse code
#ifdef __NES__
#ifndef USE_MOUSE_SUPPORT
  #define USE_MOUSE_SUPPORT 0
#endif

#else
#define USE_MOUSE_SUPPORT 1
#endif

#endif // OPTIONS_H
