%------------------------------------------------------------------------------
% File     : GEO253+1 : TPTP v6.1.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Characteristic property of parallel lines
% Version  : [vPl98] axioms : Especial.
% English  :

% Refs     : [vPl98] von Plato (1998), A Constructive Theory of Ordered Aff
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    : Corollary 5.12 [vPl98]

% Status   : Theorem
% Rating   : 0.00 v5.3.0, 0.09 v5.2.0, 0.07 v5.0.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   32 (   7 unit)
%            Number of atoms       :  103 (   0 equality)
%            Maximal formula depth :   13 (   6 average)
%            Number of connectives :   88 (  17 ~  ;  24  |;  25  &)
%                                         (   5 <=>;  17 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   12 (   0 propositional; 1-4 arity)
%            Number of functors    :    4 (   0 constant; 1-2 arity)
%            Number of variables   :   74 (   0 singleton;  74 !;   0 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
include('Axioms/GEO007+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [A,B,L] :
      ( ( apart_point_and_line(A,L)
        & ~ apart_point_and_line(B,parallel_through_point(L,A)) )
     => apart_point_and_line(B,L) ) )).

%------------------------------------------------------------------------------