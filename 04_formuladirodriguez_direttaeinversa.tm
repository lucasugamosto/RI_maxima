<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  ESERCITAZIONE 1: Procedura che data una coppia di valori in input
  (asse,angolo), verifica se l'asse è un versore e non un vettore. Se l'asse
  è un versore allora viene usata la FORMULA DI RODRIGUEZ per il calcolo
  della matrice di rotazione R intorno all'asse v di un angolo theta,
  altrimenti torna un errore.

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      mat_rotazione(v,theta):=block(

      [norma2,S,gamma,S2,II,R],

      norma2:sqrt((v[1][1])^2+(v[2][1])^2+(v[3][1])^2),

      S:matrix([0,-v[3][1],v[2][1]],[v[3][1],0,-v[1][1]],[-v[2][1],v[1][1],0]),

      if norma2 # 1 then S:(1/norma2).S,

      \;

      gamma:theta/180,

      gamma:%pi.gamma,

      if norma2 # 1 then gamma:norma2.gamma,

      \;

      S2:S.S,

      S2:trigreduce(S2),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      R:II+(sin(gamma).S)+((1-cos(gamma)).S2),

      R:trigreduce(R)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|mat_rotazione><around*|(|v,\<vartheta\>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|norma2>,S,\<gamma\>,<with|math-font-family|rm|S2>,<math-up|II>,R|]>,<with|math-font-family|rm|norma2>:<sqrt|<around*|(|v<rsub|1>|)><rsub|1><rsup|2>+<around*|(|v<rsub|2>|)><rsub|1><rsup|2>+<around*|(|v<rsub|3>|)><rsub|1><rsup|2>>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-<around*|(|v<rsub|3>|)><rsub|1>>|<cell|<around*|(|v<rsub|2>|)><rsub|1>>>|<row|<cell|<around*|(|v<rsub|3>|)><rsub|1>>|<cell|0>|<cell|-<around*|(|v<rsub|1>|)><rsub|1>>>|<row|<cell|-<around*|(|v<rsub|2>|)><rsub|1>>|<cell|<around*|(|v<rsub|1>|)><rsub|1>>|<cell|0>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>S:<around*|(|<frac|1|<with|math-font-family|rm|norma2>>|)>\<cdot\>S,\<gamma\>:<frac|\<vartheta\>|180>,\<gamma\>:\<pi\>\<cdot\>\<gamma\>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>\<gamma\>:<with|math-font-family|rm|norma2>\<cdot\>\<gamma\>,<with|math-font-family|rm|S2>:S\<cdot\>S,<with|math-font-family|rm|S2>:<math-up|trigreduce><around*|(|<with|math-font-family|rm|S2>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,R:<math-up|II>+sin
      <around*|(|\<gamma\>|)>\<cdot\>S+<around*|(|1-cos
      <around*|(|\<gamma\>|)>|)>\<cdot\><with|math-font-family|rm|S2>,R:<math-up|trigreduce><around*|(|R|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      mat:mat_rotazione(matrix([1],[1],[0]),90)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|1-<frac|1-cos
      <around*|(|<frac|\<pi\>|<sqrt|2>>|)>|2>>|<cell|<frac|1-cos
      <around*|(|<frac|\<pi\>|<sqrt|2>>|)>|2>>|<cell|<frac|sin
      <around*|(|<frac|\<pi\>|<sqrt|2>>|)>|<sqrt|2>>>>|<row|<cell|<frac|1-cos
      <around*|(|<frac|\<pi\>|<sqrt|2>>|)>|2>>|<cell|1-<frac|1-cos
      <around*|(|<frac|\<pi\>|<sqrt|2>>|)>|2>>|<cell|-<frac|sin
      <around*|(|<frac|\<pi\>|<sqrt|2>>|)>|<sqrt|2>>>>|<row|<cell|-<frac|sin
      <around*|(|<frac|\<pi\>|<sqrt|2>>|)>|<sqrt|2>>>|<cell|<frac|sin
      <around*|(|<frac|\<pi\>|<sqrt|2>>|)>|<sqrt|2>>>|<cell|cos
      <around*|(|<frac|\<pi\>|<sqrt|2>>|)>>>>>>>>
    </unfolded-io>

    \;

    \;

    ESERCITAZIONE 2: Procedura per il calcolo dell'asse di rotazione e
    l'angolo di rotazione data una matrice di rotazione. Effettuare i
    relativi controlli.

    Tramite la sottofunzione \Pcalcolo_val(mat,S)\Q vengono prelevati dalle
    matrici ai membri di sinistra e di destra un elemento diverso da zero, il
    tutto per calcolare sin(\<theta\>) e cos(\<theta\>), per poi calcolare
    poi l'angolo \<theta\> interessato.

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      calcolo_val(mat,S):=block(

      [val1,val2,i,j,x,y],

      val1:0,

      for i:1 thru 3 do

      (

      for j:1 thru 3 do

      (

      y:j,

      if mat[i][j] # 0 and S[i][j] # 0 then val1:mat[i][j],

      if val1 # 0 then return(val1)),

      x:i,

      if val1 # 0 then return(val1)),

      val2:S[x][y],

      [val1,val2]

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|calcolo_val><around*|(|<math-up|mat>,S|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>,i,j,x,y|]>,<with|math-font-family|rm|val1>:0,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|y:j,<math-bf|if><space|0.27em><around*|(|<math-up|mat><rsub|i>|)><rsub|j>\<neq\>0\<wedge\><around*|(|S<rsub|i>|)><rsub|j>\<neq\>0<space|0.27em><math-bf|then><space|0.27em><with|math-font-family|rm|val1>:<around*|(|<math-up|mat><rsub|i>|)><rsub|j>,<math-bf|if><space|0.27em><with|math-font-family|rm|val1>\<neq\>0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<with|math-font-family|rm|val1>|)>|)>,x:i,<math-bf|if><space|0.27em><with|math-font-family|rm|val1>\<neq\>0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<with|math-font-family|rm|val1>|)>|)>,<with|math-font-family|rm|val2>:<around*|(|S<rsub|x>|)><rsub|y>,<around*|[|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>|]>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      calcolo_val(matrix([0,1,0],[0,0,-1],[-1,0,0]),matrix([0,1,1],[-1,0,-1],[-1,1,0]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|1,1|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      calcolo_asse_angolo(mat_R):=block(

      [R_trasp,R_tot,II,det,IImR,agg,aut0,aut2,aut1,S,mat,val1,val2,S2,x,y],

      R_trasp:transpose(mat_R),

      R_tot:mat_R.R_trasp,

      R_tot:trigsimp(R_tot),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      \;

      if R_tot # II then return(0),

      det:determinant(mat_R),

      det:trigsimp(det),

      if det # 1 then return(0),

      IImR:II-mat_R,

      agg:adjoint(IImR),

      agg:trigsimp(agg),

      aut0:matrix([0],[0],[0]),

      aut2:matrix([0],[0],[0]),

      for i: 1 thru 3 do

      (

      aut1:matrix([agg[1,i]],[agg[2,i]],[agg[3,i]]),

      if aut1 # aut0 then aut2:aut1,

      if aut2 # aut0 then return(aut2)

      ),

      S:matrix([0,-aut2[3][1],aut2[2][1]],[aut2[3][1],0,-aut2[1][1]],[-aut2[2][1],aut2[1][1],0]),

      mat:(1/2).(mat_R-R_trasp),

      [val1,val2]:calcolo_val(mat,S),

      y:fullratsimp(val1/val2),

      mat:((1/2).(mat_R+R_trasp))-II,

      S2:S.S,

      [val1,val2]:calcolo_val(mat,S2),

      x:fullratsimp((val2-val1)/val2),

      theta:atan2(y,x),

      [aut2,theta]

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><with|math-font-family|rm|calcolo_asse_angolo><around*|(|<with|math-font-family|rm|mat_R>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|R_trasp>,<with|math-font-family|rm|R_tot>,<math-up|II>,<math-up|det>,<math-up|IImR>,<math-up|agg>,<with|math-font-family|rm|aut0>,<with|math-font-family|rm|aut2>,<with|math-font-family|rm|aut1>,S,<math-up|mat>,<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>,<with|math-font-family|rm|S2>,x,y|]>,<with|math-font-family|rm|R_trasp>:<math-up|transpose><around*|(|<with|math-font-family|rm|mat_R>|)>,<with|math-font-family|rm|R_tot>:<with|math-font-family|rm|mat_R>\<cdot\><with|math-font-family|rm|R_trasp>,<with|math-font-family|rm|R_tot>:<math-up|trigsimp><around*|(|<with|math-font-family|rm|R_tot>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|R_tot>\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|det>:<math-up|determinant><around*|(|<with|math-font-family|rm|mat_R>|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|det>|)>,<math-bf|if><space|0.27em><math-up|det>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|IImR>:<math-up|II>-<with|math-font-family|rm|mat_R>,<math-up|agg>:<math-up|adjoint><around*|(|<math-up|IImR>|)>,<math-up|agg>:<math-up|trigsimp><around*|(|<math-up|agg>|)>,<with|math-font-family|rm|aut0>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>>>>,<with|math-font-family|rm|aut2>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<with|math-font-family|rm|aut1>:<matrix|<tformat|<table|<row|<cell|<math-up|agg><rsub|1,i>>>|<row|<cell|<math-up|agg><rsub|2,i>>>|<row|<cell|<math-up|agg><rsub|3,i>>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|aut1>\<neq\><with|math-font-family|rm|aut0><space|0.27em><math-bf|then><space|0.27em><with|math-font-family|rm|aut2>:<with|math-font-family|rm|aut1>,<math-bf|if><space|0.27em><with|math-font-family|rm|aut2>\<neq\><with|math-font-family|rm|aut0><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<with|math-font-family|rm|aut2>|)>|)>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-<around*|(|<with|math-font-family|rm|aut2><rsub|3>|)><rsub|1>>|<cell|<around*|(|<with|math-font-family|rm|aut2><rsub|2>|)><rsub|1>>>|<row|<cell|<around*|(|<with|math-font-family|rm|aut2><rsub|3>|)><rsub|1>>|<cell|0>|<cell|-<around*|(|<with|math-font-family|rm|aut2><rsub|1>|)><rsub|1>>>|<row|<cell|-<around*|(|<with|math-font-family|rm|aut2><rsub|2>|)><rsub|1>>|<cell|<around*|(|<with|math-font-family|rm|aut2><rsub|1>|)><rsub|1>>|<cell|0>>>>>,<math-up|mat>:<around*|(|<frac|1|2>|)>\<cdot\><around*|(|<with|math-font-family|rm|mat_R>-<with|math-font-family|rm|R_trasp>|)>,<around*|[|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>|]>:<with|math-font-family|rm|calcolo_val><around*|(|<math-up|mat>,S|)>,y:<math-up|fullratsimp><around*|(|<frac|<with|math-font-family|rm|val1>|<with|math-font-family|rm|val2>>|)>,<math-up|mat>:<around*|(|<frac|1|2>|)>\<cdot\><around*|(|<with|math-font-family|rm|mat_R>+<with|math-font-family|rm|R_trasp>|)>-<math-up|II>,<with|math-font-family|rm|S2>:S\<cdot\>S,<around*|[|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>|]>:<with|math-font-family|rm|calcolo_val><around*|(|<math-up|mat>,<with|math-font-family|rm|S2>|)>,x:<math-up|fullratsimp><around*|(|<frac|<with|math-font-family|rm|val2>-<with|math-font-family|rm|val1>|<with|math-font-family|rm|val2>>|)>,\<vartheta\>:<math-up|atan2><around*|(|y,x|)>,<around*|[|<with|math-font-family|rm|aut2>,\<vartheta\>|]>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      calcolo_asse_angolo(matrix([1,0,0],[0,0,-1],[0,1,0]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|2>>|<row|<cell|0>>|<row|<cell|0>>>>>,arctan
      <around*|(|<frac|2|3>|)>|]>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>