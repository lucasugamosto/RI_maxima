<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA CHE IMPLEMENTA LA PARAMETRIZZAZIONE DI CAYLEY PER IL CALCOLO
  DELLA MATRICE DI ROTAZIONE E PER IL CALCOLO DELLA MATRICE ANTISIMMETRICA.

  <with|color|red|Procedura 1: Procedura che prende un vettore generico (o
  versore) in input e genera la matrice di rotazione R tramite la
  parametrizzazione di Cayley, se possibile (quindi controllare se la matrice
  I-S(a) � o meno invertibile, cio� ha determinante diverso da zero).>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      calcolo_R(vet):=block(

      [norma2,e,S,II,IImS,det,IImSinv,IIpS,R],

      norma2:sqrt((vet[1,1]^2)+(vet[2,1]^2)+(vet[3,1]^2)),

      if norma2 = 0 then return(0),

      if norma2 # 1 then e:(1/norma2)*vet else e:vet,

      S:matrix([0,-e[3,1],e[2,1]],[e[3,1],0,-e[1,1]],[-e[2,1],e[1,1],0]),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      IImS:II-S,

      det:trigsimp(determinant(IImS)),

      if det = 0 then return(0),

      IImSinv:trigsimp(invert(IImS)),

      IIpS:II+S,

      R:trigsimp(factor(IIpS.IImS)),

      return(R)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|calcolo_R><around*|(|<math-up|vet>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|norma2>,e,S,<math-up|II>,<math-up|IImS>,<math-up|det>,<math-up|IImSinv>,<math-up|IIpS>,R|]>,<with|math-font-family|rm|norma2>:<sqrt|<math-up|vet><rsub|1,1><rsup|2>+<math-up|vet><rsub|2,1><rsup|2>+<math-up|vet><rsub|3,1><rsup|2>>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>e:<frac|1|<with|math-font-family|rm|norma2>>*<math-up|vet><space|0.27em><math-bf|else><space|0.27em>e:<math-up|vet>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-e<rsub|3,1>>|<cell|e<rsub|2,1>>>|<row|<cell|e<rsub|3,1>>|<cell|0>|<cell|-e<rsub|1,1>>>|<row|<cell|-e<rsub|2,1>>|<cell|e<rsub|1,1>>|<cell|0>>>>>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|IImS>:<math-up|II>-S,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|determinant><around*|(|<math-up|IImS>|)>|)>,<math-bf|if><space|0.27em><math-up|det>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|IImSinv>:<math-up|trigsimp><around*|(|<math-up|invert><around*|(|<math-up|IImS>|)>|)>,<math-up|IIpS>:<math-up|II>+S,R:<math-up|trigsimp><around*|(|<math-up|factor><around*|(|<math-up|IIpS>\<cdot\><math-up|IImS>|)>|)>,<math-up|return><around*|(|R|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      calcolo_R(matrix([1],[1],[0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|<frac|3|2>>|<cell|-<frac|1|2>>|<cell|0>>|<row|<cell|-<frac|1|2>>|<cell|<frac|3|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|2>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      calcolo_R(matrix([1],[0],[0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|2>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|2>>>>>>>
    </unfolded-io>
  </session>

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  \;

  <with|color|red|Procedura 2: Procedura che prende in ingresso una matrice
  di rotazione R e genera una matrice anti-simmetrica S. da cui trovare il
  versore che funge da asse di rotazione.>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      calcolo_S(R):=block(

      [RT,R_tot,II,det,RpII,RmII,RpIIinv,S],

      RT:transpose(R),

      R_tot:trigsimp(R.RT),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if R_tot # II then return(0),

      det:trigsimp(determinant(R)),

      if det # 1 then return(0),

      \;

      RpII:trigsimp(R+II),

      det:trigsimp(determinant(RpII)),

      if det = 0 then return(0),

      RmII:trigsimp(R-II),

      RpIIinv:trigsimp(invert(RpII)),

      S:trigsimp(RmII.RpIIinv),

      return(S)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><with|math-font-family|rm|calcolo_S><around*|(|R|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|RT>,<with|math-font-family|rm|R_tot>,<math-up|II>,<math-up|det>,<math-up|RpII>,<math-up|RmII>,<math-up|RpIIinv>,S|]>,<math-up|RT>:<math-up|transpose><around*|(|R|)>,<with|math-font-family|rm|R_tot>:<math-up|trigsimp><around*|(|R\<cdot\><math-up|RT>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|R_tot>\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|determinant><around*|(|R|)>|)>,<math-bf|if><space|0.27em><math-up|det>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|RpII>:<math-up|trigsimp><around*|(|R+<math-up|II>|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|determinant><around*|(|<math-up|RpII>|)>|)>,<math-bf|if><space|0.27em><math-up|det>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|RmII>:<math-up|trigsimp><around*|(|R-<math-up|II>|)>,<math-up|RpIIinv>:<math-up|trigsimp><around*|(|<math-up|invert><around*|(|<math-up|RpII>|)>|)>,S:<math-up|trigsimp><around*|(|<math-up|RmII>\<cdot\><math-up|RpIIinv>|)>,<math-up|return><around*|(|S|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      calcolo_S(matrix([cos(theta),-sin(theta),0],[sin(theta),cos(theta),0],[0,0,1]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|sin
      <around*|(|\<vartheta\>|)>|cos <around*|(|\<vartheta\>|)>+1>>|<cell|0>>|<row|<cell|<frac|sin
      <around*|(|\<vartheta\>|)>|cos <around*|(|\<vartheta\>|)>+1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>
  </session>

  \;

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|font-base-size|10>
    <associate|page-medium|paper>
  </collection>
</initial>