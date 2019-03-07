candidate_number(97481).

q1(ailp_start_position(P).

q2a(new_pos(p(1,1), e, P)).

q2b(9).

q3([s,e,w,n]).

q4a([p(2,4),p(3,4),p(4,4),p(4,3),p(3,3),p(2,3),p(1,3),p(1,2),p(2,2),p(3,2),p(4,2),p(4,1),p(3,1),p(2,1),p(1,1)]).

q4b([p(2,4),p(3,4),p(4,4),p(4,3),p(3,3),p(2,3),p(1,3),p(1,2),p(2,2),p(3,2),p(3,1),p(2,1)]).

q4c([p(2,4),p(3,4),p(4,4),p(4,3),p(3,3),p(2,3),p(1,3),p(1,2),p(2,2),p(3,2),p(4,2),p(4,1),p(3,1),p(2,1),p(1,1)]).

q4d([p(2,4),p(3,4),p(4,4),p(4,3),p(3,3),p(2,3),p(2,2),p(3,2),,p(4,2),p(4,1),p(3,1),p(2,1),p(1,1),p(1,2),p(1,3),p(1,4)]).

q5_corner_move :- ailp_start_position(P),
    ailp_show_move(P, p(1,4)),
    ailp_show_move(p(1,4), p(4,4)),
    ailp_show_move(p(4,4), p(4,1)),
    ailp_show_move(p(4,1), p(1,1)).

q5_corner_move2 :- ailp_start_position(P),
    ailp_grid_size(N),
    ailp_show_move(P, p(1,N)),
    ailp_show_move(p(1,N), p(N,N)),
    ailp_show_move(p(N,N), p(N,1)),
    ailp_show_move(p(N,1), p(1,1)).

q6_spiral(R) :- ailp_start_position(P),
	ailp_show_move(P, p(1,1)),
	q6_spiral(p(1,1), e, [p(1,1)], X),
        reverse(X, R),
        !.

q6_spiral(_, _, R, R) :- complete(R).

q6_spiral(P, M, Ps, R) :- new_pos(P, M, P1),
    \+ memberchk(P1, Ps),
    ailp_show_move(P, P1),
	term_to_atom([P1|Ps], PsA),
	do_command([mower,console,PsA], _R),
    q6_spiral(P1, M, [P1|Ps], R).

q6_spiral(P, M, Ps, R) :- turn(M, M1),
    q6_spiral(P, M1, Ps, R).

turn(n, e).
turn(e, s).
turn(s, w).
turn(w, n).