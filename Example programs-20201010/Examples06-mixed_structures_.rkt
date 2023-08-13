;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Examples06-mixed_structures_) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; PERIMETER OF SHAPES
;;;;;;;;;;;;;;;;;;;;;;;;

;; Data types
; a Shape is one of:
;   - a Rectangle
;   - a Circle
; interpretation: a geometrical shape

; a Rectangle is a structure:
; (make-rectangle base height)
; where: base, height: PositiveNumber
(define-struct rectangle [base height])

(define R1 (make-rectangle 5 5))
(define R2 (make-rectangle 7 2))

; a Circle is a structure:
; (make-circle radius)
; where: radius: PositiveNumber
(define-struct circle [radius])

(define C1 (make-circle 1))
(define C2 (make-circle 7))

;; Input/output
; perimeter : Shape -> Number
; perimeter of `a-shape`
; header: (define (perimeter a-shape) 0)
(define (perimeter a-shape)
  (cond
    [(rectangle? a-shape) (* 2
                             (+ (rectangle-base a-shape)
                                (rectangle-height a-shape)))]
    [(circle? a-shape) (* 2 pi (circle-radius a-shape))]
    [else (error 'perimeter "input is not a valid shape")])) 

;; Examples
(check-expect (perimeter R1) 20)
(check-expect (perimeter R2) 18)
(check-within (perimeter C1) (* 2 pi) 0.01)
(check-within (perimeter C2) (* 2 pi 7) 0.01)

;; Template
;(define (perimeter a-shape)
;  (cond
;    [(rectangle? a-shape) ... (rectangle-base a-shape)   ...
;                              (rectangle-height a-shape) ...
;                              a-shape ...]
;    [(circle? a-shape) ... (circle-radius a-shape) ...
;                           a-shape ...]
;    [else (error ...)]))
