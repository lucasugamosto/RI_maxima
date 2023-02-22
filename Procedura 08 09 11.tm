<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA PER IL CALCOLO DIRETTO [(vettore,angolo) -\<gtr\> R] E PER IL
  CALCOLO INVERSO [R -\<gtr\> (vettore,angolo)] TRAMITE LA FORMULA DI
  RODRIGUES.

  <with|color|BLACK|CALCOLO DIRETTO>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      calcoloVersore(vettore):=block(

      [norma2,e],

      if scalarp(vettore) = true or listp(vettore) = true then return(0),

      \;

      norma2:sqrt((vettore[1,1]^2)+(vettore[2,1]^2)+(vettore[3,1]^2)),

      if norma2 = 0 then return(0),

      if norma2 # 1 then e:(1/norma2)*vettore else e:vettore,

      e:trigsimp(trigreduce(factor(e))),

      return(e)

      )$
    </input>

    \;

    \;

    La funzione \PmatriceDiRotazione\Q riceve in ingresso un vettore 3x1 ed
    un angolo e calcola la matrice di rotazione R, utilizzando la formula di
    Rodrigues.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      matriceDiRotazione(vettore,angolo):=block(

      [e,S,norma2,S2,II,mat1,mat2,R],

      e:calcoloVersore(vettore),

      \;

      /*la funzione precedente ritorna 0 in caso l'asse passato non è un
      vettore o se è un vettore totalmente nullo*/

      if e = 0 then return(0),

      \;

      S:matrix([0,-e[3,1],e[2,1]],[e[3,1],0,-e[1,1]],[-e[2,1],e[1,1],0]),

      \;

      /*controllare che l'angolo sia uno scalare*/

      if listp(angolo) = true or matrixp(angolo) = true then return(0),

      \;

      norma2:sqrt((vettore[1,1]^2)+(vettore[2,1]^2)+(vettore[3,1]^2)),

      if norma2 # 1 then angolo:norma2*angolo,

      \;

      /*calcolo la matrice di rotazione tramite la formula di Rodrigues*/

      S2:S.S,

      S2:trigsimp(trigreduce(factor(S2))),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      mat1:factor(sin(angolo)*S),

      mat2:factor((1-cos(angolo))*S2),

      R:II+mat1+mat2,

      R:trigrat(trigreduce(factor(R))),

      radR:float(R),

      return([R,radR])

      )$
    </input>

    \;

    La funzione \Pfactor\Q fattorizza l'espressione passata in ingresso,
    contenente un qualsiasi numero di variabili o funzioni, in fattori
    irriducibili.

    La funzione \Ptrigreduce\Q semplifica i prodotti e le potenze di seni e
    coseni dell'espressione passata in ingresso.

    La funzione \Ptrigrat\Q restituisce un'espressione semplificata con
    numeratore e denominatore lineare in seno e coseno, in questo caso
    specifico è stata usata per effetttuare somma e/o sottrazione di angoli
    in seni e coseni.

    \;

    \;

    \;

    \;

    CALCOLO INVERSO

    \;

    La funzione \PcalcoloValore\Q scorre gli elementi delle matrici passate
    in ingresso e restituisce le coordinate della posizione in cui il valore
    è non nullo in entrambe.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      calcoloValore(mat1,mat2):=block(

      [value,i,j,x,y],

      /*controllare il tipo di dato degli elementi passati in ingresso*/

      if scalarp(mat1) = true or listp(mat1) = true then return(0),

      if scalarp(mat2) = true or listp(mat2) = true then return(0),

      \;

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ y:j,

      \ \ if mat1[i,j] # 0 and mat2[i,j] # 0 then return(1)

      \ ),

      \ x:i,

      \ if mat1[i,y] # 0 and mat2[i,y] # 0 then return(1)

      ),

      if mat1[x,y] # 0 and mat2[x,y] # 0 then return([x,y]) else
      return([0,0])

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      calcoloAsseRotazione(R):=block(

      [transposeMatrix,finalMatrix,II,det,RmII,adj,aut0,aut1,norma2,e],

      /*controllare che il parametro inserito in ingresso sia una matrice*/

      if scalarp(R) = true or listp(R) = true then return(0),

      \;

      /*controllare che la matrice inserita in ingresso sia di rotazione*/

      transposeMatrix:transpose(R),

      finalMatrix:trigsimp(R.transposeMatrix),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if finalMatrix # II then return(0),

      det:trigsimp(determinant(R)),

      if det # 1 then return(0),

      \;

      /*calcolare l'asse di rotazione tramite la definizione dell'aggiunta e
      di un autovettore associato all'autovalore unitario. Si scorrono tutte
      le colonne dell'aggiunta di R-II ed appena se ne trova una che è
      diversa da zero, questa viene selezionata*/

      RmII:fullratsimp(R-II),

      adj:adjoint(RmII),

      aut0:matrix([0],[0],[0]),

      aut1:matrix([0],[0],[0]),

      for i:1 thru 3 do (

      \ aut1:matrix([adj[1,i]],[adj[2,i]],[adj[3,i]]),

      \ if aut1 # aut0 then return(aut1)

      ),

      e:calcoloVersore(aut1),

      return(e)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
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

    La funzione ATAN2(y,x) creata qui è definita nell'intervallo
    [0,<math|2*\<pi\>>] a differenza di quella della libreria che è definita
    nell'intervallo [-\<pi\>,+\<pi\>].

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

    La funzione \PcalcoloAngolo\Q riceve in ingresse la matrice di rotazione
    e calcola per mezzo delle formule inverse di Rodrigues l'angolo di
    rotazione intorno all'asse.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      calcoloAngolo(R):=block(

      [e,transposeR,S,mat,value1,value2,seno,S2,result,coseno,angolo],

      /*controllare che il parametro in ingresso sia di tipo matriciale*/

      if scalarp(R) = true or listp(R) = true then return(-1),

      \;

      /*calcolare l'asse di rotazione*/

      e:calcoloAsseRotazione(R),

      if e = 0 then return(-2),

      \;

      /*calcolare l'angolo di rotazione*/

      /*calcolo del seno dell'angolo*/

      S:matrix([0,-e[3,1],e[2,1]],[e[3,1],0,-e[1,1]],[-e[2,1],e[1,1],0]),

      transposeR:trigsimp(transpose(R)),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      mat[1]:fullratsimp((1/2)*(R-transposeR)),

      \;

      /*trovare il valore diverso da zero in entrambe le matrici, con le
      stesse coordinate*/

      [value1,value2]:calcoloValore(mat[1],S),

      if value1 = 0 and value2 = 0 then seno:0 else
      seno:((1/2)*(R[value1,value2]-R[value2,value1]))/S[value1,value2],

      seno:fullratsimp(factor(seno)),

      \;

      /*calcolo del coseno dell'angolo*/

      S2:trigsimp(S.S),

      mat[2]:fullratsimp(((1/2)*(R+transposeR))-II),

      \;

      /*trovare il valore diverso da zero in entrambe le matrici, con le
      stesse coordinate*/

      [value1,value2]:calcoloValore(mat[2],S2),

      result:(((1/2)*(R[value1,value2]+R[value2,value1]))-II[value1,value2])/S2[value1,value2],

      result:fullratsimp(factor(result)),

      coseno:factor(1-result),

      \;

      /*calcolo angolo di rotazione intorno all'asse precedentemente
      trovato*/

      angolo:ATAN2(seno,coseno),

      angoloSemplificato:trigreduce(angolo),

      radAngolo:float(angoloSemplificato),

      return([e,angolo,angoloSemplificato,radAngolo])

      )$
    </input>

    \;

    \;

    \;

    \;

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      R1:matriceDiRotazione(matrix([1],[1],[0]),%pi)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
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
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      calcoloAngolo(R1[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|0>>>>>,arctan
      <around*|(|<frac|sin <around*|(|<sqrt|2>*\<pi\>|)>|cos
      <around*|(|<sqrt|2>*\<pi\>|)>>|)>-2*\<pi\>,<sqrt|2>*\<pi\>-2*\<pi\>,-1.84030236902122|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      R4:matriceDiRotazione(matrix([1],[0],[0]),%pi/6)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|<sqrt|3>|2>>|<cell|-<frac|1|2>>>|<row|<cell|0>|<cell|<frac|1|2>>|<cell|<frac|<sqrt|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|1.0>|<cell|0.0>|<cell|0.0>>|<row|<cell|0.0>|<cell|0.8660254037844386>|<cell|-0.5>>|<row|<cell|0.0>|<cell|0.5>|<cell|0.8660254037844386>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      calcoloAngolo(R4[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,<frac|\<pi\>|6>,<frac|\<pi\>|6>,0.5235987755982988|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      R4controllo:matriceDiRotazione(matrix([1],[0],[0]),%pi/6)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|<sqrt|3>|2>>|<cell|-<frac|1|2>>>|<row|<cell|0>|<cell|<frac|1|2>>|<cell|<frac|<sqrt|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|1.0>|<cell|0.0>|<cell|0.0>>|<row|<cell|0.0>|<cell|0.8660254037844386>|<cell|-0.5>>|<row|<cell|0.0>|<cell|0.5>|<cell|0.8660254037844386>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      R:matriceDiRotazione(matrix([1/sqrt(2)],[1/sqrt(2)],[0]),%pi/3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|3|4>>|<cell|<frac|1|4>>|<cell|<frac|<sqrt|3>|2<rsup|<frac|3|2>>>>>|<row|<cell|<frac|1|4>>|<cell|<frac|3|4>>|<cell|-<frac|<sqrt|3>|2<rsup|<frac|3|2>>>>>|<row|<cell|-<frac|<sqrt|3>|2<rsup|<frac|3|2>>>>|<cell|<frac|<sqrt|3>|2<rsup|<frac|3|2>>>>|<cell|<frac|1|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0.75>|<cell|0.25>|<cell|0.6123724356957944>>|<row|<cell|0.25>|<cell|0.75>|<cell|-0.6123724356957944>>|<row|<cell|-0.6123724356957944>|<cell|0.6123724356957944>|<cell|0.5>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      calcoloAngolo(R[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|0>>>>>,<frac|\<pi\>|3>,<frac|\<pi\>|3>,1.047197551196598|]>>>
    </unfolded-io>
  </session>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>