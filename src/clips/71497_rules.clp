(deffunction print_result (?target)
        (do-for-all-instances ((?part ?target))
                (printout t (send ?part get-model) " / ")
        )
)

(deffunction should_remove (?socket)
        (not (any-instancep ((?cpu Processor)) (eq ?cpu:cpu_socket ?socket)))
)

(defrule get_name
        =>
        (printout t "Hey! What's your name?" crlf)
        (assert (user_name (read)))
)

(defrule get_profession
        (user_name ?name)
        =>
        (printout t crlf "Nice to meet you, " ?name "!" crlf)
        (printout t "Today I'll guide you in picking the right parts for your new computer." crlf)
        (printout t "What do you do for a living? IT/Other" crlf)
        (assert (profession (read)))
)

(defrule check_weather
        =>
        (printout t "Are there often thunderstorms where you plan to use the computer?" crlf)
        (assert (thunders (read)))
)

(defrule likes_games
        =>
        (printout t "Do you like playing games? yes/no" crlf)
        (assert (is_gamer unknown))
        (assert (likes_games (read)))
)

(defrule disk
        =>
        (printout t "What type of disk do you need? More memory, but slow (HDD) or much less memory, but 10x faster? HDD/SSD" crlf)
        (assert (drive (read)))
)

(defrule living_place
        =>
        (printout t "How many rooms do you have at your home?" crlf)
        (assert (home (read)))
)

(defrule is_gamer
        ?i <- (is_gamer unknown)
        (likes_games yes)
=>
        (printout t "Do you consider yourself a gamer? yes/no" crlf)
        (retract ?i)
        (assert (is_gamer (read)))
)

(defrule remove_weak_cpus (declare (salience -1))
        (profession IT)
        ?cpu <- (object (is-a Processor) (cores ?c)
                                         (has_hyperthreading ?hyper))

        (test (or (< ?c 2) (eq ?hyper FALSE)))
=>
        (unmake-instance ?cpu)
)

(defrule remove_non_gaming_cpus (declare (salience -1))
        (is_gamer yes)
        ?cpu <- (object (is-a Processor) (clock_speed ?speed)
                                         (has_turbo ?turbo))

        (test (or (< ?speed 2100) (eq ?turbo FALSE)))
=>
        (unmake-instance ?cpu)
)

(defrule remove_non_gaming_gpus (declare (salience -1))
        (is_gamer yes)
        ?gpu <- (object (is-a Graphics) (memory_size ?size)
                                        (memory_type ?type))

        (test (or (< ?size 2048) (not (eq (send ?type get-mem_type) GDDR5))))
=>
        (unmake-instance ?gpu)
)

(defrule remove_gaming_cpus (declare (salience -1))
        (is_gamer no|unknown)
        ?cpu <- (object (is-a Processor) (has_turbo ?turbo))

        (test (eq ?turbo TRUE))
=>
        (unmake-instance ?cpu)
)

(defrule remove_gaming_gpus (declare (salience -1))
        (is_gamer no|unknown)
        ?gpu <- (object (is-a Graphics) (memory_size ?size)
                                        (memory_type ?type))

        (test (or (> ?size 1024) (eq (send ?type get-mem_type) GDDR5)))
=>
        (unmake-instance ?gpu)
)

(defrule remove_non_gaming_cooling (declare (salience -1))
        (is_gamer ?g)
        ?cooling <- (object (is-a Cooling) (has_water ?water))

        (test (not (eq ?water (eq ?g yes))))
=>
        (unmake-instance ?cooling)
)

(defrule remove_ups (declare (salience -1))
        (thunders no)
        ?ups <- (object (is-a UPS))
=>
        (unmake-instance ?ups)
)

(defrule remove_drives (declare (salience -1))
        (drive ?d)
        ?drive <- (object (is-a Drive))

        (test (not (eq ?d (class ?drive))))
=>
        (unmake-instance ?drive)
)

(defrule remove_small_routers (declare (salience -1))
        (home ?rooms)
        ?r <- (object (is-a Router) (antennas ?a))
        (test (and (< ?a 2) (> ?rooms 3)))
=>
        (unmake-instance ?r)
)

(defrule print_advise (declare (salience -5))
        =>
        (printout t crlf "Recommended items" crlf "Processors: / ")
        (print_result Processor)
        (printout t crlf "CPU coolings: / ")
        (print_result Cooling)
        (printout t crlf "Graphic cards: / ")
        (print_result Graphics)
        (printout t crlf "Drives: / ")
        (print_result Drive)
        (printout t crlf "Routers: / ")
        (print_result Router)
        (printout t crlf "UPS: / ")
        (print_result UPS)

        (assert (phase motherboards))
)

(defrule remove_motherboards
        (phase motherboards)
        ?mobo <- (object (is-a Motherboard) (socket ?socket))

        (test (should_remove ?socket))
=>
        (unmake-instance ?mobo)
)

(defrule print_compatible_motherboards (declare (salience -5))
        ?i <- (phase motherboards)
=>
        (retract ?i)
        (printout t crlf "Compatible motherboards: / ")
        (print_result Motherboard)
        (printout t crlf)
)
