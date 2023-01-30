<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA 18: Risolvere il problema dell'orientamento inverso scegliendo
  una terna di Eulero ed applicarla a tutte le strutture portanti viste a
  lezione

  Calcolo orientamento inverso tramite la terna di Eulero
  <math|R<rsub|x><around*|(|\<alpha\>|)>*R<rsub|y><around*|(|\<beta\>|)>*R<rsub|x><around*|(|\<gamma\>|)>>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      calcoloOrientamentoXYX(R):=block(

      [transpose,finalR,II,det,alpha,beta,gamma,s1,s2,c1,c2,mat],

      \;

      /*controllare che il parametro in ingresso è di tipo matriciale*/

      if scalarp(R) = true or listp(R) = true then return(-2),

      \;

      /*controllare che la matrice in ingresso sia di rotazione*/

      transposeR:trigrat(trigreduce(factor(transpose(R)))),

      finalR:trigrat(trigreduce(factor(R.transposeR))),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if finalR # II then return(-1),

      det:trigsimp(trigreduce(determinant(R))),

      if det # 1 then return(-1),

      \;

      /*controllare e calcolare la variabile trigonometrica 'beta'*/

      if R[1,1] = 1 or R[1,1] = -1 then return(0),

      c[beta]:R[1,1],

      s1[beta]:sqrt(1-(R[1,1]^2)),

      s2[beta]:-sqrt(1-(R[1,1]^2)),

      b[1]:atan2(s1[beta],c[beta]),

      b[2]:atan2(s2[beta],c[beta]),

      \;

      /*controllare e calcolare la varianile trigonometrica 'gamma'*/

      if s1[beta] = 0 then return(0),

      c1[gamma]:R[1,3]/s1[beta],

      c2[gamma]:R[1,3]/s2[beta],

      s1[gamma]:R[1,2]/s1[beta],

      s2[gamma]:R[1,2]/s2[beta],

      g[1]:atan2(s1[gamma],c1[gamma]),

      g[2]:atan2(s2[gamma],c2[gamma]),

      \;

      /*controllare e calcolare la variabile trigonometrica 'alpha'*/

      if s1[beta] = 0 then return(0),

      c1[alpha]:-R[3,1]/s1[beta],

      c2[alpha]:-R[3,1]/s2[beta],

      s1[alpha]:R[2,1]/s1[beta],

      s2[alpha]:R[2,1]/s2[beta],

      a[1]:atan2(s1[alpha],c1[alpha]),

      a[2]:atan2(s2[alpha],c2[alpha]),

      \;

      mat:matrix([variabile,soluzione1,soluzione2],[ALPHA,a[1],a[2]],[BETA,b[1],b[2]],[GAMMA,g[1],g[2]]),

      return(mat)

      )

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><math-up|calcoloOrientamentoXYX><around*|(|R|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|transpose>,<math-up|finalR>,<math-up|II>,<math-up|det>,\<alpha\>,\<beta\>,\<gamma\>,<with|math-font-family|rm|s1>,<with|math-font-family|rm|s2>,<with|math-font-family|rm|c1>,<with|math-font-family|rm|c2>,<math-up|mat>|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|R|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|R|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|-2|)>,<math-up|transposeR>:<math-up|trigrat><around*|(|<math-up|trigreduce><around*|(|<math-up|factor><around*|(|<math-up|transpose><around*|(|R|)>|)>|)>|)>,<math-up|finalR>:<math-up|trigrat><around*|(|<math-up|trigreduce><around*|(|<math-up|factor><around*|(|R\<cdot\><math-up|transposeR>|)>|)>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><math-up|finalR>\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|-1|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|trigreduce><around*|(|<math-up|determinant><around*|(|R|)>|)>|)>,<math-bf|if><space|0.27em><math-up|det>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|-1|)>,<math-bf|if><space|0.27em>R<rsub|1,1>=1\<vee\>R<rsub|1,1>=-1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,c<rsub|\<beta\>>:R<rsub|1,1>,<with|math-font-family|rm|s1><rsub|\<beta\>>:<sqrt|1-R<rsub|1,1><rsup|2>>,<with|math-font-family|rm|s2><rsub|\<beta\>>:-<sqrt|1-R<rsub|1,1><rsup|2>>,b<rsub|1>:<math-up|atan2><around*|(|<with|math-font-family|rm|s1><rsub|\<beta\>>,c<rsub|\<beta\>>|)>,b<rsub|2>:<math-up|atan2><around*|(|<with|math-font-family|rm|s2><rsub|\<beta\>>,c<rsub|\<beta\>>|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|s1><rsub|\<beta\>>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<with|math-font-family|rm|c1><rsub|\<gamma\>>:<frac|R<rsub|1,3>|<with|math-font-family|rm|s1><rsub|\<beta\>>>,<with|math-font-family|rm|c2><rsub|\<gamma\>>:<frac|R<rsub|1,3>|<with|math-font-family|rm|s2><rsub|\<beta\>>>,<with|math-font-family|rm|s1><rsub|\<gamma\>>:<frac|R<rsub|1,2>|<with|math-font-family|rm|s1><rsub|\<beta\>>>,<with|math-font-family|rm|s2><rsub|\<gamma\>>:<frac|R<rsub|1,2>|<with|math-font-family|rm|s2><rsub|\<beta\>>>,g<rsub|1>:<math-up|atan2><around*|(|<with|math-font-family|rm|s1><rsub|\<gamma\>>,<with|math-font-family|rm|c1><rsub|\<gamma\>>|)>,g<rsub|2>:<math-up|atan2><around*|(|<with|math-font-family|rm|s2><rsub|\<gamma\>>,<with|math-font-family|rm|c2><rsub|\<gamma\>>|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|s1><rsub|\<beta\>>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<with|math-font-family|rm|c1><rsub|\<alpha\>>:<frac|-R<rsub|3,1>|<with|math-font-family|rm|s1><rsub|\<beta\>>>,<with|math-font-family|rm|c2><rsub|\<alpha\>>:<frac|-R<rsub|3,1>|<with|math-font-family|rm|s2><rsub|\<beta\>>>,<with|math-font-family|rm|s1><rsub|\<alpha\>>:<frac|R<rsub|2,1>|<with|math-font-family|rm|s1><rsub|\<beta\>>>,<with|math-font-family|rm|s2><rsub|\<alpha\>>:<frac|R<rsub|2,1>|<with|math-font-family|rm|s2><rsub|\<beta\>>>,a<rsub|1>:<math-up|atan2><around*|(|<with|math-font-family|rm|s1><rsub|\<alpha\>>,<with|math-font-family|rm|c1><rsub|\<alpha\>>|)>,a<rsub|2>:<math-up|atan2><around*|(|<with|math-font-family|rm|s2><rsub|\<alpha\>>,<with|math-font-family|rm|c2><rsub|\<alpha\>>|)>,<math-up|mat>:<matrix|<tformat|<table|<row|<cell|<math-up|variabile>>|<cell|<with|math-font-family|rm|soluzione1>>|<cell|<with|math-font-family|rm|soluzione2>>>|<row|<cell|<math-up|ALPHA>>|<cell|a<rsub|1>>|<cell|a<rsub|2>>>|<row|<cell|<math-up|BETA>>|<cell|b<rsub|1>>|<cell|b<rsub|2>>>|<row|<cell|<math-up|GAMMA>>|<cell|g<rsub|1>>|<cell|g<rsub|2>>>>>>,<math-up|return><around*|(|<math-up|mat>|)>|)>>>
    </unfolded-io>

    \;

    \;

    Una seconda terna di Eulero utile è quella
    <math|R<rsub|z><around*|(|\<alpha\>|)>*R<rsub|x><around*|(|\<beta\>|)>*R<rsub|z><around*|(|\<gamma\>|)>>,
    questa infatti permette di trovare soluzioni più semplici per le
    strutture sferico 1, sferico 2 poichè selezionano elementi più semplici.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      calcoloOrientamentoZXZ(R):=block(

      [],

      \;

      /*controllare che il parametro in ingresso sia di tipo matriciale*/

      if scalar(R) = true or listp(R) = true then return (-2),

      \;

      /*controllare che la matrice in ingresso sia di rotazione*/

      transposeR:trigrat(trigreduce(factor(transpose(R)))),

      finalR:trigrat(trigreduce(factor(R.transposeR))),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if finalR # II then return(-1),

      det:trigsimp(trigreduce(determinant(R))),

      if det # 1 then return(-1),

      \;

      /*controllare e calcolare la variabile trigonometrica 'beta'*/

      if R[3,3] = 1 or R[3,3] = -1 then return(0),

      c[beta]:R[3,3],

      s1[beta]:sqrt(1-(R[3,3]^2)),

      s2[beta]:-sqrt(1-(R[3,3]^2)),

      b[1]:atan2(s1[beta],c[beta]),

      b[2]:atan2(s2[beta],c[beta]),

      \;

      /*controllare e calcolare la varianile trigonometrica 'gamma'*/

      if s1[beta] = 0 then return(0),

      c1[gamma]:R[3,2]/s1[beta],

      c2[gamma]:R[3,2]/s2[beta],

      s1[gamma]:R[3,1]/s1[beta],

      s2[gamma]:R[3,1]/s2[beta],

      g[1]:atan2(s1[gamma],c1[gamma]),

      g[2]:atan2(s2[gamma],c2[gamma]),

      \;

      /*controllare e calcolare la variabile trigonometrica 'alpha'*/

      if s1[beta] = 0 then return(0),

      c1[alpha]:-R[2,3]/s1[beta],

      c2[alpha]:-R[2,3]/s2[beta],

      s1[alpha]:R[1,3]/s1[beta],

      s2[alpha]:R[1,3]/s2[beta],

      a[1]:atan2(s1[alpha],c1[alpha]),

      a[2]:atan2(s2[alpha],c2[alpha]),

      \;

      mat:matrix([variabile,soluzione1,soluzione2],[ALPHA,a[1],a[2]],[BETA,b[1],b[2]],[GAMMA,g[1],g[2]]),

      return(mat)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      RRMatrix:matrix([cos(q[1]+q[2]),-sin(q[1]+q[2]),0],[sin(q[1]+q[2]),cos(q[1]+q[2]),0],[0,0,1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      calcoloOrientamentoXYX(RRMatrix)$
    </input>

    <matrix|<tformat|<table|<row|<cell|<math-up|variabile>>|<cell|<with|math-font-family|rm|soluzione1>>|<cell|<with|math-font-family|rm|soluzione2>>>|<row|<cell|<math-up|ALPHA>>|<cell|<math-up|atan2><around*|(|<frac|sin
    <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
    <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>|<cell|-<math-up|atan2><around*|(|<frac|sin
    <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
    <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>>|<row|<cell|<math-up|BETA>>|<cell|<math-up|atan2><around*|(|<sqrt|1-cos
    <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>,cos
    <around*|(|q<rsub|2>+q<rsub|1>|)>|)>>|<cell|-<math-up|atan2><around*|(|<sqrt|1-cos
    <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>,cos
    <around*|(|q<rsub|2>+q<rsub|1>|)>|)>>>|<row|<cell|<math-up|GAMMA>>|<cell|-<math-up|atan2><around*|(|<frac|sin
    <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
    <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>|<cell|<math-up|atan2><around*|(|<frac|sin
    <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
    <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>>>>>

    \;

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      cartesianoMatrix:matrix([0,0,1],[0,-1,0],[1,0,0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>>|<row|<cell|0>|<cell|-1>|<cell|0>>|<row|<cell|1>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      calcoloOrientamentoXYX(cartesianoMatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|<math-up|variabile>>|<cell|<with|math-font-family|rm|soluzione1>>|<cell|<with|math-font-family|rm|soluzione2>>>|<row|<cell|<math-up|ALPHA>>|<cell|\<pi\>>|<cell|0>>|<row|<cell|<math-up|BETA>>|<cell|<frac|\<pi\>|2>>|<cell|-<frac|\<pi\>|2>>>|<row|<cell|<math-up|GAMMA>>|<cell|0>|<cell|\<pi\>>>>>>>>
    </unfolded-io>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      cilindricoMatrix:matrix([cos(q[1]),0,-sin(q[1])],[sin(q[1]),0,cos(q[1])],[0,-1,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|-sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|-1>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      calcoloOrientamentoXYX(cilindricoMatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|<math-up|variabile>>|<cell|<with|math-font-family|rm|soluzione1>>|<cell|<with|math-font-family|rm|soluzione2>>>|<row|<cell|<math-up|ALPHA>>|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>>>,0|)>>|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>>>,0|)>>>|<row|<cell|<math-up|BETA>>|<cell|<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>>,cos
      <around*|(|q<rsub|1>|)>|)>>|<cell|-<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>>,cos
      <around*|(|q<rsub|1>|)>|)>>>|<row|<cell|<math-up|GAMMA>>|<cell|<math-up|atan2><around*|(|0,-<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>>>|)>>|<cell|<math-up|atan2><around*|(|0,<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>>>|)>>>>>>>>
    </unfolded-io>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      scaraMatrix:matrix([cos(q[1]+q[2]),sin(q[1]+q[2]),0],[sin(q[1]+q[2]),-cos(q[1]+q[2]),0],[0,0,-1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      calcoloOrientamentoXYX(scaraMatrix)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<math-up|variabile>>|<cell|<with|math-font-family|rm|soluzione1>>|<cell|<with|math-font-family|rm|soluzione2>>>|<row|<cell|<math-up|ALPHA>>|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>>|<row|<cell|<math-up|BETA>>|<cell|<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>,cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>|)>>|<cell|-<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>,cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>|)>>>|<row|<cell|<math-up|GAMMA>>|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>>>>>
    </equation*>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      sferico1Matrix:matrix([cos(q[1])*cos(q[2]),sin(q[1]),cos(q[1])*sin(q[2])],[sin(q[1])*cos(q[2]),-cos(q[1]),sin(q[1])*sin(q[2])],[sin(q[2]),0,-cos(q[2])])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><matrix|<tformat|<table|<row|<cell|cos <around*|(|q<rsub|1>|)>*cos
      <around*|(|q<rsub|2>|)>>|<cell|sin <around*|(|q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>>|<cell|-cos
      <around*|(|q<rsub|1>|)>>|<cell|sin <around*|(|q<rsub|1>|)>*sin
      <around*|(|q<rsub|2>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>|)>>|<cell|0>|<cell|-cos
      <around*|(|q<rsub|2>|)>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|input>
      calcoloOrientamentoZXZ(sferico1Matrix)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<math-up|variabile>>|<cell|<with|math-font-family|rm|soluzione1>>|<cell|<with|math-font-family|rm|soluzione2>>>|<row|<cell|<math-up|ALPHA>>|<cell|<math-up|atan2><around*|(|<frac|cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,-<frac|sin
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>>|)>>|<cell|-<math-up|atan2><around*|(|<frac|cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,<frac|sin <around*|(|q<rsub|1>|)>*sin
      <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>>|)>>>|<row|<cell|<math-up|BETA>>|<cell|<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>,-cos
      <around*|(|q<rsub|2>|)>|)>>|<cell|-<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>,-cos
      <around*|(|q<rsub|2>|)>|)>>>|<row|<cell|<math-up|GAMMA>>|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,0|)>>|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,0|)>>>>>>
    </equation*>

    \;

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      sferico2Matrix:matrix([cos(q[1])*cos(q[2]),-sin(q[1]),cos(q[1])*sin(q[2])],[sin(q[1])*cos(q[2]),cos(q[1]),sin(q[1])*sin(q[2])],[-sin(q[2]),0,cos(q[2])])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|cos <around*|(|q<rsub|1>|)>*cos
      <around*|(|q<rsub|2>|)>>|<cell|-sin <around*|(|q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>>|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|sin <around*|(|q<rsub|1>|)>*sin
      <around*|(|q<rsub|2>|)>>>|<row|<cell|-sin
      <around*|(|q<rsub|2>|)>>|<cell|0>|<cell|cos
      <around*|(|q<rsub|2>|)>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|input>
      calcoloOrientamentoZXZ(sferico2Matrix)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<math-up|variabile>>|<cell|<with|math-font-family|rm|soluzione1>>|<cell|<with|math-font-family|rm|soluzione2>>>|<row|<cell|<math-up|ALPHA>>|<cell|<math-up|atan2><around*|(|<frac|cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,-<frac|sin
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>>|)>>|<cell|-<math-up|atan2><around*|(|<frac|cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,<frac|sin <around*|(|q<rsub|1>|)>*sin
      <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>>|)>>>|<row|<cell|<math-up|BETA>>|<cell|<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>,cos
      <around*|(|q<rsub|2>|)>|)>>|<cell|-<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>,cos
      <around*|(|q<rsub|2>|)>|)>>>|<row|<cell|<math-up|GAMMA>>|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,0|)>>|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,0|)>>>>>>
    </equation*>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      antropomorfoMatrix:matrix([cos(q[1])*cos(q[2]+q[3]),-cos(q[1])*sin(q[2]+q[3]),sin(q[1])],[sin(q[1])*cos(q[2]+q[3]),-sin(q[1])*sin(q[2]+q[3]),-cos(q[1])],[sin(q[2]+q[3]),cos(q[2]+q[3]),0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><matrix|<tformat|<table|<row|<cell|cos <around*|(|q<rsub|1>|)>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)>>|<cell|-cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|3>+q<rsub|2>|)>>|<cell|sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin <around*|(|q<rsub|1>|)>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)>>|<cell|-sin
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|3>+q<rsub|2>|)>>|<cell|-cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>>|<cell|cos
      <around*|(|q<rsub|3>+q<rsub|2>|)>>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|input>
      calcoloOrientamentoZXZ(antropomorfoMatrix)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<math-up|variabile>>|<cell|<with|math-font-family|rm|soluzione1>>|<cell|<with|math-font-family|rm|soluzione2>>>|<row|<cell|<math-up|ALPHA>>|<cell|<math-up|atan2><around*|(|sin
      <around*|(|q<rsub|1>|)>,cos <around*|(|q<rsub|1>|)>|)>>|<cell|-<math-up|atan2><around*|(|sin
      <around*|(|q<rsub|1>|)>,-cos <around*|(|q<rsub|1>|)>|)>>>|<row|<cell|<math-up|BETA>>|<cell|<frac|\<pi\>|2>>|<cell|-<frac|\<pi\>|2>>>|<row|<cell|<math-up|GAMMA>>|<cell|<math-up|atan2><around*|(|sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>,cos
      <around*|(|q<rsub|3>+q<rsub|2>|)>|)>>|<cell|-<math-up|atan2><around*|(|sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>,-cos
      <around*|(|q<rsub|3>+q<rsub|2>|)>|)>>>>>>
    </equation*>

    \;
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>