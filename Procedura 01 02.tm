<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA PER IL CALCOLO DELLA MATRICI DI ROTAZIONI
  <math|R<rsub|x><around*|(|\<theta\>|)>,R<rsub|y><around*|(|\<theta\>|)>,R<rsub|z><around*|(|\<theta\>|)>>

  <\with|color|black>
    La procedura prende in ingresso una coppia di valori (asse,angolo),
    quest'ultimo espresso in radianti, e verifica che l'asse appartenga alla
    terna x, y, z; verifica che l'angolo sia uno scalare e restituire la
    matrice di rotazione corrispondente, o un messaggio di errore.
  </with>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      matrice_rotazione(asse,angolo):=block(

      [x,y,z,mat_x,mat_y,mat_z],

      x:matrix([1],[0],[0]),

      y:matrix([0],[1],[0]),

      z:matrix([0],[0],[1]),

      \;

      if asse # x and asse # y and asse # z then return(0),

      if listp(angolo) = true or matrixp(angolo) = true then return(0),

      \;

      mat_x:matrix([1,0,0],[0,cos(angolo),-sin(angolo)],[0,sin(angolo),cos(angolo)]),

      mat_y:matrix([cos(angolo),0,sin(angolo)],[0,1,0],[-sin(angolo),0,cos(angolo)]),

      mat_z:matrix([cos(angolo),-sin(angolo),0],[sin(angolo),cos(angolo),0],[0,0,1]),

      \;

      if asse = x then return(mat_x),

      if asse = y then return(mat_y),

      if asse = z then return(mat_z)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      matrice_rotazione(matrix([1],[0],[0]),alpha)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      matrice_rotazione(matrix([0],[1],[0]),beta)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<beta\>|)>>|<cell|0>|<cell|sin
      <around*|(|\<beta\>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
      <around*|(|\<beta\>|)>>|<cell|0>|<cell|cos
      <around*|(|\<beta\>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      matrice_rotazione(matrix([0],[0],[1]),gamma)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<gamma\>|)>>|<cell|-sin
      <around*|(|\<gamma\>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<gamma\>|)>>|<cell|cos <around*|(|\<gamma\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      matrice_rotazione(matrix([1],[0],[1]),alpha)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>0>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      matrice_rotazione(matrix([1],[0],[0]),[alpha,beta])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>0>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>