<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  QUESTA PROCEDURA PERMETTE DI CALCOLARE LA MATRICE DI ROTAZIONE RISPETTO
  ALL'ASSE z DI UN ANGOLO \<gamma\>, CONSIDERANDO IL PRODOTTO TRA MATRICI DI
  ROTAZIONE RISPETTO AGLI ALTRI DUE ASSI x, y.

  Quindi dimostrare che <math|R<rsub|z><around*|(|\<gamma\>|)>=R<rsub|x><around*|(|\<pm\>\<pi\>/2|)>.R<rsub|y><around*|(|\<pm\>\<gamma\>|)>.R<rsub|x><around*|(|\<mp\>\<pi\>/2|)>>.

  \;

  La funzione \PcreateR\Q calcola la matrice di rotazione nello spazio, a
  seconda della coppia di parametri asse, angolo passati in ingresso:

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      createR(asse,angolo):=block(

      [x,y,z,R],

      x:matrix([1],[0],[0]),

      y:matrix([0],[1],[0]),

      z:matrix([0],[0],[1]),

      \;

      /*controllare tipo di dato dei parametri in ingresso*/

      if scalarp(asse) = true and listp(asse) = true then return(0),

      if listp(angolo) = true or matrixp(angolo) = true then return(0),

      if asse # x and asse # y and asse # z then return(0),

      \;

      if asse = x then R:matrix([1,0,0],[0,cos(angolo),-sin(angolo)],[0,sin(angolo),cos(angolo)]),

      if asse = y then R:matrix([cos(angolo),0,sin(angolo)],[0,1,0],[-sin(angolo),0,cos(angolo)]),

      if asse = z then R:matrix([cos(angolo),-sin(angolo),0],[sin(angolo),cos(angolo),0],[0,0,1]),

      return(R)

      )$
    </input>

    \;

    \;

    \;

    \;

    \PcontrolR\Q verifica se la matrice passata in ingresso alla funzione è o
    meno di rotazione. La funzione torna 1 se la matrice è di rotazione, 0
    altrimenti.

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      controlR(mat):=block(

      [transposeMatrix,finalMatrix,II,det],

      if scalarp(mat) = true or listp(mat) = true then return(-1),

      \;

      transposeMatrix:transpose(mat),

      finalMatrix:trigsimp(mat.transposeMatrix),

      \;

      /*effettuare i due controlli necessari a dire se la matrice è di
      rotazione o meno*/

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if finalMatrix # II then return(0),

      det:trigsimp(determinant(mat)),

      if det # 1 then return(0) else return(1)

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

    La funzione \PprodEulero\Q calcola la matrice
    <math|R<rsub|z><around*|(|\<gamma\>|)>> per mezzo degli assi x, y:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      prodEulero(gamma):=block(

      [Rx,Ry,Rz,value,finalMatrix,result],

      if listp(gamma) = true or matrixp(gamma) = true then return(-2),

      \;

      /*creazione di tutte le matrici necessarie al calcolo del prodotto con
      la notazione di Eulero*/

      Rx[1]:createR(matrix([1],[0],[0]),%pi/2),

      if Rx[1] = 0 then return(0),

      Rx[2]:createR(matrix([1],[0],[0]),-%pi/2),

      if Rx[2] = 0 then return(0),

      Ry[1]:createR(matrix([0],[1],[0]),gamma),

      if Ry[1] = 0 then return(0),

      Ry[2]:createR(matrix([0],[1],[0]),-gamma),

      if Ry[2] = 0 then return(0),

      Rz:createR(matrix([0],[0],[1]),gamma),

      if Rz = 0 then return(0),

      \;

      /*controllare che le matrici generate siano di rotazione*/

      value:controlR(Rx[1]),

      if value # 1 then return(-1),

      value:controlR(Rx[2]),

      if value # 1 then return(-1),

      value:controlR(Ry[1]),

      if value # 1 then return(-1),

      value:controlR(Rz),

      if value # 1 then return(-1),

      \;

      /*calcolo la matrtice R1:Rx(pi/2).Ry(gamma).Rx(-pi/2)*/

      finalMatrix[1]:trigsimp(Rx[1].Ry[1].Rx[2]),

      \;

      /*calcolo la matrice R2:Rx(-pi/2).Ry(-gamma).Rx(pi/2)*/

      finalMatrix[2]:trigsimp(Rx[2].Ry[2].Rx[1]),

      \;

      /*confronto tra la matrice Rz e R1*/

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ if finalMatrix[1][i,j] # Rz[i,j] then result:0 else result:1,

      \ \ if result # 1 then return(0)

      \ \ ),

      \ if result # 1 then return(0)

      \ ),

      \;

      /*confronto tra la matrice Rz e R2*/

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ if finalMatrix[2][i,j] # Rz[i,j] then result:0 else result:1,

      \ \ if result # 1 then return(0)

      \ ),

      \ if result # 1 then return(0)

      ),

      if result # 1 then return(0),

      \;

      /*calcolo anche la matrice in con numeri frazionari*/

      radR:float(Rz),

      return([finalMatrix[1],finalMatrix[2],Rz])

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      prodEulero(gamma)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<gamma\>|)>>|<cell|-sin
      <around*|(|\<gamma\>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<gamma\>|)>>|<cell|cos <around*|(|\<gamma\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<gamma\>|)>>|<cell|-sin
      <around*|(|\<gamma\>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<gamma\>|)>>|<cell|cos <around*|(|\<gamma\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<gamma\>|)>>|<cell|-sin
      <around*|(|\<gamma\>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<gamma\>|)>>|<cell|cos <around*|(|\<gamma\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      prodEulero([gamma,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>-2>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      prodEulero(%pi/3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|2>>|<cell|-<frac|<sqrt|3>|2>>|<cell|0>>|<row|<cell|<frac|<sqrt|3>|2>>|<cell|<frac|1|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|<frac|1|2>>|<cell|-<frac|<sqrt|3>|2>>|<cell|0>>|<row|<cell|<frac|<sqrt|3>|2>>|<cell|<frac|1|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|<frac|1|2>>|<cell|-<frac|<sqrt|3>|2>>|<cell|0>>|<row|<cell|<frac|<sqrt|3>|2>>|<cell|<frac|1|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      prodEulero(2*%pi/3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-<frac|1|2>>|<cell|-<frac|<sqrt|3>|2>>|<cell|0>>|<row|<cell|<frac|<sqrt|3>|2>>|<cell|-<frac|1|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|-<frac|1|2>>|<cell|-<frac|<sqrt|3>|2>>|<cell|0>>|<row|<cell|<frac|<sqrt|3>|2>>|<cell|-<frac|1|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|-<frac|1|2>>|<cell|-<frac|<sqrt|3>|2>>|<cell|0>>|<row|<cell|<frac|<sqrt|3>|2>>|<cell|-<frac|1|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>|]>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>