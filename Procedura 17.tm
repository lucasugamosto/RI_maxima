<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA: calcolare con MAXIMA la cinematica inversa dei seguenti robot:

  <\with|color|red>
    Procedura1: Procedura per il calcolo della cinematica inversa del ROBOT
    RR con quazioni: <math|x=L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>,y=L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>>,
    \<phi\>=<math|q<rsub|1>+q<rsub|2>>.
  </with>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:L[2]*cos(q[1]+q[2])+L[1]*cos(q[1])-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq1:subst([cos(q[1]+q[2])=c[12], cos(q[1])=c[1]],eq1)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      X:solve([eq1],x)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >>x=L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      X:ratsimp(subst([c[12]=c[1]*c[2]-s[1]*s[2]],X))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>x=-s<rsub|1>*L<rsub|2>*s<rsub|2>+c<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1>*c<rsub|1>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      eq2:L[2]*sin(q[1]+q[2])+L[1]*sin(q[1])-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      eq2:subst([sin(q[1]+q[2])=s[12], sin(q[1])=s[1]],eq2)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      Y:solve([eq2],y)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >>y=L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      Y:ratsimp(subst([s[12]=s[1]*c[2]+c[1]*s[2]],Y))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>y=c<rsub|1>*L<rsub|2>*s<rsub|2>+s<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1>*s<rsub|1>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      eqTrig2:(sin(q[2])^2)+(cos(q[2])^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      eqTrig2:subst([sin(q[2])=s[2],cos(q[2])=c[2]],eqTrig2)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      eqTrig1:(sin(q[1])^2)+(cos(q[1])^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      eqTrig1:subst([sin(q[1])=s[1],cos(q[1])=c[1]],eqTrig1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1>>
    </unfolded-io>

    \;

    \;

    Calcolo di <with|color|blue|cos(q<rsub|2>)>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      eliminate([X,Y,eqTrig1],[s[1],c[1]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>*<around*|(|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>|)>*<around*|(|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>*s<rsub|2><rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1><rsup|2>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      eq1:y^2+x^2-L[2]^2*s[2]^2-L[2]^2*c[2]^2-2*L[1]*L[2]*c[2]-L[1]^2
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >>y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>*s<rsub|2><rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      eliminate([eq1,eqTrig2],[s[2]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|<around*|(|y<rsup|2>+x<rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      eq1:y^2+x^2-2*L[1]*L[2]*c[2]-L[2]^2-L[1]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >>y<rsup|2>+x<rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      C2:solve([eq1],c[2])[1]
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
  essere raggiunto e questo viene fatto in infiniti modi (SINGOLARITA').\ 

  \;

  Calcolo di <with|color|blue|sin(q<rsub|2>)>, considerando verificata la
  condizione <math|-1\<leqslant\><frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>\<leqslant\>1>
  :

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      S2:solve([eqTrig2],s[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|s<rsub|2>=-<sqrt|1-c<rsub|2><rsup|2>>,s<rsub|2>=<sqrt|1-c<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    \;

    Calcolo della variabile trigonometrica <with|color|blue|q<rsub|2>>:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|input>
      q2[1]:atan2(S2[1],C2)$
    </input>
  </session>

  <\equation*>
    -<math-up|atan2><around*|(|<sqrt|1-c<rsub|2><rsup|2>>,<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>
  </equation*>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|input>
      q2[2]:atan2(S2[2],C2)$
    </input>
  </session>

  <\equation*>
    <math-up|atan2><around*|(|<sqrt|1-c<rsub|2><rsup|2>>,<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>
  </equation*>

  Quindi la variabile q<rsub|2> ha 2 SOLUZIONI GENERICHE.

  Se le grandezze L<rsub|1> ed L<rsub|2> sono nulle allora si ha che la
  funzione \Patan2\Q non è definita e quindi che l'origine si può raggiungere
  con INFINITE SOLUZIONI (SINGOLARITA').\ 

  <\session|maxima|default>
    \;

    Calcolo ora i valori di <with|color|blue|cos(q<rsub|1>)> e
    <with|color|blue|sin(q<rsub|1>)>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      solve([X,Y],[s[1],c[1]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><around*|[|s<rsub|1>=-<frac|-L<rsub|2>*c<rsub|2>*y-L<rsub|1>*y+L<rsub|2>*s<rsub|2>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>,c<rsub|1>=<frac|L<rsub|2>*s<rsub|2>*y+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      S1:-((-L[2]*c[2]*y-L[1]*y+L[2]*s[2]*x)/(L[2]^2*s[2]^2+L[2]^2*c[2]^2+2*L[1]*L[2]*c[2]+L[1]^2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >>-<frac|-L<rsub|2>*c<rsub|2>*y-L<rsub|1>*y+L<rsub|2>*s<rsub|2>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>>>
    </unfolded-io>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      C1:((L[2]*s[2]*y+(L[2]*c[2]+L[1])*x)/(L[2]^2*s[2]^2+L[2]^2*c[2]^2+2*L[1]*L[2]*c[2]+L[1]^2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><frac|L<rsub|2>*s<rsub|2>*y+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>>>
    </unfolded-io>

    \;

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|input>
      q1:atan2(S1,C1)$
    </input>

    <\equation*>
      -<math-up|atan2><around*|(|<frac|-L<rsub|2>*c<rsub|2>*y-L<rsub|1>*y+L<rsub|2>*s<rsub|2>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>,<frac|L<rsub|2>*s<rsub|2>*y+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>|)>
    </equation*>
  </session>

  \;

  \;

  \;

  \;

  \;

  \;

  <with|color|red|Procedura2: Procedura per il calcolo della cinematica
  inversa del ROBOT CARTESIANO a partire dalle equazioni seguenti:
  <math|x=q<rsub|1>,y=q<rsub|2>,z=q<rsub|3>>.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      X:q[3]-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      Y:q[2]-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      Z:q[1]-z$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      q1:solve([X],q[3])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >>q<rsub|3>=x>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      q2:solve([Y],q[2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>q<rsub|2>=y>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      q3:solve([Z],q[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>q<rsub|1>=z>>
    </unfolded-io>
  </session>

  Tali equazioni non hanno funzioni trigonometriche, si tratta di un sistema
  lineare e non si hanno condizioni nell'imporre le soluzioni, per cui lo
  SPAZIO OPERATIVO è tutto R<rsup|3>.

  In generale si ha una sola SOLUZIONE, inoltre non ci sono punti di
  SINGOLARITA'.

  \;

  \;

  \;

  \;

  \;

  <with|color|red|Procedura3: Procedura per il calcolo della cinematica
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
      X:-q[3]*sin(q[1])-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      X:subst(sin(q[1])=s[1],X)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      X:solve([X],x)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >>x=-s<rsub|1>*q<rsub|3>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      Y:q[3]*cos(q[1])-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      Y:subst(cos(q[1])=c[1],Y)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      Y:solve([Y],y)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>y=c<rsub|1>*q<rsub|3>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      Z:q[2]+L[1]-z$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      Z:solve([Z],z)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>z=q<rsub|2>+L<rsub|1>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      eqTrig1:(sin(q[1])^2)+(cos(q[1])^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      eqTrig1:subst([sin(q[1])=s[1],cos(q[1])=c[1]],eqTrig1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1>>
    </unfolded-io>

    \;

    Calcolo della variabile lineare <with|color|blue|q<rsub|2>> a partire
    dall terza equazione che è disaccoppiata dalle altre due:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      q2:solve([Z],q[2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>q<rsub|2>=z-L<rsub|1>>>
    </unfolded-io>

    In generale q<rsub|2> ha un'unica SOLUZIONE, tutti i valori di \Pz\Q sono
    accettabili per cui non c'è nessun punto di SINGOLARITA' ed infine lo
    SPAZIO OPERATIVO è tutto l'insieme R.

    \;

    \;

    \;

    \;

    \;

    Calcolo della variabile <with|color|blue|q<rsub|3>> partendo
    dall'equazioni eq<rsub|1>, eq<rsub|2> ed eliminando la variabile
    trigonometrica q<rsub|1>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      eq1:eliminate([X,Y,eqTrig1],[s[1],c[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|[|q<rsub|3><rsup|2>*<around*|(|y<rsup|2>+x<rsup|2>-q<rsub|3><rsup|2>|)>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|input>
      eq1:y^2+x^2-q[3]^2$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      q3:solve([eq1],q[3])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|q<rsub|3>=-<sqrt|y<rsup|2>+x<rsup|2>>,q<rsub|3>=<sqrt|y<rsup|2>+x<rsup|2>>|]>>>
    </unfolded-io>
  </session>

  In generale q<rsub|3> ha 2 SOLUZIONI ed è presente un punto di SINGOLARITA'
  quando x<rsup|2>+y<rsup|2>=0 poichè c'è solo una soluzione. Quindi l'asse
  di rotazione del cilindro è un punto di SINGOLARITA'.

  L'equazione sopra indicata permette di definire lo SPAZIO OPERATIVO nel
  piano (x,y) che è tutto R<rsup|2> e corrisponde ad una circonferenza di
  centro (0,0) e raggio q<rsub|3>.

  Nella realtà le variabili q<rsub|2>, q<rsub|3> saranno limitate
  inferiormente e superiormente così da definire lo SPAZIO OPERATIVO VERO
  come rappresentato da un cilindro cavo.

  \;

  Ipotizzando q<rsub|3>!=0 allora è possibile calcolare la variabile
  trigonometrica <with|color|blue|<with|color|blue|q<rsub|1>>> come segue:

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      S1:solve([X],s[1])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >>s<rsub|1>=-<frac|x|q<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      C1:solve([Y],c[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >>c<rsub|1>=<frac|y|q<rsub|3>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|input>
      q1:atan2(S1,C1)$
    </input>

    <\equation*>
      <\equation*>
        <text|<with|font-family|rm|>><math-up|atan2><around*|(|<frac|-x|q<rsub|3>>,<frac|y|q<rsub|3>>|)>=-<math-up|atan2><around*|(|<frac|x|q<rsub|3>>,<frac|y|q<rsub|3>>|)>
      </equation*>
    </equation*>
  </session>

  Quindi la variabile trigonometrica q<rsub|1> in generale ha un'unica
  SOLUZIONE, mentre ha infinite soluzioni (SINGOLARITA') nel caso
  \ q<rsub|3>=0.

  \;

  <with|color|red|Procedura4: Procedura per il calcolo della cinematica
  inversa del ROBOT SCARA (STRUTTURA) a partire dalle equazioni seguenti:
  <math|x=L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>,
  y=L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>>, <math|z=q<rsub|3>>.>

  Si tratta di un sistema disaccoppiato perchè q<rsub|3> dipende solo dalla
  coordinata z, mentre q<rsub|1> e q<rsub|2> solo dalle coordinate x ed y,
  quindi si possono studiare separatamente.

  Nel calcolo di questa cinematica inversa ho considerato i primi due giunti
  alla stessa altezza quindi <math|L<rsub|1>=0.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      <\session|maxima|default>
        eq1:D[2]*cos(q[1]+q[2])+D[1]*cos(q[1])-x$
      </session>
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq1:subst([cos(q[1]+q[2])=c[12], cos(q[1])=c[1]],eq1)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      X:solve([eq1],x)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >>x=D<rsub|2>*c<rsub|12>+D<rsub|1>*c<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      X:ratsimp(subst([c[12]=c[1]*c[2]-s[1]*s[2]],X))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>x=-s<rsub|1>*D<rsub|2>*s<rsub|2>+c<rsub|1>*D<rsub|2>*c<rsub|2>+D<rsub|1>*c<rsub|1>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      eq2:D[2]*sin(q[1]+q[2])+D[1]*sin(q[1])-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      eq2:subst([sin(q[1]+q[2])=s[12], sin(q[1])=s[1]],eq2)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      Y:solve([eq2],y)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >>y=D<rsub|2>*s<rsub|12>+D<rsub|1>*s<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      Y:ratsimp(subst([s[12]=s[1]*c[2]+c[1]*s[2]],Y))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>y=c<rsub|1>*D<rsub|2>*s<rsub|2>+s<rsub|1>*D<rsub|2>*c<rsub|2>+D<rsub|1>*s<rsub|1>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      eq3:-q[3]+L[2]-z$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      Z:solve([eq3],z)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>z=L<rsub|2>-q<rsub|3>>>
    </unfolded-io>

    La variabile z sta ad indicare l'altezza del piano di lavoro e l'insieme
    di tutti i punti ammissibili per <with|color|blue|q<rsub|3>> è tutto R.
    In realtà <with|color|blue|q<rsub|3>> sarà limitato inferiormente e
    superiormente da dei fine corsa.

    \;

    Da ora in avanti <math|q<rsub|1 >,q<rsub|2>> si risolvono come per il
    calcolo della cinematica inversa del robot RR

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      eqTrig2:(sin(q[2])^2)+(cos(q[2])^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      eqTrig2:subst([sin(q[2])=s[2],cos(q[2])=c[2]],eqTrig2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|input>
      eqTrig1:(sin(q[1])^2)+(cos(q[1])^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      eqTrig1:subst([sin(q[1])=s[1],cos(q[1])=c[1]],eqTrig1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >>s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1>>
    </unfolded-io>

    \;

    Calcolo l'espressione di <with|color|blue|cos(q<rsub|2>)>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      eliminate([X,Y,eqTrig1],[s[1],c[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|D<rsub|2><rsup|2>*s<rsub|2><rsup|2>*<around*|(|D<rsub|2><rsup|2>*s<rsub|2><rsup|2>+D<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*D<rsub|1>*D<rsub|2>*c<rsub|2>+D<rsub|1><rsup|2>|)>*<around*|(|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>*s<rsub|2><rsup|2>-D<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*D<rsub|1>*D<rsub|2>*c<rsub|2>-D<rsub|1><rsup|2>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      eq1:y^2+x^2-D[2]^2*s[2]^2-D[2]^2*c[2]^2-2*D[1]*D[2]*c[2]-D[1]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >>y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>*s<rsub|2><rsup|2>-D<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*D<rsub|1>*D<rsub|2>*c<rsub|2>-D<rsub|1><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      C2:solve([eq1],c[2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>c<rsub|2>=-<frac|<sqrt|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>*s<rsub|2><rsup|2>>+D<rsub|1>|D<rsub|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      S2:solve([eqTrig2],s[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|s<rsub|2>=-<sqrt|1-c<rsub|2><rsup|2>>,s<rsub|2>=<sqrt|1-c<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|input>
      q2[1]:atan2(S2[1],C2)$
    </input>

    <\textput>
      <\equation*>
        -<math-up|atan2><around*|(|<sqrt|1-c<rsub|2><rsup|2>>,-<frac|<sqrt|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>*s<rsub|2><rsup|2>>+D<rsub|1>|D<rsub|2>>|)>
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|input>
      q2[2]:atan2(S2[2],C2)$
    </input>

    \;

    <\equation*>
      <math-up|atan2><around*|(|<sqrt|1-c<rsub|2><rsup|2>>,-<frac|<sqrt|y<rsup|2>+x<rsup|2>-D<rsub|2><rsup|2>*s<rsub|2><rsup|2>>+D<rsub|1>|D<rsub|2>>|)>
    </equation*>

    Calcolo ora i valori di <with|color|blue|cos(q<rsub|1>)> e
    <with|color|blue|sin(q<rsub|1>)> tramite i quali poi calcolare la
    variabile trigonometrica <math|q<rsub|1>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      solve([X,Y],[s[1],c[1]])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><around*|[|s<rsub|1>=-<frac|-D<rsub|2>*c<rsub|2>*y-D<rsub|1>*y+D<rsub|2>*s<rsub|2>*x|D<rsub|2><rsup|2>*s<rsub|2><rsup|2>+D<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*D<rsub|1>*D<rsub|2>*c<rsub|2>+D<rsub|1><rsup|2>>,c<rsub|1>=<frac|D<rsub|2>*s<rsub|2>*y+<around*|(|D<rsub|2>*c<rsub|2>+D<rsub|1>|)>*x|D<rsub|2><rsup|2>*s<rsub|2><rsup|2>+D<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*D<rsub|1>*D<rsub|2>*c<rsub|2>+D<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      q3:solve([Z],q[3])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >>q<rsub|3>=L<rsub|2>-z>>
    </unfolded-io>
  </session>

  \;

  In definitiva la <with|color|red|variabile trigonometrica q<rsub|1>> ha 2
  SOLUZIONI GENERICHE, a seconda del valore di <math|q<rsub|2>>; ha 1
  SOLUZIONE UNICA nel caso di singolarità;

  La <with|color|red|variabile trigonometrica q<rsub|2>> ha 2 SOLUZIONI
  GENERICHE.

  La <with|color|red|variabile lineare q<rsub|3>> ha INFINITE SOLUZIONI
  GENERICHE (se non si considera l'esistenza dei fine corsa che lo limita
  inferiormente e superiormente).

  Lo SPAZIO OPERATIVO VERO è rappresentato da un cilindro cavo di altezza
  minima data da q<rsub|3min> e altezza massima da q<rsub|3max>, e di raggio
  inferiore \|<math|L<rsub|1>-L<rsub|2>>\| e raggio superiore
  (<math|L<rsub|1>+L<rsub|2>>).

  \;

  \;

  <with|color|red|Procedura 5: Procedura per il calcolo della cinematica
  inversa per il ROBOT SFERICO (PRIMO TIPO) a partire dalle seguenti
  equazioni calcolate: <math|x=q<rsub|3>*c<rsub|1>*s<rsub|2>+L<rsub|2>*c<rsub|1>*c<rsub|2>>,
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

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      eqTrig1:(sin(q[1])^2)+(cos(q[1])^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      eqTrig1:subst([sin(q[1])=s[1],cos(q[1])=c[1]],eqTrig1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      eqTrig2:(sin(q[2])^2)+(cos(q[2])^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      eqTrig2:subst([sin(q[2])=s[2],cos(q[2])=c[2]],eqTrig2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1>>
    </unfolded-io>

    \;

    Dalle prime due equazioni si può togliere la dipendenza dalla variabile
    trigonometrica <math|q<rsub|1>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      eliminate([X,Y,eqTrig1],[s[1],c[1]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|<around*|(|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+2*L<rsub|2>*c<rsub|2>*s<rsub|2>*q<rsub|3>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>*<around*|(|y<rsup|2>+x<rsup|2>-s<rsub|2><rsup|2>*q<rsub|3><rsup|2>-2*L<rsub|2>*c<rsub|2>*s<rsub|2>*q<rsub|3>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      eq1:y^2+x^2-s[2]^2*q[3]^2-2*L[2]*c[2]*s[2]*q[3]-L[2]^2*c[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >>y<rsup|2>+x<rsup|2>-s<rsub|2><rsup|2>*q<rsub|3><rsup|2>-2*L<rsub|2>*c<rsub|2>*s<rsub|2>*q<rsub|3>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      factor(eliminate([eq1,Z,eqTrig2],[s[2],c[2]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|q<rsub|3><rsup|4>*<around*|(|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>|)><rsup|4>*<around*|(|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|2>*<around*|(|q<rsub|3><rsup|4>*z<rsup|4>-4*L<rsub|1>*q<rsub|3><rsup|4>*z<rsup|3>+2*q<rsub|3><rsup|4>*y<rsup|2>*z<rsup|2>-8*L<rsub|2><rsup|2>*q<rsub|3><rsup|2>*y<rsup|2>*z<rsup|2>+2*q<rsub|3><rsup|4>*x<rsup|2>*z<rsup|2>-8*L<rsub|2><rsup|2>*q<rsub|3><rsup|2>*x<rsup|2>*z<rsup|2>-2*q<rsub|3><rsup|6>*z<rsup|2>-2*L<rsub|2><rsup|2>*q<rsub|3><rsup|4>*z<rsup|2>+6*L<rsub|1><rsup|2>*q<rsub|3><rsup|4>*z<rsup|2>-4*L<rsub|1>*q<rsub|3><rsup|4>*y<rsup|2>*z+16*L<rsub|1>*L<rsub|2><rsup|2>*q<rsub|3><rsup|2>*y<rsup|2>*z-4*L<rsub|1>*q<rsub|3><rsup|4>*x<rsup|2>*z+16*L<rsub|1>*L<rsub|2><rsup|2>*q<rsub|3><rsup|2>*x<rsup|2>*z+4*L<rsub|1>*q<rsub|3><rsup|6>*z+4*L<rsub|1>*L<rsub|2><rsup|2>*q<rsub|3><rsup|4>*z-4*L<rsub|1><rsup|3>*q<rsub|3><rsup|4>*z+q<rsub|3><rsup|4>*y<rsup|4>+8*L<rsub|2><rsup|2>*q<rsub|3><rsup|2>*y<rsup|4>+16*L<rsub|2><rsup|4>*y<rsup|4>+2*q<rsub|3><rsup|4>*x<rsup|2>*y<rsup|2>+16*L<rsub|2><rsup|2>*q<rsub|3><rsup|2>*x<rsup|2>*y<rsup|2>+32*L<rsub|2><rsup|4>*x<rsup|2>*y<rsup|2>-2*q<rsub|3><rsup|6>*y<rsup|2>-10*L<rsub|2><rsup|2>*q<rsub|3><rsup|4>*y<rsup|2>+2*L<rsub|1><rsup|2>*q<rsub|3><rsup|4>*y<rsup|2>-8*L<rsub|2><rsup|4>*q<rsub|3><rsup|2>*y<rsup|2>-8*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>*q<rsub|3><rsup|2>*y<rsup|2>+q<rsub|3><rsup|4>*x<rsup|4>+8*L<rsub|2><rsup|2>*q<rsub|3><rsup|2>*x<rsup|4>+16*L<rsub|2><rsup|4>*x<rsup|4>-2*q<rsub|3><rsup|6>*x<rsup|2>-10*L<rsub|2><rsup|2>*q<rsub|3><rsup|4>*x<rsup|2>+2*L<rsub|1><rsup|2>*q<rsub|3><rsup|4>*x<rsup|2>-8*L<rsub|2><rsup|4>*q<rsub|3><rsup|2>*x<rsup|2>-8*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>*q<rsub|3><rsup|2>*x<rsup|2>+q<rsub|3><rsup|8>+2*L<rsub|2><rsup|2>*q<rsub|3><rsup|6>-2*L<rsub|1><rsup|2>*q<rsub|3><rsup|6>+L<rsub|2><rsup|4>*q<rsub|3><rsup|4>-2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>*q<rsub|3><rsup|4>+L<rsub|1><rsup|4>*q<rsub|3><rsup|4>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      eq2:z^2-2*L[1]*z+y^2+x^2-q[3]^2-L[2]^2+L[1]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>
    </unfolded-io>

    L'espressione precedente mi permette di definire lo spazio operativo del
    robot sferico di primo tipo:

    <\equation*>
      z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>\<rightarrow\>
    </equation*>

    <\equation*>
      \<rightarrow\><around*|(|L<rsub|1>-z|)><rsup|2>+x<rsup|2>+y<rsup|2>=L<rsub|2><rsup|2>+q<rsub|3><rsup|2>
    </equation*>

    che corrisponde ad una sfera di raggio
    <math|<around*|(|L<rsub|2>+q<rsub|3>|)>> e di centro
    (0,0,<math|L<rsub|1>>).

    \;

    Sempre dall'espressione precedente è possibile calcolare la variabile
    prismatica <math|q<rsub|3>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      q3:solve([eq2],q[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|q<rsub|3>=-<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>,q<rsub|3>=<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    \;

    2 soluzioni generiche per <math|q<rsub|3>>, mentre si ha unica soluzione
    (SINGOLARITA') se <math|q<rsub|3><rsup|2>=L<rsub|2><rsup|2>>.

    Ipotizzando il caso generico per <math|q<rsub|3 >> si possono calcolare
    le altre variabili come segue:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      solve([eq1,Z],[c[2],s[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|[|<around*|[|c<rsub|2>=-<frac|q<rsub|3>*z+L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>-L<rsub|1>*q<rsub|3>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,s<rsub|2>=-<frac|-L<rsub|2>*z+q<rsub|3>*<sqrt|y<rsup|2>+x<rsup|2>>+L<rsub|1>*L<rsub|2>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>|]>,<around*|[|c<rsub|2>=<frac|-q<rsub|3>*z+L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>+L<rsub|1>*q<rsub|3>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,s<rsub|2>=<frac|L<rsub|2>*z+q<rsub|3>*<sqrt|y<rsup|2>+x<rsup|2>>-L<rsub|1>*L<rsub|2>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>|]>|]>>>
    </unfolded-io>

    \;

    Quindi la variabile <math|q<rsub|2>> ha 2 soluzioni GENERICHE per ogni
    soluzione di <math|q<rsub|3>>,quindi in totale 4 soluzioni GENERICHE.

    Mentre se vale la condizione <math|q<rsub|3><rsup|2>=L<rsub|2><rsup|2>>
    allora si hanno infinite soluzioni (SINGOLARITA') dato dal fatto che
    questa quantità appare al denominatore (ed anche come determinante nel
    calcolo dell'inversa).

    \;

    Ora considerando sempre validà la condizione <math|q<rsub|3><rsup|2>
    !=L<rsub|2><rsup|2>>, calcolata la variabile trigonometrica
    <math|q<rsub|1>>:\ 

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      solve([X,Y],[c[1],s[1]])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|c<rsub|1>=<frac|x|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>,s<rsub|1>=<frac|y|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      C1:(x/(s[2]*q[3]+L[2]*c[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><frac|x|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      S1:(y/(s[2]*q[3]+L[2]*c[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><frac|y|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      q1:atan2(S1,C1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      ><with|font-family|rm|atan2>><around*|(|<frac|y|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>,<frac|x|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>>|)>>>
    </unfolded-io>

    <\session|maxima|default>
      \;
    </session>
  </session>

  Anche in questo caso si ha SINGOLARITA' se q<rsub|3>=L<rsub|2>=0.

  \;

  \;

  <\with|color|red>
    Procedura 6: Procedura per il calcolo della cinematica inversa del ROBOT
    SFERICO (TIPO STANFORD) a partire dalle equazioni trovate dalla
    cinematica diretta: <math|x=q<rsub|3>*c<rsub|1>*s<rsub|2>-L<rsub|2>*s<rsub|1>>,
    \ <math|y=q<rsub|3>*s<rsub|1>*s<rsub|2>+L<rsub|2>*c<rsub|1>>,<math|z=q<rsub|3>*c<rsub|2>+L<rsub|1>>.
  </with>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:q[3]*cos(q[1])*sin(q[2])-L[2]*sin(q[1])-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq1:subst([cos(q[1])=c[1],sin(q[1])=s[1],sin(q[2])=s[2]],eq1)$
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
      eq2:subst([cos(q[1])=c[1],sin(q[1])=s[1],sin(q[2])=s[2]],eq2)$
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
      eqTrig1:(s[1]^2)+(c[1]^2)-1$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      eqTrig2:(s[2]^2)+(c[2]^2)-1$
    </input>

    \;

    Si fa sparire la variabile trigonometrica q<rsub|1> dalle prime due
    equazioni x, y:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      eliminate([X,Y,eqTrig1],[s[1],c[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|[|L<rsub|2><rsup|2>*<around*|(|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>|)>*<around*|(|y<rsup|2>+x<rsup|2>-s<rsub|2><rsup|2>*q<rsub|3><rsup|2>-L<rsub|2><rsup|2>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      eq1:y^2+x^2-s[2]^2*q[3]^2-L[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>y<rsup|2>+x<rsup|2>-s<rsub|2><rsup|2>*q<rsub|3><rsup|2>-L<rsub|2><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      eliminate([eq1,Z,eqTrig2],[s[2],c[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|q<rsub|3><rsup|8>*<around*|(|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|4>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      eq2:z^2-2*L[1]*z+y^2+x^2-q[3]^2-L[2]^2+L[1]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >>z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>
    </unfolded-io>

    Dall'espressione calcolata precedentemente è possibile definire il valore
    della variabile <math|q<rsub|3>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      q3:solve([eq2],q[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|q<rsub|3>=-<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>,q<rsub|3>=<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    2 soluzioni GENERICHE per <math|q<rsub|3>> mentre ha una soluzione unica
    (SINGOLARITA') se vale la condizione <math|x<rsup|2>+y<rsup|2>+<around*|(|z-L<rsub|1>|)><rsup|2>=L<rsub|2><rsup|2>>
    .

    \;

    Se la variabile lineare <math|q<rsub|3>> ha valore diverso da zero allora
    posso calcolare <math|q<rsub|2>> come segue:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      solve([eq1,Z],[s[2],c[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><around*|[|<around*|[|s<rsub|2>=-<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>>|q<rsub|3>>,c<rsub|2>=<frac|z-L<rsub|1>|q<rsub|3>>|]>,<around*|[|s<rsub|2>=<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>>|q<rsub|3>>,c<rsub|2>=<frac|z-L<rsub|1>|q<rsub|3>>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      S2[1]:-((sqrt(y^2+x^2-L[2]^2))/(q[3]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>-<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>>|q<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      S2[2]:((sqrt(y^2+x^2-L[2]^2))/(q[3]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>>|q<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      C2:((z-L[1])/(q[3]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><frac|z-L<rsub|1>|q<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      q2[1]:atan2(S2[1],C2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >>-<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>>|q<rsub|3>>,<frac|z-L<rsub|1>|q<rsub|3>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      q2[2]:atan2(S2[2],C2)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      ><with|font-family|rm|atan2>><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>>|q<rsub|3>>,<frac|z-L<rsub|1>|q<rsub|3>>|)>>>
    </unfolded-io>

    \;

    Per la variabile trigonometrica <math|q<rsub|2>> si hanno 2 soluzioni
    GENERICHE per ogni soluzione di <math|q<rsub|3>>, quindi in tutto 4
    soluzioni GENERICHE.

    Si ha un'unica soluzione (SINGOLARITA') se vale la condizione
    <math|x<rsup|2>+y<rsup|2>=L<rsub|2><rsup|2>>.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      solve([X,Y],[s[1],c[1]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><around*|[|s<rsub|1>=-<frac|L<rsub|2>*x-s<rsub|2>*q<rsub|3>*y|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,c<rsub|1>=<frac|L<rsub|2>*y+s<rsub|2>*q<rsub|3>*x|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      S1:-((L[2]*x-s[2]*q[3]*y)/(s[2]^2*q[3]^2+L[2]^2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >>-<frac|L<rsub|2>*x-s<rsub|2>*q<rsub|3>*y|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      C1:((L[2]*y+s[2]*q[3]*x)/(s[2]^2*q[3]^2+L[2]^2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >><frac|L<rsub|2>*y+s<rsub|2>*q<rsub|3>*x|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>>
    </unfolded-io>

    \;

    \;

    Posso ora calcolare la variabile trigonometrica q<rsub|1> come segue:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      q1:atan2(S1,C1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >>-<math-up|atan2><around*|(|<frac|L<rsub|2>*x-s<rsub|2>*q<rsub|3>*y|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,<frac|L<rsub|2>*y+s<rsub|2>*q<rsub|3>*x|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>|)>>>
    </unfolded-io>
  </session>

  \;

  \;

  \;

  <with|color|red|Procedura 7: Procedura per il calcolo della cinematica
  inversa del ROBOT ANTROPOMORFO a partire dalle equazioni seguenti:
  <math|x=L<rsub|3>*c<rsub|1>*c<rsub|23>+L<rsub|2>*c<rsub|1>*c<rsub|2>>,
  <math|y=L<rsub|3>*s<rsub|1>*c<rsub|23>+L<rsub|2>*s<rsub|1>*c<rsub|2>>,
  <math|z=L<rsub|3>*s<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:L[3]*cos(q[1])*cos(q[2]+q[3])+L[2]*cos(q[1])*cos(q[2])-x$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      eq1:subst([cos(q[1])=c[1],cos(q[2])=c[2],cos(q[2]+q[3])=c[23]],eq1)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      X:solve([eq1],x)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >>x=c<rsub|1>*L<rsub|3>*c<rsub|23>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      eq2:L[3]*sin(q[1])*cos(q[2]+q[3])+L[2]*sin(q[1])*cos(q[2])-y$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      eq2:subst([sin(q[1])=s[1],cos(q[2])=c[2],cos(q[2]+q[3])=c[23]],eq2)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      Y:solve([eq2],y)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>y=s<rsub|1>*L<rsub|3>*c<rsub|23>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      eq3:L[3]*sin(q[2]+q[3])+L[2]*sin(q[2])+L[1]-z$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      eq3:subst([sin(q[2])=s[2],sin(q[2]+q[3])=s[23]],eq3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      Z:solve([eq3],z)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>z=L<rsub|3>*s<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>
    </unfolded-io>

    \;

    Nella terzo espressione (lungo Z) non vi è dipendenza dalla variabile
    trigonometrica <math|q<rsub|1>>, allora prendo le altre due espressioni e
    la tolgo anche da queste:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      eqTrig1:(s[1]^2)+(c[1]^2)-1$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      eqTrig2:(s[2]^2)+(c[2]^2)-1$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      eqTrig3:(s[3]^2)+(c[3]^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      eliminate([X,Y,eqTrig1],[s[1],c[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|<around*|(|L<rsub|3><rsup|2>*c<rsub|23><rsup|2>+2*L<rsub|2>*c<rsub|2>*L<rsub|3>*c<rsub|23>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>*<around*|(|y<rsup|2>+x<rsup|2>-L<rsub|3><rsup|2>*c<rsub|23><rsup|2>-2*L<rsub|2>*c<rsub|2>*L<rsub|3>*c<rsub|23>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>|]>>>
    </unfolded-io>

    \;

    Per ottenere conti più fattibili vado a sostituire <math|\<rho\><rsup|2>>
    alla quantità <math|<around*|(|x<rsup|2>+y<rsup|2>|)>> e ne calcolo poi
    le due soluzioni distinte: <math|>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      eq1:rho^2-L[3]^2*c[23]^2-2*L[2]*c[2]*L[3]*c[23]-L[2]^2*c[2]^2
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >>\<rho\><rsup|2>-L<rsub|3><rsup|2>*c<rsub|23><rsup|2>-2*L<rsub|2>*c<rsub|2>*L<rsub|3>*c<rsub|23>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      eq1:subst([c[23]=c[2]*c[3]-s[2]*s[3]],eq1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >>\<rho\><rsup|2>-L<rsub|3><rsup|2>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)><rsup|2>-2*L<rsub|2>*c<rsub|2>*L<rsub|3>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>>>
    </unfolded-io>

    Ora mi scrivo le quantità <math|c<rsub|23>> =
    <math|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>> e
    <math|s<rsub|23>=s<rsub|2>*c<rsub|3>+s<rsub|3>*c<rsub|2>> e vado a
    cancellare la variabile trigonometrica <math|q<rsub|2>>:

    Siccome nell'andare ad eliminare i parametri <math|s<rsub|2>,c<rsub|2>>
    si hanno pagine e pagine di equazioni di gradi maggiore al secondo,
    allora vado a calcolare le due soluzioni di \<rho\> e ne studio solo una,
    tanto i risultati per quanto riguarda l'altra sono uguali in modulo ma
    opposti in segno.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      solve([eq1],rho)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|\<rho\>=-s<rsub|2>*L<rsub|3>*s<rsub|3>+c<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2>*c<rsub|2>,\<rho\>=s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      eq1:rho=s[2]*L[3]*s[3]-c[2]*L[3]*c[3]-L[2]*c[2]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>\<rho\>=s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      Z:subst([s[23]=s[2]*c[3]+s[3]*c[2]],Z)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>z=L<rsub|3>*<around*|(|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>|)>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      eliminate([eq1,Z,eqTrig2],[c[2],s[2]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|[|<around*|(|L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>|)>*<around*|(|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>|)>*<around*|(|z<rsup|2>-2*L<rsub|1>*z+\<rho\><rsup|2>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>-L<rsub|3><rsup|2>*c<rsub|3><rsup|2>-2*L<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)>|]>>>
    </unfolded-io>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      eq2:z^2-2*L[1]*z+rho^2-L[3]^2*s[3]^2-L[3]^2*c[3]^2-2*L[2]*L[3]*c[3]-L[2]^2+L[1]^2
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >>z<rsup|2>-2*L<rsub|1>*z+\<rho\><rsup|2>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>-L<rsub|3><rsup|2>*c<rsub|3><rsup|2>-2*L<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      eliminate([eq2,eqTrig3],[s[3]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><around*|(|z<rsup|2>-2*L<rsub|1>*z+\<rho\><rsup|2>-2*L<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      eq2:z^2-2*L[1]*z+rho^2-2*L[2]*L[3]*c[3]-L[3]^2-L[2]^2+L[1]^2
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >>z<rsup|2>-2*L<rsub|1>*z+\<rho\><rsup|2>-2*L<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>
    </unfolded-io>

    \;

    Prendendo in considerazione l'equazione eq2 è possibile calcolare la
    quantità cos(<math|q<rsub|3>>) e definire anche lo spazio operativo:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      C3:solve([eq2],c[3])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >>c<rsub|3>=<frac|z<rsup|2>-2*L<rsub|1>*z+\<rho\><rsup|2>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*L<rsub|2>*L<rsub|3>>>>
    </unfolded-io>

    \;

    Tale equazione è esistente se e solo se la quantità a destra dell'uguale
    è compresa tra -1 ed 1, in particolare si ha:

    <\equation*>
      -1\<leqslant\><frac|z<rsup|2>-2*L<rsub|1>*z+\<rho\><rsup|2>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*L<rsub|2>*L<rsub|3>>\<leqslant\>1
    </equation*>

    <\equation*>
      -2*L<rsub|2>*L<rsub|3>\<leqslant\>z<rsup|2>-2*L<rsub|1>*z+\<rho\><rsup|2>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>\<leqslant\>2*L<rsub|2>*L<rsub|3>
    </equation*>

    <\equation*>
      -2*L<rsub|2>*L<rsub|3>+L<rsub|3><rsup|2>+L<rsub|2><rsup|2>\<leqslant\>x<rsup|2>+y<rsup|2>+<around*|(|z-L<rsub|1>|)><rsup|2>\<leqslant\>2*L<rsub|2>*L<rsub|3>+L<rsub|3><rsup|2>+L<rsub|2><rsup|2>
    </equation*>

    <\equation*>
      <around*|(|L<rsub|2>-L<rsub|3>|)><rsup|2>\<leqslant\>x<rsup|2>+y<rsup|2>+<around*|(|z-L<rsub|1>|)><rsup|2>\<leqslant\><around*|(|L<rsub|2>+L<rsub|3>|)><rsup|2>
    </equation*>

    Allora lo spazio operativo candidato è la sfera la sfera cava con raggio
    minore <math|<around*|\||L<rsub|2>-L<rsub|3>|\|>> e raggio maggiore
    (<math|L<rsub|2>+L<rsub|3>>) e centrata in (0,0,<math|L<rsub|1>>).

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      S3:solve([eqTrig3],s[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><around*|[|s<rsub|3>=-<sqrt|1-c<rsub|3><rsup|2>>,s<rsub|3>=<sqrt|1-c<rsub|3><rsup|2>>|]>>>
    </unfolded-io>

    \;

    Posso calcolare la variabile trigonometrica <with|color|blue|q<rsub|3>>
    come segue:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|input>
      q3:atan2(S3[1],C3)$
    </input>

    <\textput>
      <\equation*>
        -<math-up|atan2><around*|(|<sqrt|1-c<rsub|3><rsup|2>>,<frac|z<rsup|2>-2*L<rsub|1>*z+\<rho\><rsup|2>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*L<rsub|2>*L<rsub|3>>|)>
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|input>
      q3:atan2(S3[2],C3)$
    </input>

    <\textput>
      <\equation*>
        <math-up|atan2><around*|(|<sqrt|1-c<rsub|3><rsup|2>>,<frac|z<rsup|2>-2*L<rsub|1>*z+\<rho\><rsup|2>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*L<rsub|2>*L<rsub|3>>|)>
      </equation*>
    </textput>

    La variabile trigonometrica <math|q<rsub|3>> ha 2 soluzioni GENERICHE che
    diventano una (SINGOLARITA') se la quantità di <math|c<rsub|3>> è in
    modulo uguale ad 1.

    \;

    Ora calcolo la variabile trigonometrica <math|q<rsub|2>> tenendo conto
    dell'equazioni eq1 e Z:\ 

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      solve([eq1,Z],[c[2],s[2]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >><around*|[|c<rsub|2>=-<frac|L<rsub|3>*s<rsub|3>*<around*|(|L<rsub|1>-z|)>+<around*|(|L<rsub|3>*c<rsub|3>+L<rsub|2>|)>*\<rho\>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>,s<rsub|2>=<frac|L<rsub|3>*c<rsub|3>*<around*|(|z-L<rsub|1>|)>+L<rsub|2>*<around*|(|z-L<rsub|1>|)>+L<rsub|3>*s<rsub|3>*\<rho\>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      C2:-((L[3]*s[3]*(L[1]-z)+(L[3]*c[3]+L[2])*rho)/(L[3]^2*s[3]^2+L[3]^2*c[3]^2+2*L[2]*L[3]*c[3]+L[2]^2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >>-<frac|L<rsub|3>*s<rsub|3>*<around*|(|L<rsub|1>-z|)>+<around*|(|L<rsub|3>*c<rsub|3>+L<rsub|2>|)>*\<rho\>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      S2:((L[3]*c[3]*(z-L[1])+L[2]*(z-L[1])+L[3]*s[3]*rho)/(L[3]^2*s[3]^2+L[3]^2*c[3]^2+2*L[2]*L[3]*c[3]+L[2]^2))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><frac|L<rsub|3>*c<rsub|3>*<around*|(|z-L<rsub|1>|)>+L<rsub|2>*<around*|(|z-L<rsub|1>|)>+L<rsub|3>*s<rsub|3>*\<rho\>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      q2:atan2(S2,C2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      ><with|font-family|rm|atan2>><around*|(|<frac|L<rsub|3>*c<rsub|3>*<around*|(|z-L<rsub|1>|)>+L<rsub|2>*<around*|(|z-L<rsub|1>|)>+L<rsub|3>*s<rsub|3>*\<rho\>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>,-<frac|L<rsub|3>*s<rsub|3>*<around*|(|L<rsub|1>-z|)>+<around*|(|L<rsub|3>*c<rsub|3>+L<rsub|2>|)>*\<rho\>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>|)>>>
    </unfolded-io>

    <math|q<rsub|2>> ha quindi 4 soluzioni GENERICHE, mentre può avere
    infinite soluzioni (SINGOLARITA') se l'end-effector si trova nell'origine
    del robot.

    \;

    Posso ora calcolare la variabile trigonometrica
    <with|color|blue|q<rsub|1>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|unfolded-io>
      solve([X,Y],[c[1],s[1]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o33>)
      >><around*|[|c<rsub|1>=<frac|x|L<rsub|3>*c<rsub|23>+L<rsub|2>*c<rsub|2>>,s<rsub|1>=<frac|y|L<rsub|3>*c<rsub|23>+L<rsub|2>*c<rsub|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|unfolded-io>
      C1:(x/(L[3]*c[23]+L[2]*c[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o34>)
      >><frac|x|L<rsub|3>*c<rsub|23>+L<rsub|2>*c<rsub|2>>>>
    </unfolded-io>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
      S1:(y/(L[3]*c[23]+L[2]*c[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >><frac|y|L<rsub|3>*c<rsub|23>+L<rsub|2>*c<rsub|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|unfolded-io>
      q1:atan2(S1,C1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
      ><with|font-family|rm|atan2>><around*|(|<frac|y|L<rsub|3>*c<rsub|23>+L<rsub|2>*c<rsub|2>>,<frac|x|L<rsub|3>*c<rsub|23>+L<rsub|2>*c<rsub|2>>|)>>>
    </unfolded-io>

    \;

    Quindi la variabile trigonometrica ha 1 soluzione GENERICA per ogni
    scelta di <math|q<rsub|3>>.
  </session>

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
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>z=c<rsub|2>*L<rsub|3>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      eqTrig1:(sin(q[1])^2)+(cos(q[1])^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      eqTrig1:subst([sin(q[1])=s[1],cos(q[1])=c[1]],eqTrig1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      eqTrig2:(sin(q[2])^2)+(cos(q[2])^2)-1$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      eqTrig2:subst([sin(q[2])=s[2],cos(q[2])=c[2]],eqTrig2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1>>
    </unfolded-io>

    \;

    Prendo le prime due equazioni x ed y, da cui posso eliminare la variabile
    trigonometrica q<rsub|1>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      eliminate([X,Y,eqTrig1],[c[1],s[1]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*<around*|(|y<rsup|2>+x<rsup|2>-s<rsub|2><rsup|2>*L<rsub|3><rsup|2>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      eq1:y^2+x^2-s[2]^2*L[3]^2
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >>y<rsup|2>+x<rsup|2>-s<rsub|2><rsup|2>*L<rsub|3><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      eliminate([eq1,Z,eqTrig2],[c[2],s[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|L<rsub|3><rsup|4>*<around*|(|z<rsup|2>+y<rsup|2>+x<rsup|2>-L<rsub|3><rsup|2>|)><rsup|2>|]>>>
    </unfolded-io>

    <\textput>
      Dall'espressione precedente di trova lo spazio operativo del polso
      sferico che è dale dall'equazione <math|z<rsup|2>+y<rsup|2>+x<rsup|2>=L<rsub|3><rsup|2>>,
      la quale appunto permette di definire come spazio operativo una sfera
      di centro (0,0,0) e raggio <math|L<rsub|3>>.
    </textput>

    \;

    Dall'equazione eq1 è possibile trovare quanto vale il
    <math|sin<around*|(|q<rsub|2>|)>> mentre dall'equazione Z è possibile
    calcolare <math|cos<around*|(|q<rsub|2>|)>>, infine si potrà definire
    quanto vale la variabile trigonometrica <math|q<rsub|2>>.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      C2:solve([Z],c[2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>c<rsub|2>=<frac|z|L<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      S2[1]:solve([eq1],s[2])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >>s<rsub|2>=-<frac|<sqrt|y<rsup|2>+x<rsup|2>>|L<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      S2[2]:solve([eq1],s[2])[2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >>s<rsub|2>=<frac|<sqrt|y<rsup|2>+x<rsup|2>>|L<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      q2[1]:atan2(S2[1],C2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      ><with|font-family|rm|atan2>><around*|(|s<rsub|2>,c<rsub|2>|)>=<math-up|atan2><around*|(|s<rsub|2>,<frac|z|L<rsub|3>>|)>=<around*|(|-<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>>|L<rsub|3>>,c<rsub|2>|)>=-<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>>|L<rsub|3>>,<frac|z|L<rsub|3>>|)>|)>>>
    </unfolded-io>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      q2[2]:atan2(S2[2],C2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      ><with|font-family|rm|atan2>><around*|(|s<rsub|2>,c<rsub|2>|)>=<math-up|atan2><around*|(|s<rsub|2>,<frac|z|L<rsub|3>>|)>=<around*|(|<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>>|L<rsub|3>>,c<rsub|2>|)>=<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>>|L<rsub|3>>,<frac|z|L<rsub|3>>|)>|)>>>
    </unfolded-io>

    Quindi la variabile trigonometrica <math|q<rsub|2>> ha 2 soluzioni
    GENERICHE.

    \;

    Adesso prendendo in considerazione le prime due equazioni è possibile
    definire in successione le quantità <math|sin<around*|(|q<rsub|1>|)>,cos<around*|(|q<rsub|1>|)>,q<rsub|1>>:

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

    \;

    La variabile trigonometrica <math|q<rsub|1>> ha 1 soluzione generica per
    ogni valore di <math|sin<around*|(|q<rsub|2>|)>>, quindi in totale ha 2
    soluzioni GENERICHE.
  </session>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|9>
    <associate|page-medium|paper>
  </collection>
</initial>