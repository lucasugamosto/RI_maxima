<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA CHE IMPLEMENTA LA PARAMETRIZZAZIONE DI CAYLEY PER IL CALCOLO
  DELLA MATRICE DI ROTAZIONE (calcolo diretto) E PER IL CALCOLO DELLA MATRICE
  ANTISIMMETRICA (calcolo inverso).

  <with|color|black|Procedura che prende in ingresso un versore e genera la
  matrice di rotazione R tramite la parametrizzazione di Cayley, se possibile
  (quindi controllare se la matrice I-S(a) è o meno invertibile, cioè ha
  determinante diverso da zero).>

  -Calcolo diretta che consiste nel calcolo di:
  <math|R<rsub|w>=<around*|(|I+S<around*|(|w|)>|)>*<around*|(|1-S<around*|(|w|)>|)><rsup|-1>>
  dato il vettore <math|w>.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      calcoloR(vettore):=block(

      [S,II,IImS,det,IImSInv,IIpS,R],

      \;

      /*controllare che il parametro in ingresso sia di tipo matriciale*/

      if scalarp(vettore) = true or listp(vettore) = true then return(0),

      \;

      /*calcolare la matrice antisimmetrica e dopo la matrice di rotazione*/

      S:matrix([0,-vettore[3,1],vettore[2,1]],[vettore[3,1],0,-vettore[1,1]],[-vettore[2,1],vettore[1,1],0]),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      IImS:factor(II-S),

      \;

      /*calcolare il determinante della matrice II-S e controllare se questa
      è invertibile andando ad effettuare il controllo proprio sul
      determinante*/

      det:factor(determinant(IImS)),

      if det = 0 then return(0),

      IImSInv:fullratsimp(invert(IImS)),

      IIpS:factor(II+S),

      R:trigreduce(factor(IIpS.IImSInv)),

      radR:float(R),

      return([R,radR])

      )$
    </input>

    \;
  </session>

  \;

  \;

  \;

  \;

  \;

  <\with|color|black>
    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    Procedura che prende in ingresso una matrice, controlla se sia di
    rotazione, ed in caso affermativo genera una matrice anti-simmetrica S,
    da cui trovare poi il versore che funge da asse di rotazione.
  </with>

  Procedura inversa che consiste nel calcolo dell'asse <math|w> e dell'angolo
  \<theta\>, data una matrice di rotazione R e la formula inversa di Cayley:
  <math|S<around*|(|w|)>=<around*|(|R<rsub|w>-I|)>*<around*|(|R<rsub|w>+I|)><rsup|-1>>.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      calcoloAsse(R):=block(

      [transposeR,finalR,II,det,RpII,RmII,RpIIInv,S,e],

      \;

      /*controllare che il parametro in ingresso sia una matrice*/

      if scalarp(R) = true or listp(R) = true then return(-1),

      \;

      /*controllare la dimensione della matrice inserita in ingresso*/

      if length(R) # 3 then return(-1),

      \;

      /*verificare che la matrice passata in ingresso sia di rotazione*/

      transposeR:transpose(R),

      finalR:trigreduce(trigsimp(R.transposeR)),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if finalR # II then return(0),

      det:trigsimp(determinant(R)),

      if det # 1 then return(0),

      \;

      /*controllare che la matrice R+II sia invertibile*/

      RpII:trigreduce(factor(R+II)),

      det:trigsimp(determinant(RpII)),

      if det = 0 then return(0),

      RmII:trigreduce(factor(R-II)),

      RpIIInv:trigsimp(invert(RpII)),

      \;

      S:trigsimp(trigreduce(factor(RmII.RpIIInv))),

      e:matrix([S[3,2]],[S[1,3]],[S[2,1]]),

      if e = matrix([1],[0],[0]) or e = matrix([0],[1],[0]) or e =
      matrix([0],[0],[1]) then return(e),

      \;

      norma2:sqrt((e[1,1]^2)+(e[2,1]^2)+(e[3,1]^2)),

      e:(1/norma2)*e,

      return(e)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      ATAN2(y,x):=block(

      if x = 0 and y = 0 then return(-1),

      if x = 0 and y \<gtr\> 0 then return(%pi/2),

      if x = 0 and y \<less\> 0 then return(-%pi/2),

      if y = 0 and x = -1 then return(%pi),

      if y = 0 and x = 1 then return(0),

      if x \<gtr\> 0 then return(atan(y/x)),

      if x \<less\> 0 and y \<gtr\>= 0 then return(atan(y/x)+2*%pi),

      if x \<less\> 0 and y \<less\> 0 then return(atan(y/x)-2*%pi)

      )$
    </input>

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    La funzione \PcalcoloAngolo\Q riceve in ingreso la matrice di rotazione
    generata tramite la parametrizzazione di Cayley e definisce l'angolo
    implicito che la crea:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      calcoloAngolo(R):=block(

      [transposeR,finalR,II,det,Coseno,Seno,angolo],

      \;

      /*controllare che il parametro in ingresso sia di tipo matriciale*/

      if scalarp(vettore) = true or listp(vettore) = true then return(-1),

      \;

      /*controllare che la matrice in ingresso abbia come asse di rotazione
      uno tra Ex, Ey, Ez*/

      if R[1,1] # 1 and R[2,2] # 1 and R[3,3] # 1 then return(-1),

      \;

      /*verificare che la matrice R in ingresso sia una matrice di
      rotazione*/

      transposeR:trigreduce(transpose(R)),

      finalR:trigsimp(trigreduce(factor(R.transposeR))),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if finalR # II then return(0),

      det:trigsimp(determinant(R)),

      if det = 0 then return(0),

      \;

      /*controllare a quale delle tre matrici di rotazione Rx,Ry,Rz
      assomiglia la matrice R inserita in ingresso*/

      if R[1,1] = 1 then [Coseno,Seno]:[R[2,2],R[3,2]]

      else if R[2,2] = 1 then [Coseno,Seno]:[R[1,1],R[1,3]]

      else if R[3,3] = 1 then [Coseno,Seno]:[R[1,1],R[2,1]],

      \;

      /*calcolare l'angolo di rotazione associato ad R*/

      angolo:atan2(Seno,Coseno),

      angolo:trigreduce(angolo),

      radAngolo:float(angolo),

      return([R,angolo,radAngolo])

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      R:calcoloR(matrix([5],[0],[0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|-<frac|12|13>>|<cell|-<frac|5|13>>>|<row|<cell|0>|<cell|<frac|5|13>>|<cell|-<frac|12|13>>>>>>,<matrix|<tformat|<table|<row|<cell|1.0>|<cell|0.0>|<cell|0.0>>|<row|<cell|0.0>|<cell|-0.9230769230769231>|<cell|-0.3846153846153846>>|<row|<cell|0.0>|<cell|0.3846153846153846>|<cell|-0.9230769230769231>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      calcoloAsse(R[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      calcoloAsse(R[2])
    <|unfolded-io>
      \;

      rat: replaced 1.0 by 1/1 = 1.0

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 1.0 by 1/1 = 1.0

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 1.0 by 1/1 = 1.0

      \;

      rat: replaced 1.0 by 1/1 = 1.0

      \;

      rat: replaced 2.0 by 2/1 = 2.0

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 0.07692307692307687 by 1/13 = 0.07692307692307693

      \;

      rat: replaced -0.3846153846153846 by -5/13 = -0.3846153846153846

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 0.3846153846153846 by 5/13 = 0.3846153846153846

      \;

      rat: replaced 0.07692307692307687 by 1/13 = 0.07692307692307693

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced -1.923076923076923 by -25/13 = -1.923076923076923

      \;

      rat: replaced -0.3846153846153846 by -5/13 = -0.3846153846153846

      \;

      rat: replaced 0.0 by 0/1 = 0.0

      \;

      rat: replaced 0.3846153846153846 by 5/13 = 0.3846153846153846

      \;

      rat: replaced -1.923076923076923 by -25/13 = -1.923076923076923

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      R1:calcoloR(matrix([1],[0],[0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>|<row|<cell|0>|<cell|1>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|1.0>|<cell|0.0>|<cell|0.0>>|<row|<cell|0.0>|<cell|0.0>|<cell|-1.0>>|<row|<cell|0.0>|<cell|1.0>|<cell|0.0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      calcoloAsse(R[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      calcoloAngolo(R[1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|-<frac|12|13>>|<cell|-<frac|5|13>>>|<row|<cell|0>|<cell|<frac|5|13>>|<cell|-<frac|12|13>>>>>>,\<pi\>-arctan
      <around*|(|<frac|5|12>|)>,2.746801533890031|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      calcoloAngolo(R1[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>|<row|<cell|0>|<cell|1>|<cell|0>>>>>,<frac|\<pi\>|2>,1.570796326794897|]>>>
    </unfolded-io>
  </session>

  \;

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|font-base-size|10>
    <associate|page-medium|paper>
  </collection>
</initial>