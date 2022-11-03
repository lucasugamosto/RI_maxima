<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA CHE PRENDE IN INGRESSO UNA MATRICE, VERIFICA SE E' DI ROTAZIONE
  ED IN CASO AFFERMATIVO CALCOLA IL VERSORE INTORNO AL QUALE VIENE EFFETTUATA
  LA ROTAZIONE.

  <\session|maxima|default>
    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      controllo_rotazione(mat):=block(

      [det,II,matT,R],

      if scalarp(mat) = true or listp(mat) = true then return(0),

      \;

      det:trigsimp(trigreduce(factor(determinant(mat)))),

      if det # 1 then return(0),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      matT:transpose(mat),

      R:trigsimp(factor(mat.matT)),

      if R # II then return(0) else return(1)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|controllo_rotazione><around*|(|<math-up|mat>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|det>,<math-up|II>,<math-up|matT>,R|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|<math-up|mat>|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|<math-up|mat>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|trigreduce><around*|(|<math-up|factor><around*|(|<math-up|determinant><around*|(|<math-up|mat>|)>|)>|)>|)>,<math-bf|if><space|0.27em><math-up|det>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|matT>:<math-up|transpose><around*|(|<math-up|mat>|)>,R:<math-up|trigsimp><around*|(|<math-up|factor><around*|(|<math-up|mat>\<cdot\><math-up|matT>|)>|)>,<math-bf|if><space|0.27em>R\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)><space|0.27em><math-bf|else><space|0.27em><math-up|return><around*|(|1|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      calcolo_autovettore(mat):=block(

      [II,RmII,adj],

      if scalarp(mat) = true or listp(mat) = true then return(0),

      \;

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      RmII:R-II,

      adj:adjoint(RmII),

      aut0:matrix([0],[0],[0]),

      aut1:matrix([0],[0],[0]),

      for i:1 thru 3 do (

      \ aut1:matrix([adj[1,i]],[adj[2,i]],[adj[3,i]]),

      \ if aut1 # aut0 then return(aut1)

      ),

      return(aut1)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|calcolo_autovettore><around*|(|<math-up|mat>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|II>,<math-up|RmII>,<math-up|adj>|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|<math-up|mat>|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|<math-up|mat>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|RmII>:R-<math-up|II>,<math-up|adj>:<math-up|adjoint><around*|(|<math-up|RmII>|)>,<with|math-font-family|rm|aut0>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>>>>,<with|math-font-family|rm|aut1>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<with|math-font-family|rm|aut1>:<matrix|<tformat|<table|<row|<cell|<math-up|adj><rsub|1,i>>>|<row|<cell|<math-up|adj><rsub|2,i>>>|<row|<cell|<math-up|adj><rsub|3,i>>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|aut1>\<neq\><with|math-font-family|rm|aut0><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<with|math-font-family|rm|aut1>|)>|)>,<math-up|return><around*|(|<with|math-font-family|rm|aut1>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      calcolo_versore(vet):=block(

      [norma2,e],

      if scalarp(vet) = true or listp(vet) = true then return(0),

      \;

      norma2:sqrt((vet[1,1]^2)+(vet[2,1]^2)+(vet[3,1]^2)),

      if norma2 = 0 then return(0),

      if norma2 # 1 then e:(1/norma2)*vet else e:vet,

      return(trigsimp(factor(e)))

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|calcolo_versore><around*|(|<math-up|vet>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|norma2>,e|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|<math-up|vet>|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|<math-up|vet>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<with|math-font-family|rm|norma2>:<sqrt|<math-up|vet><rsub|1,1><rsup|2>+<math-up|vet><rsub|2,1><rsup|2>+<math-up|vet><rsub|3,1><rsup|2>>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>e:<frac|1|<with|math-font-family|rm|norma2>>*<math-up|vet><space|0.27em><math-bf|else><space|0.27em>e:<math-up|vet>,<math-up|return><around*|(|<math-up|trigsimp><around*|(|<math-up|factor><around*|(|e|)>|)>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      calcolo_asseRotazione(R):=block(

      [res,vet,asse],

      res:controllo_rotazione(R),

      if res = 0 then return(0),

      \;

      vet:calcolo_autovettore(R),

      if vet = 0 then return(0),

      \;

      asse:calcolo_versore(vet),

      if asse = 0 then return(0),

      return(asse)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><with|math-font-family|rm|calcolo_asseRotazione><around*|(|R|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|res>,<math-up|vet>,<math-up|asse>|]>,<math-up|res>:<with|math-font-family|rm|controllo_rotazione><around*|(|R|)>,<math-bf|if><space|0.27em><math-up|res>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|vet>:<with|math-font-family|rm|calcolo_autovettore><around*|(|R|)>,<math-bf|if><space|0.27em><math-up|vet>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|asse>:<with|math-font-family|rm|calcolo_versore><around*|(|<math-up|vet>|)>,<math-bf|if><space|0.27em><math-up|asse>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|return><around*|(|<math-up|asse>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      R:matrix([cos(alpha),0,sin(alpha)],[0,1,0],[-sin(alpha),0,cos(alpha)])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|0>|<cell|sin
      <around*|(|\<alpha\>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
      <around*|(|\<alpha\>|)>>|<cell|0>|<cell|cos
      <around*|(|\<alpha\>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      e:calcolo_asseRotazione(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|1>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      R:matrix([1,0,0],[0,1/sqrt(2),-1/sqrt(2)],[0,1/sqrt(2),1/sqrt(2)])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|-<frac|1|<sqrt|2>>>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|<frac|1|<sqrt|2>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      e:calcolo_asseRotazione(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      R:matrix([1/5,2/5,2/sqrt(5)],[2/5,4/5,-1/sqrt(5)],[-2/sqrt(5),1/sqrt(5),0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|<frac|1|5>>|<cell|<frac|2|5>>|<cell|<frac|2|<sqrt|5>>>>|<row|<cell|<frac|2|5>>|<cell|<frac|4|5>>|<cell|-<frac|1|<sqrt|5>>>>|<row|<cell|-<frac|2|<sqrt|5>>>|<cell|<frac|1|<sqrt|5>>>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      e:calcolo_asseRotazione(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|5>>>>|<row|<cell|<frac|2|<sqrt|5>>>>|<row|<cell|0>>>>>>>
    </unfolded-io>
  </session>

  \;

  Per calcolare un asse di rotazione per la matrice di Rotazione R ho
  utilizzato la proprietà per cui se essa è una matrice di rotazione, allora
  1 sarà sicuramente un suo autovalore e di conseguenza ho calcolato un
  autovettore associato che mi ha permesso poi di trovare il versore.
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>