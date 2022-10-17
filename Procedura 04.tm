<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA CHE DIMOSTRA COME CALCOLARE LA MATRICE DI ROTAZIONE RISPETTO
  ALL'ASSE Y DI UN ANGOLO \<gamma\> CONSIDERANDO IL PRODOTTO TRA MATRICI DI
  ROTAZIONE RISPETTO AGLI ALTRI DUE ASSI E DETERMINATI ANGOLI.

  <with|color|red|Procedura 1: Procedura che permette di dimostrare la
  possibilità di calcolare la matrice di rotazione intorno ad un determinato
  asse di un angolo \<theta\> tramite il prodotto di altre matrici espresse
  nella notazione di Eulero.>

  Sotto-funzione per il calcolo di una matrice di rotazione nello spazio
  intorno ad un certo asse di un determinato angolo:

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      create_R(asse,angolo):=block(

      [x,y,z,R],

      x:matrix([1],[0],[0]),

      y:matrix([0],[1],[0]),

      z:matrix([0],[0],[1]),

      if asse = x then R:matrix([1,0,0],[0,cos(angolo),-sin(angolo)],[0,sin(angolo),cos(angolo)]),

      if asse = y then R:matrix([cos(angolo),0,sin(angolo)],[0,1,0],[-sin(angolo),0,cos(angolo)]),

      if asse = z then R:matrix([cos(angolo),-sin(angolo),0],[sin(angolo),cos(angolo),0],[0,0,1]),

      return(R)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|create_R><around*|(|<math-up|asse>,<math-up|angolo>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|x,y,z,R|]>,x:<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,y:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|1>>|<row|<cell|0>>>>>,z:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|1>>>>>,<math-bf|if><space|0.27em><math-up|asse>=x<space|0.27em><math-bf|then><space|0.27em>R:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|<math-up|angolo>|)>>|<cell|-sin
      <around*|(|<math-up|angolo>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|<math-up|angolo>|)>>|<cell|cos
      <around*|(|<math-up|angolo>|)>>>>>>,<math-bf|if><space|0.27em><math-up|asse>=y<space|0.27em><math-bf|then><space|0.27em>R:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<math-up|angolo>|)>>|<cell|0>|<cell|sin
      <around*|(|<math-up|angolo>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
      <around*|(|<math-up|angolo>|)>>|<cell|0>|<cell|cos
      <around*|(|<math-up|angolo>|)>>>>>>,<math-bf|if><space|0.27em><math-up|asse>=z<space|0.27em><math-bf|then><space|0.27em>R:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<math-up|angolo>|)>>|<cell|-sin
      <around*|(|<math-up|angolo>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|<math-up|angolo>|)>>|<cell|cos
      <around*|(|<math-up|angolo>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|return><around*|(|R|)>|)>>>
    </unfolded-io>

    \;

    \;

    Sotto-funzione che controlla se la matrice inserita in ingresso è o meno
    di rotazione:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      control_R(mat):=block(

      [mat_T,mat_fin,II,det],

      mat_T:transpose(mat),

      mat_fin:trigsimp(mat.mat_T),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if mat_fin # II then return(0),

      det:trigsimp(determinant(mat)),

      if det # 1 then return(0),

      return(1)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|control_R><around*|(|<math-up|mat>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|mat_T>,<with|math-font-family|rm|mat_fin>,<math-up|II>,<math-up|det>|]>,<with|math-font-family|rm|mat_T>:<math-up|transpose><around*|(|<math-up|mat>|)>,<with|math-font-family|rm|mat_fin>:<math-up|trigsimp><around*|(|<math-up|mat>\<cdot\><with|math-font-family|rm|mat_T>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|mat_fin>\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|determinant><around*|(|<math-up|mat>|)>|)>,<math-bf|if><space|0.27em><math-up|det>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|return><around*|(|1|)>|)>>>
    </unfolded-io>

    \;

    \;

    Funzione principale in cui dimostrare che
    <math|R<rsub|z><around*|(|\<gamma\>|)>=R<rsub|x><around*|(|\<pm\>\<pi\>/2|)>.R<rsub|y><around*|(|\<pm\>\<gamma\>|)>.R<rsub|x><around*|(|\<mp\>\<pi\>/2|)>>,
    per ogni \<gamma\>.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      prod_eulero(alpha,gamma):=block(

      [Rx,Ry,Rz,val,mat_tot,res],

      Rx[1]:create_R(matrix([1],[0],[0]),alpha),

      Rx[2]:create_R(matrix([1],[0],[0]),-alpha),

      Ry[1]:create_R(matrix([0],[1],[0]),gamma),

      Ry[2]:create_R(matrix([0],[1],[0]),-gamma),

      Rz:create_R(matrix([0],[0],[1]),gamma),

      val:control_R(Rx[1]),

      if val # 1 then return(-1),

      val:control_R(Rx[2]),

      if val # 1 then return(-2),

      val:control_R(Ry[1]),

      if val # 1 then return(-3),

      val:control_R(Rz),

      if val # 1 then return(-4),

      mat_tot[1]:Rx[1].Ry[1].Rx[2],

      mat_tot[2]:Rx[2].Ry[2].Rx[1],

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ if mat_tot[1][i,j] # Rz[i,j] then res:0 else res:1,

      \ \ if res # 1 then return(0)

      \ \ ),

      \ if res # 1 then return(0)

      \ ),

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ if mat_tot[2][i,j] # Rz[i,j] then res:0 else res:1,

      \ \ if res # 1 then return(0)

      \ \ ),

      \ if res # 1 then return(0)

      \ ),

      if res #1 then return(0) else return(1)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|prod_eulero><around*|(|\<alpha\>,\<gamma\>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|Rx>,<math-up|Ry>,<math-up|Rz>,<math-up|val>,<with|math-font-family|rm|mat_tot>,<math-up|res>|]>,<math-up|Rx><rsub|1>:<with|math-font-family|rm|create_R><around*|(|<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,\<alpha\>|)>,<math-up|Rx><rsub|2>:<with|math-font-family|rm|create_R><around*|(|<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,-\<alpha\>|)>,<math-up|Ry><rsub|1>:<with|math-font-family|rm|create_R><around*|(|<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|1>>|<row|<cell|0>>>>>,\<gamma\>|)>,<math-up|Ry><rsub|2>:<with|math-font-family|rm|create_R><around*|(|<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|1>>|<row|<cell|0>>>>>,-\<gamma\>|)>,<math-up|Rz>:<with|math-font-family|rm|create_R><around*|(|<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|1>>>>>,\<gamma\>|)>,<math-up|val>:<with|math-font-family|rm|control_R><around*|(|<math-up|Rx><rsub|1>|)>,<math-bf|if><space|0.27em><math-up|val>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|-1|)>,<math-up|val>:<with|math-font-family|rm|control_R><around*|(|<math-up|Rx><rsub|2>|)>,<math-bf|if><space|0.27em><math-up|val>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|-2|)>,<math-up|val>:<with|math-font-family|rm|control_R><around*|(|<math-up|Ry><rsub|1>|)>,<math-bf|if><space|0.27em><math-up|val>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|-3|)>,<math-up|val>:<with|math-font-family|rm|control_R><around*|(|<math-up|Rz>|)>,<math-bf|if><space|0.27em><math-up|val>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|-4|)>,<with|math-font-family|rm|mat_tot><rsub|1>:<math-up|Rx><rsub|1>\<cdot\><math-up|Ry><rsub|1>\<cdot\><math-up|Rx><rsub|2>,<with|math-font-family|rm|mat_tot><rsub|2>:<math-up|Rx><rsub|2>\<cdot\><math-up|Ry><rsub|2>\<cdot\><math-up|Rx><rsub|1>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<math-bf|if><space|0.27em><around*|(|<with|math-font-family|rm|mat_tot><rsub|1>|)><rsub|i,j>\<neq\><math-up|Rz><rsub|i,j><space|0.27em><math-bf|then><space|0.27em><math-up|res>:0<space|0.27em><math-bf|else><space|0.27em><math-up|res>:1,<math-bf|if><space|0.27em><math-up|res>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>|)>,<math-bf|if><space|0.27em><math-up|res>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<math-bf|if><space|0.27em><around*|(|<with|math-font-family|rm|mat_tot><rsub|2>|)><rsub|i,j>\<neq\><math-up|Rz><rsub|i,j><space|0.27em><math-bf|then><space|0.27em><math-up|res>:0<space|0.27em><math-bf|else><space|0.27em><math-up|res>:1,<math-bf|if><space|0.27em><math-up|res>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>|)>,<math-bf|if><space|0.27em><math-up|res>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>|)>,<math-bf|if><space|0.27em><math-up|res>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)><space|0.27em><math-bf|else><space|0.27em><math-up|return><around*|(|1|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      prod_eulero(%pi/2,gamma)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>1>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>