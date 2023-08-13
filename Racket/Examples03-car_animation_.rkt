;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Examples03-car_animation_) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; INTERACTIVE PROGRAM: CAR ANIMATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; libraries for interactive programs and drawing
(require 2htdp/universe)
(require 2htdp/image)



;; constants, definining overall size and animated images
; size of overall scene
(define WIDTH-OF-SCENE 400)
(define HEIGHT-OF-SCENE 80)

; background image
(define BACKGROUND
  (empty-scene WIDTH-OF-SCENE HEIGHT-OF-SCENE))

; size of wheels
(define WHEEL-RADIUS 10)
; distance between front and back wheels
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
; vertical position of car body
(define Y-CAR (- HEIGHT-OF-SCENE (* 4 WHEEL-RADIUS)))

; wheel image
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
; spacing between front and back wheels
(define SPACE                           ; mode 0 means transparent
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS 0 "white"))
; front and back wheels image
(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))
; lower part of car's body
(define CAR-LOWER
  (rectangle (+ (image-width BOTH-WHEELS) WHEEL-RADIUS WHEEL-RADIUS) (* 2 WHEEL-RADIUS)
             "solid" "red"))
; upper part of car's body
(define CAR-UPPER
  (rectangle (+ WHEEL-RADIUS WHEEL-DISTANCE WHEEL-RADIUS) WHEEL-RADIUS
             "solid" "red"))
; car body image
(define CAR-BODY
  (above CAR-UPPER CAR-LOWER))
; complete car image (body + wheels)
(define CAR
  (underlay/offset CAR-BODY 0 (* 1.5 WHEEL-RADIUS)
                   BOTH-WHEELS))



;; data types
; A WorldState is a Number
; interpretation: the number of pixels between the left border
;                 of the scene and the car's center



;; functions: event handlers and main

; render : WorldState -> Image
; place the image of the car `x` pixels from 
; the left border of the BACKGROUND image
; header: (define (render x) BACKGROUND)
; template: (define (render x) (... x ...))
(define (render x)
  (place-image CAR x Y-CAR BACKGROUND))

(check-expect (render 50) (place-image CAR 50 Y-CAR BACKGROUND))
(check-expect (render 100) (place-image CAR 100 Y-CAR BACKGROUND))
(check-expect (render 150) (place-image CAR 150 Y-CAR BACKGROUND))
(check-expect (render 200) (place-image CAR 200 Y-CAR BACKGROUND))


; tick : WorldState -> WorldState
; move the car's position `x` by 3 pixels to the right
; header: (define (tock x) x)
; template: (define (tock x) (... x ...))
(define (tick x) (+ x 3))

(check-expect (tick 20) 23)
(check-expect (tick 78) 81)


; end? : WorldState -> Boolean
; is the car's position `x` past the right-hand border of the scene?
; header: (define (end? x) #false)
; template: (define (end? x) (... x ...))
(define (end? x)
  (> x (+ (image-width CAR) WIDTH-OF-SCENE)))


; mouse-move : WorldState Number Number String -> WorldState
; handle a "button-down" `mouse-event` by moving the car's
; position to the `x-mouse` mouse coordinate
; header: (define (mouse-move x x-mouse y-mouse mouse-event) x)
; template:
; (define (mouse-move x x-mouse y-mouse mouse-event)
;    (... x x-mouse y-mouse mouse-event ...))
(define (mouse-move x x-mouse y-mouse mouse-event)
  (if (string=? "button-down" mouse-event)
      x-mouse
      x))

(check-expect (mouse-move 21 10 20 "enter") 21)
(check-expect (mouse-move 42 10 20 "button-down") 10)
(check-expect (mouse-move 42 10 20 "move") 42)

; main: WorldState -> WorldState
; launch the program from initial state `x`
(define (main x)
   (big-bang x
     [to-draw render]
     [on-tick tick]
     [on-mouse mouse-move]
     [stop-when end?]))
