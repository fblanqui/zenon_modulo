%------------------------------------------------------------------------------
% File     : CSR115+30 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Commonsense Reasoning
% Problem  : Which British company was taken over by BMW in 1994?
% Version  : [Pel09] axioms.
% English  :

% Refs     : [Glo07] Gloeckner (2007), University of Hagen at CLEF 2007: An
%          : [PW07]  Pelzer & Wernhard (2007), System Description: E-KRHype
%          : [FG+08] Furbach et al. (2008), LogAnswer - A Deduction-Based Q
%          : [Pel09] Pelzer (2009), Email to Geoff Sutcliffe
% Source   : [Pel09]
% Names    : synth_qa07_007_mira_news_1206_tptp [Pel09]

% Status   : Theorem
% Rating   : 0.36 v6.0.0, 0.50 v5.5.0, 0.42 v5.4.0, 0.39 v5.3.0, 0.48 v5.2.0, 0.36 v5.0.0, 0.35 v4.1.0, 0.39 v4.0.1, 0.42 v4.0.0
% Syntax   : Number of formulae    : 10189 (10061 unit)
%            Number of atoms       : 10835 (   0 equality)
%            Maximal formula depth :  131 (   1 average)
%            Number of connectives :  646 (   0   ~;  18   |; 502   &)
%                                         (   0 <=>; 126  =>;   0  <=)
%                                         (   0 <~>;   0  ~|;   0  ~&)
%            Number of predicates  :   88 (   0 propositional; 2-6 arity)
%            Number of functors    : 16654 (16653 constant; 0-2 arity)
%            Number of variables   :  475 (   0 sgn; 405   !;  70   ?)
%            Maximal term depth    :    5 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : The different versions of this problem stem from the use of
%            different text snippet retrieval modules, and different snippets
%            being found. The problem tries to prove the questions from the
%            snippet and the background knowledge.
%------------------------------------------------------------------------------
%----Include LogAnswer axioms
include('Axioms/CSR004+0.ax').
%------------------------------------------------------------------------------
fof(synth_qa07_007_mira_news_1206,conjecture,(
    ? [X0,X1,X2,X3,X4,X5,X6] :
      ( attr(X0,X1)
      & attr(X3,X2)
      & attr(X4,X5)
      & has_card_leq(X6,int1994)
      & sub(X5,jahr__1_1)
      & val(X5,X6) ) )).

fof(ave07_era5_synth_qa07_007_mira_news_1206,hypothesis,
    ( tupl_p6(c279,c69,c78,c83,c88,c96)
    & sub(c69,zeitraum_1_1)
    & sub(c73,anfang_1_1)
    & assoc(c78,c73)
    & attr(c78,c79)
    & sub(c79,jahr__1_1)
    & val(c79,c74)
    & sub(c83,bmw_1_1)
    & sub(c88,kurs_1_1)
    & quant_p3(c96,c92,mark_1_1)
    & sort(c279,ent)
    & card(c279,card_c)
    & etype(c279,etype_c)
    & fact(c279,real)
    & gener(c279,gener_c)
    & quant(c279,quant_c)
    & refer(c279,refer_c)
    & varia(c279,varia_c)
    & sort(c69,ta)
    & card(c69,int1)
    & etype(c69,int0)
    & fact(c69,real)
    & gener(c69,sp)
    & quant(c69,one)
    & refer(c69,det)
    & varia(c69,con)
    & sort(c78,t)
    & card(c78,int1)
    & etype(c78,int0)
    & fact(c78,real)
    & gener(c78,sp)
    & quant(c78,one)
    & refer(c78,det)
    & varia(c78,con)
    & sort(c83,d)
    & card(c83,int1)
    & etype(c83,int0)
    & fact(c83,real)
    & gener(c83,sp)
    & quant(c83,one)
    & refer(c83,det)
    & varia(c83,con)
    & sort(c88,ad)
    & sort(c88,d)
    & sort(c88,io)
    & card(c88,int1)
    & etype(c88,int0)
    & fact(c88,real)
    & gener(c88,gener_c)
    & quant(c88,one)
    & refer(c88,refer_c)
    & varia(c88,varia_c)
    & sort(c96,co)
    & sort(c96,m)
    & card(c96,card_c)
    & etype(c96,etype_c)
    & fact(c96,real)
    & gener(c96,gener_c)
    & quant(c96,quant_c)
    & refer(c96,refer_c)
    & varia(c96,con)
    & sort(zeitraum_1_1,ta)
    & card(zeitraum_1_1,int1)
    & etype(zeitraum_1_1,int0)
    & fact(zeitraum_1_1,real)
    & gener(zeitraum_1_1,ge)
    & quant(zeitraum_1_1,one)
    & refer(zeitraum_1_1,refer_c)
    & varia(zeitraum_1_1,varia_c)
    & sort(c73,ad)
    & sort(c73,io)
    & card(c73,int1)
    & etype(c73,int0)
    & fact(c73,real)
    & gener(c73,gener_c)
    & quant(c73,one)
    & refer(c73,refer_c)
    & varia(c73,varia_c)
    & sort(anfang_1_1,ad)
    & sort(anfang_1_1,io)
    & card(anfang_1_1,int1)
    & etype(anfang_1_1,int0)
    & fact(anfang_1_1,real)
    & gener(anfang_1_1,ge)
    & quant(anfang_1_1,one)
    & refer(anfang_1_1,refer_c)
    & varia(anfang_1_1,varia_c)
    & sort(c79,me)
    & sort(c79,oa)
    & sort(c79,ta)
    & card(c79,card_c)
    & etype(c79,etype_c)
    & fact(c79,real)
    & gener(c79,sp)
    & quant(c79,quant_c)
    & refer(c79,refer_c)
    & varia(c79,varia_c)
    & sort(jahr__1_1,me)
    & sort(jahr__1_1,oa)
    & sort(jahr__1_1,ta)
    & card(jahr__1_1,card_c)
    & etype(jahr__1_1,etype_c)
    & fact(jahr__1_1,real)
    & gener(jahr__1_1,ge)
    & quant(jahr__1_1,quant_c)
    & refer(jahr__1_1,refer_c)
    & varia(jahr__1_1,varia_c)
    & sort(c74,nu)
    & card(c74,int1994)
    & sort(bmw_1_1,d)
    & card(bmw_1_1,int1)
    & etype(bmw_1_1,int0)
    & fact(bmw_1_1,real)
    & gener(bmw_1_1,ge)
    & quant(bmw_1_1,one)
    & refer(bmw_1_1,refer_c)
    & varia(bmw_1_1,varia_c)
    & sort(kurs_1_1,ad)
    & sort(kurs_1_1,d)
    & sort(kurs_1_1,io)
    & card(kurs_1_1,int1)
    & etype(kurs_1_1,int0)
    & fact(kurs_1_1,real)
    & gener(kurs_1_1,ge)
    & quant(kurs_1_1,one)
    & refer(kurs_1_1,refer_c)
    & varia(kurs_1_1,varia_c)
    & sort(c92,nu)
    & card(c92,int929)
    & sort(mark_1_1,me)
    & gener(mark_1_1,ge) )).

%------------------------------------------------------------------------------