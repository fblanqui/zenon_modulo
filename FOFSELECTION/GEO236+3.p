%------------------------------------------------------------------------------
% File     : GEO236+3 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Geometry (Constructive)
% Problem  : Left and right apart leads to distinctness of lines
% Version  : [vPl98] axioms.
% English  :

% Refs     : [vPl98] von Plato (1998), A Constructive Theory of Ordered Aff
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
%          : [Rat07] Raths (2007), Email to Geoff Sutcliffe
% Source   : [Rat07]
% Names    : Therorem 5.2 [vPl98]

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0, 0.14 v5.0.0, 0.05 v4.1.0, 0.06 v4.0.1, 0.05 v4.0.0
% Syntax   : Number of formulae    :   37 (   6 unit)
%            Number of atoms       :  113 (   0 equality)
%            Maximal formula depth :   13 (   5 average)
%            Number of connectives :   88 (  12   ~;  23   |;  25   &)
%                                         (  10 <=>;  18  =>;   0  <=)
%                                         (   0 <~>;   0  ~|;   0  ~&)
%            Number of predicates  :   18 (   0 propositional; 1-4 arity)
%            Number of functors    :    4 (   0 constant; 1-2 arity)
%            Number of variables   :   84 (   0 sgn;  84   !;   0   ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments :
%------------------------------------------------------------------------------
include('Axioms/GEO009+0.ax').
%------------------------------------------------------------------------------
fof(con,conjecture,(
    ! [A,L,M] :
      ( ( left_apart_point(A,L)
        & right_apart_point(A,M) )
     => ( unequally_directed_lines(L,M)
        | distinct_lines(L,M) ) ) )).

%------------------------------------------------------------------------------