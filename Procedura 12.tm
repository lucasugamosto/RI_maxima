<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA IN CUI SONO RAPPRESENTATI I CALCOLI FATTI A LEZIONE PER QUANTO
  RIGUARDA LA CINEMATICA DIRETTA DEI ROBOT NEL PIANO.

  <\session|maxima|default>
    Funzione che calcola la matrice della cinematica diretta Q completa a
    partire dal prodotto delle matrici della cinematica dovute solo alla
    rotazione e solo alla traslazione:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      matriceQ(q,d):=block(

      [Qq,Qd,Q],

      /*calcolare la matrice della cinematica diretta di pura traslazione*/

      Qq:matrix([cos(q),-sin(q),0],[sin(q),cos(q),0],[0,0,1]),

      \;

      /*calcolare la matrice della cinematica diretta di pura rotazione*/

      Qd:matrix([1,0,d[1]],[0,1,d[2]],[0,0,1]),

      \;

      Q:trigsimp(trigreduce(factor(Qq.Qd))),

      return(Q)

      )$
    </input>

    \;

    <\textput>
      \;

      Funzione che riceve in ingresso due parametri:

      1) il vettore colonna ANGOLI tiene traccia del valore dell'angolo tra
      il giunto i e i+1;

      2) la matrice LUNGHEZZE tiene traccia della distanza lungo x ed y tra
      due giunti (la riga i-esima della matrice rappresenta la distanza tra
      il giunto i e i+1, rispettivamente lungo x e lungo y)
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      matriceQCompleta(angoli,lunghezze):=block(

      [numRows,mat,Q],

      /*controllare il tipo di dato dei parametri in ingresso*/

      if scalarp(angoli) = true or listp(angoli) = true then return(-1),

      if scalarp(lunghezze) = true or listp(lunghezze) = true then
      return(-1),

      \;

      numRows:length(angoli),

      for i:1 thru numRows do (

      \ mat[i]:matriceQ(angoli[i,1],lunghezze[i]),

      \ if i = 1 then Q:mat[i] else Q:trigsimp(trigreduce(Q.mat[i]))

      ),

      Q:subst(cos(q[1])=c[1],Q),

      Q:subst(sin(q[1])=s[1],Q),

      Q:subst(cos(q[2])=c[2],Q),

      Q:subst(sin(q[2])=s[2],Q),

      Q:subst(cos(q[3])=c[3],Q),

      Q:subst(sin(q[3])=s[3],Q),

      Q:subst(cos(q[1]+q[2])=c[12],Q),

      Q:subst(sin(q[1]+q[2])=s[12],Q),

      Q:subst(cos(q[1]+q[3])=c[13],Q),

      Q:subst(sin(q[1]+q[3])=s[13],Q),

      Q:subst(cos(q[2]+q[3])=c[23],Q),

      Q:subst(sin(q[2]+q[3])=s[23],Q),

      Q:subst(cos(q[1]+q[2]+q[3])=c[123],Q),

      Q:subst(sin(q[1]+q[2]+q[3])=s[123],Q),

      \;

      return(Q)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      robotP:matriceQCompleta(matrix([0]),matrix([q[1],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      robotR:matriceQCompleta(matrix([q[1]]),matrix([L[1],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|-s<rsub|1>>|<cell|L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|1>>|<cell|c<rsub|1>>|<cell|L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      robotPP:matriceQCompleta(matrix([0],[%pi]),matrix([q[1],0],[0,q[2]]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|-1>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|-1>|<cell|-q<rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      robotPR:matriceQCompleta(matrix([0],[q[2]]),matrix([q[1],0],[L[2],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|2>>|<cell|-s<rsub|2>>|<cell|L<rsub|2>*c<rsub|2>+q<rsub|1>>>|<row|<cell|s<rsub|2>>|<cell|c<rsub|2>>|<cell|L<rsub|2>*s<rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      robotRP:matriceQCompleta(matrix([q[1]],[0]),matrix([L[1],0],[0,q[2]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|-s<rsub|1>>|<cell|L<rsub|1>*c<rsub|1>-s<rsub|1>*q<rsub|2>>>|<row|<cell|s<rsub|1>>|<cell|c<rsub|1>>|<cell|c<rsub|1>*q<rsub|2>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      robotRR:matriceQCompleta(matrix([q[1]],[q[2]]),matrix([L[1],0],[L[2],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|12>>|<cell|-s<rsub|12>>|<cell|L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|12>>|<cell|c<rsub|12>>|<cell|L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      robotPPP:matriceQCompleta(matrix([0],[0],[0]),matrix([q[1],0],[0,q[2]],[q[3],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|q<rsub|3>+q<rsub|1>>>|<row|<cell|0>|<cell|1>|<cell|q<rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      robotPPR:matriceQCompleta(matrix([0],[0],[q[3]]),matrix([q[1],0],[0,q[2]],[L[3],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|3>>|<cell|-s<rsub|3>>|<cell|L<rsub|3>*c<rsub|3>+q<rsub|1>>>|<row|<cell|s<rsub|3>>|<cell|c<rsub|3>>|<cell|L<rsub|3>*s<rsub|3>+q<rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      robotPRP:matriceQCompleta(matrix([0],[q[2]],[-(%pi/2)]),matrix([q[1],0],[L[2],0],[q[3],0]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><matrix|<tformat|<table|<row|<cell|s<rsub|2>>|<cell|c<rsub|2>>|<cell|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>+q<rsub|1>>>|<row|<cell|-c<rsub|2>>|<cell|s<rsub|2>>|<cell|L<rsub|2>*s<rsub|2>-c<rsub|2>*q<rsub|3>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      robotRPP:matriceQCompleta(matrix([q[1]],[0],[0]),matrix([L[1],0],[0,q[2]],[q[3],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|-s<rsub|1>>|<cell|c<rsub|1>*<around*|(|q<rsub|3>+L<rsub|1>|)>-s<rsub|1>*q<rsub|2>>>|<row|<cell|s<rsub|1>>|<cell|c<rsub|1>>|<cell|s<rsub|1>*<around*|(|q<rsub|3>+L<rsub|1>|)>+c<rsub|1>*q<rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      robotPRR:matriceQCompleta(matrix([0],[q[2]],[q[3]]),matrix([q[1],0],[L[2],0],[L[3],0]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|23>>|<cell|-s<rsub|23>>|<cell|L<rsub|3>*c<rsub|23>+L<rsub|2>*c<rsub|2>+q<rsub|1>>>|<row|<cell|s<rsub|23>>|<cell|c<rsub|23>>|<cell|L<rsub|3>*s<rsub|23>+L<rsub|2>*s<rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      robotRPR:matriceQCompleta(matrix([q[1]],[0],[q[3]]),matrix([L[1],0],[0,q[2]],[L[3],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|13>>|<cell|-s<rsub|13>>|<cell|L<rsub|3>*c<rsub|13>-s<rsub|1>*q<rsub|2>+L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|13>>|<cell|c<rsub|13>>|<cell|L<rsub|3>*s<rsub|13>+c<rsub|1>*q<rsub|2>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      robotRRP:matriceQCompleta(matrix([q[1]],[q[2]],[-(%pi/2)]),matrix([L[1],0],[L[2],0],[q[3],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><matrix|<tformat|<table|<row|<cell|s<rsub|12>>|<cell|c<rsub|12>>|<cell|q<rsub|3>*s<rsub|12>+L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>>>|<row|<cell|-c<rsub|12>>|<cell|s<rsub|12>>|<cell|L<rsub|2>*s<rsub|12>-q<rsub|3>*c<rsub|12>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      robotRRR:matriceQCompleta(matrix([q[1]],[q[2]],[q[3]]),matrix([L[1],0],[L[2],0],[L[3],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|123>>|<cell|-s<rsub|123>>|<cell|L<rsub|3>*c<rsub|123>+L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|123>>|<cell|c<rsub|123>>|<cell|L<rsub|3>*s<rsub|123>+L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>