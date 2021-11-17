<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  Procedure per il calcolo di matrici generiche utili nei vari passi del
  calcolo delle matrici di cinematica diretta finali.

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      avvitamento_z(theta,d):=block(

      [AVz],

      AVz:matrix([cos(theta),-sin(theta),0,0],[sin(theta),cos(theta),0,0],[0,0,1,d],[0,0,0,1]),

      AVz

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|avvitamento_z><around*|(|\<vartheta\>,d|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|AVz>|]>,<math-up|AVz>:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|0>>|<row|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|d>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|AVz>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      avvitamento_x(alpha,a):=block(

      [AVx],

      AVx:matrix([1,0,0,a],[0,cos(alpha),-sin(alpha),0],[0,sin(alpha),cos(alpha),0],[0,0,0,1]),

      AVx

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|avvitamento_x><around*|(|\<alpha\>,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|AVx>|]>,<math-up|AVx>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|a>>|<row|<cell|0>|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>|<cell|0>>|<row|<cell|0>|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|AVx>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      calcolo_Qi(theta,alpha,d,a):=block(

      [AVz,AVx,Q],

      AVz:avvitamento_z(theta,d),

      AVx:avvitamento_x(alpha,a),

      Q:AVz.AVx

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|calcolo_Qi><around*|(|\<vartheta\>,\<alpha\>,d,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|AVz>,<math-up|AVx>,Q|]>,<math-up|AVz>:<with|math-font-family|rm|avvitamento_z><around*|(|\<vartheta\>,d|)>,<math-up|AVx>:<with|math-font-family|rm|avvitamento_x><around*|(|\<alpha\>,a|)>,Q:<math-up|AVz>\<cdot\><math-up|AVx>|)>>>
    </unfolded-io>

    ESERCITAZIONE 1: Procedura che calcola la matrice della cinematica
    diretta completa associata al robot SCARA a partire dalla tabella di D-H
    con 6 gradi di libertà.

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      calcolo_Q_SCARA(theta,alpha,d,a):=block(

      [Q,Q1,Q2,Q3,Qfin],

      for i:1 thru 6 do

      (

      Q[i]:calcolo_Qi(theta[i],alpha[i],d[i],a[i])

      ),

      Q1:trigreduce(Q[1].Q[2].Q[3]),

      \;

      Q2:trigreduce(Q1.Q[4]),

      \;

      Q3:Q2.Q[5],

      \;

      Qfin:Q3.Q[6],

      \;

      let(cos(q[1]),c[1]),

      let(sin(q[1]),s[1]),

      let(cos(q[5]),c[5]),

      let(sin(q[5]),s[5]),

      let(cos(q[6]),c[6]),

      let(sin(q[6]),s[6]),

      let(sin(q[2]+q[1]),s[12]),

      let(cos(q[2]+q[1]),c[12]),

      let(sin(q[4]+q[2]+q[1]),s[124]),

      let(cos(q[4]+q[2]+q[1]),c[124]),

      \;

      Qfin:letsimp(Qfin)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><with|math-font-family|rm|calcolo_Q_SCARA><around*|(|\<vartheta\>,\<alpha\>,d,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|Q,<with|math-font-family|rm|Q1>,<with|math-font-family|rm|Q2>,<with|math-font-family|rm|Q3>,<math-up|Qfin>|]>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>6<space|0.27em><math-bf|do><space|0.27em>Q<rsub|i>:<with|math-font-family|rm|calcolo_Qi><around*|(|\<vartheta\><rsub|i>,\<alpha\><rsub|i>,d<rsub|i>,a<rsub|i>|)>,<with|math-font-family|rm|Q1>:<math-up|trigreduce><around*|(|Q<rsub|1>\<cdot\>Q<rsub|2>\<cdot\>Q<rsub|3>|)>,<with|math-font-family|rm|Q2>:<math-up|trigreduce><around*|(|<with|math-font-family|rm|Q1>\<cdot\>Q<rsub|4>|)>,<with|math-font-family|rm|Q3>:<with|math-font-family|rm|Q2>\<cdot\>Q<rsub|5>,<math-up|Qfin>:<with|math-font-family|rm|Q3>\<cdot\>Q<rsub|6>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|1>|)>,c<rsub|1>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|1>|)>,s<rsub|1>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|5>|)>,c<rsub|5>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|5>|)>,s<rsub|5>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|6>|)>,c<rsub|6>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|6>|)>,s<rsub|6>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>,s<rsub|12>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>,c<rsub|12>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|4>+q<rsub|2>+q<rsub|1>|)>,s<rsub|124>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|4>+q<rsub|2>+q<rsub|1>|)>,c<rsub|124>|)>,<math-up|Qfin>:<math-up|letsimp><around*|(|<math-up|Qfin>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      calcolo_Q_SCARA([q[1],q[2],0,q[4],q[5],q[6]],[0,0,0,-%pi/2,-%pi/2,0],[L[1],L[2],q[3],0,0,L[6]],[D[1],D[2],0,0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|s<rsub|6>*s<rsub|124>+c<rsub|5>*c<rsub|6>*c<rsub|124>>|<cell|c<rsub|6>*s<rsub|124>-c<rsub|5>*s<rsub|6>*c<rsub|124>>|<cell|-s<rsub|5>*c<rsub|124>>|<cell|-s<rsub|5>*L<rsub|6>*c<rsub|124>+D<rsub|2>*c<rsub|12>+D<rsub|1>*c<rsub|1>>>|<row|<cell|c<rsub|5>*c<rsub|6>*s<rsub|124>-s<rsub|6>*c<rsub|124>>|<cell|-c<rsub|5>*s<rsub|6>*s<rsub|124>-c<rsub|6>*c<rsub|124>>|<cell|-s<rsub|5>*s<rsub|124>>|<cell|-s<rsub|5>*L<rsub|6>*s<rsub|124>+D<rsub|2>*s<rsub|12>+D<rsub|1>*s<rsub|1>>>|<row|<cell|-s<rsub|5>*c<rsub|6>>|<cell|s<rsub|5>*s<rsub|6>>|<cell|-c<rsub|5>>|<cell|-c<rsub|5>*L<rsub|6>+q<rsub|3>+L<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    \;

    ESERCITAZIONE 2: Procedura che calcola la matrice della cinematica
    diretta completa associata al robot SFERICO (primo tipo) a partire dalla
    tabella di D-H con 6 gradi di libertà.

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      calcolo_Q_SFERICO1(theta,alpha,d,a):=block(

      [Q,Q1,Q2,Q3,Qfin],

      for i:1 thru 6 do

      (

      Q[i]:calcolo_Qi(theta[i],alpha[i],d[i],a[i])

      ),

      Q1:trigsimp(Q[1].Q[2]),

      \;

      Q2:trigsimp(Q1.Q[3].Q[4]),

      \;

      Q3:trigsimp(Q2.Q[5]),

      \;

      Qfin:trigsimp(Q3.Q[6]),

      \;

      let(cos(q[1]),c[1]),

      let(sin(q[1]),s[1]),

      let(cos(q[2]),c[2]),

      let(sin(q[2]),s[2]),

      let(cos(q[4]),c[4]),

      let(sin(q[4]),s[4]),

      let(cos(q[5]),c[5]),

      let(sin(q[5]),s[5]),

      let(cos(q[6]),c[6]),

      let(sin(q[6]),s[6]),

      Qfin:fullratsimp(letsimp(Qfin))

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><with|math-font-family|rm|calcolo_Q_SFERICO1><around*|(|\<vartheta\>,\<alpha\>,d,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|Q,<with|math-font-family|rm|Q1>,<with|math-font-family|rm|Q2>,<with|math-font-family|rm|Q3>,<math-up|Qfin>|]>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>6<space|0.27em><math-bf|do><space|0.27em>Q<rsub|i>:<with|math-font-family|rm|calcolo_Qi><around*|(|\<vartheta\><rsub|i>,\<alpha\><rsub|i>,d<rsub|i>,a<rsub|i>|)>,<with|math-font-family|rm|Q1>:<math-up|trigsimp><around*|(|Q<rsub|1>\<cdot\>Q<rsub|2>|)>,<with|math-font-family|rm|Q2>:<math-up|trigsimp><around*|(|<with|math-font-family|rm|Q1>\<cdot\>Q<rsub|3>\<cdot\>Q<rsub|4>|)>,<with|math-font-family|rm|Q3>:<math-up|trigsimp><around*|(|<with|math-font-family|rm|Q2>\<cdot\>Q<rsub|5>|)>,<math-up|Qfin>:<math-up|trigsimp><around*|(|<with|math-font-family|rm|Q3>\<cdot\>Q<rsub|6>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|1>|)>,c<rsub|1>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|1>|)>,s<rsub|1>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|2>|)>,c<rsub|2>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|2>|)>,s<rsub|2>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|4>|)>,c<rsub|4>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|4>|)>,s<rsub|4>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|5>|)>,c<rsub|5>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|5>|)>,s<rsub|5>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|6>|)>,c<rsub|6>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|6>|)>,s<rsub|6>|)>,<math-up|Qfin>:<math-up|fullratsimp><around*|(|<math-up|letsimp><around*|(|<math-up|Qfin>|)>|)>|)>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      calcolo_Q_SFERICO1([q[1],q[2],0,q[4],q[5],q[6]],[%pi/2,%pi/2,0,%pi/2,-%pi/2,0],[L[1],0,q[3],0,0,L[6]],[0,L[2],0,0,0,0])$
    </input>
  </session>

  <math|<matrix|<tformat|<table|<row|<cell|<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*s<rsub|6>+<around*|(|c<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|s<rsub|1>*s<rsub|4>+c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|5>|)>*s<rsub|6>+<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>+c<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*s<rsub|6>+<around*|(|s<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|s<rsub|1>*c<rsub|2>*c<rsub|4>-c<rsub|1>*s<rsub|4>|)>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|5>|)>*s<rsub|6>+<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>+s<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|s<rsub|2>*c<rsub|4>*c<rsub|5>-c<rsub|2>*s<rsub|5>|)>*c<rsub|6>-s<rsub|2>*s<rsub|4>*s<rsub|6>>|<cell|<around*|(|c<rsub|2>*s<rsub|5>-s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*s<rsub|6>-s<rsub|2>*s<rsub|4>*c<rsub|6>>|<cell|-s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>>|<cell|<around*|(|-s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>

  \;

  <\session|maxima|default>
    \;

    ESERCITAZIONE 3: Procedura che a partire dalla tabella di D-H composta da
    6 righe calcola la matrice di cinematica diretta completa del robot
    SFERICO di secotipo (STANFORD).

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      calcolo_Q_SFERICO2(theta,alpha,d,a):=block(

      [Q,Q1,Q2,Q3,Qfin],

      for i:1 thru 6 do

      (

      Q[i]:calcolo_Qi(theta[i],alpha[i],d[i],a[i])

      ),

      Q1:trigsimp(Q[1].Q[2]),

      \;

      Q2:trigsimp(Q1.Q[3].Q[4]),

      \;

      Q3:trigsimp(Q2.Q[5]),

      \;

      Qfin:trigsimp(Q3.Q[6]),

      \;

      let(cos(q[1]),c[1]),

      let(sin(q[1]),s[1]),

      let(cos(q[2]),c[2]),

      let(sin(q[2]),s[2]),

      let(cos(q[4]),c[4]),

      let(sin(q[4]),s[4]),

      let(cos(q[5]),c[5]),

      let(sin(q[5]),s[5]),

      let(cos(q[6]),c[6]),

      let(sin(q[6]),s[6]),

      \;

      Qfin:fullratsimp(letsimp(Qfin))

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><with|math-font-family|rm|calcolo_Q_SFERICO2><around*|(|\<vartheta\>,\<alpha\>,d,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|Q,<with|math-font-family|rm|Q1>,<with|math-font-family|rm|Q2>,<with|math-font-family|rm|Q3>,<math-up|Qfin>|]>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>6<space|0.27em><math-bf|do><space|0.27em>Q<rsub|i>:<with|math-font-family|rm|calcolo_Qi><around*|(|\<vartheta\><rsub|i>,\<alpha\><rsub|i>,d<rsub|i>,a<rsub|i>|)>,<with|math-font-family|rm|Q1>:<math-up|trigsimp><around*|(|Q<rsub|1>\<cdot\>Q<rsub|2>|)>,<with|math-font-family|rm|Q2>:<math-up|trigsimp><around*|(|<with|math-font-family|rm|Q1>\<cdot\>Q<rsub|3>\<cdot\>Q<rsub|4>|)>,<with|math-font-family|rm|Q3>:<math-up|trigsimp><around*|(|<with|math-font-family|rm|Q2>\<cdot\>Q<rsub|5>|)>,<math-up|Qfin>:<math-up|trigsimp><around*|(|<with|math-font-family|rm|Q3>\<cdot\>Q<rsub|6>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|1>|)>,c<rsub|1>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|1>|)>,s<rsub|1>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|2>|)>,c<rsub|2>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|2>|)>,s<rsub|2>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|4>|)>,c<rsub|4>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|4>|)>,s<rsub|4>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|5>|)>,c<rsub|5>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|5>|)>,s<rsub|5>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|6>|)>,c<rsub|6>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|6>|)>,s<rsub|6>|)>,<math-up|Qfin>:<math-up|fullratsimp><around*|(|<math-up|letsimp><around*|(|<math-up|Qfin>|)>|)>|)>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      calcolo_Q_SFERICO2([q[1],q[2],0,q[4],q[5],q[6]],[-%pi/2,-%pi/2,0,%pi/2,-%pi/2,0],[L[1],L[2],q[3],0,0,L[6]],[0,0,0,0,0,0])$
    </input>

    <\textput>
      \;
    </textput>
  </session>

  <math|<matrix|<tformat|<table|<row|<cell|<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*s<rsub|6>+<around*|(|<around*|(|s<rsub|1>*s<rsub|4>+c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*s<rsub|6>+<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-c<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-c<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*s<rsub|6>+<around*|(|<around*|(|s<rsub|1>*c<rsub|2>*c<rsub|4>-c<rsub|1>*s<rsub|4>|)>*c<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|s<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*s<rsub|6>+<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-s<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-s<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>-s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|2>*s<rsub|4>*s<rsub|6>+<around*|(|-c<rsub|2>*s<rsub|5>-s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|2>*s<rsub|5>+s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*s<rsub|6>+s<rsub|2>*s<rsub|4>*c<rsub|6>>|<cell|s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>>|<cell|<around*|(|s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>

  \;

  <\session|maxima|default>
    ESERCITAZIONE 4: Procedura che calcola la matrice di cinematica diretta
    completa associata al robot ANTROPOMORFO tenendo conto di tutti e 6 i
    gradi di libertà, il tutto a partire dai valori della tabella di D-H.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      calcolo_Q_ANTROPOMORFO(theta,alpha,d,a):=block(

      [Q,Q1,Q2,Q3,Q4,Qfin],

      for i:1 thru 6 do

      (

      Q[i]:calcolo_Qi(theta[i],alpha[i],d[i],a[i])

      ),

      Q1:trigreduce(Q[2].Q[3]),

      \;

      Q2:trigsimp(Q[1].Q1),

      \;

      Q3:trigsimp(Q2.Q[4]),

      \;

      Q4:fullratsimp(trigsimp(Q3.Q[5])),

      \;

      Qfin:fullratsimp(trigsimp(Q4.Q[6])),

      \;

      let(cos(q[1]),c[1]),

      let(sin(q[1]),s[1]),

      let(cos(q[2]),c[2]),

      let(sin(q[2]),s[2]),

      let(cos(q[4]),c[4]),

      let(sin(q[4]),s[4]),

      let(cos(q[5]),c[5]),

      let(sin(q[5]),s[5]),

      let(cos(q[6]),c[6]),

      let(sin(q[6]),s[6]),

      let(cos(q[3]+q[2]),c[23]),

      let(sin(q[3]+q[2]),s[23]),

      \;

      Qfin:fullratsimp(letsimp(Qfin))

      )

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><with|math-font-family|rm|calcolo_Q_ANTROPOMORFO><around*|(|\<vartheta\>,\<alpha\>,d,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|Q,<with|math-font-family|rm|Q1>,<with|math-font-family|rm|Q2>,<with|math-font-family|rm|Q3>,<with|math-font-family|rm|Q4>,<math-up|Qfin>|]>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>6<space|0.27em><math-bf|do><space|0.27em>Q<rsub|i>:<with|math-font-family|rm|calcolo_Qi><around*|(|\<vartheta\><rsub|i>,\<alpha\><rsub|i>,d<rsub|i>,a<rsub|i>|)>,<with|math-font-family|rm|Q1>:<math-up|trigreduce><around*|(|Q<rsub|2>\<cdot\>Q<rsub|3>|)>,<with|math-font-family|rm|Q2>:<math-up|trigsimp><around*|(|Q<rsub|1>\<cdot\><with|math-font-family|rm|Q1>|)>,<with|math-font-family|rm|Q3>:<math-up|trigsimp><around*|(|<with|math-font-family|rm|Q2>\<cdot\>Q<rsub|4>|)>,<with|math-font-family|rm|Q4>:<math-up|fullratsimp><around*|(|<math-up|trigsimp><around*|(|<with|math-font-family|rm|Q3>\<cdot\>Q<rsub|5>|)>|)>,<math-up|Qfin>:<math-up|fullratsimp><around*|(|<math-up|trigsimp><around*|(|<with|math-font-family|rm|Q4>\<cdot\>Q<rsub|6>|)>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|1>|)>,c<rsub|1>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|1>|)>,s<rsub|1>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|2>|)>,c<rsub|2>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|2>|)>,s<rsub|2>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|4>|)>,c<rsub|4>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|4>|)>,s<rsub|4>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|5>|)>,c<rsub|5>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|5>|)>,s<rsub|5>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|6>|)>,c<rsub|6>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|6>|)>,s<rsub|6>|)>,<math-up|let><around*|(|cos
      <around*|(|q<rsub|3>+q<rsub|2>|)>,c<rsub|23>|)>,<math-up|let><around*|(|sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>,s<rsub|23>|)>,<math-up|Qfin>:<math-up|fullratsimp><around*|(|<math-up|letsimp><around*|(|<math-up|Qfin>|)>|)>|)>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      calcolo_Q_ANTROPOMORFO([q[1],q[2],q[3],q[4],q[5],q[6]],[%pi/2,0,%pi/2,%pi/2,-%pi/2,0],[L[1],0,0,0,0,L[6]],[0,L[2],0,0,0,0])$
    </input>
  </session>

  <math|<matrix|<tformat|<table|<row|<cell|c<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|23>+<around*|(|c<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>-c<rsub|1>*s<rsub|4>*s<rsub|6>|)>*c<rsub|23>+s<rsub|1>*c<rsub|4>*s<rsub|6>+s<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-c<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|23>+<around*|(|-c<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|6>|)>*c<rsub|23>-s<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|5>*s<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|23>-s<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|c<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|23>-s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|23>+<around*|(|s<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|4>*s<rsub|6>|)>*c<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-s<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|23>+<around*|(|-s<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|6>|)>*c<rsub|23>+c<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|5>*s<rsub|23>-s<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|23>+c<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|s<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|23>-s<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|23>+c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>|)>*s<rsub|23>-s<rsub|5>*c<rsub|6>*c<rsub|23>>|<cell|<around*|(|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>|)>*s<rsub|23>+s<rsub|5>*s<rsub|6>*c<rsub|23>>|<cell|-c<rsub|4>*s<rsub|5>*s<rsub|23>-c<rsub|5>*c<rsub|23>>|<cell|-c<rsub|4>*s<rsub|5>*L<rsub|6>*s<rsub|23>-c<rsub|5>*L<rsub|6>*c<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>