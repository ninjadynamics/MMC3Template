FT_DPCM_PTR=$c000
.export _the_moon_music_data
.export _journey_to_silius_music_data
.export _shatterhand_music_data
.export _farewell_music_data
.export _dedricil_music_data
.export _rain_music_data

.segment "MUS_01"
.include "music_themoon.s"

.segment "MUS_01"
.include "music_journey.s"

.segment "MUS_02"
.include "music_shatterhand.s"

.segment "MUS_02"
.include "music_farewell.s"

.segment "MUS_02"
.include "music_dedricil.s"

.segment "MUS_03"
.include "music_rain.s"