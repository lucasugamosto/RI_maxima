<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <with|color|red|Procedura 1: Procedura che crea la tabella di DH a partire
  dai valori inseriti dall'utente:>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
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

    \;

    <with|color|red|Procedura 2: Procedure che calcolano la matrice di
    rotazione, la matrice della cinematica diretta, che eseguono
    semplificazioni, tutte utili per il calcolo dell'energia cinetica:>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
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
      <with|color|red|(<with|math-font-family|rm|%i>3) >
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
      <with|color|red|(<with|math-font-family|rm|%i>4) >
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
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      mat_Qi(theta,d,alpha,a):=block(

      [AVz,AVx,Q],

      AVz:mat_avvitamento(matrix([0],[0],[1]),theta,d),

      AVx:mat_avvitamento(matrix([1],[0],[0]),alpha,a),

      Q:AVz.AVx

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

    <with|color|red|Procedura 3: Procedure che permettono di calcolare
    l'energia cinetica dei link e del robot, inoltre restituiscono le matrice
    delle inerzie generalizzate dei link e del robot:>

    -<with|color|blue|main func>: funzione principale in cui si passa in
    input la tabella di DH e la posizione del baricentro nei link.

    -<with|color|blue|calcolo_derivata>: funzione che calcola la derivata
    rispetto alla variabile q<rsub|i> passando in input la funzione da
    derivare e la quantità di q presenti.

    -<with|color|blue|E_traslazione>: funzione in cui si passa in input il
    vettore 'd' e il valore dell'indice 'i' per il calcolo dell'energia di
    traslazione associata all'i-esimo link.

    -<with|color|blue|E_rotazione>: funzione in cui si passa in input la
    matrice di rotazione 'R' e il valore dell'indice 'i' per il calcolo
    dell'energia di rotazione associata all'i-esimo link.

    -<with|color|blue|matrice_delle_inerzie_traslazione>: funzione che
    calcola la matrice delle inerzie generalizzate legate alla traslazione a
    partire dalle informazioni di 'd' e dell'indice 'i' che indica il link
    associato.

    -matrice_delle_inerzie_rotazione: funzione che calcola la matrice delle
    inerzie generalizzate legate alla rotazione a partire dalle informazioni
    di 'R' e dell'indice 'i' che indica il link associato.

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      calcolo_derivata(func,n):=block(

      [ret],

      ret:0,

      for i:1 thru n do (

      \ ret:diff(func,q[i])*v[i]+ret

      ),

      return(ret)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><with|math-font-family|rm|calcolo_derivata><around*|(|<math-up|func>,n|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|ret>|]>,<math-up|ret>:0,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>n<space|0.27em><math-bf|do><space|0.27em><math-up|ret>:<math-up|diff><around*|(|<math-up|func>,q<rsub|i>|)>*v<rsub|i>+<math-up|ret>,<math-up|return><around*|(|<math-up|ret>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
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

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><with|math-font-family|rm|E_traslazione><around*|(|d,<math-up|index>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|d_punto>,<with|math-font-family|rm|d_punto_T>,M,<with|math-font-family|rm|T2>|]>,<with|math-font-family|rm|d_punto>:<math-up|zeromatrix><around*|(|3,1|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><with|math-font-family|rm|d_punto><rsub|i,1>:<with|math-font-family|rm|calcolo_derivata><around*|(|d<rsub|i,1>,<math-up|index>|)>,<with|math-font-family|rm|d_punto_T>:<math-up|transpose><around*|(|<with|math-font-family|rm|d_punto>|)>,<with|math-font-family|rm|T2>:<frac|1|2>*M<rsub|<math-up|index>>*<with|math-font-family|rm|d_punto_T>\<cdot\><with|math-font-family|rm|d_punto>,<with|math-font-family|rm|T2>:<math-up|semplifica><around*|(|<math-up|trigreduce><around*|(|<math-up|trigsimp><around*|(|<with|math-font-family|rm|T2>|)>|)>|)>,<math-up|return><around*|(|<with|math-font-family|rm|T2>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
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

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><with|math-font-family|rm|E_rotazione><around*|(|R,<math-up|index>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|R_punto>,<math-up|II>,<with|math-font-family|rm|R_T>,S,\<omega\>,<with|math-font-family|rm|omega_T>,<with|math-font-family|rm|T1>|]>,<with|math-font-family|rm|R_punto>:<math-up|zeromatrix><around*|(|3,3|)>,<math-up|II><rsub|<math-up|index>>:<matrix|<tformat|<table|<row|<cell|<math-up|IIxx><rsub|<math-up|index>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<math-up|IIyy><rsub|<math-up|index>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<math-up|IIzz><rsub|<math-up|index>>>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><with|math-font-family|rm|R_punto><rsub|i,j>:<with|math-font-family|rm|calcolo_derivata><around*|(|R<rsub|i,j>,<math-up|index>|)>,<with|math-font-family|rm|R_T>:<math-up|transpose><around*|(|R|)>,S:<math-up|fullratsimp><around*|(|<math-up|trigreduce><around*|(|<with|math-font-family|rm|R_punto>\<cdot\><with|math-font-family|rm|R_T>|)>|)>,\<omega\>:<matrix|<tformat|<table|<row|<cell|S<rsub|3,2>>>|<row|<cell|S<rsub|1,3>>>|<row|<cell|S<rsub|2,1>>>>>>,<with|math-font-family|rm|omega_T>:<math-up|transpose><around*|(|\<omega\>|)>,<with|math-font-family|rm|T1>:<frac|1|2>*<around*|(|<with|math-font-family|rm|omega_T>\<cdot\>R|)>\<cdot\><math-up|II><rsub|<math-up|index>>\<cdot\><with|math-font-family|rm|R_T>\<cdot\>\<omega\>,<with|math-font-family|rm|T1>:<math-up|semplifica><around*|(|<math-up|trigreduce><around*|(|<math-up|trigsimp><around*|(|<with|math-font-family|rm|T1>|)>|)>|)>,<math-up|return><around*|(|<with|math-font-family|rm|T1>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      matrice_delle_inerzie_traslazione(d,index):=block(

      [J,J_T,B_t],

      J:zeromatrix(3,index),

      for i:1 thru 3 do (

      \ for j:1 thru index do (

      \ \ J[i,j]:diff(d[i,1],q[j])

      \ )

      ),

      J_T:transpose(J),

      B_t:M[index]*(J_T.J),

      B_t:semplifica(trigsimp(B_t)),

      return(B_t)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><with|math-font-family|rm|matrice_delle_inerzie_traslazione><around*|(|d,<math-up|index>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|J,<with|math-font-family|rm|J_T>,<with|math-font-family|rm|B_t>|]>,J:<math-up|zeromatrix><around*|(|3,<math-up|index>|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em><math-up|index><space|0.27em><math-bf|do><space|0.27em>J<rsub|i,j>:<math-up|diff><around*|(|d<rsub|i,1>,q<rsub|j>|)>,<with|math-font-family|rm|J_T>:<math-up|transpose><around*|(|J|)>,<with|math-font-family|rm|B_t>:M<rsub|<math-up|index>>*<with|math-font-family|rm|J_T>\<cdot\>J,<with|math-font-family|rm|B_t>:<math-up|semplifica><around*|(|<math-up|trigsimp><around*|(|<with|math-font-family|rm|B_t>|)>|)>,<math-up|return><around*|(|<with|math-font-family|rm|B_t>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      matrice_delle_inerzie_rotazione(mat_R,index):=block(

      [R_punto,II,R_T,S,omega,J_r,J_r_T],

      R_punto:zeromatrix(3,3),

      II[index]:matrix([IIxx[index],0,0],[0,IIyy[index],0],[0,0,IIzz[index]]),

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ R_punto[i,j]:calcolo_derivata(R[i,j],index)

      \ )

      ),

      R_T:transpose(mat_R),

      S:fullratsimp(trigreduce(R_punto.R_T)),

      omega:matrix([S[3,2]],[S[1,3]],[S[2,1]]),

      \;

      J_r:zeromatrix(3,index),

      for i:1 thru 3 do (

      \ for j:1 thru index do (

      \ \ J_r[i,j]:diff(omega[i,1],v[j])

      \ )

      ),

      J_r_T:transpose(J_r),

      B_r:(J_r_T.mat_R).II[index].(R_T.J_r),

      B_r:semplifica(trigsimp(B_r)),

      return(B_r)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><with|math-font-family|rm|matrice_delle_inerzie_rotazione><around*|(|<with|math-font-family|rm|mat_R>,<math-up|index>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|R_punto>,<math-up|II>,<with|math-font-family|rm|R_T>,S,\<omega\>,<with|math-font-family|rm|J_r>,<with|math-font-family|rm|J_r_T>|]>,<with|math-font-family|rm|R_punto>:<math-up|zeromatrix><around*|(|3,3|)>,<math-up|II><rsub|<math-up|index>>:<matrix|<tformat|<table|<row|<cell|<math-up|IIxx><rsub|<math-up|index>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<math-up|IIyy><rsub|<math-up|index>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<math-up|IIzz><rsub|<math-up|index>>>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><with|math-font-family|rm|R_punto><rsub|i,j>:<with|math-font-family|rm|calcolo_derivata><around*|(|R<rsub|i,j>,<math-up|index>|)>,<with|math-font-family|rm|R_T>:<math-up|transpose><around*|(|<with|math-font-family|rm|mat_R>|)>,S:<math-up|fullratsimp><around*|(|<math-up|trigreduce><around*|(|<with|math-font-family|rm|R_punto>\<cdot\><with|math-font-family|rm|R_T>|)>|)>,\<omega\>:<matrix|<tformat|<table|<row|<cell|S<rsub|3,2>>>|<row|<cell|S<rsub|1,3>>>|<row|<cell|S<rsub|2,1>>>>>>,<with|math-font-family|rm|J_r>:<math-up|zeromatrix><around*|(|3,<math-up|index>|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em><math-up|index><space|0.27em><math-bf|do><space|0.27em><with|math-font-family|rm|J_r><rsub|i,j>:<math-up|diff><around*|(|\<omega\><rsub|i,1>,v<rsub|j>|)>,<with|math-font-family|rm|J_r_T>:<math-up|transpose><around*|(|<with|math-font-family|rm|J_r>|)>,<with|math-font-family|rm|B_r>:<around*|(|<with|math-font-family|rm|J_r_T>\<cdot\><with|math-font-family|rm|mat_R>|)>\<cdot\><math-up|II><rsub|<math-up|index>>\<cdot\><with|math-font-family|rm|R_T>\<cdot\><with|math-font-family|rm|J_r>,<with|math-font-family|rm|B_r>:<math-up|semplifica><around*|(|<math-up|trigsimp><around*|(|<with|math-font-family|rm|B_r>|)>|)>,<math-up|return><around*|(|<with|math-font-family|rm|B_r>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      main_func(DH_tab,bc):=block(

      [Q,R,D,T1,T2,B_t,B_r,temp1,temp2,T1_tot,T2_tot,result1,result2],

      T1:zeromatrix(DH_tab[2],1),

      T2:zeromatrix(DH_tab[2],1),

      B_t:zeromatrix(DH_tab[2],1),

      mat_B_r:zeromatrix(DH_tab[2],1),

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

      \ T1[i,1]:E_rotazione(R,i),

      \ mat_B_r[i,1]:matrice_delle_inerzie_rotazione(R,i),

      \ B_t[i,1]:matrice_delle_inerzie_traslazione(d,i)

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

      \ 

      B_r:zeromatrix(DH_tab[2],1),

      for i:1 thru DH_tab[2] do (

      \ B_r[i,1]:mat_B_r[i,1]

      ),

      \;

      result1:matrix([T1_link,T2_link]),

      for i:1 thru DH_tab[2] do (

      \ val:matrix([T1[i,1],T2[i,1]]),

      \ result1:addrow(result1,val)

      ),

      T_tot:T1_tot+T2_tot,

      val:matrix([T_ROBOT,T_tot]),

      result1:addrow(result1,val),

      result2:matrix([valori_B_t,valori_B_r],[B_t,B_r]),

      [result1,result2]

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><with|math-font-family|rm|main_func><around*|(|<with|math-font-family|rm|DH_tab>,<math-up|bc>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|Q,R,D,<with|math-font-family|rm|T1>,<with|math-font-family|rm|T2>,<with|math-font-family|rm|B_t>,<with|math-font-family|rm|B_r>,<with|math-font-family|rm|temp1>,<with|math-font-family|rm|temp2>,<with|math-font-family|rm|T1_tot>,<with|math-font-family|rm|T2_tot>,<with|math-font-family|rm|result1>,<with|math-font-family|rm|result2>|]>,<with|math-font-family|rm|T1>:<math-up|zeromatrix><around*|(|<with|math-font-family|rm|DH_tab><rsub|2>,1|)>,<with|math-font-family|rm|T2>:<math-up|zeromatrix><around*|(|<with|math-font-family|rm|DH_tab><rsub|2>,1|)>,<with|math-font-family|rm|B_t>:<math-up|zeromatrix><around*|(|<with|math-font-family|rm|DH_tab><rsub|2>,1|)>,<with|math-font-family|rm|mat_B_r>:<math-up|zeromatrix><around*|(|<with|math-font-family|rm|DH_tab><rsub|2>,1|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><with|math-font-family|rm|DH_tab><rsub|2><space|0.27em><math-bf|do><space|0.27em><around*|(|Q<rsub|i>:<with|math-font-family|rm|create_Q><around*|(|<with|math-font-family|rm|DH_tab><rsub|1>,i|)>,<math-bf|if><space|0.27em><math-up|bc><rsub|i,1>\<neq\>0<space|0.27em><math-bf|then><space|0.27em>Q<rsub|i>:Q<rsub|i>\<cdot\><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|-<math-up|bc><rsub|i,1>>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><math-up|bc><rsub|i,2>\<neq\>0<space|0.27em><math-bf|then><space|0.27em>Q<rsub|i>:Q<rsub|i>\<cdot\><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|-<math-up|bc><rsub|i,2>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|if><space|0.27em><math-up|bc><rsub|i,3>\<neq\>0<space|0.27em><math-bf|then><space|0.27em>Q<rsub|i>:Q<rsub|i>\<cdot\><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|-<math-up|bc><rsub|i,3>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,R:<matrix|<tformat|<table|<row|<cell|<around*|(|Q<rsub|i>|)><rsub|1,1>>|<cell|<around*|(|Q<rsub|i>|)><rsub|1,2>>|<cell|<around*|(|Q<rsub|i>|)><rsub|1,3>>>|<row|<cell|<around*|(|Q<rsub|i>|)><rsub|2,1>>|<cell|<around*|(|Q<rsub|i>|)><rsub|2,2>>|<cell|<around*|(|Q<rsub|i>|)><rsub|2,3>>>|<row|<cell|<around*|(|Q<rsub|i>|)><rsub|3,1>>|<cell|<around*|(|Q<rsub|i>|)><rsub|3,2>>|<cell|<around*|(|Q<rsub|i>|)><rsub|3,3>>>>>>,d:<matrix|<tformat|<table|<row|<cell|<around*|(|Q<rsub|i>|)><rsub|1,4>>>|<row|<cell|<around*|(|Q<rsub|i>|)><rsub|2,4>>>|<row|<cell|<around*|(|Q<rsub|i>|)><rsub|3,4>>>>>>,<with|math-font-family|rm|T2><rsub|i,1>:<with|math-font-family|rm|E_traslazione><around*|(|d,i|)>,<with|math-font-family|rm|T1><rsub|i,1>:<with|math-font-family|rm|E_rotazione><around*|(|R,i|)>,<with|math-font-family|rm|mat_B_r><rsub|i,1>:<with|math-font-family|rm|matrice_delle_inerzie_rotazione><around*|(|R,i|)>,<with|math-font-family|rm|B_t><rsub|i,1>:<with|math-font-family|rm|matrice_delle_inerzie_traslazione><around*|(|d,i|)>|)>,<with|math-font-family|rm|temp1>:0,<with|math-font-family|rm|temp2>:0,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><with|math-font-family|rm|DH_tab><rsub|2><space|0.27em><math-bf|do><space|0.27em><around*|(|<with|math-font-family|rm|T1_tot>:<with|math-font-family|rm|T1><rsub|i,1>+<with|math-font-family|rm|temp1>,<with|math-font-family|rm|temp1>:<with|math-font-family|rm|T1_tot>,<with|math-font-family|rm|T2_tot>:<with|math-font-family|rm|T2><rsub|i,1>+<with|math-font-family|rm|temp2>,<with|math-font-family|rm|temp2>:<with|math-font-family|rm|T2_tot>|)>,<with|math-font-family|rm|B_r>:<math-up|zeromatrix><around*|(|<with|math-font-family|rm|DH_tab><rsub|2>,1|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><with|math-font-family|rm|DH_tab><rsub|2><space|0.27em><math-bf|do><space|0.27em><with|math-font-family|rm|B_r><rsub|i,1>:<with|math-font-family|rm|mat_B_r><rsub|i,1>,<with|math-font-family|rm|result1>:<matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|T1_link>>|<cell|<with|math-font-family|rm|T2_link>>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><with|math-font-family|rm|DH_tab><rsub|2><space|0.27em><math-bf|do><space|0.27em><around*|(|<math-up|val>:<matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|T1><rsub|i,1>>|<cell|<with|math-font-family|rm|T2><rsub|i,1>>>>>>,<with|math-font-family|rm|result1>:<math-up|addrow><around*|(|<with|math-font-family|rm|result1>,<math-up|val>|)>|)>,<with|math-font-family|rm|T_tot>:<with|math-font-family|rm|T1_tot>+<with|math-font-family|rm|T2_tot>,<math-up|val>:<matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|T_ROBOT>>|<cell|<with|math-font-family|rm|T_tot>>>>>>,<with|math-font-family|rm|result1>:<math-up|addrow><around*|(|<with|math-font-family|rm|result1>,<math-up|val>|)>,<with|math-font-family|rm|result2>:<matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|valori_B_t>>|<cell|<with|math-font-family|rm|valori_B_r>>>|<row|<cell|<with|math-font-family|rm|B_t>>|<cell|<with|math-font-family|rm|B_r>>>>>>,<around*|[|<with|math-font-family|rm|result1>,<with|math-font-family|rm|result2>|]>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      tab_RR:create_tab([q[1],q[2]],[0,0],[0,0],[L[1],L[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|0>|<cell|0>|<cell|L<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>>>>,2|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|input>
      [Ek,B]:main_func(tab_RR,matrix([0,0,0],[0,0,0]))$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|T1_link>>|<cell|<with|math-font-family|rm|T2_link>>>|<row|<cell|<frac|<math-up|IIzz><rsub|1>*v<rsub|1><rsup|2>|2>>|<cell|<frac|L<rsub|1><rsup|2>*M<rsub|1>*v<rsub|1><rsup|2>|2>>>|<row|<cell|<frac|<math-up|IIzz><rsub|2>*v<rsub|2><rsup|2>+2*v<rsub|1>*<math-up|IIzz><rsub|2>*v<rsub|2>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|2>|2>>|<cell|<frac|L<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>+2*L<rsub|1>*v<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>*v<rsub|2>+2*v<rsub|1>*L<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2>+2*L<rsub|1>*v<rsub|1><rsup|2>*L<rsub|2>*M<rsub|2>*c<rsub|2>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>+L<rsub|1><rsup|2>*v<rsub|1><rsup|2>*M<rsub|2>|2>>>|<row|<cell|<with|math-font-family|rm|T_ROBOT>>|<cell|<frac|L<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>+2*L<rsub|1>*v<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>*v<rsub|2>+2*v<rsub|1>*L<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2>+2*L<rsub|1>*v<rsub|1><rsup|2>*L<rsub|2>*M<rsub|2>*c<rsub|2>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>+L<rsub|1><rsup|2>*v<rsub|1><rsup|2>*M<rsub|2>|2>+<frac|<math-up|IIzz><rsub|2>*v<rsub|2><rsup|2>+2*v<rsub|1>*<math-up|IIzz><rsub|2>*v<rsub|2>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|2>|2>+<frac|L<rsub|1><rsup|2>*M<rsub|1>*v<rsub|1><rsup|2>|2>+<frac|<math-up|IIzz><rsub|1>*v<rsub|1><rsup|2>|2>>>>>>
    </equation*>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|valori_B_t>>|<cell|<with|math-font-family|rm|valori_B_r>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|L<rsub|1><rsup|2>*M<rsub|1>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|2*L<rsub|1>*s<rsub|1>*L<rsub|2>*M<rsub|2>*s<rsub|12>+2*L<rsub|1>*c<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|12>+<around*|(|L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)>*M<rsub|2>>|<cell|L<rsub|1>*s<rsub|1>*L<rsub|2>*M<rsub|2>*s<rsub|12>+L<rsub|1>*c<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|12>+L<rsub|2><rsup|2>*M<rsub|2>>>|<row|<cell|L<rsub|1>*s<rsub|1>*L<rsub|2>*M<rsub|2>*s<rsub|12>+L<rsub|1>*c<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|12>+L<rsub|2><rsup|2>*M<rsub|2>>|<cell|L<rsub|2><rsup|2>*M<rsub|2>>>>>>>>>>>>|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIzz><rsub|1>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIzz><rsub|2>>|<cell|<math-up|IIzz><rsub|2>>>|<row|<cell|<math-up|IIzz><rsub|2>>|<cell|<math-up|IIzz><rsub|2>>>>>>>>>>>>>>>>
    </equation*>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      tab_PPP:create_tab([0,-%pi/2,0],[q[1],q[2],q[3]],[-%pi/2,-%pi/2,0],[0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|0>|<cell|q<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|-<frac|\<pi\>|2>>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|input>
      [Ek,B]:main_func(tab_PPP,matrix([0,0,0],[0,0,0],[0,0,0]))$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|T1_link>>|<cell|<with|math-font-family|rm|T2_link>>>|<row|<cell|0>|<cell|<frac|M<rsub|1>*v<rsub|1><rsup|2>|2>>>|<row|<cell|0>|<cell|<frac|M<rsub|2>*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>*M<rsub|2>|2>>>|<row|<cell|0>|<cell|<frac|M<rsub|3>*v<rsub|3><rsup|2>+v<rsub|2><rsup|2>*M<rsub|3>+v<rsub|1><rsup|2>*M<rsub|3>|2>>>|<row|<cell|<with|math-font-family|rm|T_ROBOT>>|<cell|<frac|M<rsub|3>*v<rsub|3><rsup|2>+v<rsub|2><rsup|2>*M<rsub|3>+v<rsub|1><rsup|2>*M<rsub|3>|2>+<frac|M<rsub|2>*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>*M<rsub|2>|2>+<frac|M<rsub|1>*v<rsub|1><rsup|2>|2>>>>>>
    </equation*>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|valori_B_t>>|<cell|<with|math-font-family|rm|valori_B_r>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|M<rsub|1>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|M<rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|2>>>>>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|M<rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|3>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>>>>>>>|<cell|<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>>>>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>>>>>>>>>
    </equation*>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      tab_RPP:create_tab([q[1],0,0],[L[1],q[2],q[3]],[0,-%pi/2,0],[0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|input>
      [Ek,B]:main_func(tab_RPP,matrix([0,0,0],[0,0,0],[0,0,0]))$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|T1_link>>|<cell|<with|math-font-family|rm|T2_link>>>|<row|<cell|<frac|<math-up|IIzz><rsub|1>*v<rsub|1><rsup|2>|2>>|<cell|0>>|<row|<cell|<frac|v<rsub|1><rsup|2>*<math-up|IIyy><rsub|2>|2>>|<cell|<frac|M<rsub|2>*v<rsub|2><rsup|2>|2>>>|<row|<cell|<frac|v<rsub|1><rsup|2>*<math-up|IIyy><rsub|3>|2>>|<cell|<frac|M<rsub|3>*v<rsub|3><rsup|2>+v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>+v<rsub|2><rsup|2>*M<rsub|3>|2>>>|<row|<cell|<with|math-font-family|rm|T_ROBOT>>|<cell|<frac|M<rsub|3>*v<rsub|3><rsup|2>+v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>+v<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|v<rsub|1><rsup|2>*<math-up|IIyy><rsub|3>|2>+<frac|M<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|v<rsub|1><rsup|2>*<math-up|IIyy><rsub|2>|2>+<frac|<math-up|IIzz><rsub|1>*v<rsub|1><rsup|2>|2>>>>>>
    </equation*>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|valori_B_t>>|<cell|<with|math-font-family|rm|valori_B_r>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|2>>>>>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|M<rsub|3>*q<rsub|3><rsup|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|3>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>>>>>>>|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIzz><rsub|1>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIyy><rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|0>>>>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIyy><rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>>>>>>>>>
    </equation*>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      tab_SCARA:create_tab([q[1],q[2],0],[L[1],L[2],q[3]],[0,0,0],[D[1],D[2],0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|D<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|input>
      [Ek,B]:main_func(tab_SCARA,matrix([0,0,0],[0,0,0],[0,0,0]))$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|T1_link>>|<cell|<with|math-font-family|rm|T2_link>>>|<row|<cell|<frac|<math-up|IIzz><rsub|1>*v<rsub|1><rsup|2>|2>>|<cell|<frac|D<rsub|1><rsup|2>*M<rsub|1>*v<rsub|1><rsup|2>|2>>>|<row|<cell|<frac|<math-up|IIzz><rsub|2>*v<rsub|2><rsup|2>+2*v<rsub|1>*<math-up|IIzz><rsub|2>*v<rsub|2>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|2>|2>>|<cell|<frac|D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>+2*D<rsub|1>*v<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>*v<rsub|2>+2*v<rsub|1>*D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2>+2*D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|2>*c<rsub|2>+v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|2>+D<rsub|1><rsup|2>*v<rsub|1><rsup|2>*M<rsub|2>|2>>>|<row|<cell|<frac|v<rsub|2><rsup|2>*<math-up|IIzz><rsub|3>+2*v<rsub|1>*v<rsub|2>*<math-up|IIzz><rsub|3>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|3>|2>>|<cell|<frac|M<rsub|3>*v<rsub|3><rsup|2>+D<rsub|2><rsup|2>*v<rsub|2><rsup|2>*M<rsub|3>+2*D<rsub|1>*v<rsub|1>*D<rsub|2>*c<rsub|2>*v<rsub|2>*M<rsub|3>+2*v<rsub|1>*D<rsub|2><rsup|2>*v<rsub|2>*M<rsub|3>+2*D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*c<rsub|2>*M<rsub|3>+v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|3>+D<rsub|1><rsup|2>*v<rsub|1><rsup|2>*M<rsub|3>|2>>>|<row|<cell|<with|math-font-family|rm|T_ROBOT>>|<cell|<frac|M<rsub|3>*v<rsub|3><rsup|2>+D<rsub|2><rsup|2>*v<rsub|2><rsup|2>*M<rsub|3>+2*D<rsub|1>*v<rsub|1>*D<rsub|2>*c<rsub|2>*v<rsub|2>*M<rsub|3>+2*v<rsub|1>*D<rsub|2><rsup|2>*v<rsub|2>*M<rsub|3>+2*D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*c<rsub|2>*M<rsub|3>+v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|3>+D<rsub|1><rsup|2>*v<rsub|1><rsup|2>*M<rsub|3>|2>+<frac|v<rsub|2><rsup|2>*<math-up|IIzz><rsub|3>+2*v<rsub|1>*v<rsub|2>*<math-up|IIzz><rsub|3>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>+2*D<rsub|1>*v<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>*v<rsub|2>+2*v<rsub|1>*D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2>+2*D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|2>*c<rsub|2>+v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|2>+D<rsub|1><rsup|2>*v<rsub|1><rsup|2>*M<rsub|2>|2>+<frac|<math-up|IIzz><rsub|2>*v<rsub|2><rsup|2>+2*v<rsub|1>*<math-up|IIzz><rsub|2>*v<rsub|2>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|2>|2>+<frac|D<rsub|1><rsup|2>*M<rsub|1>*v<rsub|1><rsup|2>|2>+<frac|<math-up|IIzz><rsub|1>*v<rsub|1><rsup|2>|2>>>>>>
    </equation*>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|valori_B_t>>|<cell|<with|math-font-family|rm|valori_B_r>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|D<rsub|1><rsup|2>*M<rsub|1>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|2*D<rsub|1>*s<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|12>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|12>+<around*|(|D<rsub|2><rsup|2>+D<rsub|1><rsup|2>|)>*M<rsub|2>>|<cell|D<rsub|1>*s<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|12>+D<rsub|1>*c<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|12>+D<rsub|2><rsup|2>*M<rsub|2>>>|<row|<cell|D<rsub|1>*s<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|12>+D<rsub|1>*c<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|12>+D<rsub|2><rsup|2>*M<rsub|2>>|<cell|D<rsub|2><rsup|2>*M<rsub|2>>>>>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|2*D<rsub|1>*s<rsub|1>*D<rsub|2>*M<rsub|3>*s<rsub|12>+2*D<rsub|1>*c<rsub|1>*D<rsub|2>*M<rsub|3>*c<rsub|12>+<around*|(|D<rsub|2><rsup|2>+D<rsub|1><rsup|2>|)>*M<rsub|3>>|<cell|D<rsub|1>*s<rsub|1>*D<rsub|2>*M<rsub|3>*s<rsub|12>+D<rsub|1>*c<rsub|1>*D<rsub|2>*M<rsub|3>*c<rsub|12>+D<rsub|2><rsup|2>*M<rsub|3>>|<cell|0>>|<row|<cell|D<rsub|1>*s<rsub|1>*D<rsub|2>*M<rsub|3>*s<rsub|12>+D<rsub|1>*c<rsub|1>*D<rsub|2>*M<rsub|3>*c<rsub|12>+D<rsub|2><rsup|2>*M<rsub|3>>|<cell|D<rsub|2><rsup|2>*M<rsub|3>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>>>>>>>|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIzz><rsub|1>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIzz><rsub|2>>|<cell|<math-up|IIzz><rsub|2>>>|<row|<cell|<math-up|IIzz><rsub|2>>|<cell|<math-up|IIzz><rsub|2>>>>>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIzz><rsub|3>>|<cell|<math-up|IIzz><rsub|3>>|<cell|0>>|<row|<cell|<math-up|IIzz><rsub|3>>|<cell|<math-up|IIzz><rsub|3>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>>>>>>>>>
    </equation*>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      tab_SFERICO1:create_tab([q[1],q[2],0],[L[1],0,q[3]],[%pi/2,%pi/2,0],[0,L[2],0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|L<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|input>
      [Ek,B]:main_func(tab_SFERICO1,matrix([0,0,0],[0,0,0],[0,0,0]))$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|T1_link>>|<cell|<with|math-font-family|rm|T2_link>>>|<row|<cell|<frac|<math-up|IIyy><rsub|1>*v<rsub|1><rsup|2>|2>>|<cell|0>>|<row|<cell|<frac|v<rsub|1><rsup|2>*<math-up|IIzz><rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>-v<rsub|1><rsup|2>*<math-up|IIxx><rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*<math-up|IIyy><rsub|2>*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|2>+v<rsub|1><rsup|2>*<math-up|IIxx><rsub|2>|4>>|<cell|<frac|v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*L<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>|4>>>|<row|<cell|<frac|v<rsub|1><rsup|2>*<math-up|IIzz><rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>-v<rsub|1><rsup|2>*<math-up|IIxx><rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|3>+2*v<rsub|2><rsup|2>*<math-up|IIyy><rsub|3>+v<rsub|1><rsup|2>*<math-up|IIxx><rsub|3>|4>>|<cell|<frac|2*v<rsub|1><rsup|2>*L<rsub|2>*M<rsub|3>*q<rsub|3>*sin
      <around*|(|2*q<rsub|2>|)>-v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+2*M<rsub|3>*v<rsub|3><rsup|2>-4*L<rsub|2>*v<rsub|2>*M<rsub|3>*v<rsub|3>+2*v<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>+v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>+2*L<rsub|2><rsup|2>*v<rsub|2><rsup|2>*M<rsub|3>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|3>|4>>>|<row|<cell|<with|math-font-family|rm|T_ROBOT>>|<cell|<frac|2*v<rsub|1><rsup|2>*L<rsub|2>*M<rsub|3>*q<rsub|3>*sin
      <around*|(|2*q<rsub|2>|)>-v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+2*M<rsub|3>*v<rsub|3><rsup|2>-4*L<rsub|2>*v<rsub|2>*M<rsub|3>*v<rsub|3>+2*v<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>+v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>+2*L<rsub|2><rsup|2>*v<rsub|2><rsup|2>*M<rsub|3>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|3>|4>+<frac|v<rsub|1><rsup|2>*<math-up|IIzz><rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>-v<rsub|1><rsup|2>*<math-up|IIxx><rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|3>+2*v<rsub|2><rsup|2>*<math-up|IIyy><rsub|3>+v<rsub|1><rsup|2>*<math-up|IIxx><rsub|3>|4>+<frac|v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*L<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>|4>+<frac|v<rsub|1><rsup|2>*<math-up|IIzz><rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>-v<rsub|1><rsup|2>*<math-up|IIxx><rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*<math-up|IIyy><rsub|2>*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|2>+v<rsub|1><rsup|2>*<math-up|IIxx><rsub|2>|4>+<frac|<math-up|IIyy><rsub|1>*v<rsub|1><rsup|2>|2>>>>>>
    </equation*>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|valori_B_t>>|<cell|<with|math-font-family|rm|valori_B_r>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|L<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>>|<cell|0>>|<row|<cell|0>|<cell|L<rsub|2><rsup|2>*M<rsub|2>>>>>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|-c<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>+M<rsub|3>*q<rsub|3><rsup|2>+2*L<rsub|2>*c<rsub|2>*s<rsub|2>*M<rsub|3>*q<rsub|3>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>*M<rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|3>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>*M<rsub|3>>|<cell|-L<rsub|2>*M<rsub|3>>>|<row|<cell|0>|<cell|-L<rsub|2>*M<rsub|3>>|<cell|M<rsub|3>>>>>>>>>>>>|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIyy><rsub|1>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIzz><rsub|2>*c<rsub|2><rsup|2>-<math-up|IIxx><rsub|2>*c<rsub|2><rsup|2>+<math-up|IIxx><rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|<math-up|IIyy><rsub|2>>>>>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|c<rsub|2><rsup|2>*<math-up|IIzz><rsub|3>-c<rsub|2><rsup|2>*<math-up|IIxx><rsub|3>+<math-up|IIxx><rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<math-up|IIyy><rsub|3>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>>>>>>>>>
    </equation*>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      tab_SFERICO2:create_tab([q[1],q[2],0],[L[1],L[2],q[3]],[-%pi/2,%pi/2,0],[0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|input>
      [Ek,B]:main_func(tab_SFERICO2,matrix([0,0,0],[0,0,0],[0,0,0]))$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|T1_link>>|<cell|<with|math-font-family|rm|T2_link>>>|<row|<cell|<frac|<math-up|IIyy><rsub|1>*v<rsub|1><rsup|2>|2>>|<cell|0>>|<row|<cell|<frac|v<rsub|1><rsup|2>*<math-up|IIzz><rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>-v<rsub|1><rsup|2>*<math-up|IIxx><rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*<math-up|IIyy><rsub|2>*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|2>+v<rsub|1><rsup|2>*<math-up|IIxx><rsub|2>|4>>|<cell|<frac|v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>|2>>>|<row|<cell|<frac|v<rsub|1><rsup|2>*<math-up|IIzz><rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>-v<rsub|1><rsup|2>*<math-up|IIxx><rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|3>+2*v<rsub|2><rsup|2>*<math-up|IIyy><rsub|3>+v<rsub|1><rsup|2>*<math-up|IIxx><rsub|3>|4>>|<cell|<frac|-v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*M<rsub|3>*v<rsub|3><rsup|2>-4*v<rsub|1>*L<rsub|2>*s<rsub|2>*M<rsub|3>*v<rsub|3>+2*v<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>+v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>-4*v<rsub|1>*L<rsub|2>*c<rsub|2>*v<rsub|2>*M<rsub|3>*q<rsub|3>+2*v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|3>|4>>>|<row|<cell|<with|math-font-family|rm|T_ROBOT>>|<cell|<frac|-v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*M<rsub|3>*v<rsub|3><rsup|2>-4*v<rsub|1>*L<rsub|2>*s<rsub|2>*M<rsub|3>*v<rsub|3>+2*v<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>+v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>-4*v<rsub|1>*L<rsub|2>*c<rsub|2>*v<rsub|2>*M<rsub|3>*q<rsub|3>+2*v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|3>|4>+<frac|v<rsub|1><rsup|2>*<math-up|IIzz><rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>-v<rsub|1><rsup|2>*<math-up|IIxx><rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|3>+2*v<rsub|2><rsup|2>*<math-up|IIyy><rsub|3>+v<rsub|1><rsup|2>*<math-up|IIxx><rsub|3>|4>+<frac|v<rsub|1><rsup|2>*<math-up|IIzz><rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>-v<rsub|1><rsup|2>*<math-up|IIxx><rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*<math-up|IIyy><rsub|2>*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>*<math-up|IIzz><rsub|2>+v<rsub|1><rsup|2>*<math-up|IIxx><rsub|2>|4>+<frac|v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>|2>+<frac|<math-up|IIyy><rsub|1>*v<rsub|1><rsup|2>|2>>>>>>
    </equation*>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|valori_B_t>>|<cell|<with|math-font-family|rm|valori_B_r>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|L<rsub|2><rsup|2>*M<rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|0>>>>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|s<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>*M<rsub|3>>|<cell|-L<rsub|2>*c<rsub|2>*M<rsub|3>*q<rsub|3>>|<cell|-L<rsub|2>*s<rsub|2>*M<rsub|3>>>|<row|<cell|-L<rsub|2>*c<rsub|2>*M<rsub|3>*q<rsub|3>>|<cell|M<rsub|3>*q<rsub|3><rsup|2>>|<cell|0>>|<row|<cell|-L<rsub|2>*s<rsub|2>*M<rsub|3>>|<cell|0>|<cell|M<rsub|3>>>>>>>>>>>>|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIyy><rsub|1>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIzz><rsub|2>*c<rsub|2><rsup|2>-<math-up|IIxx><rsub|2>*c<rsub|2><rsup|2>+<math-up|IIxx><rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|<math-up|IIyy><rsub|2>>>>>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|c<rsub|2><rsup|2>*<math-up|IIzz><rsub|3>-c<rsub|2><rsup|2>*<math-up|IIxx><rsub|3>+<math-up|IIxx><rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<math-up|IIyy><rsub|3>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>>>>>>>>>
    </equation*>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      tab_ANTROPOMORFO:create_tab([q[1],q[2],q[3]],[L[1],0,0],[%pi/2,0,0],[0,L[2],L[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>|<row|<cell|q<rsub|3>>|<cell|0>|<cell|0>|<cell|L<rsub|3>>>>>>,3|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|input>
      [Ek,B]:main_func(tab_ANTROPOMORFO,matrix([0,0,0],[0,0,0],[0,0,0]))$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|T1_link>>|<cell|<with|math-font-family|rm|T2_link>>>|<row|<cell|<frac|<math-up|IIyy><rsub|1>*v<rsub|1><rsup|2>|2>>|<cell|0>>|<row|<cell|<frac|v<rsub|1><rsup|2>*<math-up|IIyy><rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>-v<rsub|1><rsup|2>*<math-up|IIxx><rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*<math-up|IIzz><rsub|2>*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>*<math-up|IIyy><rsub|2>+v<rsub|1><rsup|2>*<math-up|IIxx><rsub|2>|4>>|<cell|<frac|v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*L<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>|4>>>|<row|<cell|<frac|v<rsub|1><rsup|2>*<math-up|IIyy><rsub|3>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>-v<rsub|1><rsup|2>*<math-up|IIxx><rsub|3>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>+2*<math-up|IIzz><rsub|3>*v<rsub|3><rsup|2>+4*v<rsub|2>*<math-up|IIzz><rsub|3>*v<rsub|3>+2*v<rsub|2><rsup|2>*<math-up|IIzz><rsub|3>+v<rsub|1><rsup|2>*<math-up|IIyy><rsub|3>+v<rsub|1><rsup|2>*<math-up|IIxx><rsub|3>|4>>|<cell|<frac|v<rsub|1><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>+2*v<rsub|1><rsup|2>*L<rsub|2>*L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|3>+2*q<rsub|2>|)>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+2*L<rsub|3><rsup|2>*M<rsub|3>*v<rsub|3><rsup|2>+4*L<rsub|2>*v<rsub|2>*L<rsub|3>*M<rsub|3>*c<rsub|3>*v<rsub|3>+4*v<rsub|2>*L<rsub|3><rsup|2>*M<rsub|3>*v<rsub|3>+4*L<rsub|2>*v<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>*c<rsub|3>+2*v<rsub|1><rsup|2>*L<rsub|2>*L<rsub|3>*M<rsub|3>*c<rsub|3>+2*v<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>+v<rsub|1><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>+2*L<rsub|2><rsup|2>*v<rsub|2><rsup|2>*M<rsub|3>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|3>|4>>>|<row|<cell|<with|math-font-family|rm|T_ROBOT>>|<cell|<frac|v<rsub|1><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>+2*v<rsub|1><rsup|2>*L<rsub|2>*L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|3>+2*q<rsub|2>|)>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+2*L<rsub|3><rsup|2>*M<rsub|3>*v<rsub|3><rsup|2>+4*L<rsub|2>*v<rsub|2>*L<rsub|3>*M<rsub|3>*c<rsub|3>*v<rsub|3>+4*v<rsub|2>*L<rsub|3><rsup|2>*M<rsub|3>*v<rsub|3>+4*L<rsub|2>*v<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>*c<rsub|3>+2*v<rsub|1><rsup|2>*L<rsub|2>*L<rsub|3>*M<rsub|3>*c<rsub|3>+2*v<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>+v<rsub|1><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>+2*L<rsub|2><rsup|2>*v<rsub|2><rsup|2>*M<rsub|3>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|3>|4>+<frac|v<rsub|1><rsup|2>*<math-up|IIyy><rsub|3>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>-v<rsub|1><rsup|2>*<math-up|IIxx><rsub|3>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>+2*<math-up|IIzz><rsub|3>*v<rsub|3><rsup|2>+4*v<rsub|2>*<math-up|IIzz><rsub|3>*v<rsub|3>+2*v<rsub|2><rsup|2>*<math-up|IIzz><rsub|3>+v<rsub|1><rsup|2>*<math-up|IIyy><rsub|3>+v<rsub|1><rsup|2>*<math-up|IIxx><rsub|3>|4>+<frac|v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*L<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>|4>+<frac|v<rsub|1><rsup|2>*<math-up|IIyy><rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>-v<rsub|1><rsup|2>*<math-up|IIxx><rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*<math-up|IIzz><rsub|2>*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>*<math-up|IIyy><rsub|2>+v<rsub|1><rsup|2>*<math-up|IIxx><rsub|2>|4>+<frac|<math-up|IIyy><rsub|1>*v<rsub|1><rsup|2>|2>>>>>>
    </equation*>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|valori_B_t>>|<cell|<with|math-font-family|rm|valori_B_r>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|L<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>>|<cell|0>>|<row|<cell|0>|<cell|L<rsub|2><rsup|2>*M<rsub|2>>>>>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|L<rsub|3><rsup|2>*M<rsub|3>*c<rsub|23><rsup|2>+2*L<rsub|2>*c<rsub|2>*L<rsub|3>*M<rsub|3>*c<rsub|23>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>*M<rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|2*L<rsub|2>*s<rsub|2>*L<rsub|3>*M<rsub|3>*s<rsub|23>+2*L<rsub|2>*c<rsub|2>*L<rsub|3>*M<rsub|3>*c<rsub|23>+<around*|(|L<rsub|3><rsup|2>+L<rsub|2><rsup|2>|)>*M<rsub|3>>|<cell|L<rsub|2>*s<rsub|2>*L<rsub|3>*M<rsub|3>*s<rsub|23>+L<rsub|2>*c<rsub|2>*L<rsub|3>*M<rsub|3>*c<rsub|23>+L<rsub|3><rsup|2>*M<rsub|3>>>|<row|<cell|0>|<cell|L<rsub|2>*s<rsub|2>*L<rsub|3>*M<rsub|3>*s<rsub|23>+L<rsub|2>*c<rsub|2>*L<rsub|3>*M<rsub|3>*c<rsub|23>+L<rsub|3><rsup|2>*M<rsub|3>>|<cell|L<rsub|3><rsup|2>*M<rsub|3>>>>>>>>>>>>|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIyy><rsub|1>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIyy><rsub|2>*c<rsub|2><rsup|2>-<math-up|IIxx><rsub|2>*c<rsub|2><rsup|2>+<math-up|IIxx><rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|<math-up|IIzz><rsub|2>>>>>>>>|<row|<cell|<matrix|<tformat|<table|<row|<cell|<math-up|IIyy><rsub|3>*c<rsub|23><rsup|2>-<math-up|IIxx><rsub|3>*c<rsub|23><rsup|2>+<math-up|IIxx><rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<math-up|IIzz><rsub|3>>|<cell|<math-up|IIzz><rsub|3>>>|<row|<cell|0>|<cell|<math-up|IIzz><rsub|3>>|<cell|<math-up|IIzz><rsub|3>>>>>>>>>>>>>>>>
    </equation*>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>