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
    funzione \Peliminate\Q si eliminano le variabili sin(q<rsub|1>),
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

  Quest'ultima disuguaglianza trovata permette di definire lo SPAZIO
  OPERATIVO per il robot RR. Tale spazio è rappresentato da una CORONA
  CIRCOLARE di raggio inferiore pari a \|L<rsub|1>-L<rsub|2>\| e di raggio
  superiore (L<rsub|1>+L<rsub|2>).

  Tutti i punti all'interno di questa corona possono essere raggiunti con 2
  modi diversi (gomito alto, gomito basso).

  Se \|L<rsub|1>-L<rsub|2>\|=0 allora anche il centro della circonferenza può
  essere raggiunto e questo viene fatto in infiniti modi.

  \;

  Calcolo di <with|color|blue|sin(q<rsub|2>)> \ e considerando verificata la
  condizione <math|-1\<leqslant\><frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>\<leqslant\>1>
  :

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      eq7:eliminate([eq4,eq5],[s[1]^2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>*s<rsub|2><rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1><rsup|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      S2:solve([eq7[1]],s[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|[|s<rsub|2>=-<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1><rsup|2>>|L<rsub|2>>,s<rsub|2>=<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1><rsup|2>>|L<rsub|2>>|]>>>
    </unfolded-io>

    \;

    Calcolo della variabile trigonometrica <with|color|blue|q<rsub|2>>:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|input>
      q2[1]:atan2(S2[1],C2)$
    </input>
  </session>

  <\equation*>
    -<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1><rsup|2>>|L<rsub|2>>,<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>
  </equation*>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|input>
      q2[2]:atan2(S2[2],C2)$
    </input>
  </session>

  <\equation*>
    <math|<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1><rsup|2>>|L<rsub|2>>,<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>>
  </equation*>

  Quindi la variabile q<rsub|2> ha 2 SOLUZIONI GENERICHE.

  Se le grandezze L<rsub|1> ed L<rsub|2> sono nulle allora si ha che la
  funzione \Patan2\Q non è definita e quindi che l'origine si può raggiungere
  con INFINITE SOLUZIONI. \ 

  <\session|maxima|default>
    \;

    Calcolo ora i valori di <with|color|blue|cos(q<rsub|1>)> e
    <with|color|blue|sin(q<rsub|1>)>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      eq8:eliminate([X,eq4],[s[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><around*|[|x<rsup|2>+<around*|(|-2*c<rsub|1>*L<rsub|2>*c<rsub|2>-2*L<rsub|1>*c<rsub|1>|)>*x+<around*|(|c<rsub|1><rsup|2>-1|)>*L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+c<rsub|1><rsup|2>*L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*c<rsub|1><rsup|2>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>*c<rsub|1><rsup|2>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|input>
      C1:solve([eq8[1]],c[1])$
    </input>

    \;

    <\equation*>
      c<rsub|1>=-<frac|L<rsub|2>*s<rsub|2>*<sqrt|-x<rsup|2>+L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>+<around*|(|-L<rsub|2>*c<rsub|2>-L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>
    </equation*>

    \;

    <\equation*>
      c<rsub|1>=<frac|L<rsub|2>*s<rsub|2>*<sqrt|-x<rsup|2>+L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>
    </equation*>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      S1:solve([X],s[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >>s<rsub|1>=-<frac|x-c<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1>*c<rsub|1>|L<rsub|2>*s<rsub|2>>>>
    </unfolded-io>

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|input>
      q1[1]:atan2(S1,C1[1])$
    </input>

    \;

    <\equation*>
      -<math-up|atan2><around*|(|<frac|x-c<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1>*c<rsub|1>|L<rsub|2>*s<rsub|2>>,-<frac|L<rsub|2>*s<rsub|2>*<sqrt|-x<rsup|2>+L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>+<around*|(|-L<rsub|2>*c<rsub|2>-L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>|)>
    </equation*>

    \;

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|input>
      q1[2]:atan2(S1,C1[2])$
    </input>
  </session>

  <\equation*>
    -<math-up|atan2><around*|(|<frac|x-c<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1>*c<rsub|1>|L<rsub|2>*s<rsub|2>>,<frac|L<rsub|2>*s<rsub|2>*<sqrt|-x<rsup|2>+L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>|)>
  </equation*>

  \;

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
      S1:solve([eq1],s[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >>s<rsub|1>=-<frac|x|q<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      C1:solve([eq2],c[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >>c<rsub|1>=<frac|y|q<rsub|3>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|input>
      q1:atan2(S1,C1)$
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
  inversa del ROBOT SCARA (STRUTTURA) a partire dalle equazioni seguenti,
  considerando nulle L<rsub|1> ed L<rsub|2> così da avere i 3 giunti tutti
  alla stessa altezza: <math|x=D<rsub|1>*c<rsub|1>*c<rsub|2>-D<rsub|1>*s<rsub|1>*s<rsub|2>+D<rsub|2>*c<rsub|2>>,<math|y=D<rsub|1>*s<rsub|1>*c<rsub|2>+D<rsub|1>*c<rsub|1>*s<rsub|2>+D<rsub|2>*s<rsub|2>>,<math|z=q<rsub|3>>.>

  Si tratta di un sistema disaccoppiato perchè q<rsub|3> dipende solo dalla
  coordinata z, mentre q<rsub|1> e q<rsub|2> solo dalle coordinate x ed y,
  quindi si possono studiare separatamente.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      <\session|maxima|default>
        eq1:D[1]*cos(q[1])*cos(q[2])-D[1]*sin(q[1])*sin(q[2])+D[2]*cos(q[2])-x$
      </session>
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq1:subst([sin(q[1])=s[1],cos(q[1])=c[1],sin(q[2])=s[2],cos(q[2])=c[2]],eq1)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      X:solve([eq1],x)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >>x=<around*|(|D<rsub|2>+D<rsub|1>*c<rsub|1>|)>*c<rsub|2>-D<rsub|1>*s<rsub|1>*s<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      eq2:D[1]*sin(q[1])*cos(q[2])+D[1]*cos(q[1])*sin(q[2])+D[2]*sin(q[2])-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      eq2:subst([sin(q[1])=s[1],cos(q[1])=c[1],sin(q[2])=s[2],cos(q[2])=c[2]],eq2)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      Y:solve([eq2],y)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>y=<around*|(|D<rsub|2>+D<rsub|1>*c<rsub|1>|)>*s<rsub|2>+D<rsub|1>*s<rsub|1>*c<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      eq3:q[3]-z$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      Z:solve([eq3],z)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>z=q<rsub|3>>>
    </unfolded-io>

    La variabile z sta ad indicare l'altezza del piano di lavoro e l'insieme
    di tutti i punti ammissibili per <with|color|blue|q<rsub|3>> è tutto R.
    In realtà <with|color|blue|q<rsub|3>> sarà limitato inferiormente e
    superiormente da dei fine corsa.

    \;

    Considerando ora le prime due equazioni è possibile eliminare una delle
    due variabili trigonometriche, in questo caso
    <with|color|blue|q<rsub|2>>, come segue:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      eq4:factor(X^2+Y^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>y<rsup|2>+x<rsup|2>=<around*|(|D<rsub|2><rsup|2>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>+D<rsub|1><rsup|2>*s<rsub|1><rsup|2>+D<rsub|1><rsup|2>*c<rsub|1><rsup|2>|)>*<around*|(|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>|)>>>
    </unfolded-io>

    \;

    Calcolo l'espressione di <with|color|blue|cos(q<rsub|1>)>:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      e1:(s[1]^2)+(c[1]^2)-1$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      e2:(s[2]^2)+(c[2]^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      w1:eliminate([eq4,e1,e2],[s[2]^2,s[1]^2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|[|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>-2*D<rsub|1>*c<rsub|1>*D<rsub|2>-D<rsub|1><rsup|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      C1:solve(w1[1],c[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>c<rsub|1>=<frac|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|2*D<rsub|1>*D<rsub|2>>>>
    </unfolded-io>

    \;

    Questa equazione è risolubile se e solo se
    <math|<around*|\||<frac|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|2*D<rsub|1>*D<rsub|2>>|\|>\<leqslant\>1>.

    Da tale condizione (come nel caso del ROBOT RR) è possibile definire uno
    SPAZIO OPERATIVO CANDIDATO per quanto riguarda il piano di lavoro (x,y)
    che è rappresentato da una corona circolare di centro(0,0) e raggio
    inferiore pari a <math|\|D<rsub|1>-D<rsub|2>\|> e raggio superiore pari a
    (D<rsub|1>+D<rsub|2>).

    \;

    Ipotizzando di rispettare la condizione
    <math|<around*|\||<frac|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|2*D<rsub|1>*D<rsub|2>>|\|>\<less\>1>
    allora si può calcolare <with|color|blue|sin(q<rsub|1>)> nel caso
    generale:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      w2:eliminate([eq4,e2],[c[2]^2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >>-y<rsup|2>-x<rsup|2>+D<rsub|2><rsup|2>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>+D<rsub|1><rsup|2>*s<rsub|1><rsup|2>+D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      S1:solve([w2],s[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|s<rsub|1>=-<frac|<sqrt|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>-2*D<rsub|1>*c<rsub|1>*D<rsub|2>-D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>|D<rsub|1>>,s<rsub|1>=<frac|<sqrt|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>-2*D<rsub|1>*c<rsub|1>*D<rsub|2>-D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>|D<rsub|1>>|]>>>
    </unfolded-io>

    \;

    Calcolo della variabile trigonometrica <with|color|blue|q<rsub|1>>:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      q1[1]:atan2(S1[1],C1)$
    </input>

    <\equation*>
      -<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>-2*D<rsub|1>*c<rsub|1>*D<rsub|2>-D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>|D<rsub|1>>,<frac|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|2*D<rsub|1>*D<rsub|2>>|)>
    </equation*>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|input>
      q1[2]:atan2(S1[2],C1)$
    </input>

    <\equation*>
      <math|<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>-2*D<rsub|1>*c<rsub|1>*D<rsub|2>-D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>|D<rsub|1>>,<frac|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|2*D<rsub|1>*D<rsub|2>>|)>>
    </equation*>

    \;

    Quindi la variabile trigonometrica q<rsub|1> ha 2 SOLUZIONI GENERICHE.

    \;

    Se <math|<around*|\||<frac|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|2*D<rsub|1>*D<rsub|2>>|\|>=1>
    si ha un caso di SINGOARITA' poichè cos(q<rsub|1>)=<math|\<pm\>1> e
    sin(q<rsub|1>)=0, quindi q<rsub|1> ha una sola soluzione che vale 0 o
    \<pi\>.

    \;

    Conoscendo adesso q<rsub|1> e supponendo verificata la condizione
    <math|x<rsup|2>+y<rsup|2>!=0> si può calcolare
    <with|color|blue|cos(q<rsub|2>)>, <with|color|blue|sin(q<rsub|2>)> ed
    infine <with|color|blue|q<rsub|2>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      eq5:eliminate([X,e2],[s[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|x<rsup|2>+<around*|(|-2*D<rsub|2>-2*D<rsub|1>*c<rsub|1>|)>*c<rsub|2>*x+<around*|(|D<rsub|2><rsup|2>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>+D<rsub|1><rsup|2>*s<rsub|1><rsup|2>+D<rsub|1><rsup|2>*c<rsub|1><rsup|2>|)>*c<rsub|2><rsup|2>-D<rsub|1><rsup|2>*s<rsub|1><rsup|2>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|input>
      C2:solve([eq5[1]],c[2])$
    </input>

    \;

    <\equation*>
      c<rsub|2>=-<frac|D<rsub|1>*s<rsub|1>*<sqrt|-x<rsup|2>+D<rsub|2><rsup|2>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>+D<rsub|1><rsup|2>*s<rsub|1><rsup|2>+D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>+<around*|(|-D<rsub|2>-D<rsub|1>*c<rsub|1>|)>*x|D<rsub|2><rsup|2>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>+D<rsub|1><rsup|2>*s<rsub|1><rsup|2>+D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>
    </equation*>

    \;

    <\equation*>
      c<rsub|2>=<frac|D<rsub|1>*s<rsub|1>*<sqrt|-x<rsup|2>+D<rsub|2><rsup|2>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>+D<rsub|1><rsup|2>*s<rsub|1><rsup|2>+D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>+<around*|(|D<rsub|2>+D<rsub|1>*c<rsub|1>|)>*x|D<rsub|2><rsup|2>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>+D<rsub|1><rsup|2>*s<rsub|1><rsup|2>+D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>
    </equation*>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      S2:solve([X],s[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|s<rsub|2>=-<frac|x+<around*|(|-D<rsub|2>-D<rsub|1>*c<rsub|1>|)>*c<rsub|2>|D<rsub|1>*s<rsub|1>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|input>
      q2[1]:atan2(S2[1],C2[1])$
    </input>
  </session>

  <\equation*>
    -<math-up|atan2><around*|(|<frac|x+<around*|(|-D<rsub|2>-D<rsub|1>*c<rsub|1>|)>*c<rsub|2>|D<rsub|1>*s<rsub|1>>,-<frac|D<rsub|1>*s<rsub|1>*<sqrt|-x<rsup|2>+D<rsub|2><rsup|2>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>+D<rsub|1><rsup|2>*s<rsub|1><rsup|2>+D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>+<around*|(|-D<rsub|2>-D<rsub|1>*c<rsub|1>|)>*x|D<rsub|2><rsup|2>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>+D<rsub|1><rsup|2>*s<rsub|1><rsup|2>+D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>|)>
  </equation*>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|input>
      q2[2]:atan2(S2[1],C2[2])$
    </input>
  </session>

  <\equation*>
    <\equation*>
      -<math-up|atan2><around*|(|<frac|x+<around*|(|-D<rsub|2>-D<rsub|1>*c<rsub|1>|)>*c<rsub|2>|D<rsub|1>*s<rsub|1>>,<frac|D<rsub|1>*s<rsub|1>*<sqrt|-x<rsup|2>+D<rsub|2><rsup|2>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>+D<rsub|1><rsup|2>*s<rsub|1><rsup|2>+D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>+<around*|(|D<rsub|2>+D<rsub|1>*c<rsub|1>|)>*x|D<rsub|2><rsup|2>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>+D<rsub|1><rsup|2>*s<rsub|1><rsup|2>+D<rsub|1><rsup|2>*c<rsub|1><rsup|2>>|)>
    </equation*>
  </equation*>

  \;

  In definitiva la <with|color|red|variabile trigonometrica q<rsub|1>> ha 2
  SOLUZIONI GENERICHE; ha 1 SOLUZIONE UNICA nel caso di singolarità che si ha
  con la condizione sin(q<rsub|1>)=0; mentre ha SOLUZIONI INFINITE se
  \|D<rsub|1>-D<rsub|2>\|=0 poichè l'origine si può raggiungere in infiniti
  modi.

  La <with|color|red|variabile trigonometrica q<rsub|2>> ha 2 SOLUZIONI
  GENERICHE, una per ogni valore di q<rsub|1>.

  La <with|color|red|variabile lineare q<rsub|3>> ha INFINITE SOLUZIONI
  GENERICHE (se non si considera l'esistenza dei fine corsa che lo limita
  inferiormente e superiormente).

  Lo SPAZIO OPERATIVO VERO è rappresentato da un cilindro cavo di altezza
  minima data da q<rsub|3min> e altezza massima da q<rsub|3max>, e di raggio
  inferiore \|D<rsub|1>-D<rsub|2>\| e raggio superiore (D<rsub|1>+D<rsub|2>).

  \;

  <with|color|red|Procedura 5: Procedura per il calcolo della cinematica
  inversa per il ROBOT SFERICO (PRIMO TIPO) a partire dalle seguenti
  equazioni calcolate:<math|x=q<rsub|3>*c<rsub|1>*s<rsub|2>+L<rsub|2>*c<rsub|1>*c<rsub|2>>,
  <math|y=q<rsub|3>*s<rsub|1>*s<rsub|2>+L<rsub|2>*s<rsub|1>*c<rsub|2>>,
  <math|z=-q<rsub|3>*c<rsub|2>+L<rsub|2>*s<rsub|2>+L<rsub|1>>.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:q[3]*cos(q[1])*sin(q[2])+L[2]*cos(q[1])*cos(q[2])-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq1:subst([sin(q[1])=s[1],cos(q[1])=c[1],sin(q[2])=s[2],cos(q[2])=c[2]],eq1)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      X:solve([eq1],x)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >>x=c<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      eq2:q[3]*sin(q[1])*sin(q[2])+L[2]*sin(q[1])*cos(q[2])-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      eq2:subst([sin(q[1])=s[1],cos(q[1])=c[1],sin(q[2])=s[2],cos(q[2])=c[2]],eq2)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      Y:solve([eq2],y)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>y=s<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      eq3:-q[3]*cos(q[2])+L[2]*sin(q[2])+L[1]-z$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      eq3:subst([sin(q[2])=s[2],cos(q[2])=c[2]],eq3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      Z:solve([eq3],z)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>z=-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>
    </unfolded-io>

    \;

    Si possono sommare i quadrati delle equazioni X ed Y per eliminare una
    delle due variabili trigonometrice, in questo caso q<rsub|1>, ed ottenere
    la relazione dipendente solo da q<rsub|2>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      eq4:factor(X^2+Y^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>y<rsup|2>+x<rsup|2>=<around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>|)>*<around*|(|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>|)><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      eq4:subst((x^2+y^2)=P,eq4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>P=<around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>|)>*<around*|(|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>|)><rsup|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      eq5:(s[1]^2)+(c[1]^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      w1:eliminate([eq4,eq5],[c[1]^2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|-P+s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+2*L<rsub|2>*c<rsub|2>*s<rsub|2>*q<rsub|3>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|input>
      w2:solve([w1[1]],P)[1]$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      w2:factor(subst(P=(x^2+y^2),w2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >>y<rsup|2>+x<rsup|2>=<around*|(|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>|)><rsup|2>>>
    </unfolded-io>

    \;

    Considerando ora la terza equazione rispetto alla coordinata z, si trova:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      w3:L[1]-Z$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      w3:w3^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><around*|(|L<rsub|1>-z|)><rsup|2>=<around*|(|c<rsub|2>*q<rsub|3>-L<rsub|2>*s<rsub|2>|)><rsup|2>>>
    </unfolded-io>

    \;

    Da queste due equazioni (w<rsub|2> e w<rsub|3>) è possibile ricavare il
    valore della variabile lineare <with|color|blue|q<rsub|3>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      w4:factor(w2+w3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>=<around*|(|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>|)>*<around*|(|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>|)>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|input>
      eq6:(s[2]^2)+(c[2]^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      w5:eliminate([w4,eq6],[c[2]^2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|-z<rsup|2>+2*L<rsub|1>*z-y<rsup|2>-x<rsup|2>+q<rsub|3><rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|]>>>
    </unfolded-io>

    Tale equazione: <with|color|red|<math|-z<rsup|2>+2*L<rsub|1>*z-y<rsup|2>-x<rsup|2>+q<rsub|3><rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>=0\<rightarrow\>x<rsup|2>+y<rsup|2>+<around*|(|L<rsub|1>-z|)><rsup|2>=q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>
    rappresenta una sfera centrata in (0,0,L<rsub|1>) e avente raggio pari a
    <sqrt|q<rsup|2><rsub|3>+L<rsup|2><rsub|2>>. Ciò permette di definire uno
    SPAZIO OPERATIVO CANDIDATO che è dato da tutti i punti esterni alla sfera
    di centro (0,0,L<rsub|1>) e raggio L<rsub|2>.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      q3:solve([w5[1]],q[3])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><around*|[|q<rsub|3>=-<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>,q<rsub|3>=<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    La <with|color|blue|variabile lineare q<rsub|3>> ha 2 SOLUZIONI
    GENERICHE.

    E' presente un punto di SINGOLARITA' nel caso (x,y,z)=(0,0,L<rsub|1>) e
    R=L<rsub|2> in cui si ha che q<rsub|3> ha una sola SOLUZIONE NULLA.

    \;

    Calcolo delle grandezze <with|color|blue|cos(q<rsub|2>)>,
    <with|color|blue|sin(q<rsub|2>)> e infine della variabile trigonometrica
    <with|color|blue|q<rsub|2>>:

    <\session|maxima|default>
      <\unfolded-io>
        <with|color|red|(<with|math-font-family|rm|%i>22) >
      <|unfolded-io>
        eq7:eliminate([Z,eq6],[c[2]])
      <|unfolded-io>
        <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
        >><around*|[|z<rsup|2>+<around*|(|-2*L<rsub|2>*s<rsub|2>-2*L<rsub|1>|)>*z+<around*|(|s<rsub|2><rsup|2>-1|)>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*s<rsub|2>+L<rsub|1><rsup|2>|]>>>
      </unfolded-io>

      <\input>
        <with|color|red|(<with|math-font-family|rm|%i>23) >
      <|input>
        S2:solve([eq7[1]],s[2])$
      </input>

      <\equation*>
        <around*|[|s<rsub|2>=-<frac|q<rsub|3>*<sqrt|-z<rsup|2>+2*L<rsub|1>*z+q<rsub|3><rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>>-L<rsub|2>*z+L<rsub|1>*L<rsub|2>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,s<rsub|2>=<frac|q<rsub|3>*<sqrt|-z<rsup|2>+2*L<rsub|1>*z+q<rsub|3><rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>>+L<rsub|2>*z-L<rsub|1>*L<rsub|2>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>|]>
      </equation*>

      <\unfolded-io>
        <with|color|red|(<with|math-font-family|rm|%i>24) >
      <|unfolded-io>
        C2:solve([Z],c[2])[1]
      <|unfolded-io>
        <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
        >>c<rsub|2>=-<frac|z-L<rsub|2>*s<rsub|2>-L<rsub|1>|q<rsub|3>>>>
      </unfolded-io>

      <\input>
        <with|color|red|(<with|math-font-family|rm|%i>25) >
      <|input>
        q2[1]:atan2(S2[1],C2)$
      </input>

      \;

      <\equation*>
        -<math-up|atan2><around*|(|<frac|q<rsub|3>*<sqrt|-z<rsup|2>+2*L<rsub|1>*z+q<rsub|3><rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>>-L<rsub|2>*z+L<rsub|1>*L<rsub|2>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,-<frac|z-L<rsub|2>*s<rsub|2>-L<rsub|1>|q<rsub|3>>|)>
      </equation*>

      <\input>
        <with|color|red|(<with|math-font-family|rm|%i>26) >
      <|input>
        q2[2]:atan2(S2[2],C2)$
      </input>

      <\equation*>
        =<math-up|atan2><around*|(|<frac|q<rsub|3>*<sqrt|-z<rsup|2>+2*L<rsub|1>*z+q<rsub|3><rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>>+L<rsub|2>*z-L<rsub|1>*L<rsub|2>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,-<frac|z-L<rsub|2>*s<rsub|2>-L<rsub|1>|q<rsub|3>>|)>
      </equation*>

      \;

      La <with|color|blue|variabile trigonometrica q<rsub|2>> ha 4 soluzioni
      (2 per ogni valore della variabile lineare q<rsub|3>.

      Se q<rsup|2><rsub|3>+L<rsub|2><rsup|2>=0 (se e solo se
      q<rsub|3>=L<rsub|2>=0) allora si ha un caso di SINGOLARITA' per il
      quale la variabile trigonometrica q<rsub|2> ha INFINITE SOLUZIONI.

      \;

      Si calcolano ora i valori di <with|color|blue|cos(q<rsub|1>)>,
      <with|color|blue|sin(q<rsub|1>)>, <with|color|blue|q<rsub|1>>:

      <\unfolded-io>
        <with|color|red|(<with|math-font-family|rm|%i>27) >
      <|unfolded-io>
        C1:solve([X],c[1])[1]
      <|unfolded-io>
        <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
        >>c<rsub|1>=<frac|x|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>>>
      </unfolded-io>

      <\unfolded-io>
        <with|color|red|(<with|math-font-family|rm|%i>28) >
      <|unfolded-io>
        S1:solve([Y],s[1])[1]
      <|unfolded-io>
        <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
        >>s<rsub|1>=<frac|y|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>>>
      </unfolded-io>

      <\input>
        <with|color|red|(<with|math-font-family|rm|%i>29) >
      <|input>
        q1:atan2(S1,C1)$
      </input>
    </session>
  </session>

  <\equation*>
    <math-up|atan2><around*|(|<frac|y|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>,<frac|x|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>|)>
  </equation*>

  Anche in questo caso si ha SINGOLARITA' se q<rsub|3>=L<rsub|2>=0.

  \;

  \;

  <with|color|red|Procedura 6: Procedura per il calcolo della cinematica
  inversa del ROBOT SPERICO (TIPO STANFORD) a partire dalle equazioni trovate
  dalla cinematica diretta: <math|x=q<rsub|3>*c<rsub|1>*s<rsub|2>-L<rsub|2>*s<rsub|1>>,
  <math|y=q<rsub|3>*s<rsub|1>*s<rsub|2>+L<rsub|2>*c<rsub|1>>,
  <math|z=q<rsub|3>*c<rsub|2>+L<rsub|1>>.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:q[3]*cos(q[1])*sin(q[2])-L[2]*sin(q[1])-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq1:subst([cos(q[1])=c[1],sin(q[1])=s[1],cos(q[2])=c[2],sin(q[2])=s[2]],eq1)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      X:solve([eq1],x)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >>x=c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      eq2:q[3]*sin(q[1])*sin(q[2])+L[2]*cos(q[1])-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      eq2:subst([cos(q[1])=c[1],sin(q[1])=s[1],cos(q[2])=c[2],sin(q[2])=s[2]],eq2)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      Y:solve([eq2],y)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>y=s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      eq3:q[3]*cos(q[2])+L[1]-z$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      eq3:subst(cos(q[2])=c[2],eq3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      Z:solve([eq3],z)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>z=c<rsub|2>*q<rsub|3>+L<rsub|1>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      e1:(s[1]^2)+(c[1]^2)-1$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      e2:(s[2]^2)+(c[2]^2)-1$
    </input>

    \;

    Si fa sparire la variabile trigonometrica q<rsub|1> tramite le equazioni
    x, y:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      eq4:factor(X^2+Y^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>y<rsup|2>+x<rsup|2>=<around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>|)>*<around*|(|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      eq4:subst(x^2+y^2=P,eq4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>P=<around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>|)>*<around*|(|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>|)>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|input>
      eq4:eliminate([eq4,e1],[s[1]^2])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      eq4:solve([eq4[1]],P)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >>P=s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      eq4:subst(P=x^2+y^2,eq4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >>y<rsup|2>+x<rsup|2>=s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>
    </unfolded-io>

    Prendo in considerazione la terza equazione z, da cui calcolo:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|input>
      eq5:Z-L[1]$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      eq5:eq5^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|(|z-L<rsub|1>|)><rsup|2>=c<rsub|2><rsup|2>*q<rsub|3><rsup|2>>>
    </unfolded-io>

    Dalla somma delle due equazioni (eq4, eq5) si può definire uno SPAZIO
    OPERATIVO CANDIDATO.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      eq6:factor(eq4+eq5)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >>z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>=s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+c<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      eq6:eliminate([eq6,e2],[s[2]^2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|-z<rsup|2>+2*L<rsub|1>*z-y<rsup|2>-x<rsup|2>+q<rsub|3><rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|]>>>
    </unfolded-io>

    Da l'equazione eq<rsub|6> trovata se ne può ricavare la seguente:
    <math|-z<rsup|2>+2*L<rsub|1>*z-y<rsup|2>-x<rsup|2>+q<rsub|3><rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>=0\<rightarrow\>x<rsup|2>+y<rsup|2>+<around*|(|z-L<rsub|1>|)><rsup|2>=q<rsup|2><rsub|3>+L<rsub|2><rsup|2>>,
    quest'ultima permette di definire uno SPAZIO OPERATIVO CANDIDATO che
    corrisponde all'insieme di punti esterni ad una sfera di raggio
    L<rsub|2>e centrata in (0,0,L<rsub|1>).

    \;

    Posso ora calcolare la variabile lineare q<rsub|3> come segue:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      q3:solve([eq6[1]],q[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><around*|[|q<rsub|3>=-<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>,q<rsub|3>=<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    la variabile lineare q<rsub|3> ha 2 SOLUZIONI GENERICHE, mentre ne ha una
    se il radicando è nullo (caso di SINGOLARITA').

    \;

    Ora calcolo le grandezze <with|color|blue|cos(q<rsub|2>)>,
    <with|color|blue|sin(q<rsub|2>)>, <with|color|blue|q<rsub|2>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      C2:solve([Z],c[2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >>c<rsub|2>=<frac|z-L<rsub|1>|q<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      S2:solve([eq4],s[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><around*|[|s<rsub|2>=-<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>>|q<rsub|3>>,s<rsub|2>=<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>>|q<rsub|3>>|]>>>
    </unfolded-io>

    \;

    Studiando il dominio della radice si ottengono 2 condizioni: q<rsub|3>!=0
    ed x<rsup|2>+y<rsup|2><math|\<geqslant\>>L<rsub|2><rsup|2>, quest'ultima
    corrispondente all'equazione del cilindro.

    Tale condizione si va ad aggiungere a quella precedente della sfera di
    raggio L<rsub|2>, per cui si trova che lo SPAZIO OPERATIVO VERO è dato da
    tutti i punti esterni al cilindro.

    \;

    Ora si calcolano i valori di <with|color|blue|cos(q<rsub|1>)>,
    <with|color|blue|sin(q<rsub|1>)>, <with|color|blue|q<rsub|1>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      eq7:eliminate([X,e1],[s[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><around*|[|x<rsup|2>-2*c<rsub|1>*s<rsub|2>*q<rsub|3>*x+c<rsub|1><rsup|2>*s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+<around*|(|c<rsub|1><rsup|2>-1|)>*L<rsub|2><rsup|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      C1:solve([eq7[1]],c[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><around*|[|c<rsub|1>=-<frac|L<rsub|2>*<sqrt|-x<rsup|2>+s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>-s<rsub|2>*q<rsub|3>*x|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,c<rsub|1>=<frac|L<rsub|2>*<sqrt|-x<rsup|2>+s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>+s<rsub|2>*q<rsub|3>*x|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      S1:solve([Y],s[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >>s<rsub|1>=<frac|y-c<rsub|1>*L<rsub|2>|s<rsub|2>*q<rsub|3>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|input>
      q1[1]:atan2(S1,C1[1])$
    </input>

    \;

    <\equation*>
      <math-up|atan2><around*|(|<frac|y-c<rsub|1>*L<rsub|2>|s<rsub|2>*q<rsub|3>>,-<frac|L<rsub|2>*<sqrt|-x<rsup|2>+s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>-s<rsub|2>*q<rsub|3>*x|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>|)>
    </equation*>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|input>
      q1[2]:atan2(S1,C1[2])$
    </input>

    <\equation*>
      <math-up|atan2><around*|(|<frac|y-c<rsub|1>*L<rsub|2>|s<rsub|2>*q<rsub|3>>,<frac|L<rsub|2>*<sqrt|-x<rsup|2>+s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>+s<rsub|2>*q<rsub|3>*x|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>|)>
    </equation*>
  </session>

  \;

  \;

  <with|color|red|Procedura 7: Procedura per il calcolo della cinematica
  inversa del ROBOT ANTROPOMORFO a partire dalle equazioni ottenute dalla
  cinematica diretta: <math|x=c<rsub|1>*<around*|(|L<rsub|3>*c<rsub|23>+L<rsub|2>*c<rsub|2>|)>>,
  <math|y=s<rsub|1>*<around*|(|L<rsub|3>*c<rsub|23>+L<rsub|2>*c<rsub|2>|)>>,
  <math|z=L<rsub|3>*s<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:L[3]*cos(q[1])*cos(q[2])*cos(q[3])-L[3]*cos(q[1])*sin(q[2])*sin(q[3])+L[2]*cos(q[1])*cos(q[2])-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq1:subst([cos(q[1])=c[1],sin(q[1])=s[1],cos(q[2])=c[2],sin(q[2])=s[2],cos(q[3])=c[3],sin(q[3])=s[3]],eq1)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      X:solve([eq1],x)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >>x=-c<rsub|1>*s<rsub|2>*L<rsub|3>*s<rsub|3>+c<rsub|1>*c<rsub|2>*L<rsub|3>*c<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      eq2:L[3]*sin(q[1])*cos(q[2])*cos(q[3])-L[3]*sin(q[1])*sin(q[2])*sin(q[3])+L[2]*sin(q[1])*cos(q[2])-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      eq2:subst([cos(q[1])=c[1],sin(q[1])=s[1],cos(q[2])=c[2],sin(q[2])=s[2],cos(q[3])=c[3],sin(q[3])=s[3]],eq2)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      Y:solve([eq2],y)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>y=-s<rsub|1>*s<rsub|2>*L<rsub|3>*s<rsub|3>+s<rsub|1>*c<rsub|2>*L<rsub|3>*c<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      eq3:L[3]*cos(q[2])*sin(q[3])+L[3]*cos(q[3])*sin(q[2])+L[2]*sin(q[2])+L[1]-z$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      eq3:subst([cos(q[2])=c[2],sin(q[2])=s[2],cos(q[3])=c[3],sin(q[3])=s[3]],eq3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      Z:solve([eq3],z)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>z=c<rsub|2>*L<rsub|3>*s<rsub|3>+s<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>
    </unfolded-io>

    \;

    Considerando le prime due equazioni si ottiene che:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      eq4:factor(X^2+Y^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>y<rsup|2>+x<rsup|2>=<around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>|)>*<around*|(|s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>|)><rsup|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      e1:(s[1]^2)+(c[1]^2)-1$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      e2:(s[2]^2)+(c[2]^2)-1$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|input>
      e3:(s[3]^2)+(c[3]^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      eq5:subst(x^2+y^2=P,eq4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >>P=<around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>|)>*<around*|(|s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>|)><rsup|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|input>
      eq5:eliminate([eq5,e1],[(s[1])^2])$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      eq5:solve([eq5[1]],P)[1]$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      eq5:factor(eq5)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>P=<around*|(|s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>|)><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      eq5:subst(P=x^2+y^2,eq5)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>y<rsup|2>+x<rsup|2>=<around*|(|s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>|)><rsup|2>>>
    </unfolded-io>

    \;

    Dalla terza equazione si ottiene:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      eq6:Z-L[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >>z-L<rsub|1>=c<rsub|2>*L<rsub|3>*s<rsub|3>+s<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2>*s<rsub|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      eq6:factor(eq6^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|(|z-L<rsub|1>|)><rsup|2>=<around*|(|c<rsub|2>*L<rsub|3>*s<rsub|3>+s<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2>*s<rsub|2>|)><rsup|2>>>
    </unfolded-io>

    \;

    Considerandole insieme è possibile ottenere uno SPAZIO OPERATIVO
    CANDIDATO per tale robot:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      eq7:factor(eq5+eq6)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >>z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>=<around*|(|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>|)>*<around*|(|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      eq8:eliminate([eq7,e2,e3],[(s[2])^2,(s[3])^2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >>-z<rsup|2>+2*L<rsub|1>*z-y<rsup|2>-x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|3><rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>>>
    </unfolded-io>

    \;

    Da tale equazione si ricava <with|color|blue|<math|x<rsup|2>+y<rsup|2>+<around*|(|z-L<rsub|1>|)><rsup|2>=L<rsup|2><rsub|2>+L<rsup|2><rsub|3>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>>>
    che permette di definire uno SPAZIO OPERATIVO CANDIDATO rappresentato da
    una sfera cava con raggio minore \|L<rsub|2>-L<rsub|3>\|, raggio maggiore
    (L<rsub|2>+L<rsub|3>) e centrato in (0,0,L<rsub|1>).

    \;

    Posso calcolare la variabile trigonometrica <with|color|blue|q<rsub|3>>
    come segue:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      C3:solve([eq8],c[3])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >>c<rsub|3>=<frac|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*L<rsub|2>*L<rsub|3>>>>
    </unfolded-io>

    Il coseno ha soluzione se e solo se tutta la quantità a destra
    dell'equazione è in modulo minore o uguale ad 1, risolvendo tale
    disuguaglianza si trovano le relazioni che identificano il raggio minore
    e maggiore della sfera cava.\ 

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      eq9:eliminate([eq7,e2],[(s[2])^2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >>-z<rsup|2>+2*L<rsub|1>*z-y<rsup|2>-x<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|input>
      S3:solve([eq9],s[3])$
    </input>

    <\equation*>
      s<rsub|3>=-<frac|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|3><rsup|2>*c<rsub|3><rsup|2>-2*L<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|L<rsub|3>>
    </equation*>

    <\equation*>
      s<rsub|3>=<frac|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|3><rsup|2>*c<rsub|3><rsup|2>-2*L<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|L<rsub|3>>
    </equation*>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|input>
      q3[1]:atan2(S3[1],C3)$
    </input>

    <\equation*>
      -<math-up|atan2><around*|(|<frac|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|3><rsup|2>*c<rsub|3><rsup|2>-2*L<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|L<rsub|3>>,<frac|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*L<rsub|2>*L<rsub|3>>|)>
    </equation*>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|input>
      q3[2]:atan2(S3[2],C3)$
    </input>

    <\equation*>
      <math-up|atan2><around*|(|<frac|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|3><rsup|2>*c<rsub|3><rsup|2>-2*L<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|L<rsub|3>>,<frac|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*L<rsub|2>*L<rsub|3>>|)>
    </equation*>

    \;

    Quindi la variabile trigonometrica q<rsub|3> ha 2 SOLUZIONI GENERICHE, ha
    INFINITE SOLUZIONI se le lunghezze L<rsub|2>, L<rsub|3> sono nulle,
    poichè la funzione atan2 non è definita.

    \;

    Posso ora calcolare la variabile trigonometrica
    <with|color|blue|q<rsub|2>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      w1:eliminate([eq5,e2],[s[2]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >>y<rsup|4>+<around*|(|2*x<rsup|2>+<around*|(|2*c<rsub|2><rsup|2>-2|)>*L<rsub|3><rsup|2>*s<rsub|3><rsup|2>-2*c<rsub|2><rsup|2>*L<rsub|3><rsup|2>*c<rsub|3><rsup|2>-4*L<rsub|2>*c<rsub|2><rsup|2>*L<rsub|3>*c<rsub|3>-2*L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>*y<rsup|2>+x<rsup|4>+<around*|(|<around*|(|2*c<rsub|2><rsup|2>-2|)>*L<rsub|3><rsup|2>*s<rsub|3><rsup|2>-2*c<rsub|2><rsup|2>*L<rsub|3><rsup|2>*c<rsub|3><rsup|2>-4*L<rsub|2>*c<rsub|2><rsup|2>*L<rsub|3>*c<rsub|3>-2*L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>*x<rsup|2>+<around*|(|c<rsub|2><rsup|4>-2*c<rsub|2><rsup|2>+1|)>*L<rsub|3><rsup|4>*s<rsub|3><rsup|4>+<around*|(|<around*|(|2*c<rsub|2><rsup|4>-2*c<rsub|2><rsup|2>|)>*L<rsub|3><rsup|4>*c<rsub|3><rsup|2>+<around*|(|4*L<rsub|2>*c<rsub|2><rsup|4>-4*L<rsub|2>*c<rsub|2><rsup|2>|)>*L<rsub|3><rsup|3>*c<rsub|3>+<around*|(|2*L<rsub|2><rsup|2>*c<rsub|2><rsup|4>-2*L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>*L<rsub|3><rsup|2>|)>*s<rsub|3><rsup|2>+c<rsub|2><rsup|4>*L<rsub|3><rsup|4>*c<rsub|3><rsup|4>+4*L<rsub|2>*c<rsub|2><rsup|4>*L<rsub|3><rsup|3>*c<rsub|3><rsup|3>+6*L<rsub|2><rsup|2>*c<rsub|2><rsup|4>*L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+4*L<rsub|2><rsup|3>*c<rsub|2><rsup|4>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|4>*c<rsub|2><rsup|4>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|input>
      C2:solve([w1],c[2])$
    </input>

    <\equation*>
      c<rsub|2>=-<frac|<sqrt|2*L<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>+2*L<rsub|2>*L<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>+L<rsub|3><rsup|4>*s<rsub|3><rsup|4>+L<rsub|3><rsup|4>*c<rsub|3><rsup|2>*s<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3><rsup|3>*c<rsub|3>*s<rsub|3><rsup|2>+L<rsub|2><rsup|2>*L<rsub|3><rsup|2>*s<rsub|3><rsup|2>>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>
    </equation*>

    \;

    <\equation*>
      c<rsub|2>=<frac|<sqrt|2*L<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>+2*L<rsub|2>*L<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>+L<rsub|3><rsup|4>*s<rsub|3><rsup|4>+L<rsub|3><rsup|4>*c<rsub|3><rsup|2>*s<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3><rsup|3>*c<rsub|3>*s<rsub|3><rsup|2>+L<rsub|2><rsup|2>*L<rsub|3><rsup|2>*s<rsub|3><rsup|2>>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>
    </equation*>

    \;

    <\equation*>
      c<rsub|2>=-<frac|<sqrt|-2*L<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>-2*L<rsub|2>*L<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>+L<rsub|3><rsup|4>*s<rsub|3><rsup|4>+L<rsub|3><rsup|4>*c<rsub|3><rsup|2>*s<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3><rsup|3>*c<rsub|3>*s<rsub|3><rsup|2>+L<rsub|2><rsup|2>*L<rsub|3><rsup|2>*s<rsub|3><rsup|2>>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>
    </equation*>

    \;

    <\equation*>
      c<rsub|2>=<frac|<sqrt|-2*L<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>-2*L<rsub|2>*L<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>+L<rsub|3><rsup|4>*s<rsub|3><rsup|4>+L<rsub|3><rsup|4>*c<rsub|3><rsup|2>*s<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3><rsup|3>*c<rsub|3>*s<rsub|3><rsup|2>+L<rsub|2><rsup|2>*L<rsub|3><rsup|2>*s<rsub|3><rsup|2>>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>
    </equation*>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
      S2:solve([Z],s[2])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >>s<rsub|2>=<frac|z-c<rsub|2>*L<rsub|3>*s<rsub|3>-L<rsub|1>|L<rsub|3>*c<rsub|3>+L<rsub|2>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>44) >
    <|input>
      q2[1]:atan2(S2,C2[1])$
    </input>

    <\equation*>
      <math-up|atan2><around*|(|<frac|z-c<rsub|2>*L<rsub|3>*s<rsub|3>-L<rsub|1>|L<rsub|3>*c<rsub|3>+L<rsub|2>>,-<frac|<sqrt|2*L<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>+2*L<rsub|2>*L<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>+L<rsub|3><rsup|4>*s<rsub|3><rsup|4>+L<rsub|3><rsup|4>*c<rsub|3><rsup|2>*s<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3><rsup|3>*c<rsub|3>*s<rsub|3><rsup|2>+L<rsub|2><rsup|2>*L<rsub|3><rsup|2>*s<rsub|3><rsup|2>>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>|)>
    </equation*>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>46) >
    <|input>
      q2[2]:atan2(S2,C2[2])$
    </input>

    <\equation*>
      <math-up|atan2><around*|(|<frac|z-c<rsub|2>*L<rsub|3>*s<rsub|3>-L<rsub|1>|L<rsub|3>*c<rsub|3>+L<rsub|2>>,<frac|<sqrt|2*L<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>+2*L<rsub|2>*L<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>+L<rsub|3><rsup|4>*s<rsub|3><rsup|4>+L<rsub|3><rsup|4>*c<rsub|3><rsup|2>*s<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3><rsup|3>*c<rsub|3>*s<rsub|3><rsup|2>+L<rsub|2><rsup|2>*L<rsub|3><rsup|2>*s<rsub|3><rsup|2>>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>|)>
    </equation*>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>48) >
    <|input>
      q2[3]:atan2(S2,C2[3])$
    </input>

    <\equation*>
      <math-up|atan2><around*|(|<frac|z-c<rsub|2>*L<rsub|3>*s<rsub|3>-L<rsub|1>|L<rsub|3>*c<rsub|3>+L<rsub|2>>,-<frac|<sqrt|-2*L<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>-2*L<rsub|2>*L<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>+L<rsub|3><rsup|4>*s<rsub|3><rsup|4>+L<rsub|3><rsup|4>*c<rsub|3><rsup|2>*s<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3><rsup|3>*c<rsub|3>*s<rsub|3><rsup|2>+L<rsub|2><rsup|2>*L<rsub|3><rsup|2>*s<rsub|3><rsup|2>>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>|)>
    </equation*>

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>50) >
    <|input>
      q2[4]:atan2(S2,C2[4])$
    </input>

    <\equation*>
      <math-up|atan2><around*|(|<frac|z-c<rsub|2>*L<rsub|3>*s<rsub|3>-L<rsub|1>|L<rsub|3>*c<rsub|3>+L<rsub|2>>,<frac|<sqrt|-2*L<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>-2*L<rsub|2>*L<rsub|3>*s<rsub|3>*<sqrt|-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-x<rsup|4>+L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*y<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*y<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*y<rsup|2>+L<rsub|2><rsup|2>*y<rsup|2>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>*x<rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>*x<rsup|2>+L<rsub|2><rsup|2>*x<rsup|2>+L<rsub|3><rsup|4>*s<rsub|3><rsup|4>+L<rsub|3><rsup|4>*c<rsub|3><rsup|2>*s<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3><rsup|3>*c<rsub|3>*s<rsub|3><rsup|2>+L<rsub|2><rsup|2>*L<rsub|3><rsup|2>*s<rsub|3><rsup|2>>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>|)>
    </equation*>

    \;

    La variabile trigonometrica q<rsub|2> ha 4 SOLUZIONI GENERALI, mentre ci
    sono INFINITE SOLUZIONI se valgono le coordinate (x,y,z)=(0,0,L<rsub|1>).

    \;

    Calcolo adesso la variabile trigonometrica q<rsub|1>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>51) >
    <|unfolded-io>
      C1:solve([X],c[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o51>)
      >>c<rsub|1>=-<frac|x|s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>52) >
    <|unfolded-io>
      S1:solve([Y],s[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o52>)
      >>s<rsub|1>=-<frac|y|s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>54) >
    <|input>
      q1:atan2(S1,C1)$
    </input>
  </session>

  <\equation*>
    -<math-up|atan2><around*|(|<frac|y|s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>>,-<frac|x|s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>>|)>
  </equation*>

  \;

  \;

  <with|color|red|Procedura 8: Procedura per il calcolo della cinematica
  inversa del POLSO SFERICO a partire dalle seguenti equazioni trovate:
  <math|x=c<rsub|1>*s<rsub|2>*L<rsub|3>>,
  <math|y=s<rsub|1>*s<rsub|2>*L<rsub|3>>, <math|z=c<rsub|2>*L<rsub|3>>.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:cos(q[1])*sin(q[2])*L[3]-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq1:subst([cos(q[1])=c[1],sin(q[2])=s[2]],eq1)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      X:solve([eq1],x)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >>x=c<rsub|1>*s<rsub|2>*L<rsub|3>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      eq2:sin(q[1])*sin(q[2])*L[3]-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      eq2:subst([sin(q[1])=s[1],sin(q[2])=s[2]],eq2)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      Y:solve([eq2],y)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>y=s<rsub|1>*s<rsub|2>*L<rsub|3>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      eq3:cos(q[2])*L[3]-z$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      eq3:subst(cos(q[2])=c[2],eq3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      Z:solve([eq3],z)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>z=c<rsub|2>*L<rsub|3>>>
    </unfolded-io>

    \;

    Prendo le prime due equazioni x ed y, da cui posso eliminare la variabile
    trigonometrica q<rsub|1>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      eq4:factor(X^2+Y^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>y<rsup|2>+x<rsup|2>=<around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>|)>*s<rsub|2><rsup|2>*L<rsub|3><rsup|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      e1:(s[1]^2)+(c[1]^2)-1$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      e2:(s[2]^2)+(c[2]^2)-1$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|input>
      eq4:subst(x^2+y^2=P,eq4)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      eq4:eliminate([eq4,e1],[s[1]^2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >>s<rsub|2><rsup|2>*L<rsub|3><rsup|2>-P>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|input>
      eq4:solve([eq4],P)[1]$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      eq5:subst(P=x^2+y^2,eq4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >>y<rsup|2>+x<rsup|2>=s<rsub|2><rsup|2>*L<rsub|3><rsup|2>>>
    </unfolded-io>

    \;

    Adesso considero la terza equazione z prendendone il quadrato:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      eq6:Z^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>z<rsup|2>=c<rsub|2><rsup|2>*L<rsub|3><rsup|2>>>
    </unfolded-io>

    \;

    Considerando ora le equazioni eq5 e eq6 posso eliminare la variabile
    trigonometrica q<rsub|2> e definire per il polso sperico uno SPAZIO
    OPERATIVO CANDIDATO:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      eq7:factor(eq5+eq6)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>z<rsup|2>+y<rsup|2>+x<rsup|2>=<around*|(|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>|)>*L<rsub|3><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      eq7:eliminate([eq7,e2],[s[2]^2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >>-z<rsup|2>-y<rsup|2>-x<rsup|2>+L<rsub|3><rsup|2>>>
    </unfolded-io>

    \;

    Tale equazione (<math|x<rsup|2>+y<rsup|2>+z<rsup|2>=L<rsup|2><rsub|3>>)
    permettte di definire uno SPAZIO OPERATIVO CANDIDATO che corrisponde ad
    una sfera di centro (0,0,0) e raggio L<rsub|3>.

    \;

    Calcolo adesso il valore della <with|color|blue|variabile trigonometrica
    q<rsub|2>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      C2:solve([Z],c[2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >>c<rsub|2>=<frac|z|L<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      S2:solve([eq5],s[2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >>s<rsub|2>=-<frac|<sqrt|y<rsup|2>+x<rsup|2>>|L<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      q2:atan2(S2,C2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      ><with|font-family|rm|atan2>><around*|(|s<rsub|2>,c<rsub|2>|)>=<math-up|atan2><around*|(|s<rsub|2>,<frac|z|L<rsub|3>>|)>=<around*|(|-<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>>|L<rsub|3>>,c<rsub|2>|)>=-<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>>|L<rsub|3>>,<frac|z|L<rsub|3>>|)>|)>>>
    </unfolded-io>

    \;

    Ora calcolo il valore della <with|color|blue|variabile trigonometrica
    q<rsub|1>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      C1:solve([X],c[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >>c<rsub|1>=<frac|x|s<rsub|2>*L<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      S1:solve([Y],s[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >>s<rsub|1>=<frac|y|s<rsub|2>*L<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      q1:atan2(S1,C1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      ><with|font-family|rm|atan2>><around*|(|s<rsub|1>,c<rsub|1>|)>=<math-up|atan2><around*|(|s<rsub|1>,<frac|x|s<rsub|2>*L<rsub|3>>|)>=<around*|(|<math-up|atan2><around*|(|<frac|y|s<rsub|2>*L<rsub|3>>,c<rsub|1>|)>=<math-up|atan2><around*|(|<frac|y|s<rsub|2>*L<rsub|3>>,<frac|x|s<rsub|2>*L<rsub|3>>|)>|)>>>
    </unfolded-io>
  </session>

  \;

  Quindi entrambe le variabili trigonometriche q<rsub|1> e q<rsub|2> hanno 1
  SOLUZIONE GENERICA, mentre se la lunghezza del terzo link L<rsub|3> è nulla
  allora le due variabili trigonometriche hanno INFINITE SOLUZIONI poichè la
  funzione atan2 non è definita.
</body>

<\initial>
  <\collection>
    <associate|font-base-size|9>
    <associate|page-medium|paper>
  </collection>
</initial>