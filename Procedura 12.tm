<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA IN CUI SONO RAPPRESENTATI I CALCOLI FATTI A LEZIONE PER QUANTO
  RIGUARDA LA CINEMATICA DIRETTA DEI ROBOT NEL PIANO.

  <\session|maxima|default>
    Funzione che calcola la matrice della cinematica diretta Q associata o
    alla rotazione o alla traslazione:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      matrice_Q(q,d):=block(

      [Q],

      if q = 0 then Q:matrix([1,0,d[1]],[0,1,d[2]],[0,0,1]),

      if q # 0 then Q:matrix([cos(q),-sin(q),d[1]*cos(q)-d[2]*sin(q)],[sin(q),cos(q),d[1]*sin(q)+d[2]*cos(q)],[0,0,1]),

      return(Q)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|matrice_Q><around*|(|q,d|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|Q|]>,<math-bf|if><space|0.27em>q=0<space|0.27em><math-bf|then><space|0.27em>Q:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|d<rsub|1>>>|<row|<cell|0>|<cell|1>|<cell|d<rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em>q\<neq\>0<space|0.27em><math-bf|then><space|0.27em>Q:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q|)>>|<cell|-sin <around*|(|q|)>>|<cell|d<rsub|1>*cos
      <around*|(|q|)>-d<rsub|2>*sin <around*|(|q|)>>>|<row|<cell|sin
      <around*|(|q|)>>|<cell|cos <around*|(|q|)>>|<cell|d<rsub|1>*sin
      <around*|(|q|)>+d<rsub|2>*cos <around*|(|q|)>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|return><around*|(|Q|)>|)>>>
    </unfolded-io>

    \;

    <\textput>
      \;

      Funzione che riceve in input due parametri:

      1) il vettore colonna ANGOLI contenente il valore dell'angolo tra il
      giunto i e i+1;

      2) la matric LUNGHEZZE contenente la distanza lungo x ed y tra due
      giunti (la riga i-esima della matrice rappresenta la distanza tra il
      giunto i e i+1)
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      matrice_Q_completa(angoli,lunghezze):=block(

      [numRows,mat,Q],

      numRows:length(angoli),

      for i:1 thru numRows do (

      \ mat[i]:matrice_Q(angoli[i],lunghezze[i]),

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

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|matrice_Q_completa><around*|(|<math-up|angoli>,<math-up|lunghezze>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|numRows>,<math-up|mat>,Q|]>,<math-up|numRows>:<math-up|length><around*|(|<math-up|angoli>|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|numRows><space|0.27em><math-bf|do><space|0.27em><around*|(|<math-up|mat><rsub|i>:<with|math-font-family|rm|matrice_Q><around*|(|<math-up|angoli><rsub|i>,<math-up|lunghezze><rsub|i>|)>,<math-bf|if><space|0.27em>i=1<space|0.27em><math-bf|then><space|0.27em>Q:<math-up|mat><rsub|i><space|0.27em><math-bf|else><space|0.27em>Q:<math-up|trigsimp><around*|(|<math-up|trigreduce><around*|(|Q\<cdot\><math-up|mat><rsub|i>|)>|)>|)>,Q:<math-up|subst><around*|(|cos
      <around*|(|q<rsub|1>|)>=c<rsub|1>,Q|)>,Q:<math-up|subst><around*|(|sin
      <around*|(|q<rsub|1>|)>=s<rsub|1>,Q|)>,Q:<math-up|subst><around*|(|cos
      <around*|(|q<rsub|2>|)>=c<rsub|2>,Q|)>,Q:<math-up|subst><around*|(|sin
      <around*|(|q<rsub|2>|)>=s<rsub|2>,Q|)>,Q:<math-up|subst><around*|(|cos
      <around*|(|q<rsub|3>|)>=c<rsub|3>,Q|)>,Q:<math-up|subst><around*|(|sin
      <around*|(|q<rsub|3>|)>=s<rsub|3>,Q|)>,Q:<math-up|subst><around*|(|cos
      <around*|(|q<rsub|1>+q<rsub|2>|)>=c<rsub|12>,Q|)>,Q:<math-up|subst><around*|(|sin
      <around*|(|q<rsub|1>+q<rsub|2>|)>=s<rsub|12>,Q|)>,Q:<math-up|subst><around*|(|cos
      <around*|(|q<rsub|1>+q<rsub|3>|)>=c<rsub|13>,Q|)>,Q:<math-up|subst><around*|(|sin
      <around*|(|q<rsub|1>+q<rsub|3>|)>=s<rsub|13>,Q|)>,Q:<math-up|subst><around*|(|cos
      <around*|(|q<rsub|2>+q<rsub|3>|)>=c<rsub|23>,Q|)>,Q:<math-up|subst><around*|(|sin
      <around*|(|q<rsub|2>+q<rsub|3>|)>=s<rsub|23>,Q|)>,Q:<math-up|subst><around*|(|cos
      <around*|(|q<rsub|1>+q<rsub|2>+q<rsub|3>|)>=c<rsub|123>,Q|)>,Q:<math-up|subst><around*|(|sin
      <around*|(|q<rsub|1>+q<rsub|2>+q<rsub|3>|)>=s<rsub|123>,Q|)>,<math-up|return><around*|(|Q|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      robotP:matrice_Q_completa(matrix([0]),matrix([q[1],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|1|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|q<rsub|1>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>|<cell|<around*|[|0|]>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      robotR:matrice_Q_completa(matrix([q[1]]),matrix([L[1],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|c<rsub|1>|]>>|<cell|<around*|[|-s<rsub|1>|]>>|<cell|<around*|[|L<rsub|1>*c<rsub|1>|]>>>|<row|<cell|<around*|[|s<rsub|1>|]>>|<cell|<around*|[|c<rsub|1>|]>>|<cell|<around*|[|L<rsub|1>*s<rsub|1>|]>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      robotPP:matrice_Q_completa(matrix([0],[%pi]),matrix([q[1],0],[0,q[2]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|-1|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|q<rsub|1>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|-1|]>>|<cell|<around*|[|-q<rsub|2>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      robotPR:matrice_Q_completa(matrix([0],[q[2]]),matrix([q[1],0],[L[2],0]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|c<rsub|2>|]>>|<cell|<around*|[|-s<rsub|2>|]>>|<cell|<around*|[|L<rsub|2>*c<rsub|2>+q<rsub|1>|]>>>|<row|<cell|<around*|[|s<rsub|2>|]>>|<cell|<around*|[|c<rsub|2>|]>>|<cell|<around*|[|L<rsub|2>*s<rsub|2>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      robotRP:matrice_Q_completa(matrix([q[1]],[0]),matrix([L[1],0],[0,q[2]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|c<rsub|1>|]>>|<cell|<around*|[|-s<rsub|1>|]>>|<cell|<around*|[|L<rsub|1>*c<rsub|1>-s<rsub|1>*q<rsub|2>|]>>>|<row|<cell|<around*|[|s<rsub|1>|]>>|<cell|<around*|[|c<rsub|1>|]>>|<cell|<around*|[|c<rsub|1>*q<rsub|2>+L<rsub|1>*s<rsub|1>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      robotRR:matrice_Q_completa(matrix([q[1]],[q[2]]),matrix([L[1],0],[L[2],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|c<rsub|12>|]>>|<cell|<around*|[|-s<rsub|12>|]>>|<cell|<around*|[|L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>|]>>>|<row|<cell|<around*|[|s<rsub|12>|]>>|<cell|<around*|[|c<rsub|12>|]>>|<cell|<around*|[|L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      robotPPP:matrice_Q_completa(matrix([0],[0],[0]),matrix([q[1],0],[0,q[2]],[q[3],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|1|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|q<rsub|3>+q<rsub|1>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>|<cell|<around*|[|q<rsub|2>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      robotPPR:matrice_Q_completa(matrix([0],[0],[q[3]]),matrix([q[1],0],[0,q[2]],[L[3],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|c<rsub|3>|]>>|<cell|<around*|[|-s<rsub|3>|]>>|<cell|<around*|[|L<rsub|3>*c<rsub|3>+q<rsub|1>|]>>>|<row|<cell|<around*|[|s<rsub|3>|]>>|<cell|<around*|[|c<rsub|3>|]>>|<cell|<around*|[|L<rsub|3>*s<rsub|3>+q<rsub|2>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      robotPRP:matrice_Q_completa(matrix([0],[q[2]],[-(%pi/2)]),matrix([q[1],0],[L[2],0],[q[3],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|s<rsub|2>|]>>|<cell|<around*|[|c<rsub|2>|]>>|<cell|<around*|[|s<rsub|2>*q<rsub|3>+L<rsub|2>*c<rsub|2>+q<rsub|1>|]>>>|<row|<cell|<around*|[|-c<rsub|2>|]>>|<cell|<around*|[|s<rsub|2>|]>>|<cell|<around*|[|L<rsub|2>*s<rsub|2>-c<rsub|2>*q<rsub|3>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      robotRPP:matrice_Q_completa(matrix([q[1]],[0],[0]),matrix([L[1],0],[0,q[2]],[q[3],0]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|c<rsub|1>|]>>|<cell|<around*|[|-s<rsub|1>|]>>|<cell|<around*|[|c<rsub|1>*<around*|(|q<rsub|3>+L<rsub|1>|)>-s<rsub|1>*q<rsub|2>|]>>>|<row|<cell|<around*|[|s<rsub|1>|]>>|<cell|<around*|[|c<rsub|1>|]>>|<cell|<around*|[|s<rsub|1>*<around*|(|q<rsub|3>+L<rsub|1>|)>+c<rsub|1>*q<rsub|2>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      robotPRR:matrice_Q_completa(matrix([0],[q[2]],[q[3]]),matrix([q[1],0],[L[2],0],[L[3],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|c<rsub|23>|]>>|<cell|<around*|[|-s<rsub|23>|]>>|<cell|<around*|[|L<rsub|3>*c<rsub|23>+L<rsub|2>*c<rsub|2>+q<rsub|1>|]>>>|<row|<cell|<around*|[|s<rsub|23>|]>>|<cell|<around*|[|c<rsub|23>|]>>|<cell|<around*|[|L<rsub|3>*s<rsub|23>+L<rsub|2>*s<rsub|2>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      robotRPR:matrice_Q_completa(matrix([q[1]],[0],[q[3]]),matrix([L[1],0],[0,q[2]],[L[3],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|c<rsub|13>|]>>|<cell|<around*|[|-s<rsub|13>|]>>|<cell|<around*|[|L<rsub|3>*c<rsub|13>-s<rsub|1>*q<rsub|2>+L<rsub|1>*c<rsub|1>|]>>>|<row|<cell|<around*|[|s<rsub|13>|]>>|<cell|<around*|[|c<rsub|13>|]>>|<cell|<around*|[|L<rsub|3>*s<rsub|13>+c<rsub|1>*q<rsub|2>+L<rsub|1>*s<rsub|1>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      robotRRP:matrice_Q_completa(matrix([q[1]],[q[2]],[-(%pi/2)]),matrix([L[1],0],[L[2],0],[q[3],0]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|s<rsub|12>|]>>|<cell|<around*|[|c<rsub|12>|]>>|<cell|<around*|[|q<rsub|3>*s<rsub|12>+L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>|]>>>|<row|<cell|<around*|[|-c<rsub|12>|]>>|<cell|<around*|[|s<rsub|12>|]>>|<cell|<around*|[|L<rsub|2>*s<rsub|12>-q<rsub|3>*c<rsub|12>+L<rsub|1>*s<rsub|1>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      robotRRR:matrice_Q_completa(matrix([q[1]],[q[2]],[q[3]]),matrix([L[1],0],[L[2],0],[L[3],0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><matrix|<tformat|<table|<row|<cell|<around*|[|c<rsub|123>|]>>|<cell|<around*|[|-s<rsub|123>|]>>|<cell|<around*|[|L<rsub|3>*c<rsub|123>+L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>|]>>>|<row|<cell|<around*|[|s<rsub|123>|]>>|<cell|<around*|[|c<rsub|123>|]>>|<cell|<around*|[|L<rsub|3>*s<rsub|123>+L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>|]>>>|<row|<cell|<around*|[|0|]>>|<cell|<around*|[|0|]>>|<cell|<around*|[|1|]>>>>>>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>