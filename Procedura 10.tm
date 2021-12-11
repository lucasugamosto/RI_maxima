<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <with|color|red|Procedura 1: Procedura che prende un vettore generico \Pa\Q
  in input e genera la matrice di rotazione R tramite la parametrizzazione di
  Cayley-Hamilton, se possibile (quindi controllare se la matrice I-S(a) è o
  meno invertibile, cioè ha determinante diverso da zero).>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      angolo_x(mat):=block(

      [s,c,theta],

      s:mat[3,2],

      c:mat[2,2],

      theta:atan2(s,c)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|angolo_x><around*|(|<math-up|mat>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|s,c,\<vartheta\>|]>,s:<math-up|mat><rsub|3,2>,c:<math-up|mat><rsub|2,2>,\<vartheta\>:<math-up|atan2><around*|(|s,c|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      angolo_y(mat):=block(

      [s,c,theta],

      s:mat[1,3],

      c:mat[1,1],

      theta:atan2(s,c)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|angolo_y><around*|(|<math-up|mat>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|s,c,\<vartheta\>|]>,s:<math-up|mat><rsub|1,3>,c:<math-up|mat><rsub|1,1>,\<vartheta\>:<math-up|atan2><around*|(|s,c|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      angolo_z(mat):=block(

      [s,c,theta],

      s:mat[2,1],

      c:mat[1,1],

      theta:atan2(s,c)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|angolo_z><around*|(|<math-up|mat>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|s,c,\<vartheta\>|]>,s:<math-up|mat><rsub|2,1>,c:<math-up|mat><rsub|1,1>,\<vartheta\>:<math-up|atan2><around*|(|s,c|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      angolo_gen(mat):=block(

      [s2,c2,s3,c3,s1,c1,theta1,theta2,theta3],

      if s2 = 1 or s2 = -1 then return(0),

      s2:-R[2,3],

      c2:sqrt(1-(R[2][3]^2)),

      s3:R[2,1]/c2,

      c3:R[2,2]/c2,

      s1:R[1,3]/c2,

      c1:R[3,3]/c2,

      theta1:atan2(s1,c1),

      theta2:atan2(s2,c2),

      theta3:atan2(s3,c3),

      [theta1,theta2,theta3]

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><with|math-font-family|rm|angolo_gen><around*|(|<math-up|mat>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|s2>,<with|math-font-family|rm|c2>,<with|math-font-family|rm|s3>,<with|math-font-family|rm|c3>,<with|math-font-family|rm|s1>,<with|math-font-family|rm|c1>,<with|math-font-family|rm|theta1>,<with|math-font-family|rm|theta2>,<with|math-font-family|rm|theta3>|]>,<math-bf|if><space|0.27em><with|math-font-family|rm|s2>=1\<vee\><with|math-font-family|rm|s2>=-1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<with|math-font-family|rm|s2>:-R<rsub|2,3>,<with|math-font-family|rm|c2>:<sqrt|1-<around*|(|R<rsub|2>|)><rsub|3><rsup|2>>,<with|math-font-family|rm|s3>:<frac|R<rsub|2,1>|<with|math-font-family|rm|c2>>,<with|math-font-family|rm|c3>:<frac|R<rsub|2,2>|<with|math-font-family|rm|c2>>,<with|math-font-family|rm|s1>:<frac|R<rsub|1,3>|<with|math-font-family|rm|c2>>,<with|math-font-family|rm|c1>:<frac|R<rsub|3,3>|<with|math-font-family|rm|c2>>,<with|math-font-family|rm|theta1>:<math-up|atan2><around*|(|<with|math-font-family|rm|s1>,<with|math-font-family|rm|c1>|)>,<with|math-font-family|rm|theta2>:<math-up|atan2><around*|(|<with|math-font-family|rm|s2>,<with|math-font-family|rm|c2>|)>,<with|math-font-family|rm|theta3>:<math-up|atan2><around*|(|<with|math-font-family|rm|s3>,<with|math-font-family|rm|c3>|)>,<around*|[|<with|math-font-family|rm|theta1>,<with|math-font-family|rm|theta2>,<with|math-font-family|rm|theta3>|]>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      calcolo_R(a):=block(

      [S,II,IImS,det,IIpS,R],

      S:matrix([0,-a[3][1],a[2][1]],[a[3][1],0,-a[1][1]],[-a[2][1],a[1][1],0]),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      IImS:II-S,

      det:determinant(IImS),

      \;

      if det = 0 then return(0),

      IImS:invert(IImS),

      IIpS:II+S,

      R:IIpS.IImS,

      R:trigreduce(R),

      \;

      if a[1,1] = 0 and a[2,1] = 0 then theta:angolo_z(R) elseif a[1,1] = 0
      and a[3,1] = 0 then theta:angolo_y(R) elseif a[2,1] = 0 and a[3,1] = 0
      then theta:angolo_x(R) else theta:angolo_gen(R),

      \;

      [R,theta]

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><with|math-font-family|rm|calcolo_R><around*|(|a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|S,<math-up|II>,<math-up|IImS>,<math-up|det>,<math-up|IIpS>,R|]>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-<around*|(|a<rsub|3>|)><rsub|1>>|<cell|<around*|(|a<rsub|2>|)><rsub|1>>>|<row|<cell|<around*|(|a<rsub|3>|)><rsub|1>>|<cell|0>|<cell|-<around*|(|a<rsub|1>|)><rsub|1>>>|<row|<cell|-<around*|(|a<rsub|2>|)><rsub|1>>|<cell|<around*|(|a<rsub|1>|)><rsub|1>>|<cell|0>>>>>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|IImS>:<math-up|II>-S,<math-up|det>:<math-up|determinant><around*|(|<math-up|IImS>|)>,<math-bf|if><space|0.27em><math-up|det>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|IImS>:<math-up|invert><around*|(|<math-up|IImS>|)>,<math-up|IIpS>:<math-up|II>+S,R:<math-up|IIpS>\<cdot\><math-up|IImS>,R:<math-up|trigreduce><around*|(|R|)>,<math-bf|if><space|0.27em>a<rsub|1,1>=0\<wedge\>a<rsub|2,1>=0<space|0.27em><math-bf|then><space|0.27em>\<vartheta\>:<with|math-font-family|rm|angolo_z><around*|(|R|)><space|0.27em><math-bf|elseif><space|0.27em>a<rsub|1,1>=0\<wedge\>a<rsub|3,1>=0<space|0.27em><math-bf|then><space|0.27em>\<vartheta\>:<with|math-font-family|rm|angolo_y><around*|(|R|)><space|0.27em><math-bf|elseif><space|0.27em>a<rsub|2,1>=0\<wedge\>a<rsub|3,1>=0<space|0.27em><math-bf|then><space|0.27em>\<vartheta\>:<with|math-font-family|rm|angolo_x><around*|(|R|)><space|0.27em><math-bf|else><space|0.27em>\<vartheta\>:<with|math-font-family|rm|angolo_gen><around*|(|R|)>,<around*|[|R,\<vartheta\>|]>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      calcolo_R(matrix([1],[1],[0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|3>>|<cell|<frac|2|3>>|<cell|<frac|2|3>>>|<row|<cell|<frac|2|3>>|<cell|<frac|1|3>>|<cell|-<frac|2|3>>>|<row|<cell|-<frac|2|3>>|<cell|<frac|2|3>>|<cell|-<frac|1|3>>>>>>,<around*|[|\<pi\>-arctan
      <around*|(|2|)>,arctan <around*|(|<frac|2|<sqrt|5>>|)>,arctan
      <around*|(|2|)>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      calcolo_R(matrix([1],[0],[0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>|<row|<cell|0>|<cell|1>|<cell|0>>>>>,<frac|\<pi\>|2>|]>>>
    </unfolded-io>
  </session>

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  <with|color|red|ESERCITAZIONE 2: Procedura che prende in ingresso una
  matrice di rotazione R e genera una matrice anti-simmetrica S.>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      calcolo_S(mat_R):=block(

      [R_trasp,R_tot,II,det,RpII,RmII,S],

      R_trasp:transpose(mat_R),

      R_tot:mat_R.R_trasp,

      R_tot:trigsimp(R_tot),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if R_tot # II then return(0),

      \;

      det:determinant(mat_R),

      det:trigsimp(det),

      if det # 1 then return(0),

      \;

      RpII:mat_R+II,

      RpII:trigsimp(RpII),

      det:determinant(RpII),

      det:trigsimp(det),

      if det = 0 then return(0),

      \;

      RmII:mat_R-II,

      RmII:trigsimp(RmII),

      RpII:invert(RpII),

      S:RpII.RmII,

      S:trigsimp(S)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><with|math-font-family|rm|calcolo_S><around*|(|<with|math-font-family|rm|mat_R>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|R_trasp>,<with|math-font-family|rm|R_tot>,<math-up|II>,<math-up|det>,<math-up|RpII>,<math-up|RmII>,S|]>,<with|math-font-family|rm|R_trasp>:<math-up|transpose><around*|(|<with|math-font-family|rm|mat_R>|)>,<with|math-font-family|rm|R_tot>:<with|math-font-family|rm|mat_R>\<cdot\><with|math-font-family|rm|R_trasp>,<with|math-font-family|rm|R_tot>:<math-up|trigsimp><around*|(|<with|math-font-family|rm|R_tot>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|R_tot>\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|det>:<math-up|determinant><around*|(|<with|math-font-family|rm|mat_R>|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|det>|)>,<math-bf|if><space|0.27em><math-up|det>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|RpII>:<with|math-font-family|rm|mat_R>+<math-up|II>,<math-up|RpII>:<math-up|trigsimp><around*|(|<math-up|RpII>|)>,<math-up|det>:<math-up|determinant><around*|(|<math-up|RpII>|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|det>|)>,<math-bf|if><space|0.27em><math-up|det>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|RmII>:<with|math-font-family|rm|mat_R>-<math-up|II>,<math-up|RmII>:<math-up|trigsimp><around*|(|<math-up|RmII>|)>,<math-up|RpII>:<math-up|invert><around*|(|<math-up|RpII>|)>,S:<math-up|RpII>\<cdot\><math-up|RmII>,S:<math-up|trigsimp><around*|(|S|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      calcolo_S(matrix([0,1,0],[0,0,-1],[-1,0,0]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|1>|<cell|1>>|<row|<cell|-1>|<cell|0>|<cell|-1>>|<row|<cell|-1>|<cell|1>|<cell|0>>>>>>>
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