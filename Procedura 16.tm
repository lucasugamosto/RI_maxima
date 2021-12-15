<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <with|color|red|Procedura 1: Procedura che calcola le matrici della
  cinematica diretta di ogni singolo robot visto a lezione.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
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
      <with|color|red|(<with|math-font-family|rm|%i>32) >
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
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|input>
      mat_Qi(theta,d,alpha,a):=block(

      [AVz,AVx,Q],

      AVz:mat_avvitamento(matrix([0],[0],[1]),theta,d),

      AVx:mat_avvitamento(matrix([1],[0],[0]),alpha,a),

      Q:AVz.AVx

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
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

    \;

    \;

    Sotto-funzione che riceve in ingresso i valori di \<theta\>,d,\<alpha\>,a
    e restituisce in uscita la tabella di DH e il numero di righe di cui si
    compone (=numero di DOF=numero di lettere R o P).

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
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

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >><with|math-font-family|rm|create_tab><around*|(|\<vartheta\>,d,\<alpha\>,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|lngth>,<math-up|tab>,<math-up|II>,<math-up|mat>|]>,<math-up|lngth>:<math-up|length><around*|(|\<vartheta\>|)>,<math-up|tab>:<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>>>>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|lngth><space|0.27em><math-bf|do><space|0.27em><around*|(|<math-up|mat>:<matrix|<tformat|<table|<row|<cell|\<vartheta\><rsub|i>>|<cell|d<rsub|i>>|<cell|\<alpha\><rsub|i>>|<cell|a<rsub|i>>>>>>,<math-up|tab>:<math-up|addrow><around*|(|<math-up|tab>,<math-up|mat>|)>|)>,<around*|[|<math-up|tab>,<math-up|lngth>|]>|)>>>
    </unfolded-io>

    \;

    \;

    Funzione che calcola la matrice di cinematica diretta totale Q di un
    robot generico passando in ingresso la tabella di D-H.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|unfolded-io>
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

      Q_tot:fullratsimp(semplifica(mat))

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
      >><with|math-font-family|rm|create_Q><around*|(|<math-up|tab>,<math-up|lngth>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|reduce>,<math-up|prereduce>,<math-up|mat>,<with|math-font-family|rm|mat1>,<with|math-font-family|rm|Q_tot>|]>,<math-up|reduce>:0,<math-up|mat>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|lngth><space|0.27em><math-bf|do><space|0.27em><around*|(|Q<rsub|i>:<with|math-font-family|rm|mat_Qi><around*|(|<math-up|tab><rsub|i+1,1>,<math-up|tab><rsub|i+1,2>,<math-up|tab><rsub|i+1,3>,<math-up|tab><rsub|i+1,4>|)>,<math-bf|if><space|0.27em><math-up|tab><rsub|i,1>\<neq\>0\<wedge\><math-up|tab><rsub|i,3>=0<space|0.27em><math-bf|then><space|0.27em><math-up|reduce>:1<space|0.27em><math-bf|else><space|0.27em><math-up|reduce>:0,<math-bf|if><space|0.27em><math-up|tab><rsub|i,1>=0\<wedge\><math-up|tab><rsub|i,3>=0\<wedge\><math-up|tab><rsub|i-1,1>\<neq\>0\<wedge\><math-up|tab><rsub|i-1,3>=0<space|0.27em><math-bf|then><space|0.27em><math-up|reduce>:1,<math-bf|if><space|0.27em>i\<gtr\>2\<wedge\><math-up|prereduce>=0\<wedge\><math-up|reduce>=1<space|0.27em><math-bf|then><space|0.27em><around*|(|<with|math-font-family|rm|mat1>:<math-up|trigreduce><around*|(|Q<rsub|i-1>\<cdot\>Q<rsub|i>|)>,<math-up|mat>:<math-up|trigsimp><around*|(|Q<rsub|i-2>\<cdot\><with|math-font-family|rm|mat1>|)>|)><space|0.27em><math-bf|else><space|0.27em><around*|(|<math-bf|if><space|0.27em><math-up|reduce>=1<space|0.27em><math-bf|then><space|0.27em><math-up|mat>:<math-up|trigreduce><around*|(|<math-up|mat>\<cdot\>Q<rsub|i>|)><space|0.27em><math-bf|else><space|0.27em><math-up|mat>:<math-up|trigsimp><around*|(|<math-up|mat>\<cdot\>Q<rsub|i>|)>|)>,<math-up|prereduce>:<math-up|reduce>|)>,<with|math-font-family|rm|Q_tot>:<math-up|fullratsimp><around*|(|<math-up|semplifica><around*|(|<math-up|mat>|)>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|unfolded-io>
      DH_RR:create_tab([q[1],q[2]],[0,0],[0,0],[L[1],L[2]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o37>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|0>|<cell|0>|<cell|L<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>>>>,2|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      Q_RR:create_Q(DH_RR[1],DH_RR[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|12>>|<cell|-s<rsub|12>>|<cell|0>|<cell|L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|12>>|<cell|c<rsub|12>>|<cell|0>|<cell|L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|unfolded-io>
      DH_PPP:create_tab([0,-%pi/2,0],[q[1],q[2],q[3]],[-%pi/2,-%pi/2,0],[0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o39>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|0>|<cell|q<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|-<frac|\<pi\>|2>>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>40) >
    <|unfolded-io>
      Q_PPP:create_Q(DH_PPP[1],DH_PPP[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o40>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>41) >
    <|unfolded-io>
      DH_RPP:create_tab([q[1],0,0],[L[1],q[2],q[3]],[0,-%pi/2,0],[0,0,0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o41>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>42) >
    <|unfolded-io>
      Q_RPP:create_Q(DH_RPP[1],DH_RPP[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o42>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|0>|<cell|-s<rsub|1>>|<cell|-s<rsub|1>*q<rsub|3>>>|<row|<cell|s<rsub|1>>|<cell|0>|<cell|c<rsub|1>>|<cell|c<rsub|1>*q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>43) >
    <|unfolded-io>
      DH_SCARA:create_tab([q[1],q[2],0,q[4],q[5],q[6]],[L[1],L[2],q[3],0,0,L[6]],[0,0,0,-%pi/2,-%pi/2,0],[D[1],D[2],0,0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o43>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|D<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|q<rsub|4>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|5>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|6>>|<cell|L<rsub|6>>|<cell|0>|<cell|0>>>>>,6|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>44) >
    <|unfolded-io>
      Q_SCARA:create_Q(DH_SCARA[1],DH_SCARA[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o44>)
      >><matrix|<tformat|<table|<row|<cell|s<rsub|6>*s<rsub|124>+c<rsub|5>*c<rsub|6>*c<rsub|124>>|<cell|c<rsub|6>*s<rsub|124>-c<rsub|5>*s<rsub|6>*c<rsub|124>>|<cell|-s<rsub|5>*c<rsub|124>>|<cell|-s<rsub|5>*L<rsub|6>*c<rsub|124>+D<rsub|2>*c<rsub|12>+D<rsub|1>*c<rsub|1>>>|<row|<cell|c<rsub|5>*c<rsub|6>*s<rsub|124>-s<rsub|6>*c<rsub|124>>|<cell|-c<rsub|5>*s<rsub|6>*s<rsub|124>-c<rsub|6>*c<rsub|124>>|<cell|-s<rsub|5>*s<rsub|124>>|<cell|-s<rsub|5>*L<rsub|6>*s<rsub|124>+D<rsub|2>*s<rsub|12>+D<rsub|1>*s<rsub|1>>>|<row|<cell|-s<rsub|5>*c<rsub|6>>|<cell|s<rsub|5>*s<rsub|6>>|<cell|-c<rsub|5>>|<cell|-c<rsub|5>*L<rsub|6>+q<rsub|3>+L<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>45) >
    <|unfolded-io>
      DH_SCARA_STRUTTURA:create_tab([q[1],q[2],0],[L[1],L[2],q[3]],[0,0,0],[D[1],D[2],0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o45>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|D<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>46) >
    <|unfolded-io>
      Q_SCARA_STRUTTURA:create_Q(DH_SCARA_STRUTTURA[1],DH_SCARA_STRUTTURA[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o46>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|12>>|<cell|-s<rsub|12>>|<cell|0>|<cell|D<rsub|2>*c<rsub|12>+D<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|12>>|<cell|c<rsub|12>>|<cell|0>|<cell|D<rsub|2>*s<rsub|12>+D<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>+L<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>47) >
    <|unfolded-io>
      DH_SFERICO1:create_tab([q[1],q[2],0,q[4],q[5],q[6]],[L[1],0,q[3],0,0,L[6]],[%pi/2,%pi/2,0,%pi/2,-%pi/2,0],[0,L[2],0,0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o47>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|L<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|q<rsub|4>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|5>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|6>>|<cell|L<rsub|6>>|<cell|0>|<cell|0>>>>>,6|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>48) >
    <|unfolded-io>
      Q_SFERICO1:create_Q(DH_SFERICO1[1],DH_SFERICO1[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o48>)
      >><matrix|<tformat|<table|<row|<cell|<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*s<rsub|6>+<around*|(|c<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|s<rsub|1>*s<rsub|4>+c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|5>|)>*s<rsub|6>+<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>+c<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*s<rsub|6>+<around*|(|s<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|s<rsub|1>*c<rsub|2>*c<rsub|4>-c<rsub|1>*s<rsub|4>|)>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|5>|)>*s<rsub|6>+<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>+s<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|s<rsub|2>*c<rsub|4>*c<rsub|5>-c<rsub|2>*s<rsub|5>|)>*c<rsub|6>-s<rsub|2>*s<rsub|4>*s<rsub|6>>|<cell|<around*|(|c<rsub|2>*s<rsub|5>-s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*s<rsub|6>-s<rsub|2>*s<rsub|4>*c<rsub|6>>|<cell|-s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>>|<cell|<around*|(|-s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    <\math>
      <matrix|<tformat|<table|<row|<cell|<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*s<rsub|6>+<around*|(|c<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|s<rsub|1>*s<rsub|4>+c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|5>|)>*s<rsub|6>+<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>+c<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*s<rsub|6>+<around*|(|s<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|s<rsub|1>*c<rsub|2>*c<rsub|4>-c<rsub|1>*s<rsub|4>|)>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|5>|)>*s<rsub|6>+<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>+s<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|s<rsub|2>*c<rsub|4>*c<rsub|5>-c<rsub|2>*s<rsub|5>|)>*c<rsub|6>-s<rsub|2>*s<rsub|4>*s<rsub|6>>|<cell|<around*|(|c<rsub|2>*s<rsub|5>-s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*s<rsub|6>-s<rsub|2>*s<rsub|4>*c<rsub|6>>|<cell|-s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>>|<cell|<around*|(|-s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>
    </math>

    \;

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>49) >
    <|unfolded-io>
      DH_SFERICO1_STRUTTURA:create_tab([q[1],q[2],0],[L[1],0,q[3]],[%pi/2,%pi/2,0],[0,L[2],0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o49>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|L<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>50) >
    <|unfolded-io>
      Q_SFERICO1_STRUTTURA:create_Q(DH_SFERICO1_STRUTTURA[1],DH_SFERICO1_STRUTTURA[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o50>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|2>>|<cell|0>|<cell|-c<rsub|2>>|<cell|-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>51) >
    <|unfolded-io>
      DH_SFERICO2:create_tab([q[1],q[2],0,q[4],q[5],q[6]],[L[1],L[2],q[3],0,0,L[6]],[-%pi/2,-%pi/2,0,%pi/2,-%pi/2,0],[0,0,0,0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o51>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|q<rsub|4>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|5>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|6>>|<cell|L<rsub|6>>|<cell|0>|<cell|0>>>>>,6|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>52) >
    <|unfolded-io>
      Q_SFERICO2:create_Q(DH_SFERICO2[1],DH_SFERICO2[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o52>)
      >><matrix|<tformat|<table|<row|<cell|<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*s<rsub|6>+<around*|(|<around*|(|s<rsub|1>*s<rsub|4>+c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*s<rsub|6>+<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-c<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-c<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*s<rsub|6>+<around*|(|<around*|(|s<rsub|1>*c<rsub|2>*c<rsub|4>-c<rsub|1>*s<rsub|4>|)>*c<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|s<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*s<rsub|6>+<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-s<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-s<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>-s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|2>*s<rsub|4>*s<rsub|6>+<around*|(|-c<rsub|2>*s<rsub|5>-s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|2>*s<rsub|5>+s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*s<rsub|6>+s<rsub|2>*s<rsub|4>*c<rsub|6>>|<cell|s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>>|<cell|<around*|(|s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    <math|<matrix|<tformat|<table|<row|<cell|<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*s<rsub|6>+<around*|(|<around*|(|s<rsub|1>*s<rsub|4>+c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*s<rsub|6>+<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-c<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-c<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*s<rsub|6>+<around*|(|<around*|(|s<rsub|1>*c<rsub|2>*c<rsub|4>-c<rsub|1>*s<rsub|4>|)>*c<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|s<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*s<rsub|6>+<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-s<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-s<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>-s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|2>*s<rsub|4>*s<rsub|6>+<around*|(|-c<rsub|2>*s<rsub|5>-s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|2>*s<rsub|5>+s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*s<rsub|6>+s<rsub|2>*s<rsub|4>*c<rsub|6>>|<cell|s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>>|<cell|<around*|(|s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>53) >
    <|unfolded-io>
      DH_SFERICO2_STRUTTURA:create_tab([q[1],q[2],0],[L[1],L[2],q[3]],[-%pi/2,%pi/2,0],[0,0,0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o53>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>54) >
    <|unfolded-io>
      Q_SFERICO2_STRUTTURA:create_Q(DH_SFERICO2_STRUTTURA[1],DH_SFERICO2_STRUTTURA[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o54>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|-s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|-s<rsub|2>>|<cell|0>|<cell|c<rsub|2>>|<cell|c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>55) >
    <|unfolded-io>
      DH_ANTROPOMORFO:create_tab([q[1],q[2],q[3],q[4],q[5],q[6]],[L[1],0,0,0,0,L[6]],[%pi/2,0,%pi/2,%pi/2,-%pi/2,0],[0,L[2],0,0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o55>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>|<row|<cell|q<rsub|3>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|4>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|5>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|6>>|<cell|L<rsub|6>>|<cell|0>|<cell|0>>>>>,6|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>56) >
    <|unfolded-io>
      Q_ANTROPOMORFO:create_Q(DH_ANTROPOMORFO[1],DH_ANTROPOMORFO[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o56>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|23>+<around*|(|c<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>-c<rsub|1>*s<rsub|4>*s<rsub|6>|)>*c<rsub|23>+s<rsub|1>*c<rsub|4>*s<rsub|6>+s<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-c<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|23>+<around*|(|-c<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|6>|)>*c<rsub|23>-s<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|5>*s<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|23>-s<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|c<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|23>-s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|23>+<around*|(|s<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|4>*s<rsub|6>|)>*c<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-s<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|23>+<around*|(|-s<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|6>|)>*c<rsub|23>+c<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|5>*s<rsub|23>-s<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|23>+c<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|s<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|23>-s<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|23>+c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>|)>*s<rsub|23>-s<rsub|5>*c<rsub|6>*c<rsub|23>>|<cell|<around*|(|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>|)>*s<rsub|23>+s<rsub|5>*s<rsub|6>*c<rsub|23>>|<cell|-c<rsub|4>*s<rsub|5>*s<rsub|23>-c<rsub|5>*c<rsub|23>>|<cell|-c<rsub|4>*s<rsub|5>*L<rsub|6>*s<rsub|23>-c<rsub|5>*L<rsub|6>*c<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    <math|<matrix|<tformat|<table|<row|<cell|c<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|23>+<around*|(|c<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>-c<rsub|1>*s<rsub|4>*s<rsub|6>|)>*c<rsub|23>+s<rsub|1>*c<rsub|4>*s<rsub|6>+s<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-c<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|23>+<around*|(|-c<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|6>|)>*c<rsub|23>-s<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|5>*s<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|23>-s<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|c<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|23>-s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|23>+<around*|(|s<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|4>*s<rsub|6>|)>*c<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-s<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|23>+<around*|(|-s<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|6>|)>*c<rsub|23>+c<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|5>*s<rsub|23>-s<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|23>+c<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|s<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|23>-s<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|23>+c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>|)>*s<rsub|23>-s<rsub|5>*c<rsub|6>*c<rsub|23>>|<cell|<around*|(|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>|)>*s<rsub|23>+s<rsub|5>*s<rsub|6>*c<rsub|23>>|<cell|-c<rsub|4>*s<rsub|5>*s<rsub|23>-c<rsub|5>*c<rsub|23>>|<cell|-c<rsub|4>*s<rsub|5>*L<rsub|6>*s<rsub|23>-c<rsub|5>*L<rsub|6>*c<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>
  </session>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>57) >
    <|unfolded-io>
      DH_ANTROPOMORFO_STRUTTURA:create_tab([q[1],q[2],q[3]],[L[1],0,0],[%pi/2,0,0],[0,L[2],L[3]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o57>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>|<row|<cell|q<rsub|3>>|<cell|0>|<cell|0>|<cell|L<rsub|3>>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>58) >
    <|unfolded-io>
      Q_ANTROPOMORFO_STRUTTURA:create_Q(DH_ANTROPOMORFO_STRUTTURA[1],DH_ANTROPOMORFO_STRUTTURA[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o58>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|23>>|<cell|-c<rsub|1>*s<rsub|23>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*L<rsub|3>*c<rsub|23>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|23>>|<cell|-s<rsub|1>*s<rsub|23>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*L<rsub|3>*c<rsub|23>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|23>>|<cell|c<rsub|23>>|<cell|0>|<cell|L<rsub|3>*s<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>59) >
    <|unfolded-io>
      DH_POLSO_SFERICO:create_tab([q[1],q[2],q[3]],[0,0,L[3]],[-%pi/2,%pi/2,0],[0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o59>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|3>>|<cell|L<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>60) >
    <|unfolded-io>
      Q_POLSO_SFERICO:create_Q(DH_POLSO_SFERICO[1],DH_POLSO_SFERICO[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o60>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>*c<rsub|3>-s<rsub|1>*s<rsub|3>>|<cell|-c<rsub|1>*c<rsub|2>*s<rsub|3>-s<rsub|1>*c<rsub|3>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*L<rsub|3>>>|<row|<cell|c<rsub|1>*s<rsub|3>+s<rsub|1>*c<rsub|2>*c<rsub|3>>|<cell|c<rsub|1>*c<rsub|3>-s<rsub|1>*c<rsub|2>*s<rsub|3>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*L<rsub|3>>>|<row|<cell|-s<rsub|2>*c<rsub|3>>|<cell|s<rsub|2>*s<rsub|3>>|<cell|c<rsub|2>>|<cell|c<rsub|2>*L<rsub|3>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>