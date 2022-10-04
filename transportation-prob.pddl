(define (problem transportation-problem)

    (:domain transportation)
    
    (:objects 
        hub1 hub2 hub3 hub4
        
        Italy France
        
        c1 c2 c3 c4 c5 c6 c7 c8
        
        train1
        
        truck1 truck2 truck3 truck4
        
        train_station1 train_station2
    )
    
    (:init
        (CONTAINER c1) (CONTAINER c2) (CONTAINER c3) (CONTAINER c4) (CONTAINER c5) (CONTAINER c6) (CONTAINER c7) (CONTAINER c8)
        
        (TRUCK truck1) (TRUCK truck2) (TRUCK truck3) (TRUCK truck4)
        
        (TRAIN train1)
        
        (TRAIN-STATION train_station1) (TRAIN-STATION train_station2)
        
        (HUB hub1) (HUB hub2) (HUB hub3) (HUB hub4)
        
        (at-container c1 hub1) (at-container c2 hub1) (at-container c3 hub1) (at-container c4 hub1)
        (at-container c5 hub2) (at-container c6 hub2) (at-container c7 hub2) (at-container c8 hub2)
        
        (at-transport truck1 hub1) (at-transport truck2 hub2) (at-transport truck3 hub3) (at-transport truck4 hub4)
        (at-transport train1 train_station1)
        
        (can-go truck1 hub1 hub2) (can-go truck1 hub2 hub1)
        (can-go truck2 hub1 hub2) (can-go truck2 hub2 hub1)
        (can-go truck3 hub3 hub4) (can-go truck1 hub4 hub3)
        (can-go truck4 hub3 hub4) (can-go truck4 hub4 hub3)
        (can-go truck1 hub1 train_station1) (can-go truck1 train_station1 hub1)
        (can-go truck1 hub2 train_station1) (can-go truck1 train_station1 hub2)
        (can-go truck2 hub1 train_station1) (can-go truck2 train_station1 hub1) 
        (can-go truck2 hub2 train_station1) (can-go truck2 train_station1 hub2)
        (can-go truck3 hub3 train_station2) (can-go truck3 train_station2 hub3) 
        (can-go truck3 hub4 train_station2) (can-go truck3 train_station2 hub4)
        (can-go truck4 hub3 train_station2) (can-go truck4 train_station2 hub3) 
        (can-go truck4 hub4 train_station2) (can-go truck4 train_station2 hub4)
        
        (can-go train1 train_station1 train_station2) (can-go train1 train_station2 train_station1)
        (empty truck1) (empty truck2) (empty truck3) (empty truck4) (empty train1)
    )
    
    (:goal
        (and (at-container c1 hub3) (at-container c2 hub3) (at-container c3 hub3)
        (at-container c4 hub3) (at-container c5 hub4) (at-container c6 hub4)
        (at-container c7 hub4) (at-container c8 hub4))
    )
)