<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <with|color|red|ESERCITAZIONE 1: Calcolo del prodotto vettoriale e
  dimostrazione delle sue propriet�>

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

      mat:matrix([e[x],e[y],e[z]],[a[1],a[2],a[3]],[b[1],b[2],b[3]]),

      result:determinant(mat)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|prodotto_vettoriale><around*|(|a,b|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|mat>,<math-up|result>|]>,<math-up|mat>:<matrix|<tformat|<table|<row|<cell|e<rsub|x>>|<cell|e<rsub|y>>|<cell|e<rsub|z>>>|<row|<cell|a<rsub|1>>|<cell|a<rsub|2>>|<cell|a<rsub|3>>>|<row|<cell|b<rsub|1>>|<cell|b<rsub|2>>|<cell|b<rsub|3>>>>>>,<math-up|result>:<math-up|determinant><around*|(|<math-up|mat>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      prodotto_vettoriale(a,b)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|<around*|(|\<alpha\><rsub|1>*\<gamma\><rsub|2>-\<gamma\><rsub|1>*\<alpha\><rsub|2>|)>*e<rsub|z>-<around*|(|\<alpha\><rsub|1>*\<gamma\><rsub|3>-\<gamma\><rsub|1>*\<alpha\><rsub|3>|)>*e<rsub|y>+<around*|(|\<alpha\><rsub|2>*\<gamma\><rsub|3>-\<gamma\><rsub|2>*\<alpha\><rsub|3>|)>*e<rsub|x>|]>>>
    </unfolded-io>

    \;

    PROPRIETA' DISTRIBUTIVA rispetto alla somma del prodotto vettoriale:

    La propriet� distributiva rispetto alla somma ci permette di affermare
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

      [sum,result1],

      sum:u+w,

      result1:prodotto_vettoriale(v,sum),

      result2:prodotto_vettoriale(v,u),

      result3:prodotto_vettoriale(v,w),

      final_sum:result2+result3,

      fullratsimp(result1),

      fullratsimp(final_sum),

      [result1,final_sum]

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><with|math-font-family|rm|proprieta_distributiva><around*|(|u,v,w|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|sum>,<with|math-font-family|rm|result1>|]>,<math-up|sum>:u+w,<with|math-font-family|rm|result1>:<with|math-font-family|rm|prodotto_vettoriale><around*|(|v,<math-up|sum>|)>,<with|math-font-family|rm|result2>:<with|math-font-family|rm|prodotto_vettoriale><around*|(|v,u|)>,<with|math-font-family|rm|result3>:<with|math-font-family|rm|prodotto_vettoriale><around*|(|v,w|)>,<with|math-font-family|rm|final_sum>:<with|math-font-family|rm|result2>+<with|math-font-family|rm|result3>,<math-up|fullratsimp><around*|(|<with|math-font-family|rm|result1>|)>,<math-up|fullratsimp><around*|(|<with|math-font-family|rm|final_sum>|)>,<around*|[|<with|math-font-family|rm|result1>,<with|math-font-family|rm|final_sum>|]>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      proprieta_distributiva(u,v,w)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|<around*|[|<around*|(|\<gamma\><rsub|1>*<around*|(|\<delta\><rsub|2>+\<alpha\><rsub|2>|)>-<around*|(|\<delta\><rsub|1>+\<alpha\><rsub|1>|)>*\<gamma\><rsub|2>|)>*e<rsub|z>-<around*|(|\<gamma\><rsub|1>*<around*|(|\<delta\><rsub|3>+\<alpha\><rsub|3>|)>-<around*|(|\<delta\><rsub|1>+\<alpha\><rsub|1>|)>*\<gamma\><rsub|3>|)>*e<rsub|y>+<around*|(|\<gamma\><rsub|2>*<around*|(|\<delta\><rsub|3>+\<alpha\><rsub|3>|)>-<around*|(|\<delta\><rsub|2>+\<alpha\><rsub|2>|)>*\<gamma\><rsub|3>|)>*e<rsub|x>|]>,<around*|[|<around*|(|\<gamma\><rsub|1>*\<delta\><rsub|2>-\<delta\><rsub|1>*\<gamma\><rsub|2>|)>*e<rsub|z>+<around*|(|\<gamma\><rsub|1>*\<alpha\><rsub|2>-\<alpha\><rsub|1>*\<gamma\><rsub|2>|)>*e<rsub|z>-<around*|(|\<gamma\><rsub|1>*\<delta\><rsub|3>-\<delta\><rsub|1>*\<gamma\><rsub|3>|)>*e<rsub|y>-<around*|(|\<gamma\><rsub|1>*\<alpha\><rsub|3>-\<alpha\><rsub|1>*\<gamma\><rsub|3>|)>*e<rsub|y>+<around*|(|\<gamma\><rsub|2>*\<delta\><rsub|3>-\<delta\><rsub|2>*\<gamma\><rsub|3>|)>*e<rsub|x>+<around*|(|\<gamma\><rsub|2>*\<alpha\><rsub|3>-\<alpha\><rsub|2>*\<gamma\><rsub|3>|)>*e<rsub|x>|]>|]>>>
    </unfolded-io>

    \;

    Il prodotto vettoriale � ANTI-SIMMETRICO cio� a x b = - b x a, al
    contrario del prodotto scalare che � simmetrico.

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

      result1:prodotto_vettoriale(u,v),

      result2:prodotto_vettoriale(v,u),

      fullratsimp(result1),

      fullratsimp(result2),

      [result1,result2]

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><with|math-font-family|rm|proprieta_antisimmetria><around*|(|u,v|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|result1>,<with|math-font-family|rm|result2>|]>,<with|math-font-family|rm|result1>:<with|math-font-family|rm|prodotto_vettoriale><around*|(|u,v|)>,<with|math-font-family|rm|result2>:<with|math-font-family|rm|prodotto_vettoriale><around*|(|v,u|)>,<math-up|fullratsimp><around*|(|<with|math-font-family|rm|result1>|)>,<math-up|fullratsimp><around*|(|<with|math-font-family|rm|result2>|)>,<around*|[|<with|math-font-family|rm|result1>,<with|math-font-family|rm|result2>|]>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      proprieta_antisimmetria(u,v)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|<around*|[|<around*|(|\<alpha\><rsub|1>*\<gamma\><rsub|2>-\<gamma\><rsub|1>*\<alpha\><rsub|2>|)>*e<rsub|z>-<around*|(|\<alpha\><rsub|1>*\<gamma\><rsub|3>-\<gamma\><rsub|1>*\<alpha\><rsub|3>|)>*e<rsub|y>+<around*|(|\<alpha\><rsub|2>*\<gamma\><rsub|3>-\<gamma\><rsub|2>*\<alpha\><rsub|3>|)>*e<rsub|x>|]>,<around*|[|<around*|(|\<gamma\><rsub|1>*\<alpha\><rsub|2>-\<alpha\><rsub|1>*\<gamma\><rsub|2>|)>*e<rsub|z>-<around*|(|\<gamma\><rsub|1>*\<alpha\><rsub|3>-\<alpha\><rsub|1>*\<gamma\><rsub|3>|)>*e<rsub|y>+<around*|(|\<gamma\><rsub|2>*\<alpha\><rsub|3>-\<alpha\><rsub|2>*\<gamma\><rsub|3>|)>*e<rsub|x>|]>|]>>>
    </unfolded-io>
  </session>

  \;

  <with|color|red|ESERCITAZIONE 2: Calcolo della matrice di rotazione e
  dimostrazione delle sue propriet�: la matrice di rotazione � una matrice
  isometrica e il determinante di una matrice di rotazione � +-1.>

  Calcolo della matrice di rotazione:

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      matrice_rotazione(theta):=block(

      [result],

      result:matrix([cos(theta), -sin(theta)],[sin(theta), cos(theta)])

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><with|math-font-family|rm|matrice_rotazione><around*|(|\<vartheta\>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|result>|]>,<math-up|result>:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>>|<row|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>>>>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      matrice_rotazione(gamma)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<gamma\>|)>>|<cell|-sin
      <around*|(|\<gamma\>|)>>>|<row|<cell|sin
      <around*|(|\<gamma\>|)>>|<cell|cos <around*|(|\<gamma\>|)>>>>>>>>
    </unfolded-io>

    \;

    Dimostrazione che la matrice di rotazione � una matrice isometrica:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      proprieta_mat_rotazione(mat):=block(

      [mat_trasp,result1,result2],

      mat_trasp:transpose(mat),

      result1:mat.mat_trasp,

      \;

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if result1 # II then return(0),

      result2:determinant(mat),

      if result2 # 1 then return(0),

      return(1)

      )

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><with|math-font-family|rm|proprieta_mat_rotazione><around*|(|<math-up|mat>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|mat_trasp>,<with|math-font-family|rm|result1>,<with|math-font-family|rm|result2>|]>,<with|math-font-family|rm|mat_trasp>:<math-up|transpose><around*|(|<math-up|mat>|)>,<with|math-font-family|rm|result1>:<math-up|mat>\<cdot\><with|math-font-family|rm|mat_trasp>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|result1>\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<with|math-font-family|rm|result2>:<math-up|determinant><around*|(|<math-up|mat>|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|result2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|return><around*|(|1|)>|)>>>
    </unfolded-io>

    La funzione ADJOINT permette di ottenere la matrice aggiunta, cio�
    l'inverso della matrice di input moltiplicata per il suo determinante,
    tale operazione permette di calcolare su maxima l'autovettore associato
    ad un vettore della matrice.

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      mat:matrix([1,0,0],[0,1,0],[0,0,1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      proprieta_mat_rotazione(mat)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      mat:matrix([1,0,0],[0,1,0],[2,0,1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|2>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      proprieta_mat_rotazione(mat)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >>0>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>