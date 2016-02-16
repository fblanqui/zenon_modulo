%------------------------------------------------------------------------------
% File     : GEO182+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Triangle axiom 3
% Version  : [vPl95] axioms : Especial.
% English  : If X and Y are distinct points and Z is apart from the line
%            connecting X and Y, then Z is apart from the line connecting
%            Y and X.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Theorem 4.4.iii [vPl95]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.08 v6.0.0, 0.25 v5.5.0, 0.17 v5.3.0, 0.22 v5.2.0, 0.29 v5.0.0, 0.15 v4.1.0, 0.17 v4.0.1, 0.26 v4.0.0, 0.25 v3.7.0, 0.29 v3.5.0, 0.25 v3.4.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   15 (   3 unit)
%            Number of atoms       :   38 (   0 equality)
%            Maximal formula depth :    9 (   5 average)
%            Number of connectives :   30 (   7 ~  ;   9  |;   1  &)
%                                         (   0 <=>;  13 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 2-2 arity)
%            Number of functors    :    2 (   0 constant; 2-2 arity)
%            Number of variables   :   36 (   0 singleton;  36 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO006+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [X,Y,Z] :
      ( distinct_points(X,Y)
     => ( apart_point_and_line(Z,line_connecting(X,Y))
       => apart_point_and_line(Z,line_connecting(Y,X)) ) ) )).

%------------------------------------------------------------------------------