<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA: Utilizzando gli autovalori e gli autovettori si calcoli la
  matrice di rotazione intorno all'asse rappresentato dal versore \Pv\Q, di
  un angolo \<theta\>, cioè deve valere: <math|S<around*|(|v|)>=V.\<Lambda\>.V<rsup|-1>,R<rsub|v><around*|(|\<theta\>|)>=V.e<rsup|\<Lambda\>*\<theta\>>.V<rsup|-1>>.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      calcoloVersore(vettore):=block(

      [norma2,e],

      /*verificaRE che il parametro in ingresso sia di tipo matriciale*/

      if scalarp(vettore) = true or listp(vettore) = true then return(0),

      \;

      norma2:sqrt((vettore[1,1]^2)+(vettore[2,1]^2)+(vettore[3,1]^2)),

      if norma2 = 0 then return(0),

      if norma2 # 1 then e:(1/norma2)*vettore else e:vettore,

      return(e)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      matAntisimmetrica(vettore):=block(

      [S],

      /*controllare che il parametro in ingresso sia un vettore*/

      if scalarp(vettore) = true or listp(vettore) = true then return(0),

      \;

      S:matrix([0,-vettore[3,1],vettore[2,1]],[vettore[3,1],0,-vettore[1,1]],[-vettore[2,1],vettore[1,1],0]),

      return(factor(S))

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      calcoloMatriceAutovettori(S):=block(

      [II,sII,sIImS,polS,autovalori,adj,adj1,adj2,adj3,aut1,aut2,aut3,matAutovettori],

      \;

      /*verificare che il parametro in ingresso sia una matrice*/

      if scalarp(S) = true or listp(S) = true then return(-1),

      \;

      /*calcolare il polinomio caratteristico della matrice sII-S*/

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      sII:s*II,

      sIImS:sII-S,

      polS:fullratsimp(determinant(sIImS)),

      \;

      /*calcolo degli autovalori a partire dal polinomio calcolato e
      successivamente dell'aggiunta della matrice sII-S in cui si vanno ad
      inserire i valori degli autovalori al posto della variabile s*/

      autovalori:solve(polS,s),

      adj:adjoint(sIImS),

      adj1:subst(autovalori[1],adj),

      adj2:subst(autovalori[2],adj),

      adj3:subst(autovalori[3],adj),

      \;

      /*calcolo della matrice degli autovalori composta da: una colonna viene
      presa tra quelle della matrice dell'aggiunta 1 che sia diversa da zero,
      una colonna viene presa tra quelle della matrice dell'aggiunta 2 che
      sia diversa da zero e una colonna tra quelle della matrice
      dell'aggiunta 3 che sia diverda da zero*/

      aut0:matrix([0],[0],[0]),

      for i:1 thru 3 do (

      \ aut1:matrix([adj1[1,i]],[adj1[2,i]],[adj1[3,i]]),

      \ if aut1 # aut0 then return(aut1)

      ),

      if aut1 = aut0 then return(0),

      \;

      for i:1 thru 3 do (

      \ aut2:matrix([adj2[1,i]],[adj2[2,i]],[adj2[3,i]]),

      \ if aut2 # aut0 then return(aut2)

      ),

      if aut2 = aut0 then return(0),

      \ 

      for i:1 thru 3 do (

      \ aut3:matrix([adj3[1,i]],[adj3[2,i]],[adj3[3,i]]),

      \ if aut3 # aut0 then return(aut3)

      ),

      if aut3 = aut0 then return(0),

      \ 

      matAutovettori:matrix([aut1[1,1],aut2[1,1],aut3[1,1]],[aut1[2,1],aut2[2,1],aut3[2,1]],[aut1[3,1],aut2[3,1],aut3[3,1]]),

      \;

      return(trigsimp(factor(matAutovettori)))

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      calcoloMatriceAutovalori(S):=block(

      [II,sII,sIImS,polS,autovalori,mat1,mat2,mat3,matAutovalori],

      \;

      /*controllare il tipo di dato del parametro in ingresso*/

      if scalarp(S) = true or listp(S) = true then return(-1),

      \;

      /*calcolare il polinomio caratteristico della matrice sII-S e
      successivamente calcolo degli autovalori*/

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      sII:s*II,

      sIImS:sII-S,

      polS:fullratsimp(determinant(sIImS)),

      autovalori:solve(polS,s),

      \;

      /*creazione della matrice degli autovalori*/

      mat1:matrix([s,0,0],[0,0,0],[0,0,0]),

      mat2:matrix([0,0,0],[0,s,0],[0,0,0]),

      mat3:matrix([0,0,0],[0,0,0],[0,0,s]),

      mat1:subst(autovalori[1],mat1),

      mat2:subst(autovalori[2],mat2),

      mat3:subst(autovalori[3],mat3),

      matAutovalori:mat1+mat2+mat3,

      return(matAutovalori)

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

    \;

    La funzione \PmatriceDiRotazione\Q riceve in ingresso un vettore \Pv\Q ed
    uno scalare \Pangolo\Q, e calcola la matrice di rotazione R per mezzo
    delle matrici degli autovalori e degli autovettori.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      matriceDiRotazione(vettore,angolo):=block(

      [e,norma2,S,matAutovettori,matAutovettoriInv,matAutovalori,matEsponenziale,R],

      /*la funzione seguente torna 0 se il vettore non è una matrice o se è
      un vettore identicamente nullo*/

      e:calcoloVersore(vettore),

      if e = 0 then return(0),

      S:matAntisimmetrica(e),

      \;

      /*normalizzazione dell'angolo se il vettore non è un versore*/

      norma2:sqrt((vettore[1,1]^2)+(vettore[2,1]^2)+(vettore[3,1]^2)),

      if norma2 # 1 then angolo:norma2*angolo,

      \;

      /*calcolo di tutte le matrici necessarie per calcolare la matrice di
      rotazione R finale*/

      matAutovettori:calcoloMatriceAutovettori(S),

      matAutovettoriInv:trigsimp(factor(invert(matAutovettori))),

      matAutovalori:calcoloMatriceAutovalori(S),

      matEsponenziale:matrix([exp(matAutovalori[1,1]*angolo),0,0],[0,exp(matAutovalori[2,2]*angolo),0],[0,0,exp(matAutovalori[3,3]*angolo)]),

      \;

      R:trigsimp(factor(matEsponenziale.matAutovettoriInv)),

      R:trigsimp(factor(matAutovettori.R)),

      \;

      /*La funzione "demoivre" permette di trasformare l'esponenziale in seno
      e coseno*/

      R:trigsimp(trigreduce(factor(demoivre(R)))),

      radR:float(R),

      return([R,radR])

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      R:matriceDiRotazione(matrix([1],[0],[0]),theta)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|1.0>|<cell|0.0>|<cell|0.0>>|<row|<cell|0.0>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-1.0*sin
      <around*|(|\<vartheta\>|)>>>|<row|<cell|0.0>|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      R:matriceDiRotazione(matrix([0],[1],[0]),%pi)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>>>>,<matrix|<tformat|<table|<row|<cell|-1.0>|<cell|0.0>|<cell|0.0>>|<row|<cell|0.0>|<cell|1.0>|<cell|0.0>>|<row|<cell|0.0>|<cell|0.0>|<cell|-1.0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      R:matriceDiRotazione(matrix([0],[0],[1]),%pi/3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|2>>|<cell|-<frac|<sqrt|3>|2>>|<cell|0>>|<row|<cell|<frac|<sqrt|3>|2>>|<cell|<frac|1|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|0.5>|<cell|-0.8660254037844386>|<cell|0.0>>|<row|<cell|0.8660254037844386>|<cell|0.5>|<cell|0.0>>|<row|<cell|0.0>|<cell|0.0>|<cell|1.0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      R:matriceDiRotazione(matrix([1],[1],[0]),%pi)
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
      R:matriceDiRotazione(matrix([1],[0],[1]),%pi)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|cos
      <around*|(|<sqrt|2>*\<pi\>|)>+1|2>>|<cell|-<frac|sin
      <around*|(|<sqrt|2>*\<pi\>|)>|<sqrt|2>>>|<cell|-<frac|cos
      <around*|(|<sqrt|2>*\<pi\>|)>-1|2>>>|<row|<cell|<frac|sin
      <around*|(|<sqrt|2>*\<pi\>|)>|<sqrt|2>>>|<cell|cos
      <around*|(|<sqrt|2>*\<pi\>|)>>|<cell|-<frac|sin
      <around*|(|<sqrt|2>*\<pi\>|)>|<sqrt|2>>>>|<row|<cell|-<frac|cos
      <around*|(|<sqrt|2>*\<pi\>|)>-1|2>>|<cell|<frac|sin
      <around*|(|<sqrt|2>*\<pi\>|)>|<sqrt|2>>>|<cell|<frac|cos
      <around*|(|<sqrt|2>*\<pi\>|)>+1|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0.3668723289792922>|<cell|0.6815820173810371>|<cell|0.6331276710207079>>|<row|<cell|-0.6815820173810371>|<cell|-0.2662553420414157>|<cell|0.6815820173810371>>|<row|<cell|0.6331276710207079>|<cell|-0.6815820173810371>|<cell|0.3668723289792922>>>>>|]>>>
    </unfolded-io>
  </session>

  \;

  \;

  Per questa procedura ho creato una serie di funzioni che svolgono ognuna un
  compito ben definito. C'è quella che calcola il versore e quella che
  calcola la matrice antisimmetrica.

  Poi si passa a funzioni più particolari che calcolano le matrici degli
  autovettori e degli autovalori.

  Gli autovettori della matrice A sono anche autovettori della matrice
  <math|e<rsup|A*t>> per cui una volta trovati posso usare le formule
  R(\<theta\>)=<math|V*e<rsup|\<Lambda\>\<theta\>>*V<rsup|-1>> per calcolare
  la matrice di rotazione intorno al vettore \Pv\Q di un certo angolo
  \<theta\>, dove l'esponente <strong|><math|\<b-Lambda\>> indica la matrice
  degli autovalori.

  La funzione DEMOIVRE permette di sostituire la funzione esponenziale in
  funzioni con seno e coseno.
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>