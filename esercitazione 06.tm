<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <with|color|red|ESERCITAZIONE 1: Procedura che prende in ingresso una
  coppia di valori composta da un angolo e una lunghezza (\<theta\>,d), e
  calcola la matrice di avvitamento AV(z,\<theta\>,d).>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      avvitamento_z(theta,d):=block(

      [AVz],

      AVz:matrix([cos(theta),-sin(theta),0,0],[sin(theta),cos(theta),0,0],[0,0,1,d],[0,0,0,1]),

      AVz:trigsimp(AVz)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|avvitamento_z><around*|(|\<vartheta\>,d|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|AVz>|]>,<math-up|AVz>:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|0>>|<row|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|d>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|AVz>:<math-up|trigsimp><around*|(|<math-up|AVz>|)>|)>>>
    </unfolded-io>

    \;

    \;

    <with|color|red|ESERCITAZIONE 2: Procedura che prende in ingresso una
    coppia di valori composta da un angolo e una lunghezza (\<alpha\>,a) e
    calcola la matrice di avvitamento AV(x,\<alpha\>,a).>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      avvitamento_x(alpha,a):=block(

      [AVx],

      AVx:matrix([1,0,0,a],[0,cos(alpha),-sin(alpha),0],[0,sin(alpha),cos(alpha),0],[0,0,0,1]),

      AVx:trigsimp(AVx)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|avvitamento_x><around*|(|\<alpha\>,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|AVx>|]>,<math-up|AVx>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|a>>|<row|<cell|0>|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>|<cell|0>>|<row|<cell|0>|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|AVx>:<math-up|trigsimp><around*|(|<math-up|AVx>|)>|)>>>
    </unfolded-io>

    \;

    <with|color|red|ESERCITAZIONE 3: Procedura che prende una riga della
    tabella di DH e calcola per quella riga la matrice di cinematica diretta
    i-esima Q[i-1,i] come prodotto delle singole matrici di avvitamento.>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      calcolo_Qi(theta,alpha,d,a):=block(

      [AVz,AVx,Q],

      AVz:avvitamento_z(theta,d),

      AVx:avvitamento_x(alpha,a),

      Q:trigsimp(AVz.AVx)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|calcolo_Qi><around*|(|\<vartheta\>,\<alpha\>,d,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|AVz>,<math-up|AVx>,Q|]>,<math-up|AVz>:<with|math-font-family|rm|avvitamento_z><around*|(|\<vartheta\>,d|)>,<math-up|AVx>:<with|math-font-family|rm|avvitamento_x><around*|(|\<alpha\>,a|)>,Q:<math-up|trigsimp><around*|(|<math-up|AVz>\<cdot\><math-up|AVx>|)>|)>>>
    </unfolded-io>

    \;

    <with|color|red|ESERCITAZIONE 4: Procedura che calcola la matrice di
    cinematica diretta Q relativa al robot RR per cui è stata calcolata la
    tabella di D-H. (Inserire gli angoli \<theta\> e \<alpha\> esprimendoli
    in radianti).>

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      calcolo_Q_RR(theta,alpha,d,a):=block(

      [Q,Q_tot],

      for i:1 thru 2 do

      (

      Q[i]:calcolo_Qi(theta[i],alpha[i],d[i],a[i])

      ),

      Q_tot:trigreduce(Q[1].Q[2]),

      \;

      let(cos(q[1]),c[1]),

      let(sin(q[1]),s[1]),

      let(cos(q[2]+q[1]),c[12]),

      let(sin(q[2]+q[1]),s[12]),

      Q_tot:letsimp(Q_tot)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      calcolo_Q_RR([q[1],q[2]],[0,0],[0,0],[L[1],L[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|12>>|<cell|-s<rsub|12>>|<cell|0>|<cell|L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|12>>|<cell|c<rsub|12>>|<cell|0>|<cell|L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    <with|color|red|ESERCITAZIONE 5: Procedura che calcola la matrice di
    cinematica diretta Q relativa al robot PPP per cui è stata calcolata la
    tabella di D-H. (Inserire gli angoli \<theta\> e \<alpha\> esprimendoli
    in radianti).>

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      calcolo_Q_PPP(theta,alpha,d,a):=block(

      [Q,Q_tot],

      for i:1 thru 3 do

      (

      Q[i]:calcolo_Qi(theta[i],alpha[i],d[i],a[i])

      ),

      Q_tot:trigreduce(Q[1].Q[2].Q[3])

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      calcolo_Q_PPP([0,-%pi/2,0],[-%pi/2,-%pi/2,0],[q[1],q[2],q[3]],[0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    <\with|color|red>
      ESERCITAZIONE 6: Procedura che calcola la matrice di cinematica diretta
      Q relativa al robot RPP per cui è stata calcolata la tabella di D-H.

      (Inserire gli angoli \<theta\> e \<alpha\> esprimendoli in radianti).
    </with>

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      calcolo_Q_RPP(theta,alpha,d,a):=block(

      [Q,Q_tot],

      for i:1 thru 3 do

      (

      Q[i]:calcolo_Qi(theta[i],alpha[i],d[i],a[i])

      ),

      Q_tot:trigreduce(Q[1].Q[2].Q[3]),

      \;

      let(cos(q[1]),c[1]),

      let(sin(q[1]),s[1]),

      Q_tot:letsimp(Q_tot)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      calcolo_Q_RPP([q[1],0,0],[0,-%pi/2,0],[L[1],q[2],q[3]],[0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|0>|<cell|-s<rsub|1>>|<cell|-s<rsub|1>*q<rsub|3>>>|<row|<cell|s<rsub|1>>|<cell|0>|<cell|c<rsub|1>>|<cell|c<rsub|1>*q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>
  </session>

  \;
</body>

<\initial>
  <\collection>
    <associate|magnification|1>
    <associate|page-medium|paper>
    <associate|par-columns|1>
  </collection>
</initial>