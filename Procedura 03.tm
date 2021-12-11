<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <with|color|red|Procedura 1: Procedura che prende in ingresso i valori di
  due angoli generici \<alpha\> e \<beta\>, calcola le matrici di rotazioni
  intorno a due assi diversi rispettivamente di angolo \<alpha\> e \<beta\> e
  dimostra che per esse non vale la PROPRIETA' COMMUTATIVA rispetto al
  prodotto scalare.>

  Sotto-funzione che controlla se la matrice inserita in ingresso è o meno di
  rotazione:

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
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

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|control_R><around*|(|<math-up|mat>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|mat_T>,<with|math-font-family|rm|mat_fin>,<math-up|II>,<math-up|det>|]>,<with|math-font-family|rm|mat_T>:<math-up|transpose><around*|(|<math-up|mat>|)>,<with|math-font-family|rm|mat_fin>:<math-up|trigsimp><around*|(|<math-up|mat>\<cdot\><with|math-font-family|rm|mat_T>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|mat_fin>\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|determinant><around*|(|<math-up|mat>|)>|)>,<math-bf|if><space|0.27em><math-up|det>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|return><around*|(|1|)>|)>>>
    </unfolded-io>

    \;

    \;

    Funzione principale per la dimostrazione della proprietà commutativa
    rispetto alla moltiplicazione:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      prop_com(alpha,beta):=block(

      [Rx,Ry,val,mat1,mat2,res],

      Rx:matrix([1,0,0],[0,cos(alpha),-sin(alpha)],[0,sin(alpha),cos(alpha)]),

      Ry:matrix([cos(beta),0,sin(beta)],[0,1,0],[-sin(beta),0,cos(beta)]),

      val:control_R(Rx),

      if val # 1 then return(0),

      val:control_R(Ry),

      if val # 1 then return(0),

      mat1:Rx.Ry,

      mat2:Ry.Rx,

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ if mat1[i,j] # mat2[i,j] then res:0 else res:1,

      \ \ if res # 1 then return(0)

      \ \ ),

      \ if res # 1 then return(0)

      ),

      if res # 1 then return(0) else return(1)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|prop_com><around*|(|\<alpha\>,\<beta\>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|Rx>,<math-up|Ry>,<math-up|val>,<with|math-font-family|rm|mat1>,<with|math-font-family|rm|mat2>,<math-up|res>|]>,<math-up|Rx>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>>>>>,<math-up|Ry>:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<beta\>|)>>|<cell|0>|<cell|sin
      <around*|(|\<beta\>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
      <around*|(|\<beta\>|)>>|<cell|0>|<cell|cos
      <around*|(|\<beta\>|)>>>>>>,<math-up|val>:<with|math-font-family|rm|control_R><around*|(|<math-up|Rx>|)>,<math-bf|if><space|0.27em><math-up|val>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|val>:<with|math-font-family|rm|control_R><around*|(|<math-up|Ry>|)>,<math-bf|if><space|0.27em><math-up|val>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<with|math-font-family|rm|mat1>:<math-up|Rx>\<cdot\><math-up|Ry>,<with|math-font-family|rm|mat2>:<math-up|Ry>\<cdot\><math-up|Rx>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<math-bf|if><space|0.27em><with|math-font-family|rm|mat1><rsub|i,j>\<neq\><with|math-font-family|rm|mat2><rsub|i,j><space|0.27em><math-bf|then><space|0.27em><math-up|res>:0<space|0.27em><math-bf|else><space|0.27em><math-up|res>:1,<math-bf|if><space|0.27em><math-up|res>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>|)>,<math-bf|if><space|0.27em><math-up|res>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>|)>,<math-bf|if><space|0.27em><math-up|res>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)><space|0.27em><math-bf|else><space|0.27em><math-up|return><around*|(|1|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      prop_com(alpha,beta)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >>0>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>