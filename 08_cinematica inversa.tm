<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURE PER IL CALCOLO DELLA CINEMATICA INVERSA DI TUTTI LE STRUTTURE
  PORTANTI VISTE A LEZIONE.

  \;

  ESERCITAZIONE 1: Procedura per lo studio della cinematica inversa del robot
  RR che è definita dalle equazioni:

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:cos(q[1])*cos(q[2])*L[2]-sin(q[1])*sin(q[2])*L[2]+cos(q[1])*L[1]-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq2:sin(q[1])*cos(q[2])*L[2]+cos(q[1])*sin(q[2])*L[2]+sin(q[1])*L[1]-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      eq3:sin(q[2])^2+cos(q[2])^2-1$
    </input>

    \;

    Calcolo x<rsup|2>+y<rsup|2> così da cancellare una delle due variabili
    trigonometriche (in questo caso q<rsub|1>):

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      w1:solve([eq1],x)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      w2:solve([eq2],y)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      X:w1[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>x=-L<rsub|2>*sin <around*|(|q<rsub|1>|)>*sin
      <around*|(|q<rsub|2>|)>+L<rsub|2>*cos <around*|(|q<rsub|1>|)>*cos
      <around*|(|q<rsub|2>|)>+L<rsub|1>*cos <around*|(|q<rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      Y:w2[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >>y=L<rsub|2>*cos <around*|(|q<rsub|1>|)>*sin
      <around*|(|q<rsub|2>|)>+L<rsub|2>*sin <around*|(|q<rsub|1>|)>*cos
      <around*|(|q<rsub|2>|)>+L<rsub|1>*sin <around*|(|q<rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      eq:trigsimp(X^2+Y^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>y<rsup|2>+x<rsup|2>=2*L<rsub|1>*L<rsub|2>*cos
      <around*|(|q<rsub|2>|)>+L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      w3:solve([eq],cos(q[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|cos <around*|(|q<rsub|2>|)>=<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|]>>>
    </unfolded-io>

    \;

    Calcolo di cos(q<rsub|2>):

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      c2:subst(w3,cos(q[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>>>
    </unfolded-io>

    \;

    Per la regola n.1 deve valere che il cos(q<rsub|2>) , in modulo, sia
    minore o uguale a 1 affinchè esista almeno una soluzione.

    Inoltre affinchè l'equazione sia risolubile deve essere
    2*L<rsub|1>*L<rsub|2> diverso da 0.<rsub|>

    \;

    Da tale condizione si ottiene uno SPAZIO OPERATIVO CANDIDATO che
    corrisponde ad una CORONA CIRCOLARE di raggio inferiore pari a
    \|L<rsub|1>-L<rsub|2>\| e raggio superiore pari a (L<rsub|1>+L<rsub|2>) e
    centro in coordinate (0,0).

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      e1:subst([sin(q[2])=s[2],cos(q[2])=c2],eq3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><frac|<around*|(|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|2>|4*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>>+s<rsub|2><rsup|2>-1>>
    </unfolded-io>

    \;

    Calcolo di sin(q<rsub|2>):

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      s2:fullratsimp(solve(e1,s[2]))$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      S2[1]:subst(s2[1],s[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>-<frac|<sqrt|-y<rsup|4>+<around*|(|-2*x<rsup|2>+2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*y<rsup|2>-x<rsup|4>+<around*|(|2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*x<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*L<rsub|1>*L<rsub|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      S2[2]:subst(s2[2],s[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><frac|<sqrt|-y<rsup|4>+<around*|(|-2*x<rsup|2>+2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*y<rsup|2>-x<rsup|4>+<around*|(|2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*x<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*L<rsub|1>*L<rsub|2>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|input>
      q2[1]:atan2(S2[1],c2)$
    </input>
  </session>

  <math|-<math-up|atan2><around*|(|<frac|<sqrt|-y<rsup|4>+<around*|(|-2*x<rsup|2>+2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*y<rsup|2>-x<rsup|4>+<around*|(|2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*x<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*L<rsub|1>*L<rsub|2>>,<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      q2[2]:atan2(S2[2],c2)$
    </input>
  </session>

  <math|<text|<with|font-family|tt|color|red|><with|font-family|rm|atan2>><around*|(|<frac|<sqrt|-y<rsup|4>+<around*|(|-2*x<rsup|2>+2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*y<rsup|2>-x<rsup|4>+<around*|(|2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*x<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*L<rsub|1>*L<rsub|2>>,<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>>

  \;

  In definitiva si può affermare che q<rsub|2><rsub|> ha 2 SOLUZIONI
  GENERICHE.

  Mentre se cos(q<rsub|2>) = 1 o cos(q<rsub|2>) = -1 allora si ha un caso di
  SINGOLARITA' poichè si ha in entrambi i casi una sola SOLUZIONE e in
  particolare q<rsub|2> è pari a 0 o \<pi\>.

  Considerando ora q<rsub|2> come termine noto, si calcolare il valore di
  q<rsub|1> utilizzando la regola n.7 della cinematica inversa:\ 

  <\eqnarray*>
    <tformat|<cwith|3|3|3|3|cell-hyphen|t>|<cwith|3|3|3|3|cell-background|yellow>|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>>>>=R<around*|(|q<rsub|1>|)>*<around*|{|R<around*|(|q<rsub|2>|)>*<matrix|<tformat|<table|<row|<cell|L<rsub|2>>>|<row|<cell|0>>>>>+<matrix|<tformat|<table|<row|<cell|L<rsub|1>>>|<row|<cell|0>>>>>|}>>|<cell|\<rightarrow\>>|<cell|<matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>>>>=<matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|-s<rsub|1>>>|<row|<cell|s<rsub|1>>|<cell|c<rsub|1>>>>>>*<matrix|<tformat|<table|<row|<cell|a>>|<row|<cell|b>>>>>\<rightarrow\>>>|<row|<cell|\<rightarrow\><matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>>>>=<matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|-s<rsub|1>>>|<row|<cell|s<rsub|1>>|<cell|c<rsub|1>>>>>>*<matrix|<tformat|<table|<row|<cell|a>>|<row|<cell|b>>>>>>|<cell|\<rightarrow\>>|<cell|<matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>>>>=<matrix|<tformat|<table|<row|<cell|a>|<cell|-b>>|<row|<cell|b>|<cell|a>>>>>*<matrix|<tformat|<table|<row|<cell|c<rsub|1>>>|<row|<cell|s<rsub|1>>>>>>\<rightarrow\>>>|<row|<cell|\<rightarrow\><matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>>>>=<matrix|<tformat|<table|<row|<cell|a>|<cell|-b>>|<row|<cell|b>|<cell|a>>>>>*<matrix|<tformat|<table|<row|<cell|c<rsub|1>>>|<row|<cell|s<rsub|1>>>>>>>|<cell|\<rightarrow\>>|<cell|<matrix|<tformat|<table|<row|<cell|c<rsub|1>>>|<row|<cell|s<rsub|1>>>>>>=<matrix|<tformat|<table|<row|<cell|<frac|a|b<rsup|2>+a<rsup|2>>>|<cell|<frac|b|b<rsup|2>+a<rsup|2>>>>|<row|<cell|-<frac|b|b<rsup|2>+a<rsup|2>>>|<cell|<frac|a|b<rsup|2>+a<rsup|2>>>>>>>*<matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>>>>>>>>
  </eqnarray*>

  Considerando il caso in cui la coppia (x,y) appartiene allo spazio
  operativo, allora x<rsup|2>+y<rsup|2> != 0 da cui si ha L<rsub|1> !=
  L<rsub|2> e quindi il determinante della matrice sopra indicata è diversa
  non nulla. In tali condizioni è possibile poter definire i valori di
  cos(q<rsub|1>), sin(q<rsub|1>) e infine q<rsub|1>.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|input>
      a:L[2]*cos(q[2])+L[1]$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|input>
      b:L[2]*sin(q[2])$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|input>
      mat:invert(matrix([a,-b],[b,a]))$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      mat:subst([sin(q[2])=s[2],cos(q[2])=c[2]],mat)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><matrix|<tformat|<table|<row|<cell|<frac|L<rsub|2>*c<rsub|2>+L<rsub|1>|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>|<cell|<frac|L<rsub|2>*s<rsub|2>|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>>|<row|<cell|-<frac|L<rsub|2>*s<rsub|2>|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>|<cell|<frac|L<rsub|2>*c<rsub|2>+L<rsub|1>|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>>>>>>>
    </unfolded-io>

    \;

    Calcolo di cos(q<rsub|1>) e sin(q<rsub|1>):

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      c1:(mat[1][1]*x)+(mat[1][2]*y)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><frac|L<rsub|2>*s<rsub|2>*y|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>+<frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      s1:(mat[2][1]*x)+(mat[2][2]*y)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*y|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>-<frac|L<rsub|2>*s<rsub|2>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|input>
      q1:atan2(s1,c1)$
    </input>
  </session>

  <\equation*>
    <text|<with|font-family|tt|color|red|><with|font-family|rm|atan2>><around*|(|<frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*y|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>-<frac|L<rsub|2>*s<rsub|2>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>,<frac|L<rsub|2>*s<rsub|2>*y|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>+<frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>|)>
  </equation*>

  \;

  \;

  Al di fuori dei casi di singolarità ci sono 2 SOLUZIONI GENERICHE.

  Lo SPAZIO OPERATIVO finale è descritto da una CORONA CIRCOLARE di centro
  (0,0) con raggio inferiore \|L<rsub|1>-L<rsub|2>\| e raggio superiore
  (L<rsub|1>+L<rsub|2>).

  Nei casi di SINGOLARITA', dati dalla condizione di cos(q<rsub|2>) = 1 e
  cos(q<rsub|2>) = -1 allora ci sarà solo una SOLUZIONE; mentre se vale la
  condizione \|L<rsub|1>-L<rsub|2>\| = 0, allora lo SPAZIO OPERATIVO
  corrisponde alla circonferenza e il punto di coordinate (x,y) = (0,0) può
  essere raggiunto dall'end-effector in infiniti modi, quindi si hanno
  INFINITE SOLUZIONI.

  \;

  \;

  ESERCITAZIONE 2: Procedura per lo studio della cinematica inversa del robot
  CARTESIANO che è definita dalle equazioni:

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:q[3]-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq2:q[2]-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      eq3:q[1]-z$
    </input>

    Non ci sono funzioni trigonometriche e pertanto variabili q<rsub|i>
    trigonometriche, si tratta di un sistema lineare.

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      q1:solve(eq3,q[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|q<rsub|1>=z|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      q2:solve(eq2,q[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|q<rsub|2>=y|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      q3:solve(eq1,q[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|q<rsub|3>=x|]>>>
    </unfolded-io>
  </session>

  Non è servita nessuna condizione nell'imporre le soluzioni per q<rsub|1>,
  q<rsub|2>, q<rsub|3> per cui lo SPAZIO OPERATIVO è tutto R<rsup|3>. Nella
  realtà ci saranno dei fine corsa che limiteranno il variare delle tre
  variabili così da avere come spazio operativo effettivo un parallelepipedo.

  Ci sarà 1 SOLUZIONE GENERICA e nessun punto di SINGOLARITA'.

  \;

  \;

  ESERCITAZIONE 3: Procedura per lo studio della cinematica inversa del robot
  CILINDRICO che è definita dalle equazioni:

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:-q[3]*sin(q[1])-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq2:q[3]*cos(q[1])-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      eq3:q[2]+L[1]-z$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      w1:solve([eq1],x)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      w2:solve([eq2],y)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      w3:solve([eq3],z)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      X:w1[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>x=-q<rsub|3>*sin <around*|(|q<rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      Y:w2[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>y=q<rsub|3>*cos <around*|(|q<rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      Z:w3[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>z=q<rsub|2>+L<rsub|1>>>
    </unfolded-io>
  </session>

  Da tali equazioni si evince che il sistema è disaccoppiato poichè q<rsub|1>
  e q<rsub|3> non sono presenti in eq<rsub|3> (coordinata z) e q<rsub|2> non
  è presente in eq<rsub|1> ed eq<rsub|2> (coordinate x ed y), per tale motivo
  la terza equazione si risolve separatamente dalle altre due.

  Studiando solo eq<rsub|3> si ottiene:

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      q2:solve(Z,q[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|q<rsub|2>=z-L<rsub|1>|]>>>
    </unfolded-io>

    Da tale risultato si può affermare che q<rsub|2> ha 1 SOLUZIONE GENERICA;
    in riferimento a \Pz\Q, questa non ha punti di SINGOLARITA' e lo SPAZIO
    OPERATIVO è tutto R<rsup|1>

    \;

    Considerando le altre due equazioni rimanenti, in esse si può eliminare
    la variabile trigonometrica q<rsub|1> nel seguente modo e calcolare in
    seguito q<rsub|3>.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      eq:trigsimp(X^2+Y^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >>y<rsup|2>+x<rsup|2>=q<rsub|3><rsup|2>>>
    </unfolded-io>

    Tale equazione x<rsup|2>+y<rsup|2>=q<rsub|3><rsup|2> descrive una
    circonferenza di centro (0,0) e raggio q<rsub|3, >ci permette di definire
    lo SPAZIO OPERATIVO CANDIDATO nel piano (x,y) che è tutto R<rsup|2>.

    \;

    Imponendo però, come nella realtà, dei limiti minimi e massimi sia per
    q<rsub|2> sia per q<rsub|3> (del tipo [q<rsub|2min>,q<rsub|2max>] e
    [q<rsub|3min>,q<rsub|3max>]), allora la circonferenza diventa una CORONA
    CIRCOLARE di raggio minore q<rsub|3min> e raggio maggiore q<rsub|3max>,
    che si ripete rispetto all'asse z da un'altezza minima q<rsub|2min> ad
    un'altezza massima q<rsub|2max>.\ 

    Così facendo lo SPAZIO OPERATIVO è descritto dal CILINDRO CAVO.

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      w:solve([eq],q[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><around*|[|q<rsub|3>=-<sqrt|y<rsup|2>+x<rsup|2>>,q<rsub|3>=<sqrt|y<rsup|2>+x<rsup|2>>|]>>>
    </unfolded-io>

    Quindi q<rsub|3> ha 2 SOLUZIONI GENERICHE.

    C'è punto di SINGOLARITA' quando <math|x<rsup|2>+y<rsup|2>> = 0 poichè
    tale punto si può raggiungere con solo 1 SOLUZIONE di q<rsub|3>, il tutto
    se e solo se q<rsub|3min> = 0 e quindi il punto è raggiungibile.

    Quindi l'asse di rotazione del cilindro è un punto di SINGOLARITA'.

    \;

    Avendo calcolato q<rsub|3> e considerandolo un termine noto, è possibile
    calcolare ora la variabile trigonometrica q<rsub|1> come segue (imponendo
    verificata la condizione q<rsub|3> != 0).

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      s1:subst(solve([X],sin(q[1])),sin(q[1]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >>-<frac|x|q<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      c1:subst(solve([Y],cos(q[1])),cos(q[1]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><frac|y|q<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      q1:atan2(s1,c1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >>-<math-up|atan2><around*|(|<frac|x|q<rsub|3>>,<frac|y|q<rsub|3>>|)>>>
    </unfolded-io>
  </session>

  Per ognuno dei 2 valori che q<rsub|3> assume vi si ricava una sola
  soluzione di q<rsub|1>, quindi anche q<rsub|1> ha 2 SOLUZIONI GENERICHE.

  Se q<rsub|3> = 0 allora la funzione atan2 non è definita e q<rsub|1> può
  assumere un valore arbitrario, quindi in singolarità q<rsub|1> ha INFINITE
  SOLUZIONI.

  ESERCITAZIONE 5: Procedura per lo studio della cinematica inversa del robot
  SFERICO (primo tipo) descritto dalle seguenti equazioni:

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:q[3]*cos(q[1])*sin(q[2])+L[2]*cos(q[1])*cos(q[2])-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq2:q[3]*sin(q[1])*sin(q[2])+L[2]*sin(q[1])*cos(q[2])-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      eq3:-q[3]*cos(q[2])+L[2]*sin(q[2])+L[1]-z$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      w1:solve([eq1],x)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      w2:solve([eq2],y)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      w3:solve([eq3],z)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      X:w1[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >>x=q<rsub|3>*cos <around*|(|q<rsub|1>|)>*sin
      <around*|(|q<rsub|2>|)>+L<rsub|2>*cos <around*|(|q<rsub|1>|)>*cos
      <around*|(|q<rsub|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      Y:w2[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>y=q<rsub|3>*sin <around*|(|q<rsub|1>|)>*sin
      <around*|(|q<rsub|2>|)>+L<rsub|2>*sin <around*|(|q<rsub|1>|)>*cos
      <around*|(|q<rsub|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      Z:w3[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>z=L<rsub|2>*sin <around*|(|q<rsub|2>|)>-q<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+L<rsub|1>>>
    </unfolded-io>

    \;

    Siccome si hanno 3 equazioni e 2 variabili trigonometriche allora è
    possibile farle sparire. Per far sparire la variabile q<rsub|1> si
    utilizzano le equazioni eq<rsub|1>, eq<rsub|2> nel seguente modo.<rsub|>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      eq:factor(trigsimp(X^2+Y^2))$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      e1:subst([sin(q[2])=s[2],cos(q[2])=c[2]],eq)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >>y<rsup|2>+x<rsup|2>=<around*|(|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>|)><rsup|2>>>
    </unfolded-io>

    \;

    Si considera ora anche la terza equazione eq<rsub|3> definita nel
    seguente modo:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      ZmL1:Z-L[1]$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      e2:subst([sin(q[2])=s[2],cos(q[2])=c[2]],ZmL1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>z-L<rsub|1>=L<rsub|2>*s<rsub|2>-c<rsub|2>*q<rsub|3>>>
    </unfolded-io>
  </session>

  Tenendo conto di entrambe le equazioni risultanti si può ricavare una
  matrice di rotazione rispetto alla variabile q<rsub|2>, che essendo
  ISOMETRICA garantisce STESSA NORMA tra il vettore che moltiplica
  R(q<rsub|2>) e il vettore ottenuto dal loro prodotto:

  <\eqnarray*>
    <tformat|<cwith|3|3|3|3|cell-background|yellow>|<cwith|1|1|1|1|cell-row-span|2>|<cwith|1|1|1|1|cell-col-span|1>|<cwith|1|1|2|2|cell-row-span|2>|<cwith|1|1|2|2|cell-col-span|1>|<table|<row|<cell|<around*|{||\<nobracket\>>-z-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1<space|2em>>=0>|<cell|\<rightarrow\>>|<cell|<around*|{||\<nobracket\>>q<rsub|3>*c<rsub|2>-L<rsub|2>*s<rsub|2>=L<rsub|1>-z>>|<row|<cell|<around*|{||\<nobracket\>>-y<rsup|2>-x<rsup|2>+<around*|(|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>|)><rsup|2>=0>|<cell|\<rightarrow\>>|<cell|<around*|{||\<nobracket\>>q<rsub|3>*s<rsub|2>+L<rsub|2>*c<rsub|2>=\<pm\><sqrt|x<rsup|2>+y<rsup|2>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|c<rsub|2>>|<cell|-s<rsub|2>>>|<row|<cell|s<rsub|2>>|<cell|c<rsub|2>>>>>>*<matrix|<tformat|<table|<row|<cell|q<rsub|3>>>|<row|<cell|L<rsub|2>>>>>>=<matrix|<tformat|<table|<row|<cell|L<rsub|1>-z>>|<row|<cell|<math-up|>\<pm\><sqrt|x<rsup|2>+y<rsup|2>>>>>>>>|<cell|\<rightarrow\>>|<cell|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>=<around*|(|L<rsub|1>-z|)><rsup|2>+x<rsup|2>+y<rsup|2>>>>>
  </eqnarray*>

  L'ultima equazione trovata rappresenta la una sfera centrara in
  (0,0,L<rsub|1>) e di raggio <math|<sqrt|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>.
  Lo SPAZIO OPERATIVO CANDIDATO è l'insieme di tutti i punti esterni alla
  sfera di centro (0,0,L<rsub|1>) e raggio L<rsub|2> (supponendo che
  q<rsub|3> non abbia fine corsa), raggio che si ha considerando q<rsub|3> =
  0.

  Considerando dei fine corsa per la variabile q<rsub|3> si avrà che il VERO
  SPAZIO OPERATIVO coincide con la porzione di una sfera cava.

  Dall'ultima equazione si trova il valore di q<rsub|3> come segue:

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|input>
      w4:x^2+y^2+(L[1]-z)^2-q[3]^2-L[2]^2$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      q3:solve([w4],q[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><around*|[|q<rsub|3>=-<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>,q<rsub|3>=<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>
  </session>

  Quindi la variabile trigonometrica q<rsub|3> ha 2 SOLUZIONI GENERICHE;
  mentre nel caso si avesse <math|<around*|(|L<rsub|1>-z|)><rsup|2>+y<rsup|2>+x<rsup|2>=L<rsub|2><rsup|2>>
  allora si ha un punto di SINGOLARITA' e q<rsub|3> ha unica soluzione nulla.

  Essendo ora q<rsub|3> un termine noto si può utilizzare la regola n.7 ed
  avere:

  <\eqnarray*>
    <tformat|<cwith|2|2|3|3|cell-background|yellow>|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|L<rsub|1>-z>>|<row|<cell|<math-up|>\<pm\><sqrt|x<rsup|2>+y<rsup|2>>>>>>>=<matrix|<tformat|<table|<row|<cell|c<rsub|2>>|<cell|-s<rsub|2>>>|<row|<cell|s<rsub|2>>|<cell|c<rsub|2>>>>>>*<matrix|<tformat|<table|<row|<cell|q<rsub|3>>>|<row|<cell|L<rsub|2>>>>>>>|<cell|\<rightarrow\>>|<cell|<matrix|<tformat|<table|<row|<cell|L<rsub|1>-z>>|<row|<cell|<math-up|>\<pm\><sqrt|x<rsup|2>+y<rsup|2>>>>>>>=<matrix|<tformat|<table|<row|<cell|q<rsub|3>>|<cell|-L<rsub|2>>>|<row|<cell|L<rsub|2>>|<cell|q<rsub|3>>>>>><matrix|<tformat|<table|<row|<cell|c<rsub|2>>>|<row|<cell|s<rsub|2>>>>>>\<rightarrow\>>>|<row|<cell|\<rightarrow\><matrix|<tformat|<table|<row|<cell|L<rsub|1>-z>>|<row|<cell|<math-up|>\<pm\><sqrt|x<rsup|2>+y<rsup|2>>>>>>>=<matrix|<tformat|<table|<row|<cell|q<rsub|3>>|<cell|-L<rsub|2>>>|<row|<cell|L<rsub|2>>|<cell|q<rsub|3>>>>>><matrix|<tformat|<table|<row|<cell|c<rsub|2>>>|<row|<cell|s<rsub|2>>>>>>>|<cell|\<rightarrow\>>|<cell|<matrix|<tformat|<table|<row|<cell|c<rsub|2>>>|<row|<cell|s<rsub|2>>>>>>=<matrix|<tformat|<table|<row|<cell|<frac|q<rsub|3>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>|<cell|<frac|L<rsub|2>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>>|<row|<cell|-<frac|L<rsub|2>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>|<cell|<frac|q<rsub|3>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>>>>>*<matrix|<tformat|<table|<row|<cell|L<rsub|1>-z>>|<row|<cell|<math-up|>\<pm\><sqrt|x<rsup|2>+y<rsup|2>>>>>>>>>>>
  </eqnarray*>

  \;

  Assumendo la quantità <math|q<rsub|3><rsup|2>+L<rsub|2><rsup|2> !=0> allora
  si potrà definire cos(q<rsub|2>) e sin(q<rsub|2>) e infine calcolare la
  stessa variabile q<rsub|2>. Inoltre si sostituisce, per simplicità, a =
  <math|L<rsub|1>-z> e b = <math|\<pm\><sqrt|x<rsup|2>+y<rsup|2>>>.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|input>
      w5:(invert(matrix([q[3],-L[2]],[L[2],q[3]]))).(matrix([a],[b]))$
    </input>

    \;

    Calcolo di cos(q<rsub|2>) e sin(q<rsub|2>):

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      c2:w5[1][1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><frac|L<rsub|2>*b|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>+<frac|q<rsub|3>*a|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      s2:w5[2][1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><frac|q<rsub|3>*b|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>-<frac|L<rsub|2>*a|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      q2:atan2(s2,c2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      ><with|font-family|rm|atan2>><around*|(|<frac|q<rsub|3>*b|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>-<frac|L<rsub|2>*a|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,<frac|L<rsub|2>*b|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>+<frac|q<rsub|3>*a|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>|)>>>
    </unfolded-io>
  </session>

  La variabile trigonometrica q<rsub|2> ha 4 SOLUZIONI GENERICHE, 2 per ogni
  q<rsub|3> scelto.

  Se <math|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>=0> (caso che si ha se e solo
  se q<rsub|3> = L<rsub|2> = 0) allora c<rsub|2> = s<rsub|2> = 0 e quindi si
  ha un punto di SINGOLARITA' in cui si hanno INFINITE SOLUZIONI per
  q<rsub|2>.

  \;

  Ora si calcola la variabile q<rsub|1> come segue:

  Riprendendo la condizione x<rsup|2>+y<rsup|2> =
  <around*|(|s<rsub|2>q<rsub|3>+L<rsub|2>c<rsub|2>|)><rsup|2> allora si ha
  <math|<around*|(|q<rsub|3>*s<rsub|2>+L<rsub|2>*c<rsub|2>|)>=\<pm\><sqrt|x<rsup|2>+y<rsup|2>>>,
  che è pari a 0 se x<rsup|2>+y<rsup|2> = 0 e cioè se e solo se x = y = 0.\ 

  Se x = y = 0 allora l'end-effector si trova sull'asse z e
  <math|<around*|(|q<rsub|3>*s<rsub|2>+L<rsub|2>*c<rsub|2>|)> >= 0 quindi le
  equazioni iniziali x = c<rsub|1><math|<around*|(|q<rsub|3>*s<rsub|2>+L<rsub|2>*c<rsub|2>|)>>,
  y = s<rsub|1><math|<around*|(|q<rsub|3>*s<rsub|2>+L<rsub|2>*c<rsub|2>|)>>
  saranno soddisfatte qualsiasi sia il valore di q<rsub|1>, perciò tale caso
  è una SINGOLARITA' per cui q<rsub|1> ha INFINITE SOLUZIONI.

  Se (x,y) != (0,0) allora la quantità <math|<around*|(|q<rsub|3>*s<rsub|2>+L<rsub|2>*c<rsub|2>|)>>
  != 0 e quindi si può definire univocamente q<rsub|1>:

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|input>
      w6:solve([X],cos(q[1]))$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|input>
      w7:subst([cos(q[2])=c[2],sin(q[2])=s[2]],w6)$
    </input>

    \;

    Calcolo di cos(q<rsub|1>) e sin(q<rsub|1>):

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      c1:subst(w7,cos(q[1]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><frac|x|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|input>
      w6:solve([Y],sin(q[1]))$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|input>
      w7:subst([cos(q[2])=c[2],sin(q[2])=s[2]],w6)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|unfolded-io>
      s1:subst(w7,sin(q[1]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o33>)
      >><frac|y|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|unfolded-io>
      q1:atan2(s1,c1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o34>)
      ><with|font-family|rm|atan2>><around*|(|<frac|y|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>,<frac|x|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>|)>>>
    </unfolded-io>
  </session>

  \;

  \;

  ESERCITAZIONE 6: Procedura per il calcolo della cinematica inversa del
  robot SFERICO di secondo tipo (STANFORD) a partire dalle equazioni
  seguenti.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:q[3]*cos(q[1])*sin(q[2])-L[2]*sin(q[1])-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq2:q[3]*sin(q[1])*sin(q[2])+L[2]*cos(q[1])-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      eq3:q[3]*cos(q[2])+L[1]-z$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      eq4:cos(q[2])^2+sin(q[2])^2-1$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      X:solve([eq1],x)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      Y:solve([eq2],y)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      Z:solve([eq3],z)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      X:X[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>x=q<rsub|3>*cos <around*|(|q<rsub|1>|)>*sin
      <around*|(|q<rsub|2>|)>-L<rsub|2>*sin <around*|(|q<rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      Y:Y[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>y=q<rsub|3>*sin <around*|(|q<rsub|1>|)>*sin
      <around*|(|q<rsub|2>|)>+L<rsub|2>*cos <around*|(|q<rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      ZmL1:Z[1]-L[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>z-L<rsub|1>=q<rsub|3>*cos <around*|(|q<rsub|2>|)>>>
    </unfolded-io>

    Considerando le prime due equazioni (x,y) si può far sparire la variabile
    trigonometrica q<rsub|1>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      e1:trigsimp(X^2+Y^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>y<rsup|2>+x<rsup|2>=q<rsub|3><rsup|2>*sin
      <around*|(|q<rsub|2>|)><rsup|2>+L<rsub|2><rsup|2>>>
    </unfolded-io>

    \;

    Prendendo in considerazione ora anche la terza equazione (z) e elevandola
    al quadrato si ottiene che:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      e2:ZmL1^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|(|z-L<rsub|1>|)><rsup|2>=q<rsub|3><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      e3:trigsimp(e1+e2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>=q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>
    </unfolded-io>

    Da tale equazione, una volta fissato q<rsub|3>, si ricava una sfera
    centrata in (0,0,L<rsub|1>) e di raggio
    <math|<sqrt|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>. Per cui lo SPAZIO
    OPERATIVO CANDIDATO è composto da tutti i punti esterni ad una sfera di
    raggio L<rsub|2>.

    \;

    Riprendendo ora tale equazione si può definire il valore della variabile
    q<rsub|3> come segue:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      q3:solve([e3],q[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|q<rsub|3>=-<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>,q<rsub|3>=<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>
  </session>

  Quindi la variabile q<rsub|3> ha 2 SOLUZIONI GENERICHE se e solo se la
  quantità sotto la radice è maggiore di zero. Se invece tale quantità è pari
  a zero allora si ha un punto di SINGOLARITA' con un'unica SOLUZIONE (questa
  condizione corrisponde a trovarsi nel bordo della sfera).

  Considerando ora il caso in cui q<rsub|3> è una quantità NON NULLA allora
  si può trovare cos(q<rsub|2>) e quindi tramite la regola n.1 anche
  sin(q<rsub|2>), per poi definire la variabile trigonometrica q<rsub|2>:

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      c2:subst(solve([Z[1]],cos(q[2])),cos(q[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><frac|z-L<rsub|1>|q<rsub|3>>>>
    </unfolded-io>

    Se il risultato trovato è, in modulo, maggiore di 1 allora non esistono
    soluzioni per q<rsub|2>, se è proprio pari a 1 allora si ha un caso di
    SINGOLARITA' e q<rsub|2> ha una sola SOLUZIONE che vale 0 o \<pi\>,
    altrimenti q<rsub|2> ha 4 SOLUZIONI GENERICHE (2 per ogni valore di
    q<rsub|3>).

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      e5:subst(sin(q[2])=s[2],eliminate([eq4,ZmL1],[cos(q[2])]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|z<rsup|2>-2*L<rsub|1>*z+s<rsub|2><rsup|2>*q<rsub|3><rsup|2>-q<rsub|3><rsup|2>+L<rsub|1><rsup|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      s2:solve(e5,s[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><around*|[|s<rsub|2>=-<frac|<sqrt|-z<rsup|2>+2*L<rsub|1>*z+q<rsub|3><rsup|2>-L<rsub|1><rsup|2>>|q<rsub|3>>,s<rsub|2>=<frac|<sqrt|-z<rsup|2>+2*L<rsub|1>*z+q<rsub|3><rsup|2>-L<rsub|1><rsup|2>>|q<rsub|3>>|]>>>
    </unfolded-io>

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|input>
      q2:atan2(s2,c2)$
    </input>
  </session>

  <\equation*>
    -<math-up|atan2><around*|(|<frac|<sqrt|-z<rsup|2>+2*L<rsub|1>*z+q<rsub|3><rsup|2>-L<rsub|1><rsup|2>>|q<rsub|3>>,<frac|z-L<rsub|1>|q<rsub|3>>|)>,<math-up|atan2><around*|(|<frac|<sqrt|-z<rsup|2>+2*L<rsub|1>*z+q<rsub|3><rsup|2>-L<rsub|1><rsup|2>>|q<rsub|3>>,<frac|z-L<rsub|1>|q<rsub|3>>|)>
  </equation*>

  \;

  <\session|maxima|default>
    E' possibile calcolare sin(q<rsub|2>) considerando anche l'equazione
    <math|y<rsup|2>+x<rsup|2>=q<rsub|3><rsup|2>*sin
    <around*|(|q<rsub|2>|)><rsup|2>+L<rsub|2><rsup|2>> :

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      s2:solve([e1],sin(q[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|sin <around*|(|q<rsub|2>|)>=-<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>>|q<rsub|3>>,sin
      <around*|(|q<rsub|2>|)>=<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>>|q<rsub|3>>|]>>>
    </unfolded-io>

    \;

    Da tale risultato si ricavano due condizioni importanti di cui una già
    vista precedentemente, cioè che q<rsub|3> != 0, e l'altra che vale
    <math|x<rsup|2>+y<rsup|2>\<geqslant\>L<rsup|2>> , che corrisponde
    all'EQUAZIONE DEL CILINDRO.

    \;

    Considerando sia l'equazione della sfera sia quella del cilindro si
    ricava che lo SPAZIO OPERATIVO VERO è rappresentato da tutti i punti
    esterni al cilindro.

    Se q<rsub|3> ha dei fine corsa ([q<rsub|3min>, q<rsub|3max>]) allora lo
    spazio operativo è una sfera cava di un cilindro.

    \;

    Considerando il punto raggiunto dell'end-effector appartenente allo
    spazio operativo e quindi la quantità
    <math|q<rsub|3><rsup|2>*s<rsup|2><rsub|2>+L<rsup|2><rsub|2>!=0>, si può
    utilizzare la regola n.7 per il calcolo di cos(q<rsub|1>), sin(q<rsub|1>)
    e infine di q<rsub|1>.
  </session>

  <\eqnarray*>
    <tformat|<table|<row|<cell|<matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>>>>=<matrix|<tformat|<table|<row|<cell|c<rsub|2>>|<cell|-s<rsub|2>>>|<row|<cell|s<rsub|2>>|<cell|c<rsub|2>>>>>>*<matrix|<tformat|<table|<row|<cell|q<rsub|3>>>|<row|<cell|L<rsub|2>>>>>>>|<cell|>|<cell|>>>>
  </eqnarray*>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>