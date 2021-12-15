<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <\with|color|red>
    Procedura che, considerando una delle 6 terne di Eulero, risolve il
    problema dell'orientamento inverso su tutte le strutture portanti
    studiate. Come terna considero la seguente:
    R<rsub|x>(\<alpha\>).R<rsub|y>(\<beta\>).R<rsub|x>(\<gamma\>).
  </with>

  <\session|maxima|default>
    Ricavo la matrice simbolica dal prodotto di
    R<rsub|x>(\<alpha\>).R<rsub|y>(\<beta\>).R<rsub|x>(\<gamma\>):

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      mat_generica(alpha,beta,gamma):=block(

      [Rx1,Rx2,Ry,mat],

      Rx1:matrix([1,0,0],[0,cos(alpha),-sin(alpha)],[0,sin(alpha),cos(alpha)]),

      Rx2:matrix([1,0,0],[0,cos(gamma),-sin(gamma)],[0,sin(gamma),cos(gamma)]),

      Ry:matrix([cos(beta),0,sin(beta)],[0,1,0],[-sin(beta),0,cos(beta)]),

      mat:Rx1.Ry.Rx2,

      let(cos(alpha),c[alpha]),

      let(sin(alpha),s[alpha]),

      let(cos(beta),c[beta]),

      let(sin(beta),s[beta]),

      let(cos(gamma),c[gamma]),

      let(sin(gamma),s[gamma]),

      mat:letsimp(mat)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|mat_generica><around*|(|\<alpha\>,\<beta\>,\<gamma\>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|Rx1>,<with|math-font-family|rm|Rx2>,<math-up|Ry>,<math-up|mat>|]>,<with|math-font-family|rm|Rx1>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>>>>>,<with|math-font-family|rm|Rx2>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<gamma\>|)>>|<cell|-sin
      <around*|(|\<gamma\>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<gamma\>|)>>|<cell|cos <around*|(|\<gamma\>|)>>>>>>,<math-up|Ry>:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<beta\>|)>>|<cell|0>|<cell|sin
      <around*|(|\<beta\>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
      <around*|(|\<beta\>|)>>|<cell|0>|<cell|cos
      <around*|(|\<beta\>|)>>>>>>,<math-up|mat>:<with|math-font-family|rm|Rx1>\<cdot\><math-up|Ry>\<cdot\><with|math-font-family|rm|Rx2>,<math-up|let><around*|(|cos
      <around*|(|\<alpha\>|)>,c<rsub|\<alpha\>>|)>,<math-up|let><around*|(|sin
      <around*|(|\<alpha\>|)>,s<rsub|\<alpha\>>|)>,<math-up|let><around*|(|cos
      <around*|(|\<beta\>|)>,c<rsub|\<beta\>>|)>,<math-up|let><around*|(|sin
      <around*|(|\<beta\>|)>,s<rsub|\<beta\>>|)>,<math-up|let><around*|(|cos
      <around*|(|\<gamma\>|)>,c<rsub|\<gamma\>>|)>,<math-up|let><around*|(|sin
      <around*|(|\<gamma\>|)>,s<rsub|\<gamma\>>|)>,<math-up|mat>:<math-up|letsimp><around*|(|<math-up|mat>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      calcolo_orientamento(R):=block(

      [RT,R_tot,II,det,a,b,g,s,c,sol],

      RT:transpose(R),

      R_tot:trigsimp(R.RT),

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      if R_tot # II then return(0),

      det:trigsimp(determinant(R)),

      if det # 1 then return(0),

      \;

      if R[1,1] = 1 or R[1,1] = -1 then return(0),

      c[beta]:R[1,1],

      s1[beta]:sqrt(1-(R[1,1])^2),

      s2[beta]:-sqrt(1-(R[1,1])^2),

      b[1]:atan2(s1[beta],c[beta]),

      b[2]:atan2(s2[beta],c[beta]),

      \;

      c1[gamma]:R[1,3]/s1[beta],

      c2[gamma]:R[1,3]/s2[beta],

      s1[gamma]:R[1,2]/s1[beta],

      s2[gamma]:R[1,2]/s2[beta],

      g[1]:atan2(s1[gamma],c1[gamma]),

      g[2]:atan2(s2[gamma],c2[gamma]),

      \;

      c1[alpha]:-R[3,1]/s1[beta],

      c2[alpha]:-R[3,1]/s2[beta],

      s1[alpha]:R[2,1]/s1[beta],

      s2[alpha]:R[2,1]/s2[beta],

      a[1]:atan2(s1[alpha],c1[alpha]),

      a[2]:atan2(s2[alpha],c2[alpha]),

      \;

      sol[1]:matrix([a[1]],[b[1]],[g[1]]),

      sol[2]:matrix([a[2]],[b[2]],[g[2]]),

      sol:[sol[1],sol[2]]

      )

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|calcolo_orientamento><around*|(|R|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|RT>,<with|math-font-family|rm|R_tot>,<math-up|II>,<math-up|det>,a,b,g,s,c,<math-up|sol>|]>,<math-up|RT>:<math-up|transpose><around*|(|R|)>,<with|math-font-family|rm|R_tot>:<math-up|trigsimp><around*|(|R\<cdot\><math-up|RT>|)>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><with|math-font-family|rm|R_tot>\<neq\><math-up|II><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|det>:<math-up|trigsimp><around*|(|<math-up|determinant><around*|(|R|)>|)>,<math-bf|if><space|0.27em><math-up|det>\<neq\>1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em>R<rsub|1,1>=1\<vee\>R<rsub|1,1>=-1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,c<rsub|\<beta\>>:R<rsub|1,1>,<with|math-font-family|rm|s1><rsub|\<beta\>>:<sqrt|1-R<rsub|1,1><rsup|2>>,<with|math-font-family|rm|s2><rsub|\<beta\>>:-<sqrt|1-R<rsub|1,1><rsup|2>>,b<rsub|1>:<math-up|atan2><around*|(|<with|math-font-family|rm|s1><rsub|\<beta\>>,c<rsub|\<beta\>>|)>,b<rsub|2>:<math-up|atan2><around*|(|<with|math-font-family|rm|s2><rsub|\<beta\>>,c<rsub|\<beta\>>|)>,<with|math-font-family|rm|c1><rsub|\<gamma\>>:<frac|R<rsub|1,3>|<with|math-font-family|rm|s1><rsub|\<beta\>>>,<with|math-font-family|rm|c2><rsub|\<gamma\>>:<frac|R<rsub|1,3>|<with|math-font-family|rm|s2><rsub|\<beta\>>>,<with|math-font-family|rm|s1><rsub|\<gamma\>>:<frac|R<rsub|1,2>|<with|math-font-family|rm|s1><rsub|\<beta\>>>,<with|math-font-family|rm|s2><rsub|\<gamma\>>:<frac|R<rsub|1,2>|<with|math-font-family|rm|s2><rsub|\<beta\>>>,g<rsub|1>:<math-up|atan2><around*|(|<with|math-font-family|rm|s1><rsub|\<gamma\>>,<with|math-font-family|rm|c1><rsub|\<gamma\>>|)>,g<rsub|2>:<math-up|atan2><around*|(|<with|math-font-family|rm|s2><rsub|\<gamma\>>,<with|math-font-family|rm|c2><rsub|\<gamma\>>|)>,<with|math-font-family|rm|c1><rsub|\<alpha\>>:<frac|-R<rsub|3,1>|<with|math-font-family|rm|s1><rsub|\<beta\>>>,<with|math-font-family|rm|c2><rsub|\<alpha\>>:<frac|-R<rsub|3,1>|<with|math-font-family|rm|s2><rsub|\<beta\>>>,<with|math-font-family|rm|s1><rsub|\<alpha\>>:<frac|R<rsub|2,1>|<with|math-font-family|rm|s1><rsub|\<beta\>>>,<with|math-font-family|rm|s2><rsub|\<alpha\>>:<frac|R<rsub|2,1>|<with|math-font-family|rm|s2><rsub|\<beta\>>>,a<rsub|1>:<math-up|atan2><around*|(|<with|math-font-family|rm|s1><rsub|\<alpha\>>,<with|math-font-family|rm|c1><rsub|\<alpha\>>|)>,a<rsub|2>:<math-up|atan2><around*|(|<with|math-font-family|rm|s2><rsub|\<alpha\>>,<with|math-font-family|rm|c2><rsub|\<alpha\>>|)>,<math-up|sol><rsub|1>:<matrix|<tformat|<table|<row|<cell|a<rsub|1>>>|<row|<cell|b<rsub|1>>>|<row|<cell|g<rsub|1>>>>>>,<math-up|sol><rsub|2>:<matrix|<tformat|<table|<row|<cell|a<rsub|2>>>|<row|<cell|b<rsub|2>>>|<row|<cell|g<rsub|2>>>>>>,<math-up|sol>:<around*|[|<math-up|sol><rsub|1>,<math-up|sol><rsub|2>|]>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      R_RR:matrix([cos(q[1]+q[2]),-sin(q[1]+q[2]),0],[sin(q[1]+q[2]),cos(q[1]+q[2]),0],[0,0,1])
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
      orientamento_RR:calcolo_orientamento(R_RR)$
    </input>

    \;

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>>|<row|<cell|<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>,cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>|)>>>|<row|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>>>>>,<matrix|<tformat|<table|<row|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>>|<row|<cell|-<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>,cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>|)>>>|<row|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>>>>>
    </equation*>

    \;

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      R_PPP:matrix([0,0,1],[0,-1,0],[1,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>>|<row|<cell|0>|<cell|-1>|<cell|0>>|<row|<cell|1>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      orientamento_PPP:calcolo_orientamento(R_PPP)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|\<pi\>>>|<row|<cell|<frac|\<pi\>|2>>>|<row|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|-<frac|\<pi\>|2>>>|<row|<cell|\<pi\>>>>>>
    </equation*>

    \;

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      R_RPP:matrix([cos(q[1]),0,-sin(q[1])],[sin(q[1]),0,cos(q[1])],[0,-1,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|-sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|-1>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      orientamento_RPP:calcolo_orientamento(R_RPP)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>>>,0|)>>>|<row|<cell|<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>>,cos
      <around*|(|q<rsub|1>|)>|)>>>|<row|<cell|<math-up|atan2><around*|(|0,-<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>>>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>>>,0|)>>>|<row|<cell|-<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>>,cos
      <around*|(|q<rsub|1>|)>|)>>>|<row|<cell|<math-up|atan2><around*|(|0,<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>>>|)>>>>>>
    </equation*>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      R_SCARA_STRUTTURA:matrix([cos(q[1]+q[2]),-sin(q[1]+q[2]),0],[sin(q[1]+q[2]),cos(q[1]+q[2]),0],[0,0,1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      orientamento_SCARA_STRUTTURA:calcolo_orientamento(R_SCARA_STRUTTURA)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>>|<row|<cell|<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>,cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>|)>>>|<row|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>>>>>,<matrix|<tformat|<table|<row|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>>|<row|<cell|-<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>,cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>|)>>>|<row|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>|<sqrt|1-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)><rsup|2>>>,0|)>>>>>>
    </equation*>

    \;

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      R_SFERICO1_STRUTTURA:matrix([cos(q[1])*cos(q[2]),sin(q[1]),cos(q[1])*sin(q[2])],[sin(q[1])*cos(q[2]),-cos(q[1]),sin(q[1])*sin(q[2])],[sin(q[2]),0,-cos(q[2])])
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
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      orientamento_SFERICO1_STRUTTURA:calcolo_orientamento(R_SFERICO1_STRUTTURA)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,-<frac|sin
      <around*|(|q<rsub|2>|)>|<sqrt|1-cos <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>|)>>>|<row|<cell|<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>,cos <around*|(|q<rsub|1>|)>*cos
      <around*|(|q<rsub|2>|)>|)>>>|<row|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,<frac|cos <around*|(|q<rsub|1>|)>*sin
      <around*|(|q<rsub|2>|)>|<sqrt|1-cos <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,<frac|sin
      <around*|(|q<rsub|2>|)>|<sqrt|1-cos <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>|)>>>|<row|<cell|-<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>,cos <around*|(|q<rsub|1>|)>*cos
      <around*|(|q<rsub|2>|)>|)>>>|<row|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,-<frac|cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>|)>>>>>>
    </equation*>

    \;

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      R_SFERICO2_STRUTTURA:matrix([cos(q[1])*cos(q[2]),-sin(q[1]),cos(q[1])*sin(q[2])],[sin(q[1])*cos(q[2]),cos(q[1]),sin(q[1])*sin(q[2])],[-sin(q[2]),0,cos(q[2])])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
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
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|input>
      orientamento_SFERICO2_STRUTTURA:calcolo_orientamento(R_SFERICO2_STRUTTURA)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,<frac|sin
      <around*|(|q<rsub|2>|)>|<sqrt|1-cos <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>|)>>>|<row|<cell|<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>,cos <around*|(|q<rsub|1>|)>*cos
      <around*|(|q<rsub|2>|)>|)>>>|<row|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,<frac|cos <around*|(|q<rsub|1>|)>*sin
      <around*|(|q<rsub|2>|)>|<sqrt|1-cos <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,-<frac|sin
      <around*|(|q<rsub|2>|)>|<sqrt|1-cos <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>|)>>>|<row|<cell|-<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>,cos <around*|(|q<rsub|1>|)>*cos
      <around*|(|q<rsub|2>|)>|)>>>|<row|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>,-<frac|cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|2>|)><rsup|2>>>|)>>>>>>
    </equation*>

    \;

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      R_ANTROPOMORFO_STRUTTURA:matrix([cos(q[1])*cos(q[2]+q[3]),-cos(q[1])*sin(q[2]+q[3]),sin(q[1])],[sin(q[1])*cos(q[2]+q[3]),-sin(q[1])*sin(q[2]+q[3]),-cos(q[1])],[sin(q[2]+q[3]),cos(q[2]+q[3]),0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
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
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      orientamento_ANTROPOMORFO_STRUTTURA:calcolo_orientamento(R_ANTROPOMORFO_STRUTTURA)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|3>+q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)><rsup|2>>>,-<frac|sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)><rsup|2>>>|)>>>|<row|<cell|<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)><rsup|2>>,cos
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|3>+q<rsub|2>|)>|)>>>|<row|<cell|-<math-up|atan2><around*|(|<frac|cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|3>+q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)><rsup|2>>>,<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)><rsup|2>>>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|-<math-up|atan2><around*|(|<frac|sin
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|3>+q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)><rsup|2>>>,<frac|sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)><rsup|2>>>|)>>>|<row|<cell|-<math-up|atan2><around*|(|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)><rsup|2>>,cos
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|3>+q<rsub|2>|)>|)>>>|<row|<cell|<math-up|atan2><around*|(|<frac|cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|3>+q<rsub|2>|)>|<sqrt|1-cos
      <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)><rsup|2>>>,-<frac|sin
      <around*|(|q<rsub|1>|)>|<sqrt|1-cos <around*|(|q<rsub|1>|)><rsup|2>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)><rsup|2>>>|)>>>>>>
    </equation*>

    \;
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>