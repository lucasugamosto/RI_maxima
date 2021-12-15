<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURE PER IL CALCOLO DELLA CINEMATICA INVERSA PER OGNI ROBOT STUDIATO A
  LEZIONE.

  <with|color|red|Procedura 1: Procedura per il calcolo della cinematica
  inversa del ROBOT RR a partire dalle equazioni seguenti:
  <math|x=L<rsub|2>*c<rsub|1>*c<rsub|2>-L<rsub|2>*s<rsub|1>*s<rsub|2>+L<rsub|1>*c<rsub|1>>,
  <math|y=L<rsub|2>*s<rsub|1>*c<rsub|2>+L<rsub|2>*c<rsub|1>*s<rsub|2>+L<rsub|1>*s<rsub|1>>.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:L[2]*cos(q[1])*cos(q[2])-L[2]*sin(q[1])*sin(q[2])+L[1]*cos(q[1])-x$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      eq1:subst([sin(q[1])=s[1],cos(q[1])=c[1],sin(q[2])=s[2],cos(q[2])=c[2]],eq1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >>-x-s<rsub|1>*L<rsub|2>*s<rsub|2>+c<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1>*c<rsub|1>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      eq2:L[2]*sin(q[1])*cos(q[2])+L[2]*cos(q[1])*sin(q[2])+L[1]*sin(q[1])-y$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      eq2:subst([sin(q[1])=s[1],cos(q[1])=c[1],sin(q[2])=s[2],cos(q[2])=c[2]],eq2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>-y+c<rsub|1>*L<rsub|2>*s<rsub|2>+s<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1>*s<rsub|1>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      eq3:(sin(q[2])^2)+(cos(q[2])^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      eq3:subst([sin(q[2])=s[2],cos(q[2])=c[2]],eq3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      eq4:(sin(q[1])^2)+(cos(q[1])^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      eq4:subst([sin(q[1])=s[1],cos(q[1])=c[1]],eq4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1>>
    </unfolded-io>

    \;

    Calcolo di \Px\Q dall'equazione eq<rsub|1> e di \Py\Q dall'equazione
    eq<rsub|2>:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      e1:solve([eq1],x)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      e2:solve([eq2],y)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      X:e1[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>x=-s<rsub|1>*L<rsub|2>*s<rsub|2>+c<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1>*c<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      Y:e2[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>y=c<rsub|1>*L<rsub|2>*s<rsub|2>+s<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1>*s<rsub|1>>>
    </unfolded-io>

    \;

    Calcolo di <with|color|blue|cos(q<rsub|2>)> (tramite l'utilizzo della
    funzione \Peliminate\Q si eliminanto le variabili sin(q<rsub|1>),
    cos(q<rsub|1>) e sin(q<rsub|2>) presenti in eq<rsub|5>):

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      eq5:factor(X^2+Y^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>y<rsup|2>+x<rsup|2>=<around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>|)>*<around*|(|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      eq6:eliminate([eq3,eq4,eq5],[s[1]^2,s[2]^2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|-y<rsup|2>-x<rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|input>
      eq6:eq6[1]$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      C2:solve([eq6],c[2])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      C2:C2[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>c<rsub|2>=<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>>>
    </unfolded-io>
  </session>

  Tale equazione è risolubile se e solo se il risultato
  <math|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>>
  è in modulo minore o uguale a 1.

  <\with|color|dark red>
    <\with|color|#aa0000>
      <\equation*>
        -1\<leqslant\><frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>\<leqslant\>1\<rightarrow\>-2*L<rsub|1>*L<rsub|2>\<leqslant\>y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>\<leqslant\>2*L<rsub|1>*L<rsub|2>\<rightarrow\>
      </equation*>

      <\equation*>
        \<rightarrow\>L<rsub|1><rsup|2>+L<rsub|2><rsup|2>-2*L<rsub|1>*L<rsub|2>\<leqslant\>y<rsup|2>+x<rsup|2>\<leqslant\>L<rsub|1><rsup|2>+L<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>\<rightarrow\><around*|\||L<rsub|1>-L<rsub|2>|\|><rsup|2>\<leqslant\>y<rsup|2>+x<rsup|2>\<leqslant\><around*|(|L<rsub|1>+L<rsub|2>|)><rsup|2>\<rightarrow\>
      </equation*>

      <\equation*>
        \<rightarrow\><with|color|#aa0000|<around*|\||L<rsub|1>-L<rsub|2>|\|>\<leqslant\><sqrt|x<rsup|2>+y<rsup|2>>\<leqslant\><around*|(|L<rsub|1>+L<rsub|2>|)>>
      </equation*>
    </with>
  </with>

  Quest'ultima disuguaglianza trovata permette di di definire lo SPAZIO
  OPERATIVO per il robot RR. Tale spazio è rappresentato da una CORONA
  CIRCOLARE di raggio inferiore pari a \|L<rsub|1>-L<rsub|2>\| e di raggio
  superiore (L<rsub|1>+L<rsub|2>).

  Tutti i punti all'interno di questa corona possono essere raggiunti con 2
  modi diversi (gomito alto, gomito basso).

  Se \|L<rsub|1>-L<rsub|2>\|=0 allora anche il centro della circonferenza può
  essere raggiunto e questo viene fatto in infiniti modi.

  \;

  Calcolo di <with|color|blue|sin(q<rsub|2>)> utilizzando la regola n.1 della
  cinematica inversa e considerando verificata la condizione
  <math|-1\<leqslant\><frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>\<leqslant\>1>
  :

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      eq7:eliminate([eq3,C2],[c[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|y<rsup|4>+<around*|(|2*x<rsup|2>-2*L<rsub|2><rsup|2>-2*L<rsub|1><rsup|2>|)>*y<rsup|2>+x<rsup|4>+<around*|(|-2*L<rsub|2><rsup|2>-2*L<rsub|1><rsup|2>|)>*x<rsup|2>+4*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|4>-2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>+L<rsub|1><rsup|4>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      S2:solve([eq7[1]],s[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|[|s<rsub|2>=-<frac|<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+2*L<rsub|2><rsup|2>*y<rsup|2>+2*L<rsub|1><rsup|2>*y<rsup|2>-x<rsup|4>+2*L<rsub|2><rsup|2>*x<rsup|2>+2*L<rsub|1><rsup|2>*x<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*L<rsub|1>*L<rsub|2>>,s<rsub|2>=<frac|<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+2*L<rsub|2><rsup|2>*y<rsup|2>+2*L<rsub|1><rsup|2>*y<rsup|2>-x<rsup|4>+2*L<rsub|2><rsup|2>*x<rsup|2>+2*L<rsub|1><rsup|2>*x<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*L<rsub|1>*L<rsub|2>>|]>>>
    </unfolded-io>

    \;

    Calcolo della variabile trigonometrica <with|color|blue|q<rsub|2>>:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|input>
      q2[1]:atan2(S2[1],C2)$
    </input>
  </session>

  <math|-<math-up|atan2><around*|(|<frac|<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+2*L<rsub|2><rsup|2>*y<rsup|2>+2*L<rsub|1><rsup|2>*y<rsup|2>-x<rsup|4>+2*L<rsub|2><rsup|2>*x<rsup|2>+2*L<rsub|1><rsup|2>*x<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*L<rsub|1>*L<rsub|2>>,<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|input>
      q2[2]:atan2(S2[2],C2)$
    </input>
  </session>

  <math|<math-up|atan2><around*|(|<frac|<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+2*L<rsub|2><rsup|2>*y<rsup|2>+2*L<rsub|1><rsup|2>*y<rsup|2>-x<rsup|4>+2*L<rsub|2><rsup|2>*x<rsup|2>+2*L<rsub|1><rsup|2>*x<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*L<rsub|1>*L<rsub|2>>,<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>>

  Quindi la variabile q<rsub|2> ha 2 SOLUZIONI GENERICHE.

  Se invece cos(q<rsub|2>)=<math|\<pm\>>1 allora si ha un punto di
  singolarità e q<rsub|2> vale 0 o \<pi\>, quindi \Punica soluzione\Q.
  Un'altro punto di singolarità si ha se \|L<rsub|1>-L<rsub|2>\|=0 in quanto
  il centro della circonferenza è un punto raggiungibile dall'end-effector e
  può essere raggiunto con \Pinfinite soluzioni\Q.

  <\session|maxima|default>
    \;

    Si può calcolare adesso tramite la regola n.7 della cinematica inversa, i
    valori di <with|color|blue|cos(q<rsub|1>)> e
    <with|color|blue|sin(q<rsub|1>)>. Per farlo si suppone verificata la
    condizione <math|x<rsup|2>+y<rsup|2>!=0>, il che implica il determinante
    della matrice sottostante non nullo.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      mat:invert(matrix([L[2]*c[2]+L[1],-L[2]*s[2]],[L[2]*s[2],L[2]*c[2]+L[1]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><matrix|<tformat|<table|<row|<cell|<frac|L<rsub|2>*c<rsub|2>+L<rsub|1>|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>|<cell|<frac|L<rsub|2>*s<rsub|2>|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>>|<row|<cell|-<frac|L<rsub|2>*s<rsub|2>|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>|<cell|<frac|L<rsub|2>*c<rsub|2>+L<rsub|1>|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      vet:mat.(matrix([x],[y]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><matrix|<tformat|<table|<row|<cell|<frac|L<rsub|2>*s<rsub|2>*y|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>+<frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>>|<row|<cell|<frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*y|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>-<frac|L<rsub|2>*s<rsub|2>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|input>
      C1:vet[1][1]$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|input>
      S1:vet[2][1]$
    </input>

    \;

    Calcolo della variabile trigonometrica <with|color|blue|q<rsub|1>>:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|input>
      q1:atan2(S1,C1)$
    </input>

    <\equation*>
      <text|<with|font-family|tt|color|red|><with|font-family|rm|atan2>><around*|(|<frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*y|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>-<frac|L<rsub|2>*s<rsub|2>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>,<frac|L<rsub|2>*s<rsub|2>*y|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>+<frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>|)>
    </equation*>
  </session>

  La variabile trigonometrica q<rsub|1> ha 2 SOLUZIONI GENERICHE, una per
  ogni scelta di q<rsub|2>.

  \;

  <with|color|red|Procedura 2: Procedura per il calcolo della cinematica
  inversa del ROBOT CARTESIANO a partire dalle equazioni seguenti:
  <math|x=q<rsub|1>,y=q<rsub|2>,z=q<rsub|3>>.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:q[1]-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq2:q[2]-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      eq3:q[3]-z$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      q1:solve([eq1],q[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>q<rsub|1>=x>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      q2:solve([eq2],q[2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>q<rsub|2>=y>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      q3:solve([eq3],q[3])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>q<rsub|3>=z>>
    </unfolded-io>
  </session>

  Tali equazioni non hanno funzioni trigonometriche, si tratta di un sistema
  lineare e non si hanno condizioni nell'imporre le soluzioni, per cui lo
  SPAZIO OPERATIVO è tutto R<rsup|3>.

  In generale si ha una sola SOLUZIONE, inoltre non ci sono punti di
  SINGOLARITA'.

  \;

  <with|color|red|Procedura 3: Procedura per il calcolo della cinematica
  inversa del ROBOT \ CILINDRICO a partire dalle equazioni seguenti:
  <math|x=-q<rsub|3>*s<rsub|1>>, <math|y=q<rsub|3>*c<rsub|1>>,
  <math|z=q<rsub|2>*+L<rsub|1>>.>

  Si tratta di un sistema disaccoppiato poichè q<rsub|1> e q<rsub|3> non sono
  presenti in \Pz\Q e q<rsub|2> non è in \Px\Q,\Qy\Q. Perciò \Pz\Q si può
  risolvere separatamente dalle altre due equazioni.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:-q[3]*sin(q[1])-x$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      eq1:subst(sin(q[1])=s[1],eq1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >>-x-s<rsub|1>*q<rsub|3>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      eq2:q[3]*cos(q[1])-y$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      eq2:subst(cos(q[1])=c[1],eq2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>c<rsub|1>*q<rsub|3>-y>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      eq3:q[2]+L[1]-z
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>-z+q<rsub|2>+L<rsub|1>>>
    </unfolded-io>

    \;

    Calcolo della variabile lineare <with|color|blue|q<rsub|2>> a partire
    dall terza equazione:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      q2:solve([eq3],q[2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>q<rsub|2>=z-L<rsub|1>>>
    </unfolded-io>

    In generale q<rsub|2> ha un'unica SOLUZIONE, tutti i valori di \Pz\Q sono
    accettabili per cui non c'è nessun punto di SINGOLARITA' ed infine lo
    SPAZIO OPERATIVO è tutto l'insieme R.

    \;

    Calcolo della variabile <with|color|blue|q<rsub|3>> partendo
    dall'equazioni eq<rsub|1>, eq<rsub|2> ed eliminando la variabile
    trigonometrica q<rsub|1>:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      e1:solve([eq1],x)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      X:e1[1]$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      e2:solve([eq2],y)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      Y:e2[1]$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      eq4:(s[1]^2)+(c[1]^2)-1
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      eq5:factor(X^2+Y^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>y<rsup|2>+x<rsup|2>=<around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>|)>*q<rsub|3><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      eq6:eliminate([eq4,eq5],[c[1]^2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|y<rsup|2>+x<rsup|2>-q<rsub|3><rsup|2>|]>>>
    </unfolded-io>

    L'equazione sopra indicata permette di definire lo SPAZIO OPERATIVO nel
    piano (x,y) che è tutto R<rsup|2> e corrisponde ad una circonferenza di
    centro (0,0) e raggio q<rsub|3>.

    Nella realtà le variabili q<rsub|2>, q<rsub|3> saranno limitate
    inferiormente e superiormente così da definire lo SPAZIO OPERATIVO VERO
    come rappresentato da un cilindro cavo.

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      q3:solve([eq6[1]],q[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|q<rsub|3>=-<sqrt|y<rsup|2>+x<rsup|2>>,q<rsub|3>=<sqrt|y<rsup|2>+x<rsup|2>>|]>>>
    </unfolded-io>
  </session>

  In generale q<rsub|3> ha 2 SOLUZIONI ed è presente un punto di singolarità
  quando x<rsup|2>+y<rsup|2>=0 poichè c'è solo una soluzione generica. Quindi
  l'asse di rotazione del cilindro è un punto di singolarità.

  Ipotizzando q<rsub|3>!=0 allora è possibile calcolare la variabile
  trigonometrica <with|color|blue|<with|color|blue|q<rsub|1>>> come segue:

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      S1:solve([eq1],s[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|s<rsub|1>=-<frac|x|q<rsub|3>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      C1:solve([eq2],c[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|c<rsub|1>=<frac|y|q<rsub|3>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|input>
      q1:atan2(S1[1],C1[1])$
    </input>

    <\equation*>
      <\equation*>
        <text|<with|font-family|rm|atan2>><around*|(|s<rsub|1>,c<rsub|1>|)>=<math-up|atan2><around*|(|s<rsub|1>,<frac|y|q<rsub|3>>|)>=<around*|(|-<math-up|atan2><around*|(|<frac|x|q<rsub|3>>,c<rsub|1>|)>=-<math-up|atan2><around*|(|<frac|x|q<rsub|3>>,<frac|y|q<rsub|3>>|)>|)>
      </equation*>
    </equation*>
  </session>

  Quindi la variabile trigonometrica q<rsub|1> in generale ha un'unica
  SOLUZIONE, mentre ha infinite soluzioni nel caso di singolarità con
  q<rsub|3>=0.

  \;

  <with|color|red|Procedura 4: Procedura per il calcolo della cinematica
  inversa del ROBOT SCARA (STRUTTURA) a partire dalle equazioni seguenti:>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>