%------------------------------------------------------------------------------
% File     : GEO196+2 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Symmetry of incidence
% Version  : [vPl95] axioms : Reduced > Especial.
% English  : If the lines X and Y are convergent, U and V are convergent,
%            and the intersection point of X and Y is incident with U and V,
%            then the intersection point of U and V is incident with X and Y.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [Li97]  Li (1997), Replacing the Axioms for Connecting Lines a
%          : [Li98]  Li (1998), A Shorter and Intuitive Axiom to Replace th
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.00 v5.5.0, 0.21 v5.4.0, 0.17 v5.3.0, 0.26 v5.2.0, 0.21 v5.0.0, 0.20 v4.1.0, 0.22 v4.0.1, 0.21 v4.0.0, 0.25 v3.7.0, 0.29 v3.5.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   13 (   3 unit)
%            Number of atoms       :   40 (   0 equality)
%            Maximal formula depth :   10 (   6 average)
%            Number of connectives :   34 (   7 ~  ;   9  |;   6  &)
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
      ( ( convergent_lines(X,Y)
        & convergent_lines(U,V)
        & ~ apart_point_and_line(intersection_point(X,Y),U)
        & ~ apart_point_and_line(intersection_point(X,Y),V) )
     => ( ~ apart_point_and_line(intersection_point(U,V),X)
        & ~ apart_point_and_line(intersection_point(U,V),Y) ) ) )).

%------------------------------------------------------------------------------