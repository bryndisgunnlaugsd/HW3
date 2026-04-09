% ========================
%         PART 1
% ========================

% ---- Members ----
member(alice).
member(bob).
member(carol).
member(tom).


% ---- Author wrote book ----
wrote(austen, pride_and_prejudice).
wrote(tolstoy,  war_and_peace).
wrote(orwell,   '1984').
wrote(huxley,   brave_new_world).
wrote(laxness,  independent_people).
wrote(olafsson, touch).


% ----- Book genre -----
book_genre(pride_and_prejudice, romance).
book_genre(war_and_peace,       historical).
book_genre('1984',              dystopia).
book_genre(brave_new_world,     dystopia).
book_genre(independent_people,  fiction).
book_genre(touch,               fiction).


% ----- Borrowing table -----
% alice  : pride_and_prejudice, '1984', independent_people
% bob    : war_and_peace, '1984', touch
% carol  : brave_new_world, touch
% tom    : pride_and_prejudice, independent_people

borrowed(alice, pride_and_prejudice).
borrowed(alice, '1984').
borrowed(alice, independent_people).
borrowed(bob,   war_and_peace).
borrowed(bob,   '1984').
borrowed(bob,   touch).
borrowed(carol, brave_new_world).
borrowed(carol, touch).
borrowed(tom,   pride_and_prejudice).
borrowed(tom,   independent_people).


% ---- RULES ----

% M has borrowed a book written by A 
author_of_borrowed_book(M, A) :-
    borrowed(M, B),
    wrote(A, B).

% M has borrowed a book whose genre is B 
likes_genre(M, G) :-
    borrowed(M, B),
    book_genre(B, G).

% both M1 and M2 borrowed book B
common_book(M1, M2, B) :-
    borrowed(M1, B),
    borrowed(M2, B).

% True if no member has borrowed book B (a rule)
never_borrowed(B) :-
    book_genre(B, _),
    \+ borrowed(_, B).

% True if L is a list of all members (without duplicates)
member_list(L) :-
    findall(M, member(M), All),
    list_to_set(All, L).


% ========================
%         PART 2
% ========================

% ---- a. myprefix(L1,L2) ----
myprefix([], _).
myprefix([X|T1], [X|T2]) :- myprefix(T1, T2).

% ---- b. num_elements(K,L) ----
num_elements(0, []).
num_elements(K, [_|L]) :-
    num_elements(K1, L),
    K is K1 + 1.

% ---- c. remove_element(X,L1,L2) ----
remove_element(X, [X|L1], L1).
remove_element(X, [Y|L1], [Y|L2]) :- remove_element(X, L1, L2).

% ---- d. insert_element(Elem,L1,Pos,L2) ----
insert_element(Elem, L1, 1, [Elem|L1]).
insert_element(Elem, [X|L1], Pos, [X|L2]) :-
    Pos > 1,
    Pos1 is Pos - 1,
    insert_element(Elem, L1, Pos1, L2).

% ---- e. add_up_to(L1,L2)
add_up_to(L1, L2) :- add_up_to_helper_f(L1, L2, 0).
 
add_up_to_helper_f([], [], _).
add_up_to_helper_f([X|L1], [S|L2], Acc) :-
    S is X + Acc,
    add_up_to_helper_f(L1, L2, S).

% ---- f. remove_duplicates(L1,L2)
remove_duplicates([], []).
remove_duplicates([X|L1], L2) :-
    member(X, L1), !,      
    remove_duplicates(L1, L2).

remove_duplicates([X|L1], [X|L2]) :- 
    remove_duplicates(L1, L2).

% ---- g. split_even_odd(L, Even, Odd)
split_even_odd([], [], []).
split_even_odd([X], [X], []).

split_even_odd([X,Y|L], [X|Even], [Y|Odd]) :-
    split_even_odd(L, Even, Odd).

% ---- h. merge_sorted(L1, L2, L3) ----
merge_sorted([], L2, L2).
merge_sorted(L1, [], L1).
merge_sorted([X|L1], [Y|L2], [X|L3]) :-
    X =< Y,
    merge_sorted(L1, [Y|L2], L3).

merge_sorted([X|L1], [Y|L2], [Y|L3]) :-
    X > Y,
    merge_sorted([X|L1], L2, L3).


% ========================
%         PART 3
% ========================

% ---- a. binaryTree(T) ----
binaryTree(nil).
binaryTree(t(_, L, R)) :-
    binaryTree(L),
    binaryTree(R).

% ---- b. preorder(T, L) ----
preorder(nil, []).
preorder(t(X, Left, Right), L) :-
    preorder(Left, L1),
    preorder(Right, L2),
    append([X|L1], L2, L).

% ---- c. leaves(T, L) ----
leaves(nil, []).
leaves(t(X, nil, nil), [X]).
leaves(t(_, Left, Right), L) :-
    (Left \= nil ; Right \= nil),
    leaves(Left, L1),
    leaves(Right, L2),
    append(L1, L2, L).


% ========================
%         PART 4
% ========================
s([]).                                   
s([0]).                                      
s([1]).                                
s(L) :- append([0|M], [0], L), s(M).       
s(L) :- append([1|M], [1], L), s(M).