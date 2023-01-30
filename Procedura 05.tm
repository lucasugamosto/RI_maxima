<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA CHE CALCOLA LA MATRICE DI ROTAZIONE UTILIZZANDO LA MATRICE
  ANTISIMMETRICA E LA TRASFORMATA DI LAPLACE.

  Scrivere una procedura che utilizzando la trasformata di Laplace calcoli la
  matrice di rotazione intorno all'asse rappresentato dal versore \Pv\Q, di
  un angolo \<theta\>, cioè <math|R<rsub|z><around*|(|\<theta\>|)>=e<rsup|S<around*|(|v|)>.\<theta\>>>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      matAntisimmetrica(v):=block(

      [S],

      /*controllare che l'elemento passato in ingresso sia un vettore*/

      if scalarp(v) = true or listp(v) = true then return(0),

      \;

      S:matrix([0,-v[3,1],v[2,1]],[v[3,1],0,-v[1,1]],[-v[2,1],v[1,1],0]),

      return(S)

      )

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><math-up|matAntisimmetrica><around*|(|v|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|S|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|v|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|v|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-v<rsub|3,1>>|<cell|v<rsub|2,1>>>|<row|<cell|v<rsub|3,1>>|<cell|0>|<cell|-v<rsub|1,1>>>|<row|<cell|-v<rsub|2,1>>|<cell|v<rsub|1,1>>|<cell|0>>>>>,<math-up|return><around*|(|S|)>|)>>>
    </unfolded-io>

    \;

    <\with|color|black>
      \;

      La funzione \PcalcoloVettore\Q riceve in input una matrice, verifica se
      è antisimmetrica e determina il vettore corrispondente che la crea.
    </with>

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      calcoloVettore(S):=block(

      [transposeS,mat],

      if scalarp(S) = true or listp(S) = true then return(-1),

      \;

      /*controllare che la matrice inserite in ingresso sia antisimmetrica*/

      if S[1,1] # 0 or S[2,2] # 0 or S[3,3] # 0 then return(0),

      transposeS:transpose(S),

      mat:-S,

      if transposeS # mat then return(0),

      v:matrix([S[3,2]],[S[1,3]],[S[2,1]]),

      return(v)

      )$
    </input>

    <\with|color|black>
      \;
    </with>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      calcoloVersore(vettore):=block(

      [norma2,e],

      /*controllare che il parametro inserito in ingresso sia una matrice*/

      if scalarp(vettore) = true or listp(vettore) = true then return(-1),

      \;

      /*calcolare la norma2 del vettore inserito in ingresso*/

      norma2:sqrt((vettore[1,1]^2)+(vettore[2,1]^2)+(vettore[3,1]^2)),

      \;

      /*controllare che il vettore inserito non sia composto da soli zeri*/

      if norma2 = 0 then return(0),

      \;

      if norma2 # 1 then e:(1/norma2)*vettore else e:vettore,

      return(e)

      )$
    </input>

    <\textput>
      \;

      \;

      La funzione \PmatRotazione\Q riceve in ingresso due parametri, una
      matrice di dimensione 3x1 ed uno scalare, e calcola la matrice di
      rotazione R per mezzo della trasformata di Laplace:
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      matRotazione(vettore,angolo):=block(

      [e,S,norma2,II,sII,sIImS,sIImSInv,R],

      /*calcolo del versore a partire dal vettore dato*/

      e:calcoloVersore(vettore),

      \;

      /*la funzione calcoloVersore restituisce -1 se il parametro in input
      non è un vettore o 0 se è un vettore identicamente nullo*/

      if e = 0 or e = -1 then return(-1),

      \;

      /*calcolare la matrie antisimmetrica generata dal versore e*/

      S:matAntisimmetrica(e),

      \;

      /*controllare il tipo di dato del secondo parametro in ingresso*/

      if listp(angolo) = true or matrixp(angolo) = true then return(-1),

      \;

      /*Normalizzare l'angolo nel caso fosse necessario (norma2 # 1)*/

      norma2:sqrt((vettore[1,1]^2)+(vettore[2,1]^2)+(vettore[3,1]^2)),

      if norma2 # 1 then angolo:norma2*angolo,

      \;

      /*per calcolare la matrice di rotazione si calcola la trasformata
      inversa di Laplace della matrice sI-S*/

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      sII:s*II,

      sIImS:sII-S,

      sIImSInv:trigsimp(factor(invert(sIImS))),

      R:matrix([ilt(sIImSInv[1,1],s,t),ilt(sIImSInv[1,2],s,t),ilt(sIImSInv[1,3],s,t)],[ilt(sIImSInv[2,1],s,t),ilt(sIImSInv[2,2],s,t),ilt(sIImSInv[2,3],s,t)],[ilt(sIImSInv[3,1],s,t),ilt(sIImSInv[3,2],s,t),ilt(sIImSInv[3,3],s,t)]),

      R:subst(t=angolo,R),

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ R[i,j]:trigsimp(R[i,j])

      \ )

      ),

      radR:float(R),

      return([R,radR])

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      matRotazione(matrix([1],[0],[0]),%pi/2)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>|<row|<cell|0>|<cell|1>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|1.0>|<cell|0.0>|<cell|0.0>>|<row|<cell|0.0>|<cell|0.0>|<cell|-1.0>>|<row|<cell|0.0>|<cell|1.0>|<cell|0.0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      matRotazione(matrix([0],[1],[0]),%pi)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>>>>,<matrix|<tformat|<table|<row|<cell|-1.0>|<cell|0.0>|<cell|0.0>>|<row|<cell|0.0>|<cell|1.0>|<cell|0.0>>|<row|<cell|0.0>|<cell|0.0>|<cell|-1.0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      matRotazione(matrix([0],[0],[1]),%pi/3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|2>>|<cell|-<frac|<sqrt|3>|2>>|<cell|0>>|<row|<cell|<frac|<sqrt|3>|2>>|<cell|<frac|1|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|0.5>|<cell|-0.8660254037844386>|<cell|0.0>>|<row|<cell|0.8660254037844386>|<cell|0.5>|<cell|0.0>>|<row|<cell|0.0>|<cell|0.0>|<cell|1.0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      matRotazione(matrix([1],[1],[0]),%pi)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|cos
      <around*|(|<sqrt|2>*\<pi\>|)>+1|2>>|<cell|-<frac|cos
      <around*|(|<sqrt|2>*\<pi\>|)>-1|2>>|<cell|<frac|sin
      <around*|(|<sqrt|2>*\<pi\>|)>|<sqrt|2>>>>|<row|<cell|-<frac|cos
      <around*|(|<sqrt|2>*\<pi\>|)>-1|2>>|<cell|<frac|cos
      <around*|(|<sqrt|2>*\<pi\>|)>+1|2>>|<cell|-<frac|sin
      <around*|(|<sqrt|2>*\<pi\>|)>|<sqrt|2>>>>|<row|<cell|-<frac|sin
      <around*|(|<sqrt|2>*\<pi\>|)>|<sqrt|2>>>|<cell|<frac|sin
      <around*|(|<sqrt|2>*\<pi\>|)>|<sqrt|2>>>|<cell|cos
      <around*|(|<sqrt|2>*\<pi\>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|0.3668723289792922>|<cell|0.6331276710207079>|<cell|-0.6815820173810371>>|<row|<cell|0.6331276710207079>|<cell|0.3668723289792922>|<cell|0.6815820173810371>>|<row|<cell|0.6815820173810371>|<cell|-0.6815820173810371>|<cell|-0.2662553420414157>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      matRotazione(matrix([a],[1],[0]),theta)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|cos
      <around*|(|<sqrt|a<rsup|2>+1>*\<vartheta\>|)>+a<rsup|2>|a<rsup|2>+1>>|<cell|-<frac|a*cos
      <around*|(|<sqrt|a<rsup|2>+1>*\<vartheta\>|)>-a|a<rsup|2>+1>>|<cell|<frac|sin
      <around*|(|<sqrt|a<rsup|2>+1>*\<vartheta\>|)>|<sqrt|a<rsup|2>+1>>>>|<row|<cell|-<frac|a*cos
      <around*|(|<sqrt|a<rsup|2>+1>*\<vartheta\>|)>-a|a<rsup|2>+1>>|<cell|<frac|a<rsup|2>*cos
      <around*|(|<sqrt|a<rsup|2>+1>*\<vartheta\>|)>+1|a<rsup|2>+1>>|<cell|-<frac|a*sin
      <around*|(|<sqrt|a<rsup|2>+1>*\<vartheta\>|)>|<sqrt|a<rsup|2>+1>>>>|<row|<cell|-<frac|sin
      <around*|(|<sqrt|a<rsup|2>+1>*\<vartheta\>|)>|<sqrt|a<rsup|2>+1>>>|<cell|<frac|a*sin
      <around*|(|<sqrt|a<rsup|2>+1>*\<vartheta\>|)>|<sqrt|a<rsup|2>+1>>>|<cell|cos
      <around*|(|<sqrt|a<rsup|2>+1>*\<vartheta\>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|<frac|cos
      <around*|(|<sqrt|a<rsup|2>+1.0>*\<vartheta\>|)>+a<rsup|2>|a<rsup|2>+1.0>>|<cell|-<frac|1.0*<around*|(|a*cos
      <around*|(|<sqrt|a<rsup|2>+1.0>*\<vartheta\>|)>-1.0*a|)>|a<rsup|2>+1.0>>|<cell|<frac|sin
      <around*|(|<sqrt|a<rsup|2>+1.0>*\<vartheta\>|)>|<sqrt|a<rsup|2>+1.0>>>>|<row|<cell|-<frac|1.0*<around*|(|a*cos
      <around*|(|<sqrt|a<rsup|2>+1.0>*\<vartheta\>|)>-1.0*a|)>|a<rsup|2>+1.0>>|<cell|<frac|a<rsup|2>*cos
      <around*|(|<sqrt|a<rsup|2>+1.0>*\<vartheta\>|)>+1.0|a<rsup|2>+1.0>>|<cell|-<frac|1.0*a*sin
      <around*|(|<sqrt|a<rsup|2>+1.0>*\<vartheta\>|)>|<sqrt|a<rsup|2>+1.0>>>>|<row|<cell|-<frac|1.0*sin
      <around*|(|<sqrt|a<rsup|2>+1.0>*\<vartheta\>|)>|<sqrt|a<rsup|2>+1.0>>>|<cell|<frac|a*sin
      <around*|(|<sqrt|a<rsup|2>+1.0>*\<vartheta\>|)>|<sqrt|a<rsup|2>+1.0>>>|<cell|cos
      <around*|(|<sqrt|a<rsup|2>+1.0>*\<vartheta\>|)>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      matRotazione(matrix([0],[0],[0]),theta)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>-1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      matRotazione(matrix([1],[0],[0]),[alpha,beta])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>-1>>
    </unfolded-io>
  </session>

  <math|><math|>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>