<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA: SCRIVERE UNA PROCEDURA CHE UTILIZZANDO GLI
  AUTOVALORI/AUTOVETTORI CALCOLI LA MATRICE DI ROTAZIONE INTORNO ALL'ASSE
  RAPPRESENTATO DAL VERSORE v, DI UN ANGOLO \<theta\>.

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
      mat_antisimmetricaS(v):=block(

      [e,S],

      e:calcolo_versore(v),

      S:matrix([0,-e[3,1],e[2,1]],[e[3,1],0,-e[1,1]],[-e[2,1],e[1,1],0]),

      return(factor(S))

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|mat_antisimmetricaS><around*|(|v|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|e,S|]>,e:<with|math-font-family|rm|calcolo_versore><around*|(|v|)>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-e<rsub|3,1>>|<cell|e<rsub|2,1>>>|<row|<cell|e<rsub|3,1>>|<cell|0>|<cell|-e<rsub|1,1>>>|<row|<cell|-e<rsub|2,1>>|<cell|e<rsub|1,1>>|<cell|0>>>>>,<math-up|return><around*|(|<math-up|factor><around*|(|S|)>|)>|)>>>
    </unfolded-io>

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      calcolo_autovettore(S):=block(

      [II,sII,sIImS,pS,autovalori,adj,adj1,adj2,adj3,aut1,aut2,aut3,mat_autovettori],

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      sII:s*II,

      sIImS:sII-S,

      pS:determinant(sIImS),

      autovalori:solve(pS,s),

      adj:adjoint(sIImS),

      adj1:subst(autovalori[1],adj),

      adj2:subst(autovalori[2],adj),

      adj3:subst(autovalori[3],adj),

      aut0:matrix([0],[0],[0]),

      \;

      for i:1 thru 3 do (

      \ aut1:matrix([adj1[1,i]],[adj1[2,i]],[adj1[3,i]]),

      \ if aut1 # aut0 then return(aut1)

      ),

      for i:1 thru 3 do (

      \ aut2:matrix([adj2[1,i]],[adj2[2,i]],[adj2[3,i]]),

      \ if aut2 # aut0 then return(aut2)

      ),

      for i:1 thru 3 do (

      \ aut3:matrix([adj3[1,i]],[adj3[2,i]],[adj3[3,i]]),

      \ if aut3 # aut0 then return(aut3)

      ),

      aut1:trigsimp(aut1),

      aut2:trigsimp(aut2),

      aut3:trigsimp(aut3),

      \;

      mat_autovettori:matrix([aut1[1,1],aut2[1,1],aut3[1,1]],[aut1[2,1],aut2[2,1],aut3[2,1]],[aut1[3,1],aut2[3,1],aut3[3,1]]),

      \;

      return(trigsimp(factor(mat_autovettori)))

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|calcolo_autovettore><around*|(|S|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|II>,<math-up|sII>,<math-up|sIImS>,<math-up|pS>,<math-up|autovalori>,<math-up|adj>,<with|math-font-family|rm|adj1>,<with|math-font-family|rm|adj2>,<with|math-font-family|rm|adj3>,<with|math-font-family|rm|aut1>,<with|math-font-family|rm|aut2>,<with|math-font-family|rm|aut3>,<with|math-font-family|rm|mat_autovettori>|]>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|sII>:s*<math-up|II>,<math-up|sIImS>:<math-up|sII>-S,<math-up|pS>:<math-up|determinant><around*|(|<math-up|sIImS>|)>,<math-up|autovalori>:<math-up|solve><around*|(|<math-up|pS>,s|)>,<math-up|adj>:<math-up|adjoint><around*|(|<math-up|sIImS>|)>,<with|math-font-family|rm|adj1>:<math-up|subst><around*|(|<math-up|autovalori><rsub|1>,<math-up|adj>|)>,<with|math-font-family|rm|adj2>:<math-up|subst><around*|(|<math-up|autovalori><rsub|2>,<math-up|adj>|)>,<with|math-font-family|rm|adj3>:<math-up|subst><around*|(|<math-up|autovalori><rsub|3>,<math-up|adj>|)>,<with|math-font-family|rm|aut0>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<with|math-font-family|rm|aut1>:<matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|adj1><rsub|1,i>>>|<row|<cell|<with|math-font-family|rm|adj1><rsub|2,i>>>|<row|<cell|<with|math-font-family|rm|adj1><rsub|3,i>>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|aut1>\<neq\><with|math-font-family|rm|aut0><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<with|math-font-family|rm|aut1>|)>|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<with|math-font-family|rm|aut2>:<matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|adj2><rsub|1,i>>>|<row|<cell|<with|math-font-family|rm|adj2><rsub|2,i>>>|<row|<cell|<with|math-font-family|rm|adj2><rsub|3,i>>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|aut2>\<neq\><with|math-font-family|rm|aut0><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<with|math-font-family|rm|aut2>|)>|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><around*|(|<with|math-font-family|rm|aut3>:<matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|adj3><rsub|1,i>>>|<row|<cell|<with|math-font-family|rm|adj3><rsub|2,i>>>|<row|<cell|<with|math-font-family|rm|adj3><rsub|3,i>>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|aut3>\<neq\><with|math-font-family|rm|aut0><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<with|math-font-family|rm|aut3>|)>|)>,<with|math-font-family|rm|aut1>:<math-up|trigsimp><around*|(|<with|math-font-family|rm|aut1>|)>,<with|math-font-family|rm|aut2>:<math-up|trigsimp><around*|(|<with|math-font-family|rm|aut2>|)>,<with|math-font-family|rm|aut3>:<math-up|trigsimp><around*|(|<with|math-font-family|rm|aut3>|)>,<with|math-font-family|rm|mat_autovettori>:<matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|aut1><rsub|1,1>>|<cell|<with|math-font-family|rm|aut2><rsub|1,1>>|<cell|<with|math-font-family|rm|aut3><rsub|1,1>>>|<row|<cell|<with|math-font-family|rm|aut1><rsub|2,1>>|<cell|<with|math-font-family|rm|aut2><rsub|2,1>>|<cell|<with|math-font-family|rm|aut3><rsub|2,1>>>|<row|<cell|<with|math-font-family|rm|aut1><rsub|3,1>>|<cell|<with|math-font-family|rm|aut2><rsub|3,1>>|<cell|<with|math-font-family|rm|aut3><rsub|3,1>>>>>>,<math-up|return><around*|(|<math-up|trigsimp><around*|(|<math-up|factor><around*|(|<with|math-font-family|rm|mat_autovettori>|)>|)>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      calcolo_autovalore(S):=block(

      [II,sII,sIImS,pS,autovalori,mat1,mat2,mat3,mat_autovalori],

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      sII:s*II,

      sIImS:sII-S,

      pS:determinant(sIImS),

      autovalori:solve(pS,s),

      mat1:matrix([s,0,0],[0,0,0],[0,0,0]),

      mat2:matrix([0,0,0],[0,s,0],[0,0,0]),

      mat3:matrix([0,0,0],[0,0,0],[0,0,s]),

      mat1:subst(autovalori[1],mat1),

      mat2:subst(autovalori[2],mat2),

      mat3:subst(autovalori[3],mat3),

      mat_autovalori:mat1+mat2+mat3,

      return(mat_autovalori)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><with|math-font-family|rm|calcolo_autovalore><around*|(|S|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|II>,<math-up|sII>,<math-up|sIImS>,<math-up|pS>,<math-up|autovalori>,<with|math-font-family|rm|mat1>,<with|math-font-family|rm|mat2>,<with|math-font-family|rm|mat3>,<with|math-font-family|rm|mat_autovalori>|]>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|sII>:s*<math-up|II>,<math-up|sIImS>:<math-up|sII>-S,<math-up|pS>:<math-up|determinant><around*|(|<math-up|sIImS>|)>,<math-up|autovalori>:<math-up|solve><around*|(|<math-up|pS>,s|)>,<with|math-font-family|rm|mat1>:<matrix|<tformat|<table|<row|<cell|s>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>,<with|math-font-family|rm|mat2>:<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|s>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>,<with|math-font-family|rm|mat3>:<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|s>>>>>,<with|math-font-family|rm|mat1>:<math-up|subst><around*|(|<math-up|autovalori><rsub|1>,<with|math-font-family|rm|mat1>|)>,<with|math-font-family|rm|mat2>:<math-up|subst><around*|(|<math-up|autovalori><rsub|2>,<with|math-font-family|rm|mat2>|)>,<with|math-font-family|rm|mat3>:<math-up|subst><around*|(|<math-up|autovalori><rsub|3>,<with|math-font-family|rm|mat3>|)>,<with|math-font-family|rm|mat_autovalori>:<with|math-font-family|rm|mat1>+<with|math-font-family|rm|mat2>+<with|math-font-family|rm|mat3>,<math-up|return><around*|(|<with|math-font-family|rm|mat_autovalori>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      calcolo_matriceR(asse,angolo):=block(

      [e,S,matAutovettori,matAutovettoriInversa,matAutovalori,matEsponenziale,R],

      e:calcolo_versore(asse),

      if e = 0 then return(0),

      S:mat_antisimmetricaS(e),

      theta:%pi*(angolo/180),

      matAutovettori:calcolo_autovettore(S),

      matAutovettoriInversa:trigsimp(factor(invert(matAutovettori))),

      matAutovalori:calcolo_autovalore(S),

      matEsponenziale:exp(matAutovalori*theta),

      mat[1]:trigsimp(factor(matEsponenziale.matAutovettoriInversa)),

      R:trigsimp(factor(matAutovettori.mat[1])),

      return(R)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><with|math-font-family|rm|calcolo_matriceR><around*|(|<math-up|asse>,<math-up|angolo>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|e,S,<math-up|matAutovettori>,<math-up|matAutovettoriInversa>,<math-up|matAutovalori>,<math-up|matEsponenziale>,R|]>,e:<with|math-font-family|rm|calcolo_versore><around*|(|<math-up|asse>|)>,<math-bf|if><space|0.27em>e=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,S:<with|math-font-family|rm|mat_antisimmetricaS><around*|(|e|)>,\<vartheta\>:\<pi\>*<around*|(|<frac|<math-up|angolo>|180>|)>,<math-up|matAutovettori>:<with|math-font-family|rm|calcolo_autovettore><around*|(|S|)>,<math-up|matAutovettoriInversa>:<math-up|trigsimp><around*|(|<math-up|factor><around*|(|<math-up|invert><around*|(|<math-up|matAutovettori>|)>|)>|)>,<math-up|matAutovalori>:<with|math-font-family|rm|calcolo_autovalore><around*|(|S|)>,<math-up|matEsponenziale>:exp
      <around*|(|<math-up|matAutovalori>*\<vartheta\>|)>,<math-up|mat><rsub|1>:<math-up|trigsimp><around*|(|<math-up|factor><around*|(|<math-up|matEsponenziale>\<cdot\><math-up|matAutovettoriInversa>|)>|)>,R:<math-up|trigsimp><around*|(|<math-up|factor><around*|(|<math-up|matAutovettori>\<cdot\><math-up|mat><rsub|1>|)>|)>,<math-up|return><around*|(|R|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      R:calcolo_matriceR(matrix([1],[0],[0]),alpha)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|-1>|<cell|0>>|<row|<cell|-2>|<cell|<frac|\<mathe\><rsup|-<frac|\<mathi\>*\<pi\>*\<alpha\>|180>>*<around*|(|\<mathe\><rsup|<frac|\<mathi\>*\<pi\>*\<alpha\>|90>>+2*\<mathe\><rsup|<frac|\<mathi\>*\<pi\>*\<alpha\>|180>>+1|)>|2>>|<cell|<frac|\<mathe\><rsup|-<frac|\<mathi\>*\<pi\>*\<alpha\>|180>>*<around*|(|\<mathi\>*\<mathe\><rsup|<frac|\<mathi\>*\<pi\>*\<alpha\>|90>>-\<mathi\>|)>|2>>>|<row|<cell|0>|<cell|-<frac|\<mathe\><rsup|-<frac|\<mathi\>*\<pi\>*\<alpha\>|180>>*<around*|(|\<mathi\>*\<mathe\><rsup|<frac|\<mathi\>*\<pi\>*\<alpha\>|90>>-\<mathi\>|)>|2>>|<cell|<frac|\<mathe\><rsup|-<frac|\<mathi\>*\<pi\>*\<alpha\>|180>>*<around*|(|\<mathe\><rsup|<frac|\<mathi\>*\<pi\>*\<alpha\>|90>>-2*\<mathe\><rsup|<frac|\<mathi\>*\<pi\>*\<alpha\>|180>>+1|)>|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      R:calcolo_matriceR(matrix([1],[0],[0]),45)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|-1>|<cell|0>>|<row|<cell|-2>|<cell|<frac|<sqrt|2>+1|<sqrt|2>>>|<cell|-<frac|1|<sqrt|2>>>>|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|-<frac|<sqrt|2>-1|<sqrt|2>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      R:calcolo_matriceR(matrix([0],[0],[0]),alpha)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>0>>
    </unfolded-io>
  </session>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>