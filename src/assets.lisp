(in-package :jupiter-candle)

(gamekit:register-resource-package :jupiter-candle (asdf:system-relative-pathname :jupiter-candle "assets/"))

(gamekit:define-sound jupiter-candle::game-sound "sound/Nihilore-Truth-and-Justification-07-A-Tremendous-Thing.ogg")