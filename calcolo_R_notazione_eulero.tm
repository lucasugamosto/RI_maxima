<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA CHE IMPLEMENTA IL CALCOLO DELLA MATRICE DI ROTAZIONE UTILIZZANDO
  LA NOTAZIONE DI EULERO, QUINDI DATO UN ASSE ED UN ANGOLO, QUESTA CALCOLA LA
  MATRICE DI ROTAZIONE USANDO GLI ALTRI DUE ASSI E L'ANGOLO CORRISPONDENTE.

  <\session|maxima|default>
    <\textput>
      <with|color|red|Funzione che preso in input un asse, controlla se sia
      uno dei tre assi notevoli lungo x, lungo y o lungo z. In caso
      favorevole restituisce gli altri due assi da usare nella notazione di
      Eulero, altrimenti restituisce valore nullo ad indicare l'errore.>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      calcolo_assi(asse):=block(

      [asseX,asseY,asseZ,asse1,asse2],

      asseX:matrix([1],[0],[0]),

      asseY:matrix([0],[1],[0]),

      asseZ:matrix([0],[0],[1]),

      if asse = asseX then asse1:asseY,

      if asse = asseY then asse1:asseX,

      if asse = asseZ then asse1:asseX,

      if asse = asseX and asse1 = asseY then asse2:asseZ,

      if asse = asseY and asse1 = asseX then asse2:asseZ,

      if asse = asseZ and asse1 = asseX then asse2:asseY,

      if asse # asseX and asse # asseY and asse # asseZ then return([0,0])
      else return([asse1,asse2])

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|calcolo_assi><around*|(|<math-up|asse>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|asseX>,<math-up|asseY>,<math-up|asseZ>,<with|math-font-family|rm|asse1>,<with|math-font-family|rm|asse2>|]>,<math-up|asseX>:<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,<math-up|asseY>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|1>>|<row|<cell|0>>>>>,<math-up|asseZ>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|1>>>>>,<math-bf|if><space|0.27em><math-up|asse>=<math-up|asseX><space|0.27em><math-bf|then><space|0.27em><with|math-font-family|rm|asse1>:<math-up|asseY>,<math-bf|if><space|0.27em><math-up|asse>=<math-up|asseY><space|0.27em><math-bf|then><space|0.27em><with|math-font-family|rm|asse1>:<math-up|asseX>,<math-bf|if><space|0.27em><math-up|asse>=<math-up|asseZ><space|0.27em><math-bf|then><space|0.27em><with|math-font-family|rm|asse1>:<math-up|asseX>,<math-bf|if><space|0.27em><math-up|asse>=<math-up|asseX>\<wedge\><with|math-font-family|rm|asse1>=<math-up|asseY><space|0.27em><math-bf|then><space|0.27em><with|math-font-family|rm|asse2>:<math-up|asseZ>,<math-bf|if><space|0.27em><math-up|asse>=<math-up|asseY>\<wedge\><with|math-font-family|rm|asse1>=<math-up|asseX><space|0.27em><math-bf|then><space|0.27em><with|math-font-family|rm|asse2>:<math-up|asseZ>,<math-bf|if><space|0.27em><math-up|asse>=<math-up|asseZ>\<wedge\><with|math-font-family|rm|asse1>=<math-up|asseX><space|0.27em><math-bf|then><space|0.27em><with|math-font-family|rm|asse2>:<math-up|asseY>,<math-bf|if><space|0.27em><math-up|asse>\<neq\><math-up|asseX>\<wedge\><math-up|asse>\<neq\><math-up|asseY>\<wedge\><math-up|asse>\<neq\><math-up|asseZ><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<around*|[|0,0|]>|)><space|0.27em><math-bf|else><space|0.27em><math-up|return><around*|(|<around*|[|<with|math-font-family|rm|asse1>,<with|math-font-family|rm|asse2>|]>|)>|)>>>
    </unfolded-io>

    <\textput>
      \;

      <with|color|red|Funzione che calcola la matrice di rotazione generica
      intorno agli assi x, y, z di un angolo generico.>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      calcolo_R(asse,angolo):=block(

      [eX,eY,eZ,R],

      if scalarp(asse) = true or listp(asse) = true then return(0),

      if listp(angolo) = true or matrixp(angolo) = true then return(0),

      \;

      eX:matrix([1],[0],[0]),

      eY:matrix([0],[1],[0]),

      eZ:matrix([0],[0],[1]),

      if asse = eX then R:matrix([1,0,0],[0,cos(angolo),-sin(angolo)],[0,sin(angolo),cos(angolo)]),

      if asse = eY then R:matrix([cos(angolo),0,sin(angolo)],[0,1,0],[-sin(angolo),0,cos(angolo)]),

      if asse = eZ then R:matrix([cos(angolo),-sin(angolo),0],[sin(angolo),cos(angolo),0],[0,0,1]),

      return(R)

      )

      \;
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|calcolo_R><around*|(|<math-up|asse>,<math-up|angolo>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|eX>,<math-up|eY>,<math-up|eZ>,R|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|<math-up|asse>|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|<math-up|asse>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em><math-up|listp><around*|(|<math-up|angolo>|)>=<math-bf|true>\<vee\><math-up|matrixp><around*|(|<math-up|angolo>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|eX>:<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,<math-up|eY>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|1>>|<row|<cell|0>>>>>,<math-up|eZ>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|1>>>>>,<math-bf|if><space|0.27em><math-up|asse>=<math-up|eX><space|0.27em><math-bf|then><space|0.27em>R:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|<math-up|angolo>|)>>|<cell|-sin
      <around*|(|<math-up|angolo>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|<math-up|angolo>|)>>|<cell|cos
      <around*|(|<math-up|angolo>|)>>>>>>,<math-bf|if><space|0.27em><math-up|asse>=<math-up|eY><space|0.27em><math-bf|then><space|0.27em>R:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<math-up|angolo>|)>>|<cell|0>|<cell|sin
      <around*|(|<math-up|angolo>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
      <around*|(|<math-up|angolo>|)>>|<cell|0>|<cell|cos
      <around*|(|<math-up|angolo>|)>>>>>>,<math-bf|if><space|0.27em><math-up|asse>=<math-up|eZ><space|0.27em><math-bf|then><space|0.27em>R:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<math-up|angolo>|)>>|<cell|-sin
      <around*|(|<math-up|angolo>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|<math-up|angolo>|)>>|<cell|cos
      <around*|(|<math-up|angolo>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|return><around*|(|R|)>|)>>>
    </unfolded-io>

    \;

    <with|color|red|<\textput>
      Funzione che riceve in input un asse ed un angolo e calcola, usando la
      notazione di Eulero, la matrice di rotazione associata, nei 4 modi
      diversi.

      In tutto ci sono 12 modi diversi di calcolare la matrice di rotazione
      intorno agli assi notevoli (4 per asse).
    </textput>>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      R_notazioneEulero(asse,angolo):=block(

      [asse1,asse2,theta,R,vet,R_final],

      if scalarp(asse) = true or listp(asse) = true then return(0),

      if listp(angolo) = true or matrixp(angolo) = true then return(0),

      \;

      [asse1,asse2]:calcolo_assi(asse),

      if asse1 = 0 and asse2 = 0 then return(0),

      theta:%pi*(angolo/180),

      \;

      R[1]:calcolo_R(asse1,%pi/2),

      \;

      /*Tramite i due successivi comandi si controlla se il secondo asse di
      Eulero è concorde o discorde con l'asse principale, a seconda di questo
      si crea la matrice di rotazione intorno al secondo asse con il giusto
      segno dell'angolo*/

      vet:R[1].asse2,

      if vet = asse then R[2]:calcolo_R(asse2,theta) else
      R[2]:calcolo_R(asse2,-theta),

      \;

      R[3]:calcolo_R(asse1,-%pi/2),

      R_final[1]:trigsimp(R[1].R[2].R[3]),

      \;

      R[1]:calcolo_R(asse1,-%pi/2),

      \;

      /*Identico controllo di prima in cui si calcola il verso del secondo
      asse rispetto all'asse principale inserito in input*/

      vet:R[1].asse2,

      if vet = asse then R[2]:calcolo_R(asse2,theta) else
      R[2]:calcolo_R(asse2,-theta),

      \;

      R[3]:calcolo_R(asse1,%pi/2),

      R_final[2]:trigsimp(R[1].R[2].R[3]),

      \;

      R[1]:calcolo_R(asse2,%pi/2),

      \;

      vet:R[1].asse1,

      if vet = asse then R[2]:calcolo_R(asse1,theta) else
      R[2]:calcolo_R(asse1,-theta),

      \;

      R[3]:calcolo_R(asse2,-%pi/2),

      R_final[3]:trigsimp(R[1].R[2].R[3]),

      \;

      R[1]:calcolo_R(asse2,-%pi/2),

      \;

      vet:R[1].asse1,

      if vet = asse then R[2]:calcolo_R(asse1,theta) else
      R[2]:calcolo_R(asse1,-theta),

      \;

      R[3]:calcolo_R(asse2,%pi/2),

      R_final[4]:trigsimp(R[1].R[2].R[3]),

      \;

      [R_final[1],R_final[2],R_final[3],R_final[4]]

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|R_notazioneEulero><around*|(|<math-up|asse>,<math-up|angolo>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|asse1>,<with|math-font-family|rm|asse2>,\<vartheta\>,R,<math-up|vet>,<with|math-font-family|rm|R_final>|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|<math-up|asse>|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|<math-up|asse>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em><math-up|listp><around*|(|<math-up|angolo>|)>=<math-bf|true>\<vee\><math-up|matrixp><around*|(|<math-up|angolo>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<around*|[|<with|math-font-family|rm|asse1>,<with|math-font-family|rm|asse2>|]>:<with|math-font-family|rm|calcolo_assi><around*|(|<math-up|asse>|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|asse1>=0\<wedge\><with|math-font-family|rm|asse2>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,\<vartheta\>:\<pi\>*<around*|(|<frac|<math-up|angolo>|180>|)>,R<rsub|1>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse1>,<frac|\<pi\>|2>|)>,<math-up|vet>:R<rsub|1>\<cdot\><with|math-font-family|rm|asse2>,<math-bf|if><space|0.27em><math-up|vet>=<math-up|asse><space|0.27em><math-bf|then><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse2>,\<vartheta\>|)><space|0.27em><math-bf|else><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse2>,-\<vartheta\>|)>,R<rsub|3>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse1>,<frac|-\<pi\>|2>|)>,<with|math-font-family|rm|R_final><rsub|1>:<math-up|trigsimp><around*|(|R<rsub|1>\<cdot\>R<rsub|2>\<cdot\>R<rsub|3>|)>,R<rsub|1>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse1>,<frac|-\<pi\>|2>|)>,<math-up|vet>:R<rsub|1>\<cdot\><with|math-font-family|rm|asse2>,<math-bf|if><space|0.27em><math-up|vet>=<math-up|asse><space|0.27em><math-bf|then><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse2>,\<vartheta\>|)><space|0.27em><math-bf|else><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse2>,-\<vartheta\>|)>,R<rsub|3>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse1>,<frac|\<pi\>|2>|)>,<with|math-font-family|rm|R_final><rsub|2>:<math-up|trigsimp><around*|(|R<rsub|1>\<cdot\>R<rsub|2>\<cdot\>R<rsub|3>|)>,R<rsub|1>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse2>,<frac|\<pi\>|2>|)>,<math-up|vet>:R<rsub|1>\<cdot\><with|math-font-family|rm|asse1>,<math-bf|if><space|0.27em><math-up|vet>=<math-up|asse><space|0.27em><math-bf|then><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse1>,\<vartheta\>|)><space|0.27em><math-bf|else><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse1>,-\<vartheta\>|)>,R<rsub|3>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse2>,<frac|-\<pi\>|2>|)>,<with|math-font-family|rm|R_final><rsub|3>:<math-up|trigsimp><around*|(|R<rsub|1>\<cdot\>R<rsub|2>\<cdot\>R<rsub|3>|)>,R<rsub|1>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse2>,<frac|-\<pi\>|2>|)>,<math-up|vet>:R<rsub|1>\<cdot\><with|math-font-family|rm|asse1>,<math-bf|if><space|0.27em><math-up|vet>=<math-up|asse><space|0.27em><math-bf|then><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse1>,\<vartheta\>|)><space|0.27em><math-bf|else><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse1>,-\<vartheta\>|)>,R<rsub|3>:<with|math-font-family|rm|calcolo_R><around*|(|<with|math-font-family|rm|asse2>,<frac|\<pi\>|2>|)>,<with|math-font-family|rm|R_final><rsub|4>:<math-up|trigsimp><around*|(|R<rsub|1>\<cdot\>R<rsub|2>\<cdot\>R<rsub|3>|)>,<around*|[|<with|math-font-family|rm|R_final><rsub|1>,<with|math-font-family|rm|R_final><rsub|2>,<with|math-font-family|rm|R_final><rsub|3>,<with|math-font-family|rm|R_final><rsub|4>|]>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      R_notazioneEulero(matrix([1],[0],[0]),alpha)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>|<cell|-sin
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>|<cell|cos
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>|<cell|-sin
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>|<cell|cos
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>|<cell|-sin
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>|<cell|cos
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>|<cell|-sin
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>|<cell|cos
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      R_notazioneEulero(matrix([0],[1],[0]),beta)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>|<cell|0>|<cell|sin
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>|<cell|0>|<cell|cos
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>|<cell|0>|<cell|sin
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>|<cell|0>|<cell|cos
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>|<cell|0>|<cell|sin
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>|<cell|0>|<cell|cos
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>|<cell|0>|<cell|sin
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>|<cell|0>|<cell|cos
      <around*|(|<frac|\<pi\>*\<beta\>|180>|)>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      R_notazioneEulero(matrix([0],[0],[1]),gamma)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|-sin
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|cos
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|-sin
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|cos
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|-sin
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|cos
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|-sin
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|cos
      <around*|(|<frac|\<pi\>*\<gamma\>|180>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      R_notazioneEulero(matrix([0],[0],[0]),alpha)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >>0>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      R_notazioneEulero(matrix([1],[0],[0]),45)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|-<frac|1|<sqrt|2>>>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|<frac|1|<sqrt|2>>>>>>>,<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|-<frac|1|<sqrt|2>>>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|<frac|1|<sqrt|2>>>>>>>,<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|-<frac|1|<sqrt|2>>>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|<frac|1|<sqrt|2>>>>>>>,<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|-<frac|1|<sqrt|2>>>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|<frac|1|<sqrt|2>>>>>>>|]>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>