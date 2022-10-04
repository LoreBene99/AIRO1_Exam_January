(define (domain transportation)

    (:requirements :strips)

    (:predicates
        (CONTAINER ?c)
        (TRUCK ?t) 
        (TRAIN-STATION ?s) 
        (HUB ?h) 
        (TRAIN ?t)
        (at-container ?c ?l)
        (at-transport ?t ?l)
        (can-go ?t ?from ?to) 
        (in ?c ?t) 
        (empty ?t)
        (unloadbytruck ?c) 
    )

    (:action load_truck
        :parameters (?c ?t ?l) ;specifichiamo gli oggetti presenti in tale azione
        :precondition (and (CONTAINER ?c) (TRUCK ?t)
                            (at-container ?c ?l) (at-transport ?t ?l)
                            (empty ?t)) 
                           
        :effect (and (not(at-container ?c ?l)) (in ?c ?t) (not(empty ?t))) 
    )
    
    (:action unload_truck 
        :parameters (?c ?t ?l) ;specifichiamo gli oggetti presenti in tale azione
        :precondition (and (CONTAINER ?c) (TRUCK ?t) 
                            (in ?c ?t) (at-transport ?t ?l)) 
                          
        :effect (and (empty ?t) (not(in ?c ?t)) (at-container ?c ?l) (unloadbytruck ?c)) 
    )
    
    (:action train_is_full
        :parameters (?c1 ?c2 ?c3 ?c4 ?t) ;specifichiamo gli oggetti presenti in tale azione
        :precondition (and (CONTAINER ?c1) (CONTAINER ?c2) (CONTAINER ?c3) (CONTAINER ?c4)
                            (in ?c1 ?t) (in ?c2 ?t) (in ?c3 ?t) (in ?c4 ?t)
                            (TRAIN ?t))
                           
        :effect (not(empty ?t)) 
    )
    
     (:action load_train
        :parameters (?c ?t ?l) ;specifichiamo gli oggetti presenti in tale azione
        :precondition (and (CONTAINER ?c) (TRAIN ?t) (TRAIN-STATION ?l)
                            (at-container ?c ?l) (at-transport ?t ?l)
                            (unloadbytruck ?c) (empty ?t)) 
                           
        :effect (and (not(at-container ?c ?l)) (not(unloadbytruck ?c)) (in ?c ?t)) 
    )
    
    (:action unload_train
        :parameters (?c ?t ?l) ;specifichiamo gli oggetti presenti in tale azione
        :precondition (and (CONTAINER ?c) (TRAIN ?t) (TRAIN-STATION ?l)
                            (at-transport ?t ?l)
                            (in ?c ?t)) 
                           
        :effect (and (not(in ?c ?t)) (at-container ?c ?l) (empty ?t)) 
    )
    
    (:action move
        :parameters (?t ?from ?to)
        :precondition (and (can-go ?t ?from ?to) 
                            (at-transport ?t ?from))
                            
        :effect (and (not(at-transport ?t ?from)) (at-transport ?t ?to))
        )
)