<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA PER IL CALCOLO DIRETTO (dalla coppia (asse,angolo) alla matrice
  di rotazone R) ED INVERSO (dalla matrice di rotazione R alla coppia
  (asse,angolo)) \ TRAMITE LA FORMULA DI RODRIGUEZ.

  <with|color|red|Procedura 1: Data una coppia di valori in input
  (asse,angolo), verifica se l'asse è un versore e non un vettore. Se l'asse
  è un versore allora viene usata la FORMULA DI RODRIGUEZ per il calcolo
  della matrice di rotazione R intorno all'asse v di un angolo \<theta\>,
  altrimenti viene calcolato prima il versore e poi viene calcolata la
  matrice R.>

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
      mat_rotazioneR(asse,angolo):=block(

      [e,S,norma2,theta,S2,II,R],

      e:calcolo_versore(asse),

      if e = 0 then return(0),

      S:matrix([0,-e[3,1],e[2,1]],[e[3,1],0,-e[1,1]],[-e[2,1],e[1,1],0]),

      if listp(angolo) = true or matrixp(angolo) = true then return(0),

      \;

      theta:%pi*(angolo/180),

      \;

      S2:S.S,

      S2:trigsimp(trigreduce(factor(S2))),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      R:II+(sin(theta)*S)+((1-cos(theta))*S2),

      R:trigsimp(trigreduce(factor(R))),

      return(R)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|mat_rotazioneR><around*|(|<math-up|asse>,<math-up|angolo>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|e,S,<with|math-font-family|rm|norma2>,\<vartheta\>,<with|math-font-family|rm|S2>,<math-up|II>,R|]>,e:<with|math-font-family|rm|calcolo_versore><around*|(|<math-up|asse>|)>,<math-bf|if><space|0.27em>e=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-e<rsub|3,1>>|<cell|e<rsub|2,1>>>|<row|<cell|e<rsub|3,1>>|<cell|0>|<cell|-e<rsub|1,1>>>|<row|<cell|-e<rsub|2,1>>|<cell|e<rsub|1,1>>|<cell|0>>>>>,<math-bf|if><space|0.27em><math-up|listp><around*|(|<math-up|angolo>|)>=<math-bf|true>\<vee\><math-up|matrixp><around*|(|<math-up|angolo>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,\<vartheta\>:\<pi\>*<around*|(|<frac|<math-up|angolo>|180>|)>,<with|math-font-family|rm|S2>:S\<cdot\>S,<with|math-font-family|rm|S2>:<math-up|trigsimp><around*|(|<math-up|trigreduce><around*|(|<math-up|factor><around*|(|<with|math-font-family|rm|S2>|)>|)>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,R:<math-up|II>+sin
      <around*|(|\<vartheta\>|)>*S+<around*|(|1-cos
      <around*|(|\<vartheta\>|)>|)>*<with|math-font-family|rm|S2>,R:<math-up|trigsimp><around*|(|<math-up|trigreduce><around*|(|<math-up|factor><around*|(|R|)>|)>|)>,<math-up|return><around*|(|R|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      mat1:mat_rotazioneR(matrix([1],[0],[0]),30)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|<sqrt|3>|2>>|<cell|-<frac|1|2>>>|<row|<cell|0>|<cell|<frac|1|2>>|<cell|<frac|<sqrt|3>|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      mat2:mat_rotazioneR(matrix([1],[1],[-1]),120)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>|<row|<cell|-1>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    \;

    \;

    <\with|color|red>
      ESERCITAZIONE 2: Calcolo dell'asse di rotazione e dell'angolo di
      rotazione data una matrice di rotazione. Effettuare i relativi
      controlli.

      Tramite la sottofunzione \Pcalcolo_val(mat1,mat2)\Q vengono calcolati
      gli indici in cui il valore presente è NON NULLO, il tutto per
      calcolare sin(\<theta\>) e cos(\<theta\>), e poi calcolare l'angolo
      \<theta\> interessato.
    </with>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
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
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><with|math-font-family|rm|calcolo_val><around*|(|<with|math-font-family|rm|mat1>,<with|math-font-family|rm|mat2>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|val>,i,j,x,y|]>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|y:j,<math-bf|if><space|0.27em><with|math-font-family|rm|mat1><rsub|i,j>\<neq\>0\<wedge\><with|math-font-family|rm|mat2><rsub|i,j>\<neq\>0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|1|)>|)>,x:i,<math-bf|if><space|0.27em><math-up|mat><rsub|i,y>\<neq\>0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|1|)>|)>,<math-up|return><around*|(|<around*|[|x,y|]>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      calcolo_vettore(R):=block(

      [mat_T,mat_fin,II,det,RmII,adj,aut0,aut1,norma2,e],

      mat_T:transpose(R),

      mat_fin:trigsimp(R.mat_T),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if mat_fin # II then return(0),

      det:trigsimp(determinant(R)),

      if det # 1 then return(0),

      \;

      RmII:R-II,

      adj:adjoint(RmII),

      aut0:matrix([0],[0],[0]),

      for i:1 thru 3 do (

      \ aut1:matrix([adj[1,i]],[adj[2,i]],[adj[3,i]]),

      if aut1 # aut0 then return(aut1)

      ),

      norma2:sqrt((aut1[1,1]^2)+(aut1[2,1]^2)+(aut1[3,1]^2)),

      if norma2 # 1 then e:(1/norma2)*aut1 else e:aut1,

      return(e)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><with|math-font-family|rm|calcolo_vettore><around*|(|R|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|mat_T>,<with|math-font-family|rm|mat_fin>,<math-up|II>,<math-up|det>,<math-up|RmII>,<math-up|adj>,<with|math-font-family|rm|aut0>,<with|math-font-family|rm|aut1>,<with|math-font-family|rm|norma2>,e|]>,<with|math-font-family|rm|mat_T>:<math-up|transpose><around*|(|R|)>,<with|math-font-family|rm|mat_fin>:<math-up|trigsimp><around*|(|R\<cdot\><with|math-font-family|rm|mat_T>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|mat_fin>\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|determinant><around*|(|R|)>|)>,<math-bf|if><space|0.27em><math-up|det>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|RmII>:R-<math-up|II>,<math-up|adj>:<math-up|adjoint><around*|(|<math-up|RmII>|)>,<with|math-font-family|rm|aut0>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<with|math-font-family|rm|aut1>:<matrix|<tformat|<table|<row|<cell|<math-up|adj><rsub|1,i>>>|<row|<cell|<math-up|adj><rsub|2,i>>>|<row|<cell|<math-up|adj><rsub|3,i>>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|aut1>\<neq\><with|math-font-family|rm|aut0><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<with|math-font-family|rm|aut1>|)>|)>,<with|math-font-family|rm|norma2>:<sqrt|<with|math-font-family|rm|aut1><rsub|1,1><rsup|2>+<with|math-font-family|rm|aut1><rsub|2,1><rsup|2>+<with|math-font-family|rm|aut1><rsub|3,1><rsup|2>>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>e:<frac|1|<with|math-font-family|rm|norma2>>*<with|math-font-family|rm|aut1><space|0.27em><math-bf|else><space|0.27em>e:<with|math-font-family|rm|aut1>,<math-up|return><around*|(|e|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      calcolo_asse_angolo(R):=block(

      [e,RT,S,mat,val1,val2,seno,S2,res,coseno,theta],

      e:calcolo_vettore(R),

      if e = 0 then return(0),

      \;

      S:matrix([0,-e[3,1],e[2,1]],[e[3,1],0,-e[1,1]],[-e[2,1],e[1,1],0]),

      RT:transpose(R),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      mat:(1/2)*(R-RT),

      [val1,val2]:calcolo_val(mat,S),

      seno:((1/2)*(R[val1,val2]-R[val2,val1]))/S[val1,val2],

      seno:factor(seno),

      \;

      S2:trigsimp(S.S),

      mat:((1/2)*(R+RT))-II,

      [val1,val2]:calcolo_val(mat,S2),

      res:(((1/2)*(R[val1,val2]+R[val2,val1]))-II[val1,val2])/S2[val1,val2],

      res:factor(res),

      coseno:factor(1-res),

      theta:atan2(seno,coseno),

      return([e,theta])

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><with|math-font-family|rm|calcolo_asse_angolo><around*|(|R|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|e,<math-up|RT>,S,<math-up|mat>,<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>,<math-up|seno>,<with|math-font-family|rm|S2>,<math-up|res>,<math-up|coseno>,\<vartheta\>|]>,e:<with|math-font-family|rm|calcolo_vettore><around*|(|R|)>,<math-bf|if><space|0.27em>e=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-e<rsub|3,1>>|<cell|e<rsub|2,1>>>|<row|<cell|e<rsub|3,1>>|<cell|0>|<cell|-e<rsub|1,1>>>|<row|<cell|-e<rsub|2,1>>|<cell|e<rsub|1,1>>|<cell|0>>>>>,<math-up|RT>:<math-up|transpose><around*|(|R|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|mat>:<frac|1|2>*<around*|(|R-<math-up|RT>|)>,<around*|[|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>|]>:<with|math-font-family|rm|calcolo_val><around*|(|<math-up|mat>,S|)>,<math-up|seno>:<frac|<frac|1|2>*<around*|(|R<rsub|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>>-R<rsub|<with|math-font-family|rm|val2>,<with|math-font-family|rm|val1>>|)>|S<rsub|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>>>,<math-up|seno>:<math-up|factor><around*|(|<math-up|seno>|)>,<with|math-font-family|rm|S2>:<math-up|trigsimp><around*|(|S\<cdot\>S|)>,<math-up|mat>:<frac|1|2>*<around*|(|R+<math-up|RT>|)>-<math-up|II>,<around*|[|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>|]>:<with|math-font-family|rm|calcolo_val><around*|(|<math-up|mat>,<with|math-font-family|rm|S2>|)>,<math-up|res>:<frac|<frac|1|2>*<around*|(|R<rsub|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>>+R<rsub|<with|math-font-family|rm|val2>,<with|math-font-family|rm|val1>>|)>-<math-up|II><rsub|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>>|<with|math-font-family|rm|S2><rsub|<with|math-font-family|rm|val1>,<with|math-font-family|rm|val2>>>,<math-up|res>:<math-up|factor><around*|(|<math-up|res>|)>,<math-up|coseno>:<math-up|factor><around*|(|1-<math-up|res>|)>,\<vartheta\>:<math-up|atan2><around*|(|<math-up|seno>,<math-up|coseno>|)>,<math-up|return><around*|(|<around*|[|e,\<vartheta\>|]>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      calcolo_asse_angolo(mat1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,<frac|\<pi\>|6>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      calcolo_vettore(mat2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|3>>>>|<row|<cell|<frac|1|<sqrt|3>>>>|<row|<cell|-<frac|1|<sqrt|3>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      calcolo_asse_angolo(mat2)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|3>>>>|<row|<cell|<frac|1|<sqrt|3>>>>|<row|<cell|-<frac|1|<sqrt|3>>>>>>>,<frac|2*\<pi\>|3>|]>>>
    </unfolded-io>
  </session>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>