<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA 20: Calcolare la cinematica inversa completa del manipolatore
  completo di Stanford

  \;

  Per utilizzare il DISACCOPPIAMENTO POLSO-STRUTTRA bisogna verificare che la
  condizione <math|d<rsub|36><around*|(|q<rsub|b>|)>=R<rsub|36><around*|(|q<rsub|b>|)>*d<rsub|1>+d<rsub|0>>,
  dove <math|d<rsub|0>,d<rsub|1>> sono dei valori COSTANTI, quindi deve
  valere che:

  \|<math|<tformat|<table|<row|<cell|c<rsub|4>*s<rsub|5>*L<rsub|6>>>|<row|<cell|s<rsub|4>*s<rsub|5>*L<rsub|6>>>|<row|<cell|c<rsub|5>*L<rsub|6>+L<rsub|4>>>>>>\|=
  <math|<matrix|<tformat|<table|<row|<cell|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>>|<cell|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>>|<cell|c<rsub|4>*s<rsub|5>>>|<row|<cell|c<rsub|4>*s<rsub|6>+s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|4>*c<rsub|6>-s<rsub|4>*c<rsub|5>*s<rsub|6>>|<cell|s<rsub|4>*s<rsub|5>>>|<row|<cell|-s<rsub|5>*c<rsub|6>>|<cell|s<rsub|5>*s<rsub|6>>|<cell|c<rsub|5>>>>>>>.d1
  + d0

  \;

  Dalla risoluzione dell'equazione di sopra di trova facilmente che
  d1=<math|<around*|[|0;0;L<rsub|6>|]>> mentre d0=[<math|0;0;L<rsub|4>>].

  \;

  Quindi verificata la CONDIZIONE DI DISACCOPPIAMENTO è possibile scrivere la
  relazione seguente: <math|d=R*d<rsub|1>+R<rsub|03>*q<rsub|a>*d<rsub|0>+d<rsub|03><around*|(|q<rsub|a>|)>>,
  che è possibile riscrivere anche come: <math|d<rsup|*c>=d-R*d<rsub|1>=R<rsub|03><around*|(|q<rsub|a>|)>*d<rsub|0>+d<rsub|03><around*|(|q<rsub|a>|)>>.

  Quest'ultima formula permette di cacolare
  <math|q<rsub|a>=q<rsub|1>*q<rsub|2>*q<rsub|3>>.

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      R03:matrix([c[1]*c[2],-s[1],c[1]*s[2]],[s[1]*c[2],c[1],s[1]*s[2]],[-s[2],0,c[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|-s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>>|<row|<cell|-s<rsub|2>>|<cell|0>|<cell|c<rsub|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      d03:matrix([c[1]*s[2]*q[3]-s[1]*L[2]],[s[1]*s[2]*q[3]+c[1]*L[2]],[c[2]*q[3]+L[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|c<rsub|2>*q<rsub|3>+L<rsub|1>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      d0:matrix([0],[0],[L[4]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|L<rsub|4>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      dCappello:(R03.d0)+d03
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*s<rsub|2>*L<rsub|4>+c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|1>*s<rsub|2>*L<rsub|4>+s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|c<rsub|2>*L<rsub|4>+c<rsub|2>*q<rsub|3>+L<rsub|1>>>>>>>>
    </unfolded-io>

    \;

    \;

    Ora si va ad eseguire la cinematica inversa classica per calcolare il
    valore delle variabili <math|q<rsub|1>,q<rsub|2>,q<rsub|3>>:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      eq1:dCappello[1,1]-xC$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      X:solve([eq1],xC)[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><math-up|xC>=c<rsub|1>*s<rsub|2>*L<rsub|4>+c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      eq2:dCappello[2,1]-yC$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      Y:solve([eq2],yC)[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><math-up|yC>=s<rsub|1>*s<rsub|2>*L<rsub|4>+s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      eq3:dCappello[3,1]-zC$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      Z:solve([eq3],zC)[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><math-up|zC>=c<rsub|2>*L<rsub|4>+c<rsub|2>*q<rsub|3>+L<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      eqTrig1:(s[1]^2)+(c[1]^2)-1
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      eqTrig2:(s[2]^2)+(c[2]^2)-1
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      eliminate([X,Y,eqTrig1],[c[1],s[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|s<rsub|2><rsup|2>*<around*|(|s<rsub|2><rsup|2>*L<rsub|4><rsup|4>+4*s<rsub|2><rsup|2>*q<rsub|3>*L<rsub|4><rsup|3>+<around*|(|6*s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>|)>*L<rsub|4><rsup|2>+<around*|(|4*s<rsub|2><rsup|2>*q<rsub|3><rsup|3>+2*L<rsub|2><rsup|2>*q<rsub|3>|)>*L<rsub|4>+s<rsub|2><rsup|2>*q<rsub|3><rsup|4>+L<rsub|2><rsup|2>*q<rsub|3><rsup|2>|)>*<around*|(|<math-up|yC><rsup|2>+<math-up|xC><rsup|2>-s<rsub|2><rsup|2>*L<rsub|4><rsup|2>-2*s<rsub|2><rsup|2>*q<rsub|3>*L<rsub|4>-s<rsub|2><rsup|2>*q<rsub|3><rsup|2>-L<rsub|2><rsup|2>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      eq1:yC^2+xC^2-s[2]^2*L[4]^2-2*s[2]^2*q[3]*L[4]-s[2]^2*q[3]^2-L[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><math-up|yC><rsup|2>+<math-up|xC><rsup|2>-s<rsub|2><rsup|2>*L<rsub|4><rsup|2>-2*s<rsub|2><rsup|2>*q<rsub|3>*L<rsub|4>-s<rsub|2><rsup|2>*q<rsub|3><rsup|2>-L<rsub|2><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      eliminate([eq1,Z,eqTrig2],[c[2],s[2]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|<around*|(|L<rsub|4><rsup|2>+2*q<rsub|3>*L<rsub|4>+q<rsub|3><rsup|2>|)><rsup|2>*<around*|(|<math-up|zC><rsup|2>-2*L<rsub|1>*<math-up|zC>+<math-up|yC><rsup|2>+<math-up|xC><rsup|2>-L<rsub|4><rsup|2>-2*q<rsub|3>*L<rsub|4>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      eq2:zC^2-2*L[1]*zC+yC^2+xC^2-L[4]^2-2*q[3]*L[4]-q[3]^2-L[2]^2+L[1]^2
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><math-up|zC><rsup|2>-2*L<rsub|1>*<math-up|zC>+<math-up|yC><rsup|2>+<math-up|xC><rsup|2>-L<rsub|4><rsup|2>-2*q<rsub|3>*L<rsub|4>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>
    </unfolded-io>

    Adesso da questa espressione è possibile ricavare il valore di
    <math|q<rsub|3>> e definire lo spazio operativo candidato per il
    manipolatore completo di Stanford:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      q3:solve([eq2],q[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><around*|[|q<rsub|3>=-<sqrt|<math-up|zC><rsup|2>-2*L<rsub|1>*<math-up|zC>+<math-up|yC><rsup|2>+<math-up|xC><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|4>,q<rsub|3>=<sqrt|<math-up|zC><rsup|2>-2*L<rsub|1>*<math-up|zC>+<math-up|yC><rsup|2>+<math-up|xC><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|4>|]>>>
    </unfolded-io>

    Quindi la variabile lineare <math|q<rsub|3>> ha 2 soluzioni GENERICHE che
    diventano una (SINGOLARITA') nel caso in cui la quantità sotto radice è
    nulla.

    \;

    Per quanto riguarda lo SPAZIO OPERATIVO CANDIDATO, questo è una fersa di
    centro (0,0,<math|L<rsub|1>>) e di raggio
    (<math|q<rsub|3>+L<rsub|4>>)+<math|L<rsub|2><rsup|>>.

    \;

    E' possibile ora calcolare la variabile trigonometrica <math|q<rsub|2>>
    tenendo conto dell'equazione Z ed eq1:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      C2:solve([Z],c[2])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>c<rsub|2>=<frac|<math-up|zC>-L<rsub|1>|L<rsub|4>+q<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      S2:solve([eqTrig2],s[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|[|s<rsub|2>=-<sqrt|1-c<rsub|2><rsup|2>>,s<rsub|2>=<sqrt|1-c<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|input>
      q2[1]:atan2(S2[1],C2)$
    </input>

    <\textput>
      <\equation*>
        -<math-up|atan2><around*|(|<sqrt|1-c<rsub|2><rsup|2>>,<frac|<math-up|zC>-L<rsub|1>|L<rsub|4>+q<rsub|3>>|)>
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|input>
      q2[2]:atan2(S2[2],C2)$
    </input>

    <\textput>
      <\equation*>
        <math-up|atan2><around*|(|<sqrt|1-c<rsub|2><rsup|2>>,<frac|<math-up|zC>-L<rsub|1>|L<rsub|4>+q<rsub|3>>|)>
      </equation*>
    </textput>

    La variabile trigonometrica <math|q<rsub|2>> ha 2 soluzioni generiche per
    ogni valore di <math|q<rsub|3>>, quindi siccome quest'ultimo ha a sua
    volta 2 soluzioni generiche allora <math|q<rsub|2>> ha 4 SOLUZIONI
    GENERICHE.

    Ora si calcola la variabile trigonometrica <math|q<rsub|1>> dalle prime
    due equazioni X,Y:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      C1:solve([X],c[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >>c<rsub|1>=<frac|<math-up|xC>+s<rsub|1>*L<rsub|2>|s<rsub|2>*L<rsub|4>+s<rsub|2>*q<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      S1:solve([Y],s[1])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >>s<rsub|1>=<frac|<math-up|yC>-c<rsub|1>*L<rsub|2>|s<rsub|2>*L<rsub|4>+s<rsub|2>*q<rsub|3>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|input>
      q1:atan2(S1,C1)$
    </input>

    <\textput>
      <\equation*>
        <math-up|atan2><around*|(|<frac|<math-up|yC>-c<rsub|1>*L<rsub|2>|s<rsub|2>*L<rsub|4>+s<rsub|2>*q<rsub|3>>,<frac|<math-up|xC>+s<rsub|1>*L<rsub|2>|s<rsub|2>*L<rsub|4>+s<rsub|2>*q<rsub|3>>|)>
      </equation*>
    </textput>
  </session>

  \;

  Nota la variabile <math|q<rsub|a>>, è possibile calcolare <math|q<rsub|b>>
  come segue:

  <math|R<rsub|36><around*|(|q<rsub|b>|)>=R<rsub|03><rsup|T><around*|(|q<rsub|a>|)>*R=<matrix|<tformat|<table|<row|<cell|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>>|<cell|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>>|<cell|c<rsub|4>*s<rsub|5>>>|<row|<cell|c<rsub|4>*s<rsub|6>+s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|4>*c<rsub|6>-s<rsub|4>*c<rsub|5>*s<rsub|6>>|<cell|s<rsub|4>*s<rsub|5>>>|<row|<cell|-s<rsub|5>*c<rsub|6>>|<cell|s<rsub|5>*s<rsub|6>>|<cell|c<rsub|5>>>>>>>
  = <math|<matrix|<tformat|<table|<row|<cell|R<rsub|1,1>>|<cell|R<rsub|1,2>>|<cell|R<rsub|1,3>>>|<row|<cell|R<rsub|2,1>>|<cell|R<rsub|2,2>>|<cell|R<rsub|2,3>>>|<row|<cell|R<rsub|3,1>>|<cell|R<rsub|3,2>>|<cell|R<rsub|3,3>>>>>>>
  i cui elementi sono tutti di valore noto.

  Quindi mi scelgo una terna di Eulero, tra quelle utili, per calcolare il
  valore delle variabili trigonometriche <math|q<rsub|4>,q<rsub|5>,q<rsub|6>>.
  Le due terne da utilizzare sono <math|R<rsub|z>*R<rsub|x>*R<rsub|z>> oppure
  <math|R<rsub|z>*R<rsub|y>*R<rsub|z>> poichè l'elemento semplice
  <math|c<rsub|5>> si trova in posizione 3,3. Tra queste ho scelto la terna
  <math|R<rsub|z>*R<rsub|x>*R<rsub|z>> e da questa trovo che:

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      R:matrix([c[4]*c[5]*c[6]-s[4]*s[6],-c[4]*c[5]*s[6]-s[4]*c[6],c[4]*s[5]],[c[4]*s[6]+s[4]*c[5]*c[6],c[4]*c[6]-s[4]*c[5]*s[6],s[4]*s[5]],[-s[5]*c[6],s[5]*s[6],c[5]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>>|<cell|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>>|<cell|c<rsub|4>*s<rsub|5>>>|<row|<cell|c<rsub|4>*s<rsub|6>+s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|4>*c<rsub|6>-s<rsub|4>*c<rsub|5>*s<rsub|6>>|<cell|s<rsub|4>*s<rsub|5>>>|<row|<cell|-s<rsub|5>*c<rsub|6>>|<cell|s<rsub|5>*s<rsub|6>>|<cell|c<rsub|5>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      calcolo_qb(R):=block(

      [transposeR,finalR,II],

      \;

      /*controllare che il tipo di dato in ingresso è una matrice*/

      if scalarp(R) = true or listp(R) = true then return(0),

      \;

      R:subst([c[4]=cos(q[4]),c[5]=cos(q[5]),c[6]=cos(q[6]),s[4]=sin(q[4]),s[5]=sin(q[5]),s[6]=sin(q[6])],R),

      \;

      /*controllare che la matrice in ingresso sia di rotazione*/

      transposeR:trigsimp(trigreduce(factor(transpose(R)))),

      finalR:trigsimp(trigreduce(factor(R.transposeR))),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if finalR # II then return(-1),

      \;

      det:trigsimp(trigreduce(factor(determinant(R)))),

      if det = 0 then return(-1),

      \;

      /*dopo aver effettuato tutti i controlli riapplico le semplificazioni
      per avere più semplici e pulite le soluzioni*/

      R:subst([cos[4]=c(q[4]),cos[5]=c(q[5]),cos[6]=c(q[6]),sin[4]=s(q[4]),sin[5]=s(q[5]),sin[6]=s(q[6])],R),

      \;

      /*calcolo il valore di q[4],q[5],q[6] considerando la terna di Eulero
      Rz*Rx*Rz per la matrice R*/

      if R[3,3] = 1 or R[3,3] = -1 then return(0),

      q5[1]:atan2(sqrt(1-(R[3,3]^2)),R[3,3]),

      q5[2]:atan2(-sqrt(1-(R[3,3]^2)),R[3,3]),

      \;

      if sqrt(1-(R[3,3]^2)) = 0 then return(0),

      q4:atan2(R[1,3]/sqrt(1-(R[3,3]^2)),-R[2,3]/sqrt(1-(R[3,3]^2))),

      q6:atan2(R[3,1]/sqrt(1-(R[3,3]^2)),-R[3,2]/sqrt(1-(R[3,3]^2))),

      \;

      mat:matrix([q,sol1,sol2],[q[4],q4,q4],[q[5],q5[1],q5[2]],[q[6],q6,q6]),

      return(mat)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      calcolo_qb(R)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|q>|<cell|<with|math-font-family|rm|sol1>>|<cell|<with|math-font-family|rm|sol2>>>|<row|<cell|q<rsub|4>>|<cell|<math-up|atan2><around*|(|<frac|cos
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>|<sqrt|1-cos
      <around*|(|q<rsub|5>|)><rsup|2>>>,-<frac|sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>|<sqrt|1-cos
      <around*|(|q<rsub|5>|)><rsup|2>>>|)>>|<cell|<math-up|atan2><around*|(|<frac|cos
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>|<sqrt|1-cos
      <around*|(|q<rsub|5>|)><rsup|2>>>,-<frac|sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>|<sqrt|1-cos
      <around*|(|q<rsub|5>|)><rsup|2>>>|)>>>|<row|<cell|q<rsub|5>>|<cell|<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|5>|)><rsup|2>>,cos
      <around*|(|q<rsub|5>|)>|)>>|<cell|-<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|5>|)><rsup|2>>,cos
      <around*|(|q<rsub|5>|)>|)>>>|<row|<cell|q<rsub|6>>|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>|<sqrt|1-cos
      <around*|(|q<rsub|5>|)><rsup|2>>>,-<frac|sin
      <around*|(|q<rsub|5>|)>*sin <around*|(|q<rsub|6>|)>|<sqrt|1-cos
      <around*|(|q<rsub|5>|)><rsup|2>>>|)>>|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>|<sqrt|1-cos
      <around*|(|q<rsub|5>|)><rsup|2>>>,-<frac|sin
      <around*|(|q<rsub|5>|)>*sin <around*|(|q<rsub|6>|)>|<sqrt|1-cos
      <around*|(|q<rsub|5>|)><rsup|2>>>|)>>>>>>
    </equation*>
  </session>

  \;

  \;

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
  </collection>
</references>