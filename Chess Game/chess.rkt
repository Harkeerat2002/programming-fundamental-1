#lang racket
(require graphics/graphics)
(open-graphics)

(define EMPTY-WORLD (open-viewport "Chess Game" 500 500))

(define (MAIN-WORLD-STRUCT pos-x pos-y row)
  (if (> row 8)
      (void)
      (if (> pos-x 400)
          (MAIN-WORLD-STRUCT 50 (+ pos-y 50) (+ row 1))
          (begin
            (if (odd? row)
                (if (odd? (/ pos-x 50))
                    (begin
                      ((draw-solid-rectangle EMPTY-WORLD) (make-posn pos-x pos-y) 50 50 "white")
                      (MAIN-WORLD-STRUCT (+ pos-x 50) pos-y row))
                    (begin
                      ((draw-solid-rectangle EMPTY-WORLD) (make-posn pos-x pos-y) 50 50 "red")
                      (MAIN-WORLD-STRUCT (+ pos-x 50) pos-y row))

                    )
                (if (odd? (/ pos-x 50))
                    (begin
                      ((draw-solid-rectangle EMPTY-WORLD) (make-posn pos-x pos-y) 50 50 "red")
                      (MAIN-WORLD-STRUCT (+ pos-x 50) pos-y row))
                    (begin
                      ((draw-solid-rectangle EMPTY-WORLD) (make-posn pos-x pos-y) 50 50 "white")
                      (MAIN-WORLD-STRUCT (+ pos-x 50) pos-y row))
                    )
                )
            )
          )
      )
  )

(MAIN-WORLD-STRUCT 50 50 1)
((draw-rectangle EMPTY-WORLD) (make-posn 50 50) 400 400 "black")



(define h1 (make-posn 395 395))
(define h2 (make-posn 395 345))
(define h3 (make-posn 395 195))
(define h4 (make-posn 395 245))
(define h5 (make-posn 395 195))
(define h6 (make-posn 395 145))
(define h7 (make-posn 395 95))
(define h8 (make-posn 395 45))

(define g1 (make-posn 345 395))
(define g2 (make-posn 345 345))
(define g3 (make-posn 345 295))
(define g4 (make-posn 345 245))
(define g5 (make-posn 345 195))
(define g6 (make-posn 345 145))
(define g7 (make-posn 345 95))
(define g8 (make-posn 345 45))

(define f1 (make-posn 295 395))
(define f2 (make-posn 295 345))
(define f3 (make-posn 295 295))
(define f4 (make-posn 295 245))
(define f5 (make-posn 295 195))
(define f6 (make-posn 295 145))
(define f7 (make-posn 295 95))
(define f8 (make-posn 295 45))

(define e1 (make-posn 245 395))
(define e2 (make-posn 245 345))
(define e3 (make-posn 245 295))
(define e4 (make-posn 245 245))
(define e5 (make-posn 245 195))
(define e6 (make-posn 245 145))
(define e7 (make-posn 245 95))
(define e8 (make-posn 245 45))

(define d1 (make-posn 195 395))
(define d2 (make-posn 195 345))
(define d3 (make-posn 195 295))
(define d4 (make-posn 195 245))
(define d5 (make-posn 195 195))
(define d6 (make-posn 195 145))
(define d7 (make-posn 195 95))
(define d8 (make-posn 195 45))

(define c1 (make-posn 145 395))
(define c2 (make-posn 145 345))
(define c3 (make-posn 145 295))
(define c4 (make-posn 145 245))
(define c5 (make-posn 145 195))
(define c6 (make-posn 145 145))
(define c7 (make-posn 145 95))
(define c8 (make-posn 145 45))

(define b1 (make-posn 95 395))
(define b2 (make-posn 95 345))
(define b3 (make-posn 95 295))
(define b4 (make-posn 95 245))
(define b5 (make-posn 95 195))
(define b6 (make-posn 95 145))
(define b7 (make-posn 95 95))
(define b8 (make-posn 95 45))

(define a1 (make-posn 45 395))
(define a2 (make-posn 45 345))
(define a3 (make-posn 45 295))
(define a4 (make-posn 45 245))
(define a5 (make-posn 45 195))
(define a6 (make-posn 45 145))
(define a7 (make-posn 45 95))
(define a8 (make-posn 45 45))

;White Possitioning
(((draw-pixmap-posn "photos/whiteRook.png") EMPTY-WORLD) a8)
(sleep 0.2)
(((draw-pixmap-posn "photos/whiteKnight.png") EMPTY-WORLD) b8)
(sleep 0.2)
(((draw-pixmap-posn "photos/whiteBishop.png") EMPTY-WORLD) c8)
(sleep 0.2)
(((draw-pixmap-posn "photos/whiteKing.png") EMPTY-WORLD) d8)
(sleep 0.2)
(((draw-pixmap-posn "photos/whiteQueen.png") EMPTY-WORLD) e8)
(sleep 0.2)
(((draw-pixmap-posn "photos/whiteBishop.png") EMPTY-WORLD) f8)
(sleep 0.2)
(((draw-pixmap-posn "photos/whiteKnight.png") EMPTY-WORLD) g8)
(sleep 0.2)
(((draw-pixmap-posn "photos/whiteRook.png") EMPTY-WORLD) h8)
(sleep 0.2)


(((draw-pixmap-posn "photos/whitePawn.png") EMPTY-WORLD) a7)
(sleep 0.2)
(((draw-pixmap-posn "photos/whitePawn.png") EMPTY-WORLD) b7)
(sleep 0.2)
(((draw-pixmap-posn "photos/whitePawn.png") EMPTY-WORLD) c7)
(sleep 0.2)
(((draw-pixmap-posn "photos/whitePawn.png") EMPTY-WORLD) d7)
(sleep 0.2)
(((draw-pixmap-posn "photos/whitePawn.png") EMPTY-WORLD) e7)
(sleep 0.2)
(((draw-pixmap-posn "photos/whitePawn.png") EMPTY-WORLD) f7)
(sleep 0.2)
(((draw-pixmap-posn "photos/whitePawn.png") EMPTY-WORLD) g7)
(sleep 0.2)
(((draw-pixmap-posn "photos/whitePawn.png") EMPTY-WORLD) h7)
(sleep 0.2)

;Black Possitioning
(((draw-pixmap-posn "photos/blackPawn.png") EMPTY-WORLD) a2)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackPawn.png") EMPTY-WORLD) b2)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackPawn.png") EMPTY-WORLD) c2)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackPawn.png") EMPTY-WORLD) d2)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackPawn.png") EMPTY-WORLD) e2)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackPawn.png") EMPTY-WORLD) f2)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackPawn.png") EMPTY-WORLD) g2)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackPawn.png") EMPTY-WORLD) h2)
(sleep 0.2)

;(((draw-pixmap-posn "photos/blackRook.png") EMPTY-WORLD) a1)
;(sleep 0.2)
(((draw-pixmap-posn "photos/blackKnight.png") EMPTY-WORLD) b1)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackBishop.png") EMPTY-WORLD) c1)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackKing.png") EMPTY-WORLD) d1)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackQueen.png") EMPTY-WORLD) e1)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackBishop.png") EMPTY-WORLD) f1)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackKnight.png") EMPTY-WORLD) g1)
(sleep 0.2)
(((draw-pixmap-posn "photos/blackRook.png") EMPTY-WORLD) h1)
(sleep 0.2)

(define x-axis (vector 45 94 146 195 245 295 345 395))
(define y-axis (vector 45 94 146 195 245 295 345 395))
(define possitions (vector a8 a7 a6 a5 a4 a3 a2 a1 b8 b7 b6 b5 b4 b3 b2 b1 c8 c7 c6 c5 c4 c3 c2 c1 d8 d7 d6 d5 d4 d3 d2 d1 e8 e7 e6 e5 e4 e3 e2 e1 f8 f7 f6 f5 f4 f3 f2 f1
                           g8 g7 g6 g5 g4 g3 g2 g1 h8 h7 h6 h5 h4 h3 h2 h1))

(define blackPieces (vector "photos/blackPawn.png" "photos/blackRook.png" "photos/blackKnight.png" "photos/blackBishop.png" "photos/blackKing.png" "photos/blackQueen.png"))
(define whitePieces (vector "photos/whitePawn.png" "photos/whiteRook.png" "photos/whiteKnight.png" "photos/whiteBishop.png" "photos/whiteQueen.png" "photos/whiteKing.png"))
(define emptyPieces (vector "photos/trans.png"))

(define 8Row (vector (vector-ref whitePieces 1) (vector-ref whitePieces 2) (vector-ref whitePieces 3) (vector-ref whitePieces 4) (vector-ref whitePieces 5)
                      (vector-ref whitePieces 3) (vector-ref whitePieces 2) (vector-ref whitePieces 1)))

(define 7Row (vector (vector-ref whitePieces 0) (vector-ref whitePieces 0) (vector-ref whitePieces 0) (vector-ref whitePieces 0) (vector-ref whitePieces 0)
                      (vector-ref whitePieces 0) (vector-ref whitePieces 0) (vector-ref whitePieces 0)))

(define 6Row (vector (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0)
                      (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0)))

(define 5Row (vector (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0)
                      (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0)))

(define 4Row (vector (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0)
                      (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0)))

(define 3Row (vector (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0)
                      (vector-ref emptyPieces 0) (vector-ref emptyPieces 0) (vector-ref emptyPieces 0)))

(define 2Row (vector (vector-ref blackPieces 0) (vector-ref blackPieces 0) (vector-ref blackPieces 0) (vector-ref blackPieces 0) (vector-ref blackPieces 0)
                      (vector-ref blackPieces 0) (vector-ref blackPieces 0) (vector-ref blackPieces 0)))

(define 1Row (vector (vector-ref blackPieces 1) (vector-ref blackPieces 2) (vector-ref blackPieces 3) (vector-ref blackPieces 4) (vector-ref blackPieces 5)
                      (vector-ref blackPieces 3) (vector-ref blackPieces 2) (vector-ref blackPieces 1)))

(define table (vector 1Row 2Row 3Row 4Row 5Row 6Row 7Row 8Row))


(define (MAIN-WORLD-STRUCTURE x )
  (cond
    [(equal? x a1) (((draw-pixmap-posn (vector-ref (vector-ref table 0) 0) ) EMPTY-WORLD) a1)]
    [(equal? x a2) (((draw-pixmap-posn (vector-ref (vector-ref table 1) 0) ) EMPTY-WORLD) a2)]
    [(equal? x a3) (((draw-pixmap-posn (vector-ref (vector-ref table 2) 0) ) EMPTY-WORLD) a3)]
    [(equal? x a4) (((draw-pixmap-posn (vector-ref (vector-ref table 3) 0) ) EMPTY-WORLD) a4)]
    [(equal? x a5) (((draw-pixmap-posn (vector-ref (vector-ref table 4) 0) ) EMPTY-WORLD) a5)]
    [(equal? x a6) (((draw-pixmap-posn (vector-ref (vector-ref table 5) 0) ) EMPTY-WORLD) a6)]
    [(equal? x a7) (((draw-pixmap-posn (vector-ref (vector-ref table 6) 0) ) EMPTY-WORLD) a7)]
    [(equal? x a8) (((draw-pixmap-posn (vector-ref (vector-ref table 7) 0) ) EMPTY-WORLD) a8)]

    [(equal? x b1) (((draw-pixmap-posn (vector-ref (vector-ref table 0) 1) ) EMPTY-WORLD) b1)]
    [(equal? x b2) (((draw-pixmap-posn (vector-ref (vector-ref table 1) 1) ) EMPTY-WORLD) b2)]
    [(equal? x b3) (((draw-pixmap-posn (vector-ref (vector-ref table 2) 1) ) EMPTY-WORLD) b3)]
    [(equal? x b4) (((draw-pixmap-posn (vector-ref (vector-ref table 3) 1) ) EMPTY-WORLD) b4)]
    [(equal? x b5) (((draw-pixmap-posn (vector-ref (vector-ref table 4) 1) ) EMPTY-WORLD) b5)]
    [(equal? x b6) (((draw-pixmap-posn (vector-ref (vector-ref table 5) 1) ) EMPTY-WORLD) b6)]
    [(equal? x b7) (((draw-pixmap-posn (vector-ref (vector-ref table 6) 1) ) EMPTY-WORLD) b7)]
    [(equal? x b8) (((draw-pixmap-posn (vector-ref (vector-ref table 7) 1) ) EMPTY-WORLD) b8)]

    [(equal? x c1) (((draw-pixmap-posn (vector-ref (vector-ref table 0) 2) ) EMPTY-WORLD) c1)]
    [(equal? x c2) (((draw-pixmap-posn (vector-ref (vector-ref table 1) 2) ) EMPTY-WORLD) c2)]
    [(equal? x c3) (((draw-pixmap-posn (vector-ref (vector-ref table 2) 2) ) EMPTY-WORLD) c3)]
    [(equal? x c4) (((draw-pixmap-posn (vector-ref (vector-ref table 3) 2) ) EMPTY-WORLD) c4)]
    [(equal? x c5) (((draw-pixmap-posn (vector-ref (vector-ref table 4) 2) ) EMPTY-WORLD) c5)]
    [(equal? x c6) (((draw-pixmap-posn (vector-ref (vector-ref table 5) 2) ) EMPTY-WORLD) c6)]
    [(equal? x c7) (((draw-pixmap-posn (vector-ref (vector-ref table 6) 2) ) EMPTY-WORLD) c7)]
    [(equal? x c8) (((draw-pixmap-posn (vector-ref (vector-ref table 7) 2) ) EMPTY-WORLD) c8)]

    [(equal? x d1) (((draw-pixmap-posn (vector-ref (vector-ref table 0) 3) ) EMPTY-WORLD) d1)]
    [(equal? x d2) (((draw-pixmap-posn (vector-ref (vector-ref table 1) 3) ) EMPTY-WORLD) d2)]
    [(equal? x d3) (((draw-pixmap-posn (vector-ref (vector-ref table 2) 3) ) EMPTY-WORLD) d3)]
    [(equal? x d4) (((draw-pixmap-posn (vector-ref (vector-ref table 3) 3) ) EMPTY-WORLD) d4)]
    [(equal? x d5) (((draw-pixmap-posn (vector-ref (vector-ref table 4) 3) ) EMPTY-WORLD) d5)]
    [(equal? x d6) (((draw-pixmap-posn (vector-ref (vector-ref table 5) 3) ) EMPTY-WORLD) d6)]
    [(equal? x d7) (((draw-pixmap-posn (vector-ref (vector-ref table 6) 3) ) EMPTY-WORLD) d7)]
    [(equal? x d8) (((draw-pixmap-posn (vector-ref (vector-ref table 7) 3) ) EMPTY-WORLD) d8)]

    [(equal? x e1) (((draw-pixmap-posn (vector-ref (vector-ref table 0) 4) ) EMPTY-WORLD) e1)]
    [(equal? x e2) (((draw-pixmap-posn (vector-ref (vector-ref table 1) 4) ) EMPTY-WORLD) e2)]
    [(equal? x e3) (((draw-pixmap-posn (vector-ref (vector-ref table 2) 4) ) EMPTY-WORLD) e3)]
    [(equal? x e4) (((draw-pixmap-posn (vector-ref (vector-ref table 3) 4) ) EMPTY-WORLD) e4)]
    [(equal? x e5) (((draw-pixmap-posn (vector-ref (vector-ref table 4) 4) ) EMPTY-WORLD) e5)]
    [(equal? x e6) (((draw-pixmap-posn (vector-ref (vector-ref table 5) 4) ) EMPTY-WORLD) e6)]
    [(equal? x e7) (((draw-pixmap-posn (vector-ref (vector-ref table 6) 4) ) EMPTY-WORLD) e7)]
    [(equal? x e8) (((draw-pixmap-posn (vector-ref (vector-ref table 7) 4) ) EMPTY-WORLD) e8)]

    [(equal? x f1) (((draw-pixmap-posn (vector-ref (vector-ref table 0) 5) ) EMPTY-WORLD) f1)]
    [(equal? x f2) (((draw-pixmap-posn (vector-ref (vector-ref table 1) 5) ) EMPTY-WORLD) f2)]
    [(equal? x f3) (((draw-pixmap-posn (vector-ref (vector-ref table 2) 5) ) EMPTY-WORLD) f3)]
    [(equal? x f4) (((draw-pixmap-posn (vector-ref (vector-ref table 3) 5) ) EMPTY-WORLD) f4)]
    [(equal? x f5) (((draw-pixmap-posn (vector-ref (vector-ref table 4) 5) ) EMPTY-WORLD) f5)]
    [(equal? x f6) (((draw-pixmap-posn (vector-ref (vector-ref table 5) 5) ) EMPTY-WORLD) f6)]
    [(equal? x f7) (((draw-pixmap-posn (vector-ref (vector-ref table 6) 5) ) EMPTY-WORLD) f7)]
    [(equal? x f8) (((draw-pixmap-posn (vector-ref (vector-ref table 7) 5) ) EMPTY-WORLD) f8)]

    [(equal? x g1) (((draw-pixmap-posn (vector-ref (vector-ref table 0) 6) ) EMPTY-WORLD) g1)]
    [(equal? x g2) (((draw-pixmap-posn (vector-ref (vector-ref table 1) 6) ) EMPTY-WORLD) g2)]
    [(equal? x g3) (((draw-pixmap-posn (vector-ref (vector-ref table 2) 6) ) EMPTY-WORLD) g3)]
    [(equal? x g4) (((draw-pixmap-posn (vector-ref (vector-ref table 3) 6) ) EMPTY-WORLD) g4)]
    [(equal? x g5) (((draw-pixmap-posn (vector-ref (vector-ref table 4) 6) ) EMPTY-WORLD) g5)]
    [(equal? x g6) (((draw-pixmap-posn (vector-ref (vector-ref table 5) 6) ) EMPTY-WORLD) g6)]
    [(equal? x g7) (((draw-pixmap-posn (vector-ref (vector-ref table 6) 6) ) EMPTY-WORLD) g7)]
    [(equal? x g8) (((draw-pixmap-posn (vector-ref (vector-ref table 7) 6) ) EMPTY-WORLD) g8)]

    [(equal? x h1) (((draw-pixmap-posn (vector-ref (vector-ref table 1) 7) ) EMPTY-WORLD) h1)]
    [(equal? x h2) (((draw-pixmap-posn (vector-ref (vector-ref table 2) 7) ) EMPTY-WORLD) h2)]
    [(equal? x h3) (((draw-pixmap-posn (vector-ref (vector-ref table 3) 7) ) EMPTY-WORLD) h3)]
    [(equal? x h4) (((draw-pixmap-posn (vector-ref (vector-ref table 4) 7) ) EMPTY-WORLD) h4)]
    [(equal? x h5) (((draw-pixmap-posn (vector-ref (vector-ref table 5) 7) ) EMPTY-WORLD) h5)]
    [(equal? x h6) (((draw-pixmap-posn (vector-ref (vector-ref table 6) 7) ) EMPTY-WORLD) h6)]
    [(equal? x h7) (((draw-pixmap-posn (vector-ref (vector-ref table 7) 7) ) EMPTY-WORLD) h7)]
    [(equal? x h8) (((draw-pixmap-posn (vector-ref (vector-ref table 8) 7) ) EMPTY-WORLD) h8)]

    [else "fin"]))


(define (convertion x y)
  (cond
    ((and (= x 395) (= y 395)) h1)
    ((and (= x 395) (= y 345)) h2)
    ((and (= x 395) (= y 295)) h3)
    ((and (= x 395) (= y 245)) h4)
    ((and (= x 395) (= y 195)) h5)
    ((and (= x 395) (= y 145)) h6)
    ((and (= x 395) (= y 95)) h7)
    ((and (= x 395) (= y 45)) h8)

    ((and (= x 345) (= y 395)) g1)
    ((and (= x 345) (= y 345)) g2)
    ((and (= x 345) (= y 295)) g3)
    ((and (= x 345) (= y 245)) g4)
    ((and (= x 345) (= y 195)) g5)
    ((and (= x 345) (= y 145)) g6)
    ((and (= x 345) (= y 95)) g7)
    ((and (= x 345) (= y 45)) g8)

    ((and (= x 295) (= y 395)) f1)
    ((and (= x 295) (= y 345)) f2)
    ((and (= x 295) (= y 295)) f3)
    ((and (= x 295) (= y 245)) f4)
    ((and (= x 295) (= y 195)) f5)
    ((and (= x 295) (= y 145)) f6)
    ((and (= x 295) (= y 95)) f7)
    ((and (= x 295) (= y 45)) f8)

    ((and (= x 245) (= y 395)) e1)
    ((and (= x 245) (= y 345)) e2)
    ((and (= x 245) (= y 295)) e3)
    ((and (= x 245) (= y 245)) e4)
    ((and (= x 245) (= y 195)) e5)
    ((and (= x 245) (= y 145)) e6)
    ((and (= x 245) (= y 95)) e7)
    ((and (= x 245) (= y 45)) e8)

    ((and (= x 195) (= y 395)) d1)
    ((and (= x 195) (= y 345)) d2)
    ((and (= x 195) (= y 295)) d3)
    ((and (= x 195) (= y 245)) d4)
    ((and (= x 195) (= y 195)) d5)
    ((and (= x 195) (= y 145)) d6)
    ((and (= x 195) (= y 95)) d7)
    ((and (= x 195) (= y 45)) d8)

    ((and (= x 145) (= y 395)) c1)
    ((and (= x 145) (= y 345)) c2)
    ((and (= x 145) (= y 295)) c3)
    ((and (= x 145) (= y 245)) c4)
    ((and (= x 145) (= y 195)) c5)
    ((and (= x 145) (= y 145)) c6)
    ((and (= x 145) (= y 95)) c7)
    ((and (= x 145) (= y 45)) c8)

    ((and (= x 95) (= y 395)) b1)
    ((and (= x 95) (= y 345)) b2)
    ((and (= x 95) (= y 295)) b3)
    ((and (= x 95) (= y 245)) b4)
    ((and (= x 95) (= y 195)) b5)
    ((and (= x 95) (= y 145)) b6)
    ((and (= x 95) (= y 95)) b7)
    ((and (= x 95) (= y 45)) b8)

    ((and (= x 45) (= y 395)) a1)
    ((and (= x 45) (= y 345)) a2)
    ((and (= x 45) (= y 295)) a3)
    ((and (= x 45) (= y 245)) a4)
    ((and (= x 45) (= y 195)) a5)
    ((and (= x 45) (= y 145)) a6)
    ((and (= x 45) (= y 95)) a7)
    ((and (= x 45) (= y 45)) a8)
    )
  )

(define (message p)
  (cond
    ((= p 1) ((draw-string EMPTY-WORLD) (make-posn 130 490) "Player 1 is check!"))
    ((= p 2) ((draw-string EMPTY-WORLD) (make-posn 130 490) "Player 2 is check!"))
    ((= p 4) ((draw-string EMPTY-WORLD) (make-posn 130 490) "Player 1 is check!"))
    ((= p 5) ((draw-string EMPTY-WORLD) (make-posn 130 490) "Player 2 is check!"))
    ((= p 6) ((draw-string EMPTY-WORLD) (make-posn 130 490) "invalid Movement"))
    )
  )




       
    
    
    
    








  



                      
             
                             
      