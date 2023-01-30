<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA 19: Calcolare la cinematica inversa completa del 3DOF planare

  \;

  -Dalla cinemamatica diretta del robot 3DOF planare si ricavano le seguenzi
  equazioni:

  <math|x=L<rsub|3>*c<rsub|123>+L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>>

  <math|y=L<rsub|3>*s<rsub|123>+L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>>

  <math|\<phi\>=q<rsub|1>+q<rsub|2>+q<rsub|3>>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      eq1:L[3]*c[123]+L[2]*c[12]+L[1]*c[1]-x$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      X:solve([eq1],x)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >>x=L<rsub|3>*c<rsub|123>+L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      eq2:L[3]*s[123]+L[2]*s[12]+L[1]*s[1]-y$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      Y:solve([eq2],y)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>y=L<rsub|3>*s<rsub|123>+L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      eqTrig1:(s[1]^2)+(c[1]^2)-1
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      eqTrig2:(s[2]^2)+(c[2]^2)-1
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1>>
    </unfolded-io>

    <\textput>
      Dalla terza equazione (<math|\<phi\>=q<rsub|1>+q<rsub|2>+q<rsub|3>>)<space|1em>conosciamo
      l'angolo totale e questo può essere sostituito alle quantità
      <math|c<rsub|123>,s<rsub|123>> che sono presenti nelle prime due
      equazioni:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      X:subst([c[123]=c[phi],c[12]=c[1]*c[2]-s[1]*s[2]],X)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >>x=L<rsub|3>*c<rsub|\<varphi\>>+L<rsub|2>*<around*|(|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>|)>+L<rsub|1>*c<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      Y:subst([s[123]=s[phi],s[12]=s[1]*c[2]+s[2]*c[1]],Y)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>y=L<rsub|3>*s<rsub|\<varphi\>>+L<rsub|2>*<around*|(|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>|)>+L<rsub|1>*s<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      eliminate([X,Y,eqTrig1,eqTrig2],[c[1],s[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|<around*|(|L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>|)>*<around*|(|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>|)>*<around*|(|y<rsup|2>-2*L<rsub|3>*s<rsub|\<varphi\>>*y+x<rsup|2>-2*L<rsub|3>*c<rsub|\<varphi\>>*x+L<rsub|3><rsup|2>*s<rsub|\<varphi\>><rsup|2>+L<rsub|3><rsup|2>*c<rsub|\<varphi\>><rsup|2>-L<rsub|2><rsup|2>*s<rsub|2><rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1><rsup|2>|)>,<around*|(|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1|)><rsup|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      eq1:y^2-2*L[3]*s[phi]*y+x^2-2*L[3]*c[phi]*x+L[3]^2*s[phi]^2+L[3]^2*c[phi]^2-L[2]^2*s[2]^2-L[2]^2*c[2]^2-2*L[1]*L[2]*c[2]-L[1]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>y<rsup|2>-2*L<rsub|3>*s<rsub|\<varphi\>>*y+x<rsup|2>-2*L<rsub|3>*c<rsub|\<varphi\>>*x+L<rsub|3><rsup|2>*s<rsub|\<varphi\>><rsup|2>+L<rsub|3><rsup|2>*c<rsub|\<varphi\>><rsup|2>-L<rsub|2><rsup|2>*s<rsub|2><rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|1><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      eliminate([eq1,eqTrig2],[s[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|<around*|(|y<rsup|2>-2*L<rsub|3>*s<rsub|\<varphi\>>*y+x<rsup|2>-2*L<rsub|3>*c<rsub|\<varphi\>>*x+L<rsub|3><rsup|2>*s<rsub|\<varphi\>><rsup|2>+L<rsub|3><rsup|2>*c<rsub|\<varphi\>><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      eq2:y^2-2*L[3]*s[phi]*y+x^2-2*L[3]*c[phi]*x+L[3]^2*s[phi]^2+L[3]^2*c[phi]^2-2*L[1]*L[2]*c[2]-L[2]^2-L[1]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>y<rsup|2>-2*L<rsub|3>*s<rsub|\<varphi\>>*y+x<rsup|2>-2*L<rsub|3>*c<rsub|\<varphi\>>*x+L<rsub|3><rsup|2>*s<rsub|\<varphi\>><rsup|2>+L<rsub|3><rsup|2>*c<rsub|\<varphi\>><rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      C2:solve([eq2],c[2])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>c<rsub|2>=<frac|y<rsup|2>-2*L<rsub|3>*s<rsub|\<varphi\>>*y+x<rsup|2>-2*L<rsub|3>*c<rsub|\<varphi\>>*x+L<rsub|3><rsup|2>*s<rsub|\<varphi\>><rsup|2>+L<rsub|3><rsup|2>*c<rsub|\<varphi\>><rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      S2:solve([eqTrig2],s[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|s<rsub|2>=-<sqrt|1-c<rsub|2><rsup|2>>,s<rsub|2>=<sqrt|1-c<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|input>
      q2:atan2(S2[1],C2)$
    </input>

    <\textput>
      <\equation*>
        -<math-up|atan2><around*|(|<sqrt|1-c<rsub|2><rsup|2>>,<frac|y<rsup|2>-2*L<rsub|3>*s<rsub|\<varphi\>>*y+x<rsup|2>-2*L<rsub|3>*c<rsub|\<varphi\>>*x+L<rsub|3><rsup|2>*s<rsub|\<varphi\>><rsup|2>+L<rsub|3><rsup|2>*c<rsub|\<varphi\>><rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      q2:atan2(S2[2],C2)$
    </input>

    <\textput>
      <\equation*>
        <math-up|atan2><around*|(|<sqrt|1-c<rsub|2><rsup|2>>,<frac|y<rsup|2>-2*L<rsub|3>*s<rsub|\<varphi\>>*y+x<rsup|2>-2*L<rsub|3>*c<rsub|\<varphi\>>*x+L<rsub|3><rsup|2>*s<rsub|\<varphi\>><rsup|2>+L<rsub|3><rsup|2>*c<rsub|\<varphi\>><rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>
      </equation*>
    </textput>

    \;

    La variabile trigonometrica <math|q<rsub|2>> ha due soluzioni generiche.

    \;

    Per quanto riguarda lo spazio operativo, questo è possibile calcolarlo
    andando a prendere la seguente quantità che deve essere limitata tra -1
    ed 1:

    <\equation*>
      -1\<leqslant\><frac|y<rsup|2>-2*L<rsub|3>*s<rsub|\<varphi\>>*y+x<rsup|2>-2*L<rsub|3>*c<rsub|\<varphi\>>*x+L<rsub|3><rsup|2>*s<rsub|\<varphi\>><rsup|2>+L<rsub|3><rsup|2>*c<rsub|\<varphi\>><rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>\<leqslant\>1
    </equation*>

    <\equation*>
      -1\<leqslant\><frac|<around*|(|*y-L<rsub|3>*s<rsub|\<varphi\>>*|)><rsup|2>+<around*|(|x-L<rsub|3>*c<rsub|\<varphi\>>|)><rsup|2>*-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>\<leqslant\>1
    </equation*>

    <\equation*>
      -2*L<rsub|1>*L<rsub|2>\<leqslant\><around*|(|*x<rsup|c>|)><rsup|2>+<around*|(|y<rsup|c>|)><rsup|2>*-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>\<leqslant\>2*L<rsub|1>*L<rsub|2>*
    </equation*>

    <\equation*>
      <around*|(|L<rsub|1>-L<rsub|2>|)><rsup|2>\<leqslant\><around*|(|*x<rsup|c>|)><rsup|2>+<around*|(|y<rsup|c>|)><rsup|2>\<leqslant\><around*|(|L<rsub|1>+L<rsub|2>|)><rsup|2>
    </equation*>

    Quindi lo spazio operativo è dato da una corona circolare di centro (0,0)
    e raggio inferiore <math|<around*|\||L<rsub|1>-L<rsub|2>|\|>> e raggio
    superiore (<math|L<rsub|1>+L<rsub|2>>).

    \;

    Ora è possibile calcolare, dalle equazioni X,Y la variabile
    trigonometrica <math|q<rsub|1>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      C1:solve([X],c[1])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>c<rsub|1>=<frac|x-L<rsub|3>*c<rsub|\<varphi\>>+s<rsub|1>*L<rsub|2>*s<rsub|2>|L<rsub|2>*c<rsub|2>+L<rsub|1>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      S1:solve([Y],s[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >>s<rsub|1>=<frac|y-L<rsub|3>*s<rsub|\<varphi\>>-c<rsub|1>*L<rsub|2>*s<rsub|2>|L<rsub|2>*c<rsub|2>+L<rsub|1>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|input>
      q1:atan2(S1,C1)$
    </input>

    <\textput>
      <\equation*>
        <math-up|atan2><around*|(|<frac|y-L<rsub|3>*s<rsub|\<varphi\>>-c<rsub|1>*L<rsub|2>*s<rsub|2>|L<rsub|2>*c<rsub|2>+L<rsub|1>>,<frac|x-L<rsub|3>*c<rsub|\<varphi\>>+s<rsub|1>*L<rsub|2>*s<rsub|2>|L<rsub|2>*c<rsub|2>+L<rsub|1>>|)>
      </equation*>

      \;
    </textput>

    Infine calcolate le variabili trigonometriche <math|q<rsub|1>,q<rsub|2>>
    e conosciuto il valore di \<phi\>, è possibile calcolare
    <math|q<rsub|3>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      eq1:q[1]+q[2]+q[3]-phi
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >>-\<varphi\>+q<rsub|3>+q<rsub|2>+q<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      eq1:solve([eq1],phi)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >>\<varphi\>=q<rsub|3>+q<rsub|2>+q<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      q3:solve([eq1],q[3])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >>q<rsub|3>=\<varphi\>-q<rsub|2>-q<rsub|1>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>