<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA 21: Calcolare la cinematica inversa completa del PUMA

  Per utilizzare il DISACCOPPIAMENTO POLSO-STRUTTURA bisogna verificare che
  dati due costanti <math|d<rsub|0>,d<rsub|1>>, è verificata la condizione
  <math|d<rsub|36><around*|(|q<rsub|b>|)>=R<rsub|36><around*|(|q<rsub|b>|)>*d<rsub|1>+d<rsub|0>>:

  \|<math|<tformat|<table|<row|<cell|c<rsub|4>*s<rsub|5>*L<rsub|6>>>|<row|<cell|s<rsub|4>*s<rsub|5>*L<rsub|6>>>|<row|<cell|c<rsub|5>*L<rsub|6>+L<rsub|4>>>>>>\|=
  <math|<matrix|<tformat|<table|<row|<cell|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>>|<cell|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>>|<cell|c<rsub|4>*s<rsub|5>>>|<row|<cell|c<rsub|4>*s<rsub|6>+s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|4>*c<rsub|6>-s<rsub|4>*c<rsub|5>*s<rsub|6>>|<cell|s<rsub|4>*s<rsub|5>>>|<row|<cell|-s<rsub|5>*c<rsub|6>>|<cell|s<rsub|5>*s<rsub|6>>|<cell|c<rsub|5>>>>>>>.d1
  + d0

  \;

  Dall'equazione appena sopra si calcola che i due vettori hanno valore:
  <math|d<rsub|1>=><math|<around*|[|0;0;L<rsub|6>|]>> mentre l'altra vale
  <math|d<rsub|0>=<around*|[|0;0;L<rsub|4>|]>>.

  Quindi verificata la condizione di disaccoppiamento polso-struttura è
  possibile scrivere la relazione seguente:
  <math|d=R*d<rsub|1>+R<rsub|03>*q<rsub|a>*d<rsub|0>+d<rsub|03><around*|(|q<rsub|a>|)>>,
  che è possibile riscrivere anche come: <math|d<rsup|*c>=d-R*d<rsub|1>=R<rsub|03><around*|(|q<rsub|a>|)>*d<rsub|0>+d<rsub|03><around*|(|q<rsub|a>|)>>.

  Quest'ultima formula permette di calcolare
  <math|q<rsub|a>=q<rsub|1>*q<rsub|2>*q<rsub|3>.>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      R03:matrix([c[1]*c[23],-c[1]*s[23],s[1]],[s[1]*c[23],-s[1]*s[23],-c[1]],[s[23],c[23],0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|23>>|<cell|-c<rsub|1>*s<rsub|23>>|<cell|s<rsub|1>>>|<row|<cell|s<rsub|1>*c<rsub|23>>|<cell|-s<rsub|1>*s<rsub|23>>|<cell|-c<rsub|1>>>|<row|<cell|s<rsub|23>>|<cell|c<rsub|23>>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      d0:matrix([0],[0],[L[4]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|L<rsub|4>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      d03:matrix([c[1]*L[3]*c[23]+c[1]*L[2]*c[2]],[s[1]*L[3]*c[23]+s[1]*L[2]*c[2]],[L[3]*s[23]+L[2]*s[2]+L[1]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*L<rsub|3>*c<rsub|23>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*L<rsub|3>*c<rsub|23>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|L<rsub|3>*s<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      dCappello:(R03.d0)+d03
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*L<rsub|3>*c<rsub|23>+s<rsub|1>*L<rsub|4>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*L<rsub|3>*c<rsub|23>-c<rsub|1>*L<rsub|4>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|L<rsub|3>*s<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>>>>>>
    </unfolded-io>

    \;

    \;

    Ora si esegue il calcolo della cinematica inversa sul vettore
    <math|d<rsup|c>> e si trovano i valori di
    <math|q<rsub|1>,q<rsub|2>,q<rsub|3>>:

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
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><math-up|xC>=c<rsub|1>*L<rsub|3>*c<rsub|23>+s<rsub|1>*L<rsub|4>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>
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
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><math-up|yC>=s<rsub|1>*L<rsub|3>*c<rsub|23>-c<rsub|1>*L<rsub|4>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      eq3:dCappello[3,1]-zC$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      eq3:subst([s[23]=s[2]*c[3]+s[3]*c[2]],eq3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      Z:solve([eq3],zC)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><math-up|zC>=c<rsub|2>*L<rsub|3>*s<rsub|3>+s<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      eqTrig1:(s[1]^2)+(c[1]^2)-1
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      eqTrig2:(s[2]^2)+(c[2]^2)-1
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      eqTrig3:(s[3]^2)+(c[3]^2)-1
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >>s<rsub|3><rsup|2>+c<rsub|3><rsup|2>-1>>
    </unfolded-io>

    \;

    La terza equazione è indipendente dalla variabile trigonometrica
    <math|q<rsub|1>>, quindi considero le prime due e la elimino anche da
    queste:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      eliminate([X,Y,eqTrig1],[c[1],s[1]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|<around*|(|L<rsub|3><rsup|4>*c<rsub|23><rsup|4>+4*L<rsub|2>*c<rsub|2>*L<rsub|3><rsup|3>*c<rsub|23><rsup|3>+<around*|(|L<rsub|3><rsup|2>*L<rsub|4><rsup|2>+6*L<rsub|2><rsup|2>*c<rsub|2><rsup|2>*L<rsub|3><rsup|2>|)>*c<rsub|23><rsup|2>+<around*|(|2*L<rsub|2>*c<rsub|2>*L<rsub|3>*L<rsub|4><rsup|2>+4*L<rsub|2><rsup|3>*c<rsub|2><rsup|3>*L<rsub|3>|)>*c<rsub|23>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>*L<rsub|4><rsup|2>+L<rsub|2><rsup|4>*c<rsub|2><rsup|4>|)>*<around*|(|<math-up|yC><rsup|2>+<math-up|xC><rsup|2>-L<rsub|3><rsup|2>*c<rsub|23><rsup|2>-2*L<rsub|2>*c<rsub|2>*L<rsub|3>*c<rsub|23>-L<rsub|4><rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>|]>>>
    </unfolded-io>

    \;

    Per semplificare i conti vado a sostituire la quantità
    <math|\<rho\><rsup|2>=<around*|(|xC<rsup|2>+yC<rsup|2>|)>>
    nell'espressione seguente:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      eq1:yC^2+xC^2-L[3]^2*c[23]^2-2*L[2]*c[2]*L[3]*c[23]-L[4]^2-L[2]^2*c[2]^2
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><math-up|yC><rsup|2>+<math-up|xC><rsup|2>-L<rsub|3><rsup|2>*c<rsub|23><rsup|2>-2*L<rsub|2>*c<rsub|2>*L<rsub|3>*c<rsub|23>-L<rsub|4><rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      eq1:rho^2-L[3]^2*c[23]^2-2*L[2]*c[2]*L[3]*c[23]-L[4]^2-L[2]^2*c[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>\<rho\><rsup|2>-L<rsub|3><rsup|2>*c<rsub|23><rsup|2>-2*L<rsub|2>*c<rsub|2>*L<rsub|3>*c<rsub|23>-L<rsub|4><rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      eq1:solve([eq1],rho^2)[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>\<rho\><rsup|2>=L<rsub|3><rsup|2>*c<rsub|23><rsup|2>+2*L<rsub|2>*c<rsub|2>*L<rsub|3>*c<rsub|23>+L<rsub|4><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>>>
    </unfolded-io>

    \;

    Per evitare conti molto complicati nel passaggio in cui si va ad
    eliminare una variabile trigonometrica allora vado ad eguagliare a 0 la
    costante lineare <math|L<rsub|4>> ed otttenere così la seguent
    espressione:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      eq1:subst([L[4]=0],eq1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >>\<rho\><rsup|2>=L<rsub|3><rsup|2>*c<rsub|23><rsup|2>+2*L<rsub|2>*c<rsub|2>*L<rsub|3>*c<rsub|23>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      eq1:solve([eq1],rho)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|\<rho\>=-L<rsub|3>*c<rsub|23>-L<rsub|2>*c<rsub|2>,\<rho\>=L<rsub|3>*c<rsub|23>+L<rsub|2>*c<rsub|2>|]>>>
    </unfolded-io>

    Prendo in considerazione solo una delle due soluzioni (quella con valori
    positivi), per l'altra valgono gli stessi ragionamenti e passaggi
    matematici:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      eq1:eq1[2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >>\<rho\>=L<rsub|3>*c<rsub|23>+L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      eq1:subst([c[23]=c[2]*c[3]-s[2]*s[3]],eq1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >>\<rho\>=L<rsub|3>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>+L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      Z
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><math-up|zC>=c<rsub|2>*L<rsub|3>*s<rsub|3>+s<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      eliminate([eq1,Z,eqTrig2],[c[2],s[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><around*|[|<around*|(|L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>|)>*<around*|(|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>|)>*<around*|(|<math-up|zC><rsup|2>-2*L<rsub|1>*<math-up|zC>+\<rho\><rsup|2>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>-L<rsub|3><rsup|2>*c<rsub|3><rsup|2>-2*L<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      eq2:zC^2-2*L[1]*+rho^2-L[3]^2*s[3]^2-L[3]^2*c[3]^2-2*L[2]*L[3]*c[3]-L[2]^2+L[1]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><math-up|zC><rsup|2>-2*L<rsub|1>*\<rho\><rsup|2>-L<rsub|3><rsup|2>*s<rsub|3><rsup|2>-L<rsub|3><rsup|2>*c<rsub|3><rsup|2>-2*L<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>
    </unfolded-io>

    Da questa espressione è possibile definire il
    <math|cos<around*|(|q<rsub|3>|)>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      eliminate([eq2,eqTrig3],[s[3]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><around*|(|<math-up|zC><rsup|2>-2*L<rsub|1>*\<rho\><rsup|2>-2*L<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      eq2:zC^2-2*L[1]*rho^2-2*L[2]*L[3]*c[3]-L[3]^2-L[2]^2+L[1]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >><math-up|zC><rsup|2>-2*L<rsub|1>*\<rho\><rsup|2>-2*L<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      C3:solve([eq2],c[3])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >>c<rsub|3>=<frac|<math-up|zC><rsup|2>-2*L<rsub|1>*\<rho\><rsup|2>-L<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*L<rsub|2>*L<rsub|3>>>>
    </unfolded-io>

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
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      S3:solve([eqTrig3],s[3])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><around*|[|s<rsub|3>=-<sqrt|1-c<rsub|3><rsup|2>>,s<rsub|3>=<sqrt|1-c<rsub|3><rsup|2>>|]>>>
    </unfolded-io>

    \;

    Quindi la variabile trigonometrica <math|q<rsub|3>> ha 2 soluzioni
    GENERICHE che diventano una (SINGOLARITA') se la quantità a cui è
    uguagliato <math|cos<around*|(|q<rsub|3>|)>=\<pm\>1>.

    \;

    Ora calcolo la variabile trigonometrica <math|q<rsub|2>> tenendo conto
    dell'equazioni eq1 e Z:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      solve([eq1,Z],[c[2],s[2]])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >><around*|[|c<rsub|2>=<frac|L<rsub|3>*s<rsub|3>*<around*|(|<math-up|zC>-L<rsub|1>|)>+<around*|(|L<rsub|3>*c<rsub|3>+L<rsub|2>|)>*\<rho\>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>,s<rsub|2>=-<frac|L<rsub|3>*c<rsub|3>*<around*|(|L<rsub|1>-<math-up|zC>|)>+L<rsub|2>*<around*|(|L<rsub|1>-<math-up|zC>|)>+L<rsub|3>*s<rsub|3>*\<rho\>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|unfolded-io>
      C2:((L[3]*s[3]*(zC-L[1])+(L[3]*c[3]+L[2])*rho)/(L[3]^2*s[3]^2+L[3]^2*c[3]^2+2*L[2]*L[3]*c[3]+L[2]^2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o33>)
      >><frac|L<rsub|3>*s<rsub|3>*<around*|(|<math-up|zC>-L<rsub|1>|)>+<around*|(|L<rsub|3>*c<rsub|3>+L<rsub|2>|)>*\<rho\>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|unfolded-io>
      S2:-((L[3]*c[3]*(L[1]-zC)+L[2]*(L[1]-zC)+L[3]*s[3]*rho)/(L[3]^2*s[3]^2+L[3]^2*c[3]^2+2*L[2]*L[3]*c[3]+L[2]^2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o34>)
      >>-<frac|L<rsub|3>*c<rsub|3>*<around*|(|L<rsub|1>-<math-up|zC>|)>+L<rsub|2>*<around*|(|L<rsub|1>-<math-up|zC>|)>+L<rsub|3>*s<rsub|3>*\<rho\>|L<rsub|3><rsup|2>*s<rsub|3><rsup|2>+L<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*L<rsub|2>*L<rsub|3>*c<rsub|3>+L<rsub|2><rsup|2>>>>
    </unfolded-io>

    \;

    Da qui poi è possibile calcolare la variabile trigonometrica
    <math|q<rsub|2>> per mezzo della funzione \Patan2\Q.

    \;

    \;

    Posso ora calcolare la variabile trigonometrica
    <with|color|blue|q<rsub|1>>:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
      X
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >><math-up|xC>=c<rsub|1>*L<rsub|3>*c<rsub|23>+s<rsub|1>*L<rsub|4>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      X:subst([c[23]=c[2]*c[3]-s[2]*s[3],L[4]=0],X)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><math-up|xC>=c<rsub|1>*L<rsub|3>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|unfolded-io>
      Y
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o39>)
      >><math-up|yC>=s<rsub|1>*L<rsub|3>*c<rsub|23>-c<rsub|1>*L<rsub|4>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>40) >
    <|unfolded-io>
      Y:subst([c[23]=c[2]*c[3]-s[2]*s[3],L[4]=0],Y)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o40>)
      >><math-up|yC>=s<rsub|1>*L<rsub|3>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>41) >
    <|unfolded-io>
      solve([X,Y],[c[1],s[1]])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o41>)
      >><around*|[|c<rsub|1>=-<frac|<math-up|xC>|s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>>,s<rsub|1>=-<frac|<math-up|yC>|s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>42) >
    <|unfolded-io>
      C1:-((xC)/(s[2]*L[3]*s[3]-c[2]*L[3]*c[3]-L[2]*c[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o42>)
      >>-<frac|<math-up|xC>|s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>43) >
    <|unfolded-io>
      S1:-((yC)/(s[2]*L[3]*s[3]-c[2]*L[3]*c[3]-L[2]*c[2]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o43>)
      >>-<frac|<math-up|yC>|s<rsub|2>*L<rsub|3>*s<rsub|3>-c<rsub|2>*L<rsub|3>*c<rsub|3>-L<rsub|2>*c<rsub|2>>>>
    </unfolded-io>

    \;

    Da qui poi è possibile calcolare la variabile trigonometrica
    <math|q<rsub|1>> per mezzo della funzione \Patan2\Q
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
      <with|color|red|(<with|math-font-family|rm|%i>44) >
    <|unfolded-io>
      R:matrix([c[4]*c[5]*c[6]-s[4]*s[6],-c[4]*c[5]*s[6]-s[4]*c[6],c[4]*s[5]],[c[4]*s[6]+s[4]*c[5]*c[6],c[4]*c[6]-s[4]*c[5]*s[6],s[4]*s[5]],[-s[5]*c[6],s[5]*s[6],c[5]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o44>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>>|<cell|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>>|<cell|c<rsub|4>*s<rsub|5>>>|<row|<cell|c<rsub|4>*s<rsub|6>+s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|4>*c<rsub|6>-s<rsub|4>*c<rsub|5>*s<rsub|6>>|<cell|s<rsub|4>*s<rsub|5>>>|<row|<cell|-s<rsub|5>*c<rsub|6>>|<cell|s<rsub|5>*s<rsub|6>>|<cell|c<rsub|5>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>45) >
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
      <with|color|red|(<with|math-font-family|rm|%i>48) >
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
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>