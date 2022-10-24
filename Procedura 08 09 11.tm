<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA PER IL CALCOLO DIRETTO, DA (ASSE,ANGOLO) A MATRICE DI ROTAZIONE)
  ED INVERSO (DA MATRICE DI ROTAZIONE AD (ASSE,ANGOLO), TRAMITE LA FORMULA DI
  RODRIGUEZ.

  <with|color|red|Procedura 1: Procedura che data una coppia di valori in
  input (asse,angolo), verifica se l'asse è un versore e non un vettore. Se
  l'asse è un versore allora viene usata la FORMULA DI RODRIGUEZ per il
  calcolo della matrice di rotazione R intorno all'asse v di un angolo theta,
  altrimenti torna viene calcolato prima il versore e poi la matrice R.>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      calcolo_versore(vettore):=block(

      [norma2,e],

      norma2:sqrt((vettore[1,1])^2+(vettore[2,1])^2+(vettore[3,1])^2),

      if norma2 = 0 then return(0),

      if norma2 # 1 then e:(1/norma2)*vettore else e:vettore,

      return(e)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|calcolo_versore><around*|(|<math-up|vettore>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|norma2>,e|]>,<with|math-font-family|rm|norma2>:<sqrt|<math-up|vettore><rsub|1,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|3,1><rsup|2>>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>e:<frac|1|<with|math-font-family|rm|norma2>>*<math-up|vettore><space|0.27em><math-bf|else><space|0.27em>e:<math-up|vettore>,<math-up|return><around*|(|e|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      mat_rotazione(asse,angolo):=block(

      [e,S,norma2,theta,S2,II,R],

      e:calcolo_versore(asse),

      S:matrix([0,-asse[3,1],asse[2,1]],[asse[3,1],0,-asse[1,1]],[-asse[2,1],asse[1,1],0]),

      theta:%pi*(angolo/180),

      norma2:sqrt((asse[1,1])^2+(asse[2,1])^2+(asse[3,1])^2),

      if norma2 # 1 then theta:norma2*theta,

      S2:S.S,

      S2:trigsimp(trigreduce(S2)),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      R:II+(sin(theta)*S)+((1-cos(theta))*S2),

      R:trigsimp(trigreduce(factor(R))),

      return(R)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|mat_rotazione><around*|(|<math-up|asse>,<math-up|angolo>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|e,S,<with|math-font-family|rm|norma2>,\<vartheta\>,<with|math-font-family|rm|S2>,<math-up|II>,R|]>,e:<with|math-font-family|rm|calcolo_versore><around*|(|<math-up|asse>|)>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-<math-up|asse><rsub|3,1>>|<cell|<math-up|asse><rsub|2,1>>>|<row|<cell|<math-up|asse><rsub|3,1>>|<cell|0>|<cell|-<math-up|asse><rsub|1,1>>>|<row|<cell|-<math-up|asse><rsub|2,1>>|<cell|<math-up|asse><rsub|1,1>>|<cell|0>>>>>,\<vartheta\>:\<pi\>*<around*|(|<frac|<math-up|angolo>|180>|)>,<with|math-font-family|rm|norma2>:<sqrt|<math-up|asse><rsub|1,1><rsup|2>+<math-up|asse><rsub|2,1><rsup|2>+<math-up|asse><rsub|3,1><rsup|2>>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>\<vartheta\>:<with|math-font-family|rm|norma2>*\<vartheta\>,<with|math-font-family|rm|S2>:S\<cdot\>S,<with|math-font-family|rm|S2>:<math-up|trigsimp><around*|(|<math-up|trigreduce><around*|(|<with|math-font-family|rm|S2>|)>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,R:<math-up|II>+sin
      <around*|(|\<vartheta\>|)>*S+<around*|(|1-cos
      <around*|(|\<vartheta\>|)>|)>*<with|math-font-family|rm|S2>,R:<math-up|trigsimp><around*|(|<math-up|trigreduce><around*|(|<math-up|factor><around*|(|R|)>|)>|)>,<math-up|return><around*|(|R|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      mat:mat_rotazione(matrix([1],[0],[0]),90)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>|<row|<cell|0>|<cell|1>|<cell|0>>>>>>>
    </unfolded-io>

    \;

    \;

    <\with|color|red>
      ESERCITAZIONE 2: Procedura per il calcolo dell'asse di rotazione e
      l'angolo di rotazione data una matrice di rotazione. Effettuare i
      relativi controlli.

      Tramite la sottofunzione \Pcalcolo_val(mat1,mat2)\Q vengono calcolati
      gli indici in cui il valore presente è NON NULLO, il tutto per
      calcolare sin(\<theta\>) e cos(\<theta\>), per poi calcolare l'angolo
      \<theta\> interessato.
    </with>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      calcolo_val(mat1,mat2):=block(

      [val,i,j,x,y],

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ y:j,

      \ \ if mat1[i,j] # 0 and mat2[i,j] # 0 then return(1)

      \ ),

      \ x:i,

      \ if mat[i,y] # 0 then return(1)

      ),

      return([x,y])

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><with|math-font-family|rm|calcolo_val><around*|(|<with|math-font-family|rm|mat1>,<with|math-font-family|rm|mat2>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|val>,i,j,x,y|]>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|y:j,<math-bf|if><space|0.27em><with|math-font-family|rm|mat1><rsub|i,j>\<neq\>0\<wedge\><with|math-font-family|rm|mat2><rsub|i,j>\<neq\>0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|1|)>|)>,x:i,<math-bf|if><space|0.27em><math-up|mat><rsub|i,y>\<neq\>0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|1|)>|)>,<math-up|return><around*|(|<around*|[|x,y|]>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      calcolo_autovettore(R):=block(

      [RmII,adj,aut0,aut1,norma2,e],

      RmII:R-II,

      adj:adjoint(RmII),

      aut0:matrix([0],[0],[0]),

      for i:1 thru 3 do (

      \ aut1:matrix([adj[1,i]],[adj[2,i]],[adj[3,i]]),

      if aut1 # aut0 then return(aut1)

      ),

      norma2:sqrt((aut1[1,1]^2)+(aut1[2,1]^2)+(aut1[3,1]^2)),

      e:aut1*(1/norma2),

      return(e)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><with|math-font-family|rm|calcolo_autovettore><around*|(|R|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|RmII>,<math-up|adj>,<with|math-font-family|rm|aut0>,<with|math-font-family|rm|aut1>,<with|math-font-family|rm|norma2>,e|]>,<math-up|RmII>:R-<math-up|II>,<math-up|adj>:<math-up|adjoint><around*|(|<math-up|RmII>|)>,<with|math-font-family|rm|aut0>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<with|math-font-family|rm|aut1>:<matrix|<tformat|<table|<row|<cell|<math-up|adj><rsub|1,i>>>|<row|<cell|<math-up|adj><rsub|2,i>>>|<row|<cell|<math-up|adj><rsub|3,i>>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|aut1>\<neq\><with|math-font-family|rm|aut0><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<with|math-font-family|rm|aut1>|)>|)>,<with|math-font-family|rm|norma2>:<sqrt|<with|math-font-family|rm|aut1><rsub|1,1><rsup|2>+<with|math-font-family|rm|aut1><rsub|2,1><rsup|2>+<with|math-font-family|rm|aut1><rsub|3,1><rsup|2>>,e:<with|math-font-family|rm|aut1>*<around*|(|<frac|1|<with|math-font-family|rm|norma2>>|)>,<math-up|return><around*|(|e|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      calcolo_asse_angolo(R):=block(

      [RT,R_tot,II,det,S,mat,val1,val2,seno,S2,res,coseno,theta],

      RT:transpose(R),

      R_tot:trigsimp(R.RT),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if R_tot # II then return(-1),

      det:trigsimp(determinant(R)),

      if det # 1 then return(-2),

      e:calcolo_autovettore(R),

      \;

      S:matrix([0,-e[3,1],e[2,1]],[e[3,1],0,-e[1,1]],[-e[2,1],e[1,1],0]),

      mat:(1/2)*(R-RT),

      [val1,val2]:calcolo_val(mat,S),

      seno:fullratsimp(((1/2)*(R[val1,val2]-R[val2,val1]))/S[val1,val2]),

      \;

      S2:trigsimp(S.S),

      mat:((1/2)*(R+RT))-II,

      [val1,val2]:calcolo_val(mat,S2),

      res:fullratsimp((((1/2)*(R[val1,val2]+R[val2,val1]))-II[val1,val2])/S2[val1,val2]),

      coseno:1-res,

      theta:atan2(seno,coseno),

      return(theta)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><with|math-font-family|rm|calcolo_asse_angolo><around*|(|R|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|RT>,<with|math-font-family|rm|R_tot>,<math-up|II>,<math-up|det>,S,<math-up|mat>,<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>,<math-up|seno>,<with|math-font-family|rm|S2>,<math-up|res>,<math-up|coseno>,\<vartheta\>|]>,<math-up|RT>:<math-up|transpose><around*|(|R|)>,<with|math-font-family|rm|R_tot>:<math-up|trigsimp><around*|(|R\<cdot\><math-up|RT>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|R_tot>\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|-1|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|determinant><around*|(|R|)>|)>,<math-bf|if><space|0.27em><math-up|det>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|-2|)>,e:<with|math-font-family|rm|calcolo_autovettore><around*|(|R|)>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-e<rsub|3,1>>|<cell|e<rsub|2,1>>>|<row|<cell|e<rsub|3,1>>|<cell|0>|<cell|-e<rsub|1,1>>>|<row|<cell|-e<rsub|2,1>>|<cell|e<rsub|1,1>>|<cell|0>>>>>,<math-up|mat>:<frac|1|2>*<around*|(|R-<math-up|RT>|)>,<around*|[|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>|]>:<with|math-font-family|rm|calcolo_val><around*|(|<math-up|mat>,S|)>,<math-up|seno>:<math-up|fullratsimp><around*|(|<frac|<frac|1|2>*<around*|(|R<rsub|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>>-R<rsub|<with|math-font-family|rm|val2>,<with|math-font-family|rm|val1>>|)>|S<rsub|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>>>|)>,<with|math-font-family|rm|S2>:<math-up|trigsimp><around*|(|S\<cdot\>S|)>,<math-up|mat>:<frac|1|2>*<around*|(|R+<math-up|RT>|)>-<math-up|II>,<around*|[|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>|]>:<with|math-font-family|rm|calcolo_val><around*|(|<math-up|mat>,<with|math-font-family|rm|S2>|)>,<math-up|res>:<math-up|fullratsimp><around*|(|<frac|<frac|1|2>*<around*|(|R<rsub|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>>+R<rsub|<with|math-font-family|rm|val2>,<with|math-font-family|rm|val1>>|)>-<math-up|II><rsub|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>>|<with|math-font-family|rm|S2><rsub|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>>>|)>,<math-up|coseno>:1-<math-up|res>,\<vartheta\>:<math-up|atan2><around*|(|<math-up|seno>,<math-up|coseno>|)>,<math-up|return><around*|(|\<vartheta\>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      calcolo_asse_angolo(mat)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><frac|\<pi\>|2>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>