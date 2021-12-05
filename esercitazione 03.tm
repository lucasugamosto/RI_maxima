<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <with|color|red|ESERCITAZIONE 1: Procedura che prende in input un vettore e
  associa a quel vettore la corrispondente matrice anti-simmetrica.>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      mat_antisimmetrica(v):=block(

      [S],

      S:matrix([0,-v[3][1],v[2][1]],[v[3][1],0,-v[1][1]],[-v[2][1],v[1][1],0])

      )

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|mat_antisimmetrica><around*|(|v|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|S|]>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-<around*|(|v<rsub|3>|)><rsub|1>>|<cell|<around*|(|v<rsub|2>|)><rsub|1>>>|<row|<cell|<around*|(|v<rsub|3>|)><rsub|1>>|<cell|0>|<cell|-<around*|(|v<rsub|1>|)><rsub|1>>>|<row|<cell|-<around*|(|v<rsub|2>|)><rsub|1>>|<cell|<around*|(|v<rsub|1>|)><rsub|1>>|<cell|0>>>>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      mat_antisimmetrica(matrix([1],[2],[3]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-3>|<cell|2>>|<row|<cell|3>|<cell|0>|<cell|-1>>|<row|<cell|-2>|<cell|1>|<cell|0>>>>>>>
    </unfolded-io>

    \;

    <with|color|red|ESERCITAZIONE 2: Procedura che prende in input una
    matrice, verifica se è anti-simmetrica e determina il vettore
    corrispondente:>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      calcolo_vettore(S):=block(

      [S_trasp,mat],

      \;

      if S[1][1] # 0 or S[2][2] # 0 or S[3][3] # 0 then return(0),

      S_trasp:transpose(S),

      mat:-S,

      \;

      if S_trasp # mat then return(0),

      v:matrix([S[3][2]],[S[1][3]],[S[2][1]])

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|calcolo_vettore><around*|(|S|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|S_trasp>,<math-up|mat>|]>,<math-bf|if><space|0.27em><around*|(|S<rsub|1>|)><rsub|1>\<neq\>0\<vee\><around*|(|S<rsub|2>|)><rsub|2>\<neq\>0\<vee\><around*|(|S<rsub|3>|)><rsub|3>\<neq\>0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<with|math-font-family|rm|S_trasp>:<math-up|transpose><around*|(|S|)>,<math-up|mat>:-S,<math-bf|if><space|0.27em><with|math-font-family|rm|S_trasp>\<neq\><math-up|mat><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,v:<matrix|<tformat|<table|<row|<cell|<around*|(|S<rsub|3>|)><rsub|2>>>|<row|<cell|<around*|(|S<rsub|1>|)><rsub|3>>>|<row|<cell|<around*|(|S<rsub|2>|)><rsub|1>>>>>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      calcolo_vettore(matrix([0,-3,2],[3,0,-1],[-2,1,0]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|2>>|<row|<cell|3>>>>>>>
    </unfolded-io>

    \;

    \;

    <with|color|red|ESERCITAZIONE 3: Procedura che prende in input una coppia
    di valori (vettore,angolo). Se il vettore è un versore allora si applica
    la procedura per il calcolo della matrice di rotazione. Se il vettore non
    è un versore bisogna normalizzare il vettore e moltiplicare l'angolo per
    la norma calcolata in precedenza.>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      mat_rotazione(v,theta):=block(

      [norma2,S,gamma,II,sII,sIImS,sIImS_inv,mat],

      norma2:sqrt((v[1][1])^2+(v[2][1])^2+(v[3][1])^2),

      \;

      if norma2 # 1 then S: (1/norma2).(matrix([0,-v[3][1],v[2][1]],[v[3][1],0,-v[1][1]],[-v[2][1],v[1][1],0]))
      else S: matrix([0,-v[3][1],v[2][1]],[v[3][1],0,-v[1][1]],[-v[2][1],v[1][1],0]),

      \;

      gamma:theta/180,

      gamma:%pi.gamma,

      if norma2 # 1 then gamma:gamma.norma2,

      \;

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      sII:s*II,

      sIImS:sII-S,

      sIImS_inv:invert(sIImS),

      mat:matrix([ilt(sIImS_inv[1][1],s,t),ilt(sIImS_inv[1][2],s,t),ilt(sIImS_inv[1][3],s,t)],[ilt(sIImS_inv[2][1],s,t),ilt(sIImS_inv[2][2],s,t),ilt(sIImS_inv[2][3],s,t)],[ilt(sIImS_inv[3][1],s,t),ilt(sIImS_inv[3][2],s,t),ilt(sIImS_inv[3][3],s,t)]),

      mat:subst(t=gamma,mat),

      mat:trigreduce(mat)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><with|math-font-family|rm|mat_rotazione><around*|(|v,\<vartheta\>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|norma2>,S,\<gamma\>,<math-up|II>,<math-up|sII>,<math-up|sIImS>,<with|math-font-family|rm|sIImS_inv>,<math-up|mat>|]>,<with|math-font-family|rm|norma2>:<sqrt|<around*|(|v<rsub|1>|)><rsub|1><rsup|2>+<around*|(|v<rsub|2>|)><rsub|1><rsup|2>+<around*|(|v<rsub|3>|)><rsub|1><rsup|2>>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>S:<around*|(|<frac|1|<with|math-font-family|rm|norma2>>|)>\<cdot\><matrix|<tformat|<table|<row|<cell|0>|<cell|-<around*|(|v<rsub|3>|)><rsub|1>>|<cell|<around*|(|v<rsub|2>|)><rsub|1>>>|<row|<cell|<around*|(|v<rsub|3>|)><rsub|1>>|<cell|0>|<cell|-<around*|(|v<rsub|1>|)><rsub|1>>>|<row|<cell|-<around*|(|v<rsub|2>|)><rsub|1>>|<cell|<around*|(|v<rsub|1>|)><rsub|1>>|<cell|0>>>>><space|0.27em><math-bf|else><space|0.27em>S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-<around*|(|v<rsub|3>|)><rsub|1>>|<cell|<around*|(|v<rsub|2>|)><rsub|1>>>|<row|<cell|<around*|(|v<rsub|3>|)><rsub|1>>|<cell|0>|<cell|-<around*|(|v<rsub|1>|)><rsub|1>>>|<row|<cell|-<around*|(|v<rsub|2>|)><rsub|1>>|<cell|<around*|(|v<rsub|1>|)><rsub|1>>|<cell|0>>>>>,\<gamma\>:<frac|\<vartheta\>|180>,\<gamma\>:\<pi\>\<cdot\>\<gamma\>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>\<gamma\>:\<gamma\>\<cdot\><with|math-font-family|rm|norma2>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|sII>:s*<math-up|II>,<math-up|sIImS>:<math-up|sII>-S,<with|math-font-family|rm|sIImS_inv>:<math-up|invert><around*|(|<math-up|sIImS>|)>,<math-up|mat>:<matrix|<tformat|<table|<row|<cell|<math-up|ilt><around*|(|<around*|(|<with|math-font-family|rm|sIImS_inv><rsub|1>|)><rsub|1>,s,t|)>>|<cell|<math-up|ilt><around*|(|<around*|(|<with|math-font-family|rm|sIImS_inv><rsub|1>|)><rsub|2>,s,t|)>>|<cell|<math-up|ilt><around*|(|<around*|(|<with|math-font-family|rm|sIImS_inv><rsub|1>|)><rsub|3>,s,t|)>>>|<row|<cell|<math-up|ilt><around*|(|<around*|(|<with|math-font-family|rm|sIImS_inv><rsub|2>|)><rsub|1>,s,t|)>>|<cell|<math-up|ilt><around*|(|<around*|(|<with|math-font-family|rm|sIImS_inv><rsub|2>|)><rsub|2>,s,t|)>>|<cell|<math-up|ilt><around*|(|<around*|(|<with|math-font-family|rm|sIImS_inv><rsub|2>|)><rsub|3>,s,t|)>>>|<row|<cell|<math-up|ilt><around*|(|<around*|(|<with|math-font-family|rm|sIImS_inv><rsub|3>|)><rsub|1>,s,t|)>>|<cell|<math-up|ilt><around*|(|<around*|(|<with|math-font-family|rm|sIImS_inv><rsub|3>|)><rsub|2>,s,t|)>>|<cell|<math-up|ilt><around*|(|<around*|(|<with|math-font-family|rm|sIImS_inv><rsub|3>|)><rsub|3>,s,t|)>>>>>>,<math-up|mat>:<math-up|subst><around*|(|t=\<gamma\>,<math-up|mat>|)>,<math-up|mat>:<math-up|trigreduce><around*|(|<math-up|mat>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      mat_rotazione(matrix([1],[1],[0]),45)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|<frac|cos
      <around*|(|<frac|\<pi\>|2<rsup|<frac|3|2>>>|)>|2>+<frac|1|2>>|<cell|<frac|1|2>-<frac|cos
      <around*|(|<frac|\<pi\>|2<rsup|<frac|3|2>>>|)>|2>>|<cell|<frac|sin
      <around*|(|<frac|\<pi\>|2<rsup|<frac|3|2>>>|)>|<sqrt|2>>>>|<row|<cell|<frac|1|2>-<frac|cos
      <around*|(|<frac|\<pi\>|2<rsup|<frac|3|2>>>|)>|2>>|<cell|<frac|cos
      <around*|(|<frac|\<pi\>|2<rsup|<frac|3|2>>>|)>|2>+<frac|1|2>>|<cell|-<frac|sin
      <around*|(|<frac|\<pi\>|2<rsup|<frac|3|2>>>|)>|<sqrt|2>>>>|<row|<cell|-<frac|sin
      <around*|(|<frac|\<pi\>|2<rsup|<frac|3|2>>>|)>|<sqrt|2>>>|<cell|<frac|sin
      <around*|(|<frac|\<pi\>|2<rsup|<frac|3|2>>>|)>|<sqrt|2>>>|<cell|cos
      <around*|(|<frac|\<pi\>|2<rsup|<frac|3|2>>>|)>>>>>>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>