(in-package :jupiter-candle)

(gamekit:define-image jupiter-candle::bg-1 "textures/tilemap1.png")
(gamekit:define-image jupiter-candle::bg-2 "textures/tilemap2.png")
(gamekit:define-image jupiter-candle::bg-3 "textures/tilemap3.png")
(gamekit:define-image jupiter-candle::bg-4 "textures/tilemap4.png")
(gamekit:define-image jupiter-candle::bg-5 "textures/tilemap5.png")
(gamekit:define-image jupiter-candle::bg-6 "textures/tilemap6.png")
(gamekit:define-image jupiter-candle::bg-7 "textures/tilemap7.png")
(gamekit:define-image jupiter-candle::bg-8 "textures/tilemap8.png")
(gamekit:define-image jupiter-candle::bg-9 "textures/tilemap9.png")

(gamekit:define-image jupiter-candle::layer-2-bg "textures/background.png")

(defparameter *bg-layer-2-height* 1000)

(defparameter *number-of-bg-images* 9)
(defparameter *bg-image-height* 640)
(defparameter *bg-images* (vector 'bg-1 'bg-2 'bg-3 'bg-4 'bg-5 'bg-6 'bg-7 'bg-8 'bg-9))

(defparameter *bg-random-state* (make-random-state))

(defparameter *parallax-factor* 1.7)
(defparameter *parallax-factor-2* 80)

(defun draw-background (y-offset)
  (let* ((parallax-offset (/ y-offset *parallax-factor*))
         (parallax-offset-2 (/ y-offset *parallax-factor-2*))
         (offset (ceiling  (- (mod (- parallax-offset) *bg-image-height*))))
         (index (floor (/ (- parallax-offset) *bg-image-height*))))
    (gamekit:with-pushed-canvas ()
      (setf parallax-offset-2 (min -480 (- (- parallax-offset-2) *bg-layer-2-height*)))
      (ge.vg:scale-canvas 1 -1)
      (gamekit:translate-canvas 0 parallax-offset-2)
      
      (gamekit:draw-image (gamekit:vec2 0 0) 'layer-2-bg))
    (gamekit:with-pushed-canvas ()
      (gamekit:translate-canvas 0 offset)
      (let ((rs (make-random-state *bg-random-state*)))
        (dotimes (n index)
          (random *number-of-bg-images* rs))
        (let ((bg-index (random *number-of-bg-images* rs))
              (bg-index-2 (random *number-of-bg-images* rs)))
          (gamekit:draw-image (gamekit:vec2 0 0) (aref *bg-images* bg-index))
          (gamekit:draw-image (gamekit:vec2 0 640) (aref *bg-images* bg-index-2)))))
    ))

