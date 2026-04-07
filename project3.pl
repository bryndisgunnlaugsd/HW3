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


% TODO: Á EFTIR AÐ GERA

never_borrowed(B) :-

member_list(L)


% ========================
%         PART 2
% ========================

% ---- a. myprefix(L1,L2) ----

% ---- b. num_elements(K,L) ----

% ---- c. remove_element(X,L1,L2) ----

% ---- d. insert_element(Elem,L1,Pos,L2) ----

% ---- e. add_up_to(L1,L2)

% ---- f. remove_duplicates(L1,L2)

% ---- g. split_even_odd(L, Even, Odd)

% ---- h. merge_sorted(L1, L2, L3) ----



% ========================
%         PART 3
% ========================

% ---- a. binaryTree(T) ----

% ---- b. preorder(T, L) ----

% ---- c. leaves(T, L) ----



% ========================
%         PART 4
% ========================

% TODO: Eitthvað PARSING dæmi