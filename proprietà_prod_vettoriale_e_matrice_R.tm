<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA PER IL CALCOLO DEL PRODOTTO VETTORIALE E DELLA MATRICE DI
  ROTAZIONE.

  <with|color|red|Procedura 1: Calcolo del prodotto vettoriale e
  dimostrazione delle sue proprietà>

  Calcolo del prodotto vettoriale:

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      a:matrix([alpha[1]],[alpha[2]],[alpha[3]])$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      b:matrix([gamma[1]],[gamma[2]],[gamma[3]])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      prodotto_vettoriale(a,b):=block(

      [mat,result],

      if scalarp(a) = true or listp(a) = true then return(0),

      if scalarp(b) = true or listp(b) = true then return(0),

      \;

      mat:matrix([e[x],e[y],e[z]],[a[1],a[2],a[3]],[b[1],b[2],b[3]]),

      result:trigsimp(determinant(mat))

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|prodotto_vettoriale><around*|(|a,b|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|mat>,<math-up|result>|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|a|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|a|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|b|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|b|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|mat>:<matrix|<tformat|<table|<row|<cell|e<rsub|x>>|<cell|e<rsub|y>>|<cell|e<rsub|z>>>|<row|<cell|a<rsub|1>>|<cell|a<rsub|2>>|<cell|a<rsub|3>>>|<row|<cell|b<rsub|1>>|<cell|b<rsub|2>>|<cell|b<rsub|3>>>>>>,<math-up|result>:<math-up|trigsimp><around*|(|<math-up|determinant><around*|(|<math-up|mat>|)>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      prodotto_vettoriale(a,b)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|<around*|(|\<alpha\><rsub|1>*\<gamma\><rsub|2>-\<gamma\><rsub|1>*\<alpha\><rsub|2>|)>*e<rsub|z>+<around*|(|\<gamma\><rsub|1>*\<alpha\><rsub|3>-\<alpha\><rsub|1>*\<gamma\><rsub|3>|)>*e<rsub|y>+<around*|(|\<alpha\><rsub|2>*\<gamma\><rsub|3>-\<gamma\><rsub|2>*\<alpha\><rsub|3>|)>*e<rsub|x>|]>>>
    </unfolded-io>

    \;

    PROPRIETA' DISTRIBUTIVA (rispetto alla somma) del prodotto vettoriale:

    La proprietà distributiva rispetto alla somma ci permette di affermare
    che dati tre vettori u,v,w allora v x (u + w) = v x u + v x w.

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      u:matrix([alpha[1]],[alpha[2]],[alpha[3]])$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      v:matrix([gamma[1]],[gamma[2]],[gamma[3]])$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      w:matrix([delta[1]],[delta[2]],[delta[3]])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      proprieta_distributiva(u,v,w):=block(

      [sum,res1,res2,res3,final_sum],

      if scalarp(u) = true or listp(u) = true then return(0),

      if scalarp(v) = true or listp(v) = true then return(0),

      if scalarp(w) = true or listp(w) = true then return(0),

      \;

      sum:u+w,

      res1:prodotto_vettoriale(v,sum),

      res2:prodotto_vettoriale(v,u),

      res3:prodotto_vettoriale(v,w),

      final_sum:fullratsimp(res2+res3),

      [res1,final_sum]

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><with|math-font-family|rm|proprieta_distributiva><around*|(|u,v,w|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|sum>,<with|math-font-family|rm|res1>,<with|math-font-family|rm|res2>,<with|math-font-family|rm|res3>,<with|math-font-family|rm|final_sum>|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|u|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|u|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|v|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|v|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|w|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|w|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|sum>:u+w,<with|math-font-family|rm|res1>:<with|math-font-family|rm|prodotto_vettoriale><around*|(|v,<math-up|sum>|)>,<with|math-font-family|rm|res2>:<with|math-font-family|rm|prodotto_vettoriale><around*|(|v,u|)>,<with|math-font-family|rm|res3>:<with|math-font-family|rm|prodotto_vettoriale><around*|(|v,w|)>,<with|math-font-family|rm|final_sum>:<math-up|fullratsimp><around*|(|<with|math-font-family|rm|res2>+<with|math-font-family|rm|res3>|)>,<around*|[|<with|math-font-family|rm|res1>,<with|math-font-family|rm|final_sum>|]>|)>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      proprieta_distributiva(u,v,w)$
    </input>

    \;

    <around*|[|<around*|(|<around*|(|-\<delta\><rsub|1>-\<alpha\><rsub|1>|)>*\<gamma\><rsub|2>+\<gamma\><rsub|1>*\<delta\><rsub|2>+\<gamma\><rsub|1>*\<alpha\><rsub|2>|)>*e<rsub|z>+<around*|(|<around*|(|\<delta\><rsub|1>+\<alpha\><rsub|1>|)>*\<gamma\><rsub|3>-\<gamma\><rsub|1>*\<delta\><rsub|3>-\<gamma\><rsub|1>*\<alpha\><rsub|3>|)>*e<rsub|y>+<around*|(|<around*|(|-\<delta\><rsub|2>-\<alpha\><rsub|2>|)>*\<gamma\><rsub|3>+\<gamma\><rsub|2>*\<delta\><rsub|3>+\<gamma\><rsub|2>*\<alpha\><rsub|3>|)>*e<rsub|x>|]>

    \;

    <around*|[|<around*|(|<around*|(|-\<delta\><rsub|1>-\<alpha\><rsub|1>|)>*\<gamma\><rsub|2>+\<gamma\><rsub|1>*\<delta\><rsub|2>+\<gamma\><rsub|1>*\<alpha\><rsub|2>|)>*e<rsub|z>+<around*|(|<around*|(|\<delta\><rsub|1>+\<alpha\><rsub|1>|)>*\<gamma\><rsub|3>-\<gamma\><rsub|1>*\<delta\><rsub|3>-\<gamma\><rsub|1>*\<alpha\><rsub|3>|)>*e<rsub|y>+<around*|(|<around*|(|-\<delta\><rsub|2>-\<alpha\><rsub|2>|)>*\<gamma\><rsub|3>+\<gamma\><rsub|2>*\<delta\><rsub|3>+\<gamma\><rsub|2>*\<alpha\><rsub|3>|)>*e<rsub|x>|]>

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    Il prodotto vettoriale è ANTI-SIMMETRICO cioè a x b = - b x a, al
    contrario del prodotto scalare che è simmetrico.

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      u$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      v$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      proprieta_antisimmetria(u,v):=block(

      [result1,result2],

      if scalarp(u) = true or listp(u) = true then return(0),

      if scalarp(v) = true or listp(v) = true then return(0),

      \;

      result1:prodotto_vettoriale(u,v),

      result2:prodotto_vettoriale(v,u),

      return([result1,result2])

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><with|math-font-family|rm|proprieta_antisimmetria><around*|(|u,v|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|result1>,<with|math-font-family|rm|result2>|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|u|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|u|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|v|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|v|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<with|math-font-family|rm|result1>:<with|math-font-family|rm|prodotto_vettoriale><around*|(|u,v|)>,<with|math-font-family|rm|result2>:<with|math-font-family|rm|prodotto_vettoriale><around*|(|v,u|)>,<math-up|return><around*|(|<around*|[|<with|math-font-family|rm|result1>,<with|math-font-family|rm|result2>|]>|)>|)>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|input>
      proprieta_antisimmetria(u,v)$
    </input>
  </session>

  <math|<around*|[|<around*|(|\<alpha\><rsub|1>*\<gamma\><rsub|2>-\<gamma\><rsub|1>*\<alpha\><rsub|2>|)>*e<rsub|z>-<around*|(|\<alpha\><rsub|1>*\<gamma\><rsub|3>-\<gamma\><rsub|1>*\<alpha\><rsub|3>|)>*e<rsub|y>+<around*|(|\<alpha\><rsub|2>*\<gamma\><rsub|3>-\<gamma\><rsub|2>*\<alpha\><rsub|3>|)>*e<rsub|x>|]>>

  <math|<around*|[|<around*|(|\<gamma\><rsub|1>*\<alpha\><rsub|2>-\<alpha\><rsub|1>*\<gamma\><rsub|2>|)>*e<rsub|z>-<around*|(|\<gamma\><rsub|1>*\<alpha\><rsub|3>-\<alpha\><rsub|1>*\<gamma\><rsub|3>|)>*e<rsub|y>+<around*|(|\<gamma\><rsub|2>*\<alpha\><rsub|3>-\<alpha\><rsub|2>*\<gamma\><rsub|3>|)>*e<rsub|x>|]>>

  \;

  <\with|color|red>
    \;

    \;

    \;

    \;

    Procedura 2: Calcolo della matrice di rotazione e dimostrazione delle sue
    proprietà: la matrice di rotazione è una matrice isometrica e il
    determinante di una matrice di rotazione è +-1.
  </with>

  Calcolo della matrice di rotazione R:

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      matrice_rotazione(theta):=block(

      [res],

      if listp(theta) = true or matrixp(theta) = true then return(0),

      res:matrix([cos(theta), -sin(theta)],[sin(theta), cos(theta)]),

      return(res)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><with|math-font-family|rm|matrice_rotazione><around*|(|\<vartheta\>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|res>|]>,<math-bf|if><space|0.27em><math-up|listp><around*|(|\<vartheta\>|)>=<math-bf|true>\<vee\><math-up|matrixp><around*|(|\<vartheta\>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|res>:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>>|<row|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>>>>>,<math-up|return><around*|(|<math-up|res>|)>|)>>>
    </unfolded-io>

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

    Dimostrazione che la matrice di rotazione è una matrice isometrica:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      proprieta_mat_R(theta):=block(

      [mat,mat_T,res1,res2],

      mat:matrice_rotazione(theta),

      mat_T:transpose(mat),

      res1:trigsimp(mat.mat_T),

      \;

      II:matrix([1,0],[0,1]),

      if res1 # II then return(0),

      res2:trigsimp(determinant(mat)),

      if res2 # 1 then return(0) else return(1)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><with|math-font-family|rm|proprieta_mat_R><around*|(|\<vartheta\>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|mat>,<with|math-font-family|rm|mat_T>,<with|math-font-family|rm|res1>,<with|math-font-family|rm|res2>|]>,<math-up|mat>:<with|math-font-family|rm|matrice_rotazione><around*|(|\<vartheta\>|)>,<with|math-font-family|rm|mat_T>:<math-up|transpose><around*|(|<math-up|mat>|)>,<with|math-font-family|rm|res1>:<math-up|trigsimp><around*|(|<math-up|mat>\<cdot\><with|math-font-family|rm|mat_T>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|res1>\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<with|math-font-family|rm|res2>:<math-up|trigsimp><around*|(|<math-up|determinant><around*|(|<math-up|mat>|)>|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|res2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)><space|0.27em><math-bf|else><space|0.27em><math-up|return><around*|(|1|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      proprieta_mat_R(%pi/6)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >>1>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>