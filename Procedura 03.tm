<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA CHE DIMOSTRA LA NON VALIDITA' DELLA PROPRIETA' COMMUTATIVA
  RISPETTO ALLA MOLTIPLICAZIONE PER LE MATRICI DI ROTAZIONE, NELLO SPAZIO.
  Questa proprietà vale invece nel piano.

  Per qualsiasi valori \<alpha\>, \<beta\> deve valere che:
  <math|R<rsub|x><around*|(|\<alpha\>|)>.R<rsub|y><around*|(|\<beta\>|)>
  #R<rsub|y><around*|(|\<beta\>|)>.R<rsub|x><around*|(|\<alpha\>|)>>

  \;

  \PcontrolR\Q controlla se la matrice inserita in ingresso è o meno di
  rotazione:

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      controlR(mat):=block(

      [transposeMatrix,finalMatrix,II,det],

      transposeMatrix:transpose(mat),

      finalMatrix:trigsimp(mat.transposeMatrix),

      \;

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if finalMatrix # II then return(0),

      det:trigsimp(determinant(mat)),

      if det # 1 then return(0) else return(1)

      )

      \;

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><math-up|controlR><around*|(|<math-up|mat>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|transposeMatrix>,<math-up|finalMatrix>,<math-up|II>,<math-up|det>|]>,<math-up|transposeMatrix>:<math-up|transpose><around*|(|<math-up|mat>|)>,<math-up|finalMatrix>:<math-up|trigsimp><around*|(|<math-up|mat>\<cdot\><math-up|transposeMatrix>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><math-up|finalMatrix>\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|determinant><around*|(|<math-up|mat>|)>|)>,<math-bf|if><space|0.27em><math-up|det>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)><space|0.27em><math-bf|else><space|0.27em><math-up|return><around*|(|1|)>|)>>>
    </unfolded-io>

    \;

    \;

    \PpropCommutativa\Q calcola le due matrici finali e le paragona per
    dimostrare la non validità:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      propCommutativa(alpha,beta):=block(

      [Rx,Ry,value,mat1,mat2,result],

      if listp(alpha) = true or matrixp(alpha) = true then return(-1),

      if listp(beta) = true or matrixp(beta) = true then return(-1),

      \;

      Rx:matrix([1,0,0],[0,cos(alpha),-sin(alpha)],[0,sin(alpha),cos(alpha)]),

      Ry:matrix([cos(beta),0,sin(beta)],[0,1,0],[-sin(beta),0,cos(beta)]),

      \;

      value:controlR(Rx),

      if value # 1 then return(-1),

      value:controlR(Ry),

      if value # 1 then return(-1),

      \;

      mat1:trigsimp(Rx.Ry),

      mat2:trigsimp(Ry.Rx),

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ if mat1[i,j] # mat2[i,j] then result:0 else result:1,

      \ \ if result # 1 then return(0)

      \ \ ),

      \ if result # 1 then return(0)

      ),

      if result # 1 then return(0) else return(1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      propCommutativa(alpha,beta)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >>0>>
    </unfolded-io>

    \;

    \;

    \;

    <with|color|black|La proprietà COMMUTATIVA rispetto alla moltiplicazione
    vale invece se ci si trova nel piano, qui di seguito la dimostrazione.>

    La funzione \PmatriceRotazione\Q calcola la matrice R definita nel piano:

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      matriceRotazione(theta):=block(

      [result],

      if listp(theta) = true or matrixp(theta) = true then return(0),

      result:matrix([cos(theta),-sin(theta)],[sin(theta),cos(theta)]),

      return(result)

      )$
    </input>

    \;

    \;

    \;

    La funzione \PpropCommutativa2\Q controlla elemento per elemento le due
    matrici calcolate e restituisce valore 1 nel caso siano uguali, 0
    altrimenti:

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      propCommutativa2(alpha,beta):=block(

      [R1,R2,finalMatrix1,finalMatrix2,result],

      \;

      /*controllare il tipo di dato dei parametri in ingresso*/

      if listp(alpha) = true or matrixp(alpha) = true then return(-1),

      if listp(beta) = true or matrixp(beta) = true then return(-1),

      \;

      R1:matriceRotazione(alpha),

      R2:matriceRotazione(beta),

      finalMatrix1:trigsimp(R1.R2),

      finalMatrix2:trigsimp(R2.R1),

      \;

      for i:1 thru 2 do (

      \ for j:1 thru 2 do (

      \ \ if finalMatrix1[i,j] # finalMatrix2[i,j] then result:0 else
      result:1,

      \ \ if result # 1 then return(0)

      \ \ ),

      \ if result # 1 then return(0)

      ),

      if result # 1 then return(0) else return(1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      propCommutativa2(alpha,beta)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      propCommutativa2(%pi,%pi/2)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >>1>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>