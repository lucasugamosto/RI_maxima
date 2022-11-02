<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA CHE CALCOLA LA MATRICE DI ROTAZIONE UTILIZZANDO LA MATRICE
  ANTISIMMETRICA E LA TRASFORMATA DI LAPLACE.

  <with|color|red|Procedura 1: Procedura che prende in input un vettore e
  associa a quel vettore la corrispondente matrice anti-simmetrica.>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      mat_antisimmetricaS(v):=block(

      [S],

      /*Controllo che l'elemento passato in ingresso sia un vettore*/

      if scalarp(v) = true or listp(v) = true then return(0),

      \;

      S:matrix([0,-v[3,1],v[2,1]],[v[3,1],0,-v[1,1]],[-v[2,1],v[1,1],0]),

      return(S)

      )

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|mat_antisimmetricaS><around*|(|v|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|S|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|v|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|v|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-v<rsub|3,1>>|<cell|v<rsub|2,1>>>|<row|<cell|v<rsub|3,1>>|<cell|0>|<cell|-v<rsub|1,1>>>|<row|<cell|-v<rsub|2,1>>|<cell|v<rsub|1,1>>|<cell|0>>>>>,<math-up|return><around*|(|S|)>|)>>>
    </unfolded-io>

    \;

    \;

    <\with|color|red>
      \;

      \;

      Procedura 2: Procedura che prende in input una matrice, verifica se �
      anti-simmetrica e determina il vettore corrispondente.
    </with>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      calcolo_vettore(S):=block(

      [ST,mat],

      if scalarp(S) = true or listp(S) = true then retuen(0),

      \;

      if S[1,1] # 0 or S[2,2] # 0 or S[3,3] # 0 then return(0),

      ST:transpose(S),

      mat:-S,

      if ST # mat then return(0),

      v:matrix([S[3,2]],[S[1,3]],[S[2,1]]),

      return(v)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|calcolo_vettore><around*|(|S|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|ST>,<math-up|mat>|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|S|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|S|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|retuen><around*|(|0|)>,<math-bf|if><space|0.27em>S<rsub|1,1>\<neq\>0\<vee\>S<rsub|2,2>\<neq\>0\<vee\>S<rsub|3,3>\<neq\>0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|ST>:<math-up|transpose><around*|(|S|)>,<math-up|mat>:-S,<math-bf|if><space|0.27em><math-up|ST>\<neq\><math-up|mat><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,v:<matrix|<tformat|<table|<row|<cell|S<rsub|3,2>>>|<row|<cell|S<rsub|1,3>>>|<row|<cell|S<rsub|2,1>>>>>>,<math-up|return><around*|(|v|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      calcolo_vettore(matrix([0,-c,b],[c,0,-a],[-b,a,0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|a>>|<row|<cell|b>>|<row|<cell|c>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      mat_antisimmetricaS(matrix([a],[b],[c]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-c>|<cell|b>>|<row|<cell|c>|<cell|0>|<cell|-a>>|<row|<cell|-b>|<cell|a>|<cell|0>>>>>>>
    </unfolded-io>

    \;

    \;

    \;

    \;

    \;

    \;

    <\with|color|red>
      \;

      Procedura 3: Procedura che prende in input una coppia di valori
      (vettore,angolo). Se il vettore � un versore allora si applica la
      procedura per il calcolo della matrice di rotazione. Se il vettore non
      � un versore bisogna normalizzare il vettore e ricordare
      successivamente di moltiplicare l'angolo per la norma calcolata in
      precedenza. Inoltre controllare che l'angolo sia un numero.

      \;
    </with>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      calcolo_versore(vettore):=block(

      [norma2,e],

      if scalarp(vettore) = true or listp(vettore) = true then return(0),

      norma2:sqrt((vettore[1,1]^2)+(vettore[2,1]^2)+(vettore[3,1]^2)),

      \;

      /*Controllo che il vettore inserito non sia composto da soli zeri*/

      if norma2 = 0 then return(0),

      \;

      if norma2 # 1 then e:(1/norma2)*vettore else e:vettore,

      return(e)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><with|math-font-family|rm|calcolo_versore><around*|(|<math-up|vettore>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|norma2>,e|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|<math-up|vettore>|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|<math-up|vettore>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<with|math-font-family|rm|norma2>:<sqrt|<math-up|vettore><rsub|1,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|3,1><rsup|2>>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>e:<frac|1|<with|math-font-family|rm|norma2>>*<math-up|vettore><space|0.27em><math-bf|else><space|0.27em>e:<math-up|vettore>,<math-up|return><around*|(|e|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      calcolo_versore(matrix([2],[1],[0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2|<sqrt|5>>>>|<row|<cell|<frac|1|<sqrt|5>>>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\textput>
      \;

      \;

      <\with|color|red>
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

        Funzione che vuole passati in ingresso due parametri: il primo � una
        matrice 3x1 ed il secondo � uno scalare rappresentante l'angolo di
        rotazione, espresso in modo generico (alpha,beta,ecc<text-dots>)
        oppure in gradi poich� viene convertito in radianti all'interno della
        funzione.
      </with>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      mat_rotazione(vet,angolo):=block(

      [e,S,theta,norma2,II,sII,sIImS,sIImS_inv,R],

      e:calcolo_versore(vet),

      \;

      /*Pu� tornare 0 se il parametro in input non � un vettore o se � un
      vettore identicamente nullo*/

      if e = 0 then return(0),

      S:mat_antisimmetricaS(e),

      \;

      if listp(angolo) = true or matrixp(angolo) = true then return(0),

      theta:%pi*(angolo/180),

      \;

      /*Normalizzo l'angolo nel caso fosse necessario (norma2 # 1)*/

      norma2:sqrt((vet[1,1]^2)+(vet[2,1]^2)+(vet[3,1]^2)),

      if norma2 # 1 then theta:norma2*theta,

      \;

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      sII:s*II,

      sIImS:sII-S,

      sIImS_inv:trigsimp(factor(invert(sIImS))),

      R:matrix([ilt(sIImS_inv[1,1],s,t),ilt(sIImS_inv[1,2],s,t),ilt(sIImS_inv[1,3],s,t)],[ilt(sIImS_inv[2,1],s,t),ilt(sIImS_inv[2,2],s,t),ilt(sIImS_inv[2,3],s,t)],[ilt(sIImS_inv[3,1],s,t),ilt(sIImS_inv[3,2],s,t),ilt(sIImS_inv[3,3],s,t)]),

      R:subst(t=theta,R),

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ R[i,j]:trigsimp(R[i,j])

      \ )

      ),

      return(R)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><with|math-font-family|rm|mat_rotazione><around*|(|<math-up|vet>,<math-up|angolo>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|e,S,\<vartheta\>,<with|math-font-family|rm|norma2>,<math-up|II>,<math-up|sII>,<math-up|sIImS>,<with|math-font-family|rm|sIImS_inv>,R|]>,e:<with|math-font-family|rm|calcolo_versore><around*|(|<math-up|vet>|)>,<math-bf|if><space|0.27em>e=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,S:<with|math-font-family|rm|mat_antisimmetricaS><around*|(|e|)>,<math-bf|if><space|0.27em><math-up|listp><around*|(|<math-up|angolo>|)>=<math-bf|true>\<vee\><math-up|matrixp><around*|(|<math-up|angolo>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,\<vartheta\>:\<pi\>*<around*|(|<frac|<math-up|angolo>|180>|)>,<with|math-font-family|rm|norma2>:<sqrt|<math-up|vet><rsub|1,1><rsup|2>+<math-up|vet><rsub|2,1><rsup|2>+<math-up|vet><rsub|3,1><rsup|2>>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>\<vartheta\>:<with|math-font-family|rm|norma2>*\<vartheta\>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|sII>:s*<math-up|II>,<math-up|sIImS>:<math-up|sII>-S,<with|math-font-family|rm|sIImS_inv>:<math-up|trigsimp><around*|(|<math-up|factor><around*|(|<math-up|invert><around*|(|<math-up|sIImS>|)>|)>|)>,R:<matrix|<tformat|<table|<row|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|1,1>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|1,2>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|1,3>,s,t|)>>>|<row|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|2,1>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|2,2>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|2,3>,s,t|)>>>|<row|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|3,1>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|3,2>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|3,3>,s,t|)>>>>>>,R:<math-up|subst><around*|(|t=\<vartheta\>,R|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em>R<rsub|i,j>:<math-up|trigsimp><around*|(|R<rsub|i,j>|)>,<math-up|return><around*|(|R|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      mat_rotazione(matrix([1],[0],[0]),90)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>|<row|<cell|0>|<cell|1>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      mat_rotazione(matrix([1],[1],[0]),60)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|<frac|cos
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>+1|2>>|<cell|-<frac|cos
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>-1|2>>|<cell|<frac|sin
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>|<sqrt|2>>>>|<row|<cell|-<frac|cos
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>-1|2>>|<cell|<frac|cos
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>+1|2>>|<cell|-<frac|sin
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>|<sqrt|2>>>>|<row|<cell|-<frac|sin
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>|<sqrt|2>>>|<cell|<frac|sin
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>|<sqrt|2>>>|<cell|cos
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      mat_rotazione(matrix([a],[0],[0]),90)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|<frac|\<pi\>*<around*|\||a|\|>|2>|)>>|<cell|-<frac|a*sin
      <around*|(|<frac|\<pi\>*<around*|\||a|\|>|2>|)>|<around*|\||a|\|>>>>|<row|<cell|0>|<cell|<frac|a*sin
      <around*|(|<frac|\<pi\>*<around*|\||a|\|>|2>|)>|<around*|\||a|\|>>>|<cell|cos
      <around*|(|<frac|\<pi\>*<around*|\||a|\|>|2>|)>>>>>>>>
    </unfolded-io>
  </session>

  <math|><math|>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>