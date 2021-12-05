<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <with|color|red|ESERCITAZIONE: Procedura che prende in ingresso una coppia
  di valori (asse,angolo) e verifica che l'asse appartenga alla terna x,y,z,
  poi verifica che l'angolo sia uno scalare e deve restituire la matrice di
  rotazione corrispondente, o un messaggio di errore.>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      matrice_rotazione(asse,angolo):=block(

      [x,y,z,theta,mat_x,mat_y,mat_z],

      x:matrix([1],[0],[0]),

      y:matrix([0],[1],[0]),

      z:matrix([0],[0],[1]),

      \;

      if asse # x and asse # y and asse # z then return(0),

      if angolo \<less\> 0 or angolo \<gtr\> 360 then return(0),

      theta:%pi.(angolo/180),

      \;

      mat_x:matrix([1,0,0],[0,cos(theta),-sin(theta)],[0,sin(theta),cos(theta)]),

      mat_y:matrix([cos(theta),0,sin(theta)],[0,1,0],[-sin(theta),0,cos(theta)]),

      mat_z:matrix([cos(theta),-sin(theta),0],[sin(theta),cos(theta),0],[0,0,1]),

      \;

      if asse = x then return(mat_x),

      if asse = y then return(mat_y),

      if asse = z then return(mat_z)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|matrice_rotazione><around*|(|<math-up|asse>,<math-up|angolo>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|x,y,z,\<vartheta\>,<with|math-font-family|rm|mat_x>,<with|math-font-family|rm|mat_y>,<with|math-font-family|rm|mat_z>|]>,x:<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,y:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|1>>|<row|<cell|0>>>>>,z:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|1>>>>>,<math-bf|if><space|0.27em><math-up|asse>\<neq\>x\<wedge\><math-up|asse>\<neq\>y\<wedge\><math-up|asse>\<neq\>z<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em><math-up|angolo>\<less\>0\<vee\><math-up|angolo>\<gtr\>360<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,\<vartheta\>:\<pi\>\<cdot\><around*|(|<frac|<math-up|angolo>|180>|)>,<with|math-font-family|rm|mat_x>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>>>>>,<with|math-font-family|rm|mat_y>:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|sin
      <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
      <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|cos
      <around*|(|\<vartheta\>|)>>>>>>,<with|math-font-family|rm|mat_z>:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><math-up|asse>=x<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<with|math-font-family|rm|mat_x>|)>,<math-bf|if><space|0.27em><math-up|asse>=y<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<with|math-font-family|rm|mat_y>|)>,<math-bf|if><space|0.27em><math-up|asse>=z<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<with|math-font-family|rm|mat_z>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      matrice_rotazione(matrix([1],[0],[0]),45)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|-<frac|1|<sqrt|2>>>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|<frac|1|<sqrt|2>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      matrice_rotazione(matrix([0],[1],[0]),45)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|2>>>|<cell|0>|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-<frac|1|<sqrt|2>>>|<cell|0>|<cell|<frac|1|<sqrt|2>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      matrice_rotazione(matrix([0],[0],[1]),45)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|2>>>|<cell|-<frac|1|<sqrt|2>>>|<cell|0>>|<row|<cell|<frac|1|<sqrt|2>>>|<cell|<frac|1|<sqrt|2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      matrice_rotazione(matrix([1],[0],[1]),45)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>0>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>