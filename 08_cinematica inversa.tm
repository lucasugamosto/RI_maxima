<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURE PER IL CALCOLO DELLA CINEMATICA INVERSA PER OGNI ROBOT STUDIATO A
  LEZIONE.

  ESERCITAZIONE 1: Procedura per il calcolo della cinematica inversa del
  ROBOT SCARA a partire dalle equazioni seguenti:
  <math|x=L<rsub|2>*c<rsub|1>*c<rsub|2>-L<rsub|2>*s<rsub|1>*s<rsub|2>+L<rsub|1>*c<rsub|1>>,
  <math|y=L<rsub|2>*s<rsub|1>*c<rsub|2>+L<rsub|2>*c<rsub|1>*s<rsub|2>+L<rsub|1>*s<rsub|1>>.

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
      eq6:eliminate([eq4,eq5],[s[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|<around*|(|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>*s<rsub|2><rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1><rsup|2>|)><rsup|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      eq7:eliminate([eq3,eq4,eq5,eq6],[s[1],c[1],s[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|<around*|[|<around*|(|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>*s<rsub|2><rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1><rsup|2>|)><rsup|16>|]>,<around*|(|-y<rsup|2>-x<rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|8>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      eq7:eq7[2]$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|input>
      C2:solve([eq7],c[2])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      C2:C2[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
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
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      eq8:eliminate([eq3,C2],[c[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|[|y<rsup|4>+<around*|(|2*x<rsup|2>-2*L<rsub|2><rsup|2>-2*L<rsub|1><rsup|2>|)>*y<rsup|2>+x<rsup|4>+<around*|(|-2*L<rsub|2><rsup|2>-2*L<rsub|1><rsup|2>|)>*x<rsup|2>+4*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|4>-2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>+L<rsub|1><rsup|4>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      S2:solve([eq8[1]],s[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|s<rsub|2>=-<frac|<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+2*L<rsub|2><rsup|2>*y<rsup|2>+2*L<rsub|1><rsup|2>*y<rsup|2>-x<rsup|4>+2*L<rsub|2><rsup|2>*x<rsup|2>+2*L<rsub|1><rsup|2>*x<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*L<rsub|1>*L<rsub|2>>,s<rsub|2>=<frac|<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+2*L<rsub|2><rsup|2>*y<rsup|2>+2*L<rsub|1><rsup|2>*y<rsup|2>-x<rsup|4>+2*L<rsub|2><rsup|2>*x<rsup|2>+2*L<rsub|1><rsup|2>*x<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*L<rsub|1>*L<rsub|2>>|]>>>
    </unfolded-io>

    \;

    Calcolo della variabile trigonometrica <with|color|blue|q<rsub|2>>:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|input>
      q2[1]:atan2(S2[1],C2)$
    </input>
  </session>

  <math|-<math-up|atan2><around*|(|<frac|<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+2*L<rsub|2><rsup|2>*y<rsup|2>+2*L<rsub|1><rsup|2>*y<rsup|2>-x<rsup|4>+2*L<rsub|2><rsup|2>*x<rsup|2>+2*L<rsub|1><rsup|2>*x<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*L<rsub|1>*L<rsub|2>>,<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
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
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      mat:invert(matrix([L[2]*c[2]+L[1],-L[2]*s[2]],[L[2]*s[2],L[2]*c[2]+L[1]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><matrix|<tformat|<table|<row|<cell|<frac|L<rsub|2>*c<rsub|2>+L<rsub|1>|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>|<cell|<frac|L<rsub|2>*s<rsub|2>|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>>|<row|<cell|-<frac|L<rsub|2>*s<rsub|2>|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>|<cell|<frac|L<rsub|2>*c<rsub|2>+L<rsub|1>|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      vet:mat.(matrix([x],[y]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><matrix|<tformat|<table|<row|<cell|<frac|L<rsub|2>*s<rsub|2>*y|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>+<frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>>|<row|<cell|<frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*y|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>-<frac|L<rsub|2>*s<rsub|2>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|input>
      C1:vet[1][1]$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|input>
      S1:vet[1][1]$
    </input>

    \;

    Calcolo della variabile trigonometrica <with|color|blue|q<rsub|1>>:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|input>
      q1:atan2(S1,C1)$
    </input>
  </session>

  <\equation*>
    <text|<with|font-family|rm|atan2>><around*|(|<frac|L<rsub|2>*s<rsub|2>*y|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>+<frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>,<frac|L<rsub|2>*s<rsub|2>*y|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>+<frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)><rsup|2>>|)>
  </equation*>

  \;

  \;

  ESERCITAZIONE 3: Procedura per il calcolo della cinematica inversa del
  ROBOT \ CILINDRICO a partire dalle equazioni seguenti:
  <math|x=-q<rsub|3>*s<rsub|1>>, <math|y=q<rsub|3>*c<rsub|1>>,
  <math|z=q<rsub|2>*+L<rsub|1>>.

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

    Calcolo della variabile lineare <with|color|blue|q<rsub|2>> a partire
    dall terza equazione:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      q2:solve([eq3],q[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|q<rsub|2>=z-L<rsub|1>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      \;
    </input>
  </session>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>