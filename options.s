
;;;;;;;;;;;;;;;;;;;
; Internal validation for the options. If you see one of these error messages, you need to follow the instructions and
; update the options above.

.macro bool_option name
  .if .not .defined(.ident(.string(name)))
    .ident(.string(name)) .set 0
  .elseif .not ((.ident(.string(name))=1) .or (.ident(.string(name))=0))
    ; if you get this error then you've set a boolean config option to something other than 0 or 1
    .error .sprintf("Boolean Option `%s` was set to a value other than 0 or 1", .string(name))
    .fatal "Invalid Options selected"
  .endif
  .ifdef PRINT_OPTIONS_FOR_C
    .if PRINT_OPTIONS_FOR_C
      .out .sprintf("#ifndef %s", .string(name))
      .out .sprintf("  #define %s 0", .string(name))
      .out "#endif"
    .endif
  .endif
.endmacro

;;;
; Macro to define that a 
.macro num_option name
; Dumb work around to check if something is numeric
.local Num
Num = 123
  .if .not .defined(.ident(.string(name)))
    .ident(.string(name)) .set 0
    ; Check if its numeric
    ; match only checks that the types are the same between the two tokens.
  .elseif .not ( .match ( {.ident(.string(name))}, Num ) )
    ; if you get this error then you've set a numeric config option to something other than a number
    .error .sprintf("Number Option `%s` was set to a non numeric value %d", .string(name), .ident(.string(name)))
    .fatal "Invalid Options selected"
  .endif
  .ifdef PRINT_OPTIONS_FOR_C
    .if PRINT_OPTIONS_FOR_C
      .out .sprintf("#ifndef %s", .string(name))
      .out .sprintf("  #define %s 0", .string(name))
      .out "#endif"
    .endif
  .endif
.endmacro


num_option A12_INVERSION


bool_option USE_MOUSE_SUPPORT
num_option MOUSE_CONFIG_CONTROLLER_SIZE
num_option MOUSE_READ_FROM_PORT
bool_option MOUSE_CONFIG_SENSITIVITY
bool_option MOUSE_DISPLAY_CURSOR
num_option MOUSE_X_MINIMUM
num_option MOUSE_X_MAXIMUM
num_option MOUSE_Y_MINIMUM
num_option MOUSE_Y_MAXIMUM

