<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <with|color|red|Procedura 1: Funzioni varie per il calcolo della matrice di
  avvitamento, matrice della cinematica diretta, tabella di D-H,
  semplificazione dei coseni e seni, ecc.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      semplifica(Q):=block(

      let(cos(q[1]),c[1]),

      let(sin(q[1]),s[1]),

      let(cos(q[2]),c[2]),

      let(sin(q[2]),s[2]),

      let(cos(q[3]),c[3]),

      let(sin(q[3]),s[3]),

      let(cos(q[4]),c[4]),

      let(sin(q[4]),s[4]),

      let(cos(q[5]),c[5]),

      let(sin(q[5]),s[5]),

      let(cos(q[6]),c[6]),

      let(sin(q[6]),s[6]),

      let(cos(q[1]+q[2]),c[12]),

      let(sin(q[1]+q[2]),s[12]),

      let(sin(q[1]+q[2]+q[4]),s[124]),

      let(cos(q[1]+q[2]+q[4]),c[124]),

      let(cos(q[2]+q[3]),c[23]),

      let(sin(q[2]+q[3]),s[23]),

      Q:letsimp(Q)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      mat_rotazione(vet,angolo):=block(

      [norma2,S,theta,II,sII,sIImS,sIImS_inv,mat],

      norma2:sqrt((vet[1,1])^2+(vet[2,1])^2+(vet[3,1])^2),

      if norma2 # 1 then S: (1/norma2).(matrix([0,-vet[3,1],vet[2,1]],[vet[3,1],0,-vet[1,1]],[-vet[2,1],vet[1,1],0]))
      else S: matrix([0,-vet[3,1],vet[2,1]],[vet[3,1],0,-vet[1,1]],[-vet[2,1],vet[1,1],0]),

      theta:angolo,

      if norma2 # 1 then theta:theta.norma2,

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      sII:s*II,

      sIImS:sII-S,

      sIImS_inv:invert(sIImS),

      mat:matrix([ilt(sIImS_inv[1,1],s,t),ilt(sIImS_inv[1,2],s,t),ilt(sIImS_inv[1,3],s,t)],[ilt(sIImS_inv[2,1],s,t),ilt(sIImS_inv[2,2],s,t),ilt(sIImS_inv[2,3],s,t)],[ilt(sIImS_inv[3,1],s,t),ilt(sIImS_inv[3,2],s,t),ilt(sIImS_inv[3,3],s,t)]),

      mat:subst(t=theta,mat),

      mat:factor(mat)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      mat_avvitamento(vettore,angolo,spostamento):=block(

      [R,norma2,D,Q],

      R:mat_rotazione(vettore,angolo),

      norma2:sqrt((vettore[1,1]^2)+(vettore[2,1])^2+(vettore[3,1]^2)),

      if norma2 # 1 then D:spostamento*(vettore/norma2) else
      D:spostamento*vettore,

      Q:matrix([R[1,1],R[1,2],R[1,3],D[1,1]],[R[2,1],R[2,2],R[2,3],D[2,1]],[R[3,1],R[3,2],R[3,3],D[3,1]],[0,0,0,1]),

      Q

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      mat_Qi(theta,d,alpha,a):=block(

      [AVz,AVx,Q],

      AVz:mat_avvitamento(matrix([0],[0],[1]),theta,d),

      AVx:mat_avvitamento(matrix([1],[0],[0]),alpha,a),

      Q:AVz.AVx

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      create_tab(theta,d,alpha,a):=block(

      [lngth,tab,II,mat],

      lngth:length(theta),

      tab:matrix([THETA,D,ALPHA,A]),

      II:matrix([1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]),

      for i:1 thru lngth do (

      mat:matrix([theta[i],d[i],alpha[i],a[i]]),

      tab:addrow(tab,mat)

      ),

      [tab,lngth]

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      create_Q(tab,lngth):=block(

      [reduce,prereduce,mat,mat1,Q_tot],

      reduce:0,

      mat:matrix([1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]),

      for i:1 thru lngth do (

      Q[i]:mat_Qi(tab[i+1,1],tab[i+1,2],tab[i+1,3],tab[i+1,4]),

      \ \ \ \ \ \ \ \ \ \ \ 

      if tab[i,1] # 0 and tab[i,3] = 0 then reduce:1 else reduce:0,

      \;

      if tab[i,1] = 0 and tab[i,3] = 0 and tab[i-1,1] # 0 and tab[i-1,3] = 0
      then reduce:1,

      \;

      if i \<gtr\> 2 and prereduce = 0 and reduce = 1 then
      (mat1:trigreduce(Q[i-1].Q[i]),mat:trigsimp(Q[i-2].mat1))

      else if reduce = 1 then mat:trigreduce(mat.Q[i]) else
      mat:trigsimp(mat.Q[i]),

      \;

      prereduce:reduce

      ),

      Q_tot:fullratsimp(mat)

      )$
    </input>

    \;

    \;

    <with|color|red|Procedura 2: Procedura per il calcolo dell'energia
    potenziale gravitazionale associata ad ogni link ed al robot totale, per
    calcolarla viene passato in input la tabella DH e i sistemi di
    riferimento dei baricentri.>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      main_func(DH_tab,bc):=block(

      [U,G_T],

      U:zeromatrix(DH_tab[2],1),

      \;

      if DH_tab[1][2,1] = q[1] and DH_tab[1][2,2] = L[1] then
      \ G_T:matrix([0,0,-g]),

      if DH_tab[1][2,1] = q[1] and DH_tab[1][2,2] = 0 then
      G_T:matrix([0,-g,0]),

      if DH_tab[1][2,2] = q[1] then G_T:matrix([0,0,-g]),

      \;

      for i:1 thru DH_tab[2] do (

      \ Q[i]:create_Q(DH_tab[1],i),

      \ if bc[i,1] # 0 then Q[i]:Q[i].matrix([1,0,0,-bc[i,1]],[0,1,0,0],[0,0,1,0],
      \ [0,0,0,1]),

      \ if bc[i,2] # 0 then Q[i]:Q[i].matrix([1,0,0,0],[0,1,0,-bc[i,2]],[0,0,1,0],
      \ [0,0,0,1]),

      \ if bc[i,3] # 0 then Q[i]:Q[i].matrix([1,0,0,0],[0,1,0,0],[0,0,1,-bc[i,3]],
      \ [0,0,0,1]),

      \ d:matrix([Q[i][1,4]],[Q[i][2,4]],[Q[i][3,4]]),

      \ 

      \ U[i,1]:-M[i]*(G_T.d),

      \ U[i,1]:semplifica(U[i,1])

      ),

      U_tot:0,

      for i:1 thru DH_tab[2] do (

      \ U_tot:U_tot+U[i,1]

      ),

      U_tot:fullratsimp(U_tot),

      return(U_tot)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><with|math-font-family|rm|main_func><around*|(|<with|math-font-family|rm|DH_tab>,<math-up|bc>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|U,<with|math-font-family|rm|G_T>|]>,U:<math-up|zeromatrix><around*|(|<with|math-font-family|rm|DH_tab><rsub|2>,1|)>,<math-bf|if><space|0.27em><around*|(|<with|math-font-family|rm|DH_tab><rsub|1>|)><rsub|2,1>=q<rsub|1>\<wedge\><around*|(|<with|math-font-family|rm|DH_tab><rsub|1>|)><rsub|2,2>=L<rsub|1><space|0.27em><math-bf|then><space|0.27em><with|math-font-family|rm|G_T>:<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|-g>>>>>,<math-bf|if><space|0.27em><around*|(|<with|math-font-family|rm|DH_tab><rsub|1>|)><rsub|2,1>=q<rsub|1>\<wedge\><around*|(|<with|math-font-family|rm|DH_tab><rsub|1>|)><rsub|2,2>=0<space|0.27em><math-bf|then><space|0.27em><with|math-font-family|rm|G_T>:<matrix|<tformat|<table|<row|<cell|0>|<cell|-g>|<cell|0>>>>>,<math-bf|if><space|0.27em><around*|(|<with|math-font-family|rm|DH_tab><rsub|1>|)><rsub|2,2>=q<rsub|1><space|0.27em><math-bf|then><space|0.27em><with|math-font-family|rm|G_T>:<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|-g>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><with|math-font-family|rm|DH_tab><rsub|2><space|0.27em><math-bf|do><space|0.27em><around*|(|Q<rsub|i>:<with|math-font-family|rm|create_Q><around*|(|<with|math-font-family|rm|DH_tab><rsub|1>,i|)>,<math-bf|if><space|0.27em><math-up|bc><rsub|i,1>\<neq\>0<space|0.27em><math-bf|then><space|0.27em>Q<rsub|i>:Q<rsub|i>\<cdot\><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|-<math-up|bc><rsub|i,1>>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><math-up|bc><rsub|i,2>\<neq\>0<space|0.27em><math-bf|then><space|0.27em>Q<rsub|i>:Q<rsub|i>\<cdot\><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|-<math-up|bc><rsub|i,2>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><math-up|bc><rsub|i,3>\<neq\>0<space|0.27em><math-bf|then><space|0.27em>Q<rsub|i>:Q<rsub|i>\<cdot\><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|-<math-up|bc><rsub|i,3>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,d:<matrix|<tformat|<table|<row|<cell|<around*|(|Q<rsub|i>|)><rsub|1,4>>>|<row|<cell|<around*|(|Q<rsub|i>|)><rsub|2,4>>>|<row|<cell|<around*|(|Q<rsub|i>|)><rsub|3,4>>>>>>,U<rsub|i,1>:<around*|(|-M<rsub|i>|)>*<with|math-font-family|rm|G_T>\<cdot\>d,U<rsub|i,1>:<math-up|semplifica><around*|(|U<rsub|i,1>|)>|)>,<with|math-font-family|rm|U_tot>:0,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><with|math-font-family|rm|DH_tab><rsub|2><space|0.27em><math-bf|do><space|0.27em><with|math-font-family|rm|U_tot>:<with|math-font-family|rm|U_tot>+U<rsub|i,1>,<with|math-font-family|rm|U_tot>:<math-up|fullratsimp><around*|(|<with|math-font-family|rm|U_tot>|)>,<math-up|return><around*|(|<with|math-font-family|rm|U_tot>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      RR_tab:create_tab([%pi/2,q[2]],[q[1],0],[%pi/2,0],[0,L[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|<frac|\<pi\>|2>>|<cell|q<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>>>>,2|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      RR:main_func(RR_tab,matrix([0,0,0],[0,0,0]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|(|L<rsub|2>*M<rsub|2>*s<rsub|2>+q<rsub|1>*M<rsub|2>+M<rsub|1>*q<rsub|1>|)>*g>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      RPP_tab:create_tab([q[1],0,0],[L[1],q[2],q[3]],[0,-%pi/2,0],[0,0,0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      RPP:main_func(RPP_tab,matrix([0,0,0],[0,0,0],[0,0,0]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|(|<around*|(|q<rsub|2>+L<rsub|1>|)>*M<rsub|3>+M<rsub|2>*q<rsub|2>+L<rsub|1>*M<rsub|2>+L<rsub|1>*M<rsub|1>|)>*g>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>