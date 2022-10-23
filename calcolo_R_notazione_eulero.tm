<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA CHE IMPLEMENTA IL CALCOLO DELLA MATRICE DI ROTAZIONE UTILIZZANDO
  LA NOTAZIONE DI EULERO, QUINDI DATO UN ASSE ED UN ANGOLO, QUESTA CALCOLA LA
  MATRICE DI ROTAZIONE USANDO GLI ALTRI DUE ASSI E L'ANGOLO CORRISPONDENTE.

  <\session|maxima|default>
    <\textput>
      Funzione che preso in input un asse, controlla se sia uno dei tre assi
      notevoli lungo x, lungo y o lungo z. In caso favorevole restituisce gli
      altri due assi da usare nella notazione di Eulero, altrimenti
      restituisce valore nullo ad indicare l'errore.
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
      Funzione che calcola la matrice di rotazione generica intorno all'asse
      x, y o z di un certo angolo alpha.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      calcolo_matrici_di_rotazione(w,theta):=block(

      [eX,eY,eZ,R],

      eX:matrix([1],[0],[0]),

      eY:matrix([0],[1],[0]),

      eZ:matrix([0],[0],[1]),

      if w = eX then R:matrix([1,0,0],[0,cos(theta),-sin(theta)],[0,sin(theta),cos(theta)]),

      if w = eY then R:matrix([cos(theta),0,sin(theta)],[0,1,0],[-sin(theta),0,cos(theta)]),

      if w = eZ then R:matrix([cos(theta),-sin(theta),0],[sin(theta),cos(theta),0],[0,0,1]),

      return(R)

      )

      \;
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|w,\<vartheta\>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|eX>,<math-up|eY>,<math-up|eZ>,R|]>,<math-up|eX>:<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,<math-up|eY>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|1>>|<row|<cell|0>>>>>,<math-up|eZ>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|1>>>>>,<math-bf|if><space|0.27em>w=<math-up|eX><space|0.27em><math-bf|then><space|0.27em>R:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>>>>>,<math-bf|if><space|0.27em>w=<math-up|eY><space|0.27em><math-bf|then><space|0.27em>R:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|sin
      <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
      <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|cos
      <around*|(|\<vartheta\>|)>>>>>>,<math-bf|if><space|0.27em>w=<math-up|eZ><space|0.27em><math-bf|then><space|0.27em>R:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|return><around*|(|R|)>|)>>>
    </unfolded-io>

    <\textput>
      Funzione che riceve in input un asse ed un angolo, e calcola usando i
      rispettivi altri 2 assi la matrice di rotazione associata, nei 4 modi
      diversi. In tutto quindi ci sono 12 modi diverdi di calcolare la
      matrice di rotazione intorno agli assi notevoli (4 per asse).
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      R_notazioneEulero(asse,angolo):=block(

      [asse1,asse2,theta,R,vet,resR],

      [asse1,asse2]:calcolo_assi(asse),

      if asse1 = 0 and asse2 = 0 then return(0),

      theta:%pi*(angolo/180),

      \;

      R[1]:calcolo_matrici_di_rotazione(asse1,%pi/2),

      vet:R[1].asse2,

      if vet = asse then R[2]:calcolo_matrici_di_rotazione(asse2,theta) else
      R[2]:calcolo_matrici_di_rotazione(asse2,-theta),

      R[3]:calcolo_matrici_di_rotazione(asse1,-%pi/2),

      resR[1]:R[1].R[2].R[3],

      \;

      R[1]:calcolo_matrici_di_rotazione(asse1,-%pi/2),

      vet:R[1].asse2,

      if vet = asse then R[2]:calcolo_matrici_di_rotazione(asse2,theta) else
      R[2]:calcolo_matrici_di_rotazione(asse2,-theta),

      R[3]:calcolo_matrici_di_rotazione(asse1,%pi/2),

      resR[2]:R[1].R[2].R[3],

      \;

      R[1]:calcolo_matrici_di_rotazione(asse2,%pi/2),

      vet:R[1].asse1,

      if vet = asse then R[2]:calcolo_matrici_di_rotazione(asse1,theta) else
      R[2]:calcolo_matrici_di_rotazione(asse1,-theta),

      R[3]:calcolo_matrici_di_rotazione(asse2,-%pi/2),

      resR[3]:R[1].R[2].R[3],

      \;

      R[1]:calcolo_matrici_di_rotazione(asse2,-%pi/2),

      vet:R[1].asse1,

      if vet = asse then R[2]:calcolo_matrici_di_rotazione(asse1,theta) else
      R[2]:calcolo_matrici_di_rotazione(asse1,-theta),

      R[3]:calcolo_matrici_di_rotazione(asse2,%pi/2),

      resR[4]:R[1].R[2].R[3],

      \;

      [resR[1],resR[2],resR[3],resR[4]]

      )

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|R_notazioneEulero><around*|(|<math-up|asse>,<math-up|angolo>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|asse1>,<with|math-font-family|rm|asse2>,\<vartheta\>,R,<math-up|vet>,<math-up|resR>|]>,<around*|[|<with|math-font-family|rm|asse1>,<with|math-font-family|rm|asse2>|]>:<with|math-font-family|rm|calcolo_assi><around*|(|<math-up|asse>|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|asse1>=0\<wedge\><with|math-font-family|rm|asse2>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,\<vartheta\>:\<pi\>*<around*|(|<frac|<math-up|angolo>|180>|)>,R<rsub|1>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse1>,<frac|\<pi\>|2>|)>,<math-up|vet>:R<rsub|1>\<cdot\><with|math-font-family|rm|asse2>,<math-bf|if><space|0.27em><math-up|vet>=<math-up|asse><space|0.27em><math-bf|then><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse2>,\<vartheta\>|)><space|0.27em><math-bf|else><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse2>,-\<vartheta\>|)>,R<rsub|3>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse1>,<frac|-\<pi\>|2>|)>,<math-up|resR><rsub|1>:R<rsub|1>\<cdot\>R<rsub|2>\<cdot\>R<rsub|3>,R<rsub|1>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse1>,<frac|-\<pi\>|2>|)>,<math-up|vet>:R<rsub|1>\<cdot\><with|math-font-family|rm|asse2>,<math-bf|if><space|0.27em><math-up|vet>=<math-up|asse><space|0.27em><math-bf|then><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse2>,\<vartheta\>|)><space|0.27em><math-bf|else><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse2>,-\<vartheta\>|)>,R<rsub|3>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse1>,<frac|\<pi\>|2>|)>,<math-up|resR><rsub|2>:R<rsub|1>\<cdot\>R<rsub|2>\<cdot\>R<rsub|3>,R<rsub|1>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse2>,<frac|\<pi\>|2>|)>,<math-up|vet>:R<rsub|1>\<cdot\><with|math-font-family|rm|asse1>,<math-bf|if><space|0.27em><math-up|vet>=<math-up|asse><space|0.27em><math-bf|then><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse1>,\<vartheta\>|)><space|0.27em><math-bf|else><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse1>,-\<vartheta\>|)>,R<rsub|3>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse2>,<frac|-\<pi\>|2>|)>,<math-up|resR><rsub|3>:R<rsub|1>\<cdot\>R<rsub|2>\<cdot\>R<rsub|3>,R<rsub|1>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse2>,<frac|-\<pi\>|2>|)>,<math-up|vet>:R<rsub|1>\<cdot\><with|math-font-family|rm|asse1>,<math-bf|if><space|0.27em><math-up|vet>=<math-up|asse><space|0.27em><math-bf|then><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse1>,\<vartheta\>|)><space|0.27em><math-bf|else><space|0.27em>R<rsub|2>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse1>,-\<vartheta\>|)>,R<rsub|3>:<with|math-font-family|rm|calcolo_matrici_di_rotazione><around*|(|<with|math-font-family|rm|asse2>,<frac|\<pi\>|2>|)>,<math-up|resR><rsub|4>:R<rsub|1>\<cdot\>R<rsub|2>\<cdot\>R<rsub|3>,<around*|[|<math-up|resR><rsub|1>,<math-up|resR><rsub|2>,<math-up|resR><rsub|3>,<math-up|resR><rsub|4>|]>|)>>>
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

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      \;
    </input>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>