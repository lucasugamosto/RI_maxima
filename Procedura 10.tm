<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA CHE IMPLEMENTA LA PARAMETRIZZAZIONE DI CAYLEY PER IL CALCOLO
  DELLA MATRICE DI ROTAZIONE (calcolo diretto) E PER IL CALCOLO DELLA MATRICE
  ANTISIMMETRICA (calcolo inverso).

  <with|color|black|Procedura che prende in ingresso un vettore e genera la
  matrice di rotazione R tramite la parametrizzazione di Cayley, se possibile
  (quindi controllare se la matrice I-S(a) è o meno invertibile, cioè ha
  determinante diverso da zero).>

  -Calcolo diretta che consiste nel calcolo di:
  <math|R<rsub|w>=<around*|(|I+S<around*|(|w|)>|)>*<around*|(|1-S<around*|(|w|)>|)><rsup|-1>>
  dato il vettore <math|w>.

  Dati in input angolo e versore, si calcola il valore di \<alpha\> per cui
  si otttiene l'angolo desiderato e si moltiplica per il versore, così da
  avere il vettore associato che si inserisce all'interno del codice.

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      eq1:(2*alpha)/(1+alpha^2) = sin(sqrt(3)/2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><frac|2*\<alpha\>|\<alpha\><rsup|2>+1>=sin
      <around*|(|<frac|<sqrt|3>|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      value:solve([eq1],alpha)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|\<alpha\>=-<frac|<sqrt|1-sin
      <around*|(|<frac|<sqrt|3>|2>|)><rsup|2>>-1|sin
      <around*|(|<frac|<sqrt|3>|2>|)>>,\<alpha\>=<frac|<sqrt|1-sin
      <around*|(|<frac|<sqrt|3>|2>|)><rsup|2>>+1|sin
      <around*|(|<frac|<sqrt|3>|2>|)>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      value:float(value)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|\<alpha\>=0.4622724529225485,\<alpha\>=2.16322645590899|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      eq2:(1-alpha^2)/(1+alpha^2) = cos(sqrt(3)/2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><frac|1-\<alpha\><rsup|2>|\<alpha\><rsup|2>+1>=cos
      <around*|(|<frac|<sqrt|3>|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      value2:solve([eq2],alpha)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|\<alpha\>=-<frac|<sqrt|1-cos
      <around*|(|<frac|<sqrt|3>|2>|)>>|<sqrt|cos
      <around*|(|<frac|<sqrt|3>|2>|)>+1>>,\<alpha\>=<frac|<sqrt|1-cos
      <around*|(|<frac|<sqrt|3>|2>|)>>|<sqrt|cos
      <around*|(|<frac|<sqrt|3>|2>|)>+1>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      value2:float(value)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|\<alpha\>=0.4622724529225485,\<alpha\>=2.16322645590899|]>>>
    </unfolded-io>

    \;

    Quindi per avere come angolo \<theta\> la quantità \<pi\>/3 devo
    scegliere \<alpha\>=1/<sqrt|3>.

    Successivamente definisco il vettore da passare in input alla funzione
    che calcola R nel seguente modo, dove
    e=versore=[1/<sqrt|2>,1/<sqrt|2>,0]<math|<rsup|T>>.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      vettore:(((sqrt(1-sin (((sqrt(3))/2))^2)+1)/(sin
      (((sqrt(3))/2)))))*matrix([1],[0],[0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|<frac|<sqrt|1-sin
      <around*|(|<frac|<sqrt|3>|2>|)><rsup|2>>+1|sin
      <around*|(|<frac|<sqrt|3>|2>|)>>>>|<row|<cell|0>>|<row|<cell|0>>>>>>>
    </unfolded-io>

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

      R:trigsimp(R),

      return([R,radR])

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      R:calcoloR(vettore)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-<frac|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>-<math-up|vettore><rsub|1,1><rsup|2>-1|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1>>|<cell|-<frac|2*<math-up|vettore><rsub|3,1>-2*<math-up|vettore><rsub|1,1>*<math-up|vettore><rsub|2,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1>>|<cell|<frac|2*<math-up|vettore><rsub|1,1>*<math-up|vettore><rsub|3,1>+2*<math-up|vettore><rsub|2,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1>>>|<row|<cell|<frac|2*<math-up|vettore><rsub|3,1>+2*<math-up|vettore><rsub|1,1>*<math-up|vettore><rsub|2,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1>>|<cell|-<frac|<math-up|vettore><rsub|3,1><rsup|2>-<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>-1|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1>>|<cell|<frac|2*<math-up|vettore><rsub|2,1>*<math-up|vettore><rsub|3,1>-2*<math-up|vettore><rsub|1,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1>>>|<row|<cell|<frac|2*<math-up|vettore><rsub|1,1>*<math-up|vettore><rsub|3,1>-2*<math-up|vettore><rsub|2,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1>>|<cell|<frac|2*<math-up|vettore><rsub|2,1>*<math-up|vettore><rsub|3,1>+2*<math-up|vettore><rsub|1,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1>>|<cell|<frac|<math-up|vettore><rsub|3,1><rsup|2>-<math-up|vettore><rsub|2,1><rsup|2>-<math-up|vettore><rsub|1,1><rsup|2>+1|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1>>>>>>,<matrix|<tformat|<table|<row|<cell|-<frac|1.0*<math-up|vettore><rsub|3,1><rsup|2>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>-<frac|1.0*<math-up|vettore><rsub|2,1><rsup|2>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>+<frac|<math-up|vettore><rsub|1,1><rsup|2>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>+<frac|1|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>>|<cell|-2.0*<around*|(|<frac|<math-up|vettore><rsub|3,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>-<frac|1.0*<math-up|vettore><rsub|1,1>*<math-up|vettore><rsub|2,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>|)>>|<cell|2.0*<around*|(|<frac|<math-up|vettore><rsub|1,1>*<math-up|vettore><rsub|3,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>+<frac|<math-up|vettore><rsub|2,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>|)>>>|<row|<cell|2.0*<around*|(|<frac|<math-up|vettore><rsub|3,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>+<frac|<math-up|vettore><rsub|1,1>*<math-up|vettore><rsub|2,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>|)>>|<cell|-<frac|1.0*<math-up|vettore><rsub|3,1><rsup|2>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>+<frac|<math-up|vettore><rsub|2,1><rsup|2>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>-<frac|1.0*<math-up|vettore><rsub|1,1><rsup|2>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>+<frac|1|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>>|<cell|2.0*<around*|(|<frac|<math-up|vettore><rsub|2,1>*<math-up|vettore><rsub|3,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>-<frac|1.0*<math-up|vettore><rsub|1,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>|)>>>|<row|<cell|2.0*<around*|(|<frac|<math-up|vettore><rsub|1,1>*<math-up|vettore><rsub|3,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>-<frac|1.0*<math-up|vettore><rsub|2,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>|)>>|<cell|2.0*<around*|(|<frac|<math-up|vettore><rsub|2,1>*<math-up|vettore><rsub|3,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>+<frac|<math-up|vettore><rsub|1,1>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>|)>>|<cell|<frac|<math-up|vettore><rsub|3,1><rsup|2>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>-<frac|1.0*<math-up|vettore><rsub|2,1><rsup|2>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>-<frac|1.0*<math-up|vettore><rsub|1,1><rsup|2>|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>+<frac|1|<math-up|vettore><rsub|3,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|1,1><rsup|2>+1.0>>>>>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      \;
    </input>
  </session>

  <\with|color|black>
    Procedura che prende in ingresso una matrice, controlla se sia di
    rotazione, ed in caso affermativo genera una matrice anti-simmetrica S,
    da cui trovare poi il versore che funge da asse di rotazione.
  </with>

  Procedura inversa che consiste nel calcolo dell'asse <math|w> e dell'angolo
  \<theta\>, data una matrice di rotazione R e la formula inversa di Cayley:
  <math|S<around*|(|w|)>=<around*|(|R<rsub|w>-I|)>*<around*|(|R<rsub|w>+I|)><rsup|-1>>.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      calcoloAsseAngolo(R):=block(

      [transposeR,finalR,II,det,RpII,RmII,RpIIInv,S,e,norma2,Seno,Coseno,theta],

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

      \;

      /*calcolo angolo di rotazione utilizzando alpha (che corrisponde alla
      norma2 del vettore trovato prima*/

      Seno:(2*norma2)/(1+norma2^2),

      Coseno:(1-norma2^2)/(1+norma2^2),

      theta:ATAN2(Seno,Coseno),

      return([e,theta])

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
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

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      calcoloAsseAngolo(R[1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|0>>>>>,<frac|\<pi\>|3>|]>>>
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