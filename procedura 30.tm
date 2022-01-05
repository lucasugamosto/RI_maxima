<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA PER IL CALCOLO DELL'EQUAZIONI DI EULERO-LAGRANGE ASSOCIATE AL
  ROBOT PRESO IN ESAME.

  <with|color|red|Procedura 1: Procedura per il calcolo dell'equazione delle
  equazioni di Eulero-Lagrange, passando in ingresso la tabella di D-H e i
  sistemi di riferimento dei baricentri dei links.>

  FUNZIONI GENERICHE PER CALCOLO DI MATRICI DI ROTAZIONE, MATRICI DI
  CINEMATICA DIRETTA, SEMPLIFICAZIONI, ECC<text-dots>

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

    FUNZIONI PER CALCOLO DI DERIVATE, ENERGIA CINETICA, ENERGIA POTENZIALE,
    ECC<text-dots>

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      calcolo_derivata(func,n):=block(

      [ret],

      ret:0,

      for i:1 thru n do (

      \ ret:diff(func,q[i])*v[i]+ret,

      \ ret:diff(func,v[i])*a[i]+ret

      ),

      return(ret)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      E_traslazione(d,index):=block(

      [d_punto,d_punto_T,M,T2],

      d_punto:zeromatrix(3,1),

      for i:1 thru 3 do (

      \ d_punto[i,1]:calcolo_derivata(d[i,1],index)

      ),

      d_punto_T:transpose(d_punto),

      T2:(1/2)*M[index]*(d_punto_T.d_punto),

      T2:semplifica(trigreduce(trigsimp(T2))),

      return(T2)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      E_rotazione(R,index):=block(

      [R_punto,II,R_T,S,omega,omega_T,T1],

      R_punto:zeromatrix(3,3),

      II[index]:matrix([IIxx[index],0,0],[0,IIyy[index],0],[0,0,IIzz[index]]),

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ R_punto[i,j]:calcolo_derivata(R[i,j],index)

      \ )

      ),

      R_T:transpose(R),

      S:fullratsimp(trigreduce(R_punto.R_T)),

      omega:matrix([S[3,2]],[S[1,3]],[S[2,1]]),

      omega_T:transpose(omega),

      T1:(1/2)*(omega_T.R).II[index].(R_T.omega),

      T1:semplifica(trigreduce(trigsimp(T1))),

      return(T1)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      calcolo_T(DH_tab,bc):=block(

      [Q,R,D,T1,T2,temp1,temp2,T1_tot,T2_tot],

      T1:zeromatrix(DH_tab[2],1),

      T2:zeromatrix(DH_tab[2],1),

      \;

      for i:1 thru DH_tab[2] do (

      \ Q[i]:create_Q(DH_tab[1],i),

      \ if bc[i,1] # 0 then Q[i]:Q[i].matrix([1,0,0,-bc[i,1]],[0,1,0,0],[0,0,1,0],
      \ [0,0,0,1]),

      \ if bc[i,2] # 0 then Q[i]:Q[i].matrix([1,0,0,0],[0,1,0,-bc[i,2]],[0,0,1,0],
      \ [0,0,0,1]),

      \ if bc[i,3] # 0 then Q[i]:Q[i].matrix([1,0,0,0],[0,1,0,0],[0,0,1,-bc[i,3]],
      \ [0,0,0,1]),

      \ R:matrix([Q[i][1,1],Q[i][1,2],Q[i][1,3]],[Q[i][2,1],Q[i][2,2],Q[i][2,3]],
      \ [Q[i][3,1],Q[i][3,2],Q[i][3,3]]),

      \ d:matrix([Q[i][1,4]],[Q[i][2,4]],[Q[i][3,4]]),

      \;

      \ T2[i,1]:E_traslazione(d,i),

      \ T1[i,1]:E_rotazione(R,i)

      ),

      \;

      temp1:0,

      temp2:0,

      for i:1 thru DH_tab[2] do (

      \ T1_tot:T1[i,1]+temp1,

      \ temp1:T1_tot,

      \ T2_tot:T2[i,1]+temp2,

      \ temp2:T2_tot

      ),

      T_tot:fullratsimp(T1_tot+T2_tot),

      return(T_tot)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      calcolo_U(DH_tab,bc):=block(

      [U,G_T,U_tot],

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

      )$
    </input>

    \;

    \;

    FUNZIONE CHE CALCOLA LE EQUAZIONI DI EULERO-LAGRAGE:

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      calcolo_eulero_lagrange(DH_tab,bc):=block(

      [T,U,L,eq_EL,dLdv,ddLdvdt,dLdq],

      T:calcolo_T(DH_tab,bc),

      U:calcolo_U(DH_tab,bc),

      L:T-U,

      eq_EL:zeromatrix(DH_tab[2],1),

      for i:1 thru DH_tab[2] do (

      \ dLdv:diff(L,v[i]),

      \ ddLdvdt:calcolo_derivata(dLdv,i),

      \ dLdq:diff(L,q[i]),

      \ eq_EL[i,1]:(ddLdvdt-dLdq=u[i])

      ),

      return(eq_EL)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><with|math-font-family|rm|calcolo_eulero_lagrange><around*|(|<with|math-font-family|rm|DH_tab>,<math-up|bc>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|T,U,L,<with|math-font-family|rm|eq_EL>,<math-up|dLdv>,<math-up|ddLdvdt>,<math-up|dLdq>|]>,T:<with|math-font-family|rm|calcolo_T><around*|(|<with|math-font-family|rm|DH_tab>,<math-up|bc>|)>,U:<with|math-font-family|rm|calcolo_U><around*|(|<with|math-font-family|rm|DH_tab>,<math-up|bc>|)>,L:T-U,<with|math-font-family|rm|eq_EL>:<math-up|zeromatrix><around*|(|<with|math-font-family|rm|DH_tab><rsub|2>,1|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><with|math-font-family|rm|DH_tab><rsub|2><space|0.27em><math-bf|do><space|0.27em><around*|(|<math-up|dLdv>:<math-up|diff><around*|(|L,v<rsub|i>|)>,<math-up|ddLdvdt>:<with|math-font-family|rm|calcolo_derivata><around*|(|<math-up|dLdv>,i|)>,<math-up|dLdq>:<math-up|diff><around*|(|L,q<rsub|i>|)>,<with|math-font-family|rm|eq_EL><rsub|i,1>:<math-up|ddLdvdt>-<math-up|dLdq>=u<rsub|i>|)>,<math-up|return><around*|(|<with|math-font-family|rm|eq_EL>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      tabella_DH:create_tab([q[1],0,0],[L[1],q[2],q[3]],[0,-%pi/2,0],[0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      L:calcolo_eulero_lagrange(tabella_DH,matrix([0,0,0],[0,0,0],[0,0,0]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|<frac|a<rsub|1>*<around*|(|2*M<rsub|3>*q<rsub|3><rsup|2>+2*<math-up|IIyy><rsub|3>+2*<math-up|IIyy><rsub|2>+2*<math-up|IIzz><rsub|1>|)>|2>=u<rsub|1>>>|<row|<cell|<around*|(|M<rsub|3>+M<rsub|2>|)>*g+<frac|a<rsub|2>*<around*|(|2*M<rsub|3>+2*M<rsub|2>|)>|2>=u<rsub|2>>>|<row|<cell|M<rsub|3>*a<rsub|3>-v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3>=u<rsub|3>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
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