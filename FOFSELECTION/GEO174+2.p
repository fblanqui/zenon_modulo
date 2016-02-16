%------------------------------------------------------------------------------
% File     : GEO174+2 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Lemma on symmetry and apartness
% Version  : [vPl95] axioms : Reduced > Especial.
% English  : If two points are distinct and a line U is apart from at least
%            one of these points, then this line is distinct from the line
%            connecting these points

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [Li97]  Li (1997), Replacing the Axioms for Connecting Lines a
%          : [Li98]  Li (1998), A Shorter and Intuitive Axiom to Replace th
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.0.0, 0.25 v5.5.0, 0.04 v5.3.0, 0.13 v5.2.0, 0.14 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.11 v4.0.0, 0.10 v3.7.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   13 (   3 unit)
%            Number of atoms       :   39 (   0 equality)
%            Maximal formula depth :    9 (   6 average)
%            Number of connectives :   29 (   3 ~  ;  10  |;   4  &)
%                                         (   0 <=>;  12 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 2-2 arity)
%            Number of functors    :    2 (   0 constant; 2-2 arity)
%            Number of variables   :   34 (   0 singleton;  34 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :  Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO008+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & convergent_lines(U,V)
        & ( apart_point_and_line(X,U)
          | apart_point_and_line(Y,U) ) )
     => distinct_lines(U,line_connecting(X,Y)) ) )).

%------------------------------------------------------------------------------