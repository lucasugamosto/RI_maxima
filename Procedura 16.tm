<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA PER IL CALCOLO DELLE TABELLE DI CINEMATICA DIRETTA DI OGNI
  SINGOLO ROBOT, NELLO SPAZIO, VISTO A LEZIONE (SOLO STRUTTURA E NON).

  <with|color|red|Procedura 1: Procedura che calcola le matrici della
  cinematica diretta di ogni singolo robot nello spazio:>

  <\session|maxima|default>
    <\textput>
      La funzione \Pcontrollo_versore(vet)\Q verifica se l'elemento passato
      in ingresso sia un versore o un vettore, nel primo caso restituisce lo
      stesso elemento passato in ingresso, altrimenti restituisce il versore
      corrispondente.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      controllo_versore(vet):=block(

      [norma2,e],

      if scalarp(vet) = true or listp(vet) = true then return(0),

      norma2:sqrt((vet[1,1]^2)+(vet[2,1]^2)+(vet[3,1]^2)),

      if norma2 = 0 then return(0),

      if norma2 = 1 then return(vet) else e:(1/norma2)*vet,

      return(e)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|controllo_versore><around*|(|<math-up|vet>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|norma2>,e|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|<math-up|vet>|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|<math-up|vet>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<with|math-font-family|rm|norma2>:<sqrt|<math-up|vet><rsub|1,1><rsup|2>+<math-up|vet><rsub|2,1><rsup|2>+<math-up|vet><rsub|3,1><rsup|2>>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>=1<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|<math-up|vet>|)><space|0.27em><math-bf|else><space|0.27em>e:<frac|1|<with|math-font-family|rm|norma2>>*<math-up|vet>,<math-up|return><around*|(|e|)>|)>>>
    </unfolded-io>

    \;

    <\textput>
      La funzione \Pcalcolo_S(e)\Q riceve in ingresso un versore e calcola la
      matrice anti-simmetrica S corrispondente.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      calcolo_S(e):=block(

      [S],

      if scalarp(e) = true or listp(e) = true then return(0),

      S:matrix([0,-e[3,1],e[2,1]],[e[3,1],0,-e[1,1]],[-e[2,1],e[1,1],0]),

      return(S)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|calcolo_S><around*|(|e|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|S|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|e|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|e|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-e<rsub|3,1>>|<cell|e<rsub|2,1>>>|<row|<cell|e<rsub|3,1>>|<cell|0>|<cell|-e<rsub|1,1>>>|<row|<cell|-e<rsub|2,1>>|<cell|e<rsub|1,1>>|<cell|0>>>>>,<math-up|return><around*|(|S|)>|)>>>
    </unfolded-io>

    <\textput>
      \;

      La funzione \Pmat_rotazione(vet,angolo)\Q in primo piano controllo i
      due elementi passati in input, riguardo il primo controlla se è un
      vettore o un versore e di seguito ne calcola la matrice anti-simmetrica
      associata, mentre per quanto riguarda l'angolo (PASSATO IN RADIANTI)
      controlla se è un valore scalare e se deve lo normalizza.

      Successivamente per mezzo della trasformata di Laplace viene calcolata
      la matrice di rotazione intorno all'asse \Pe\Q di un angolo \<theta\>.
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      mat_rotazione(vet,angolo):=block(

      [e,S,norma2,theta,II,sII,sIImS,sIImS_inv,R],

      e:controllo_versore(vet),

      if e = 0 then return(0),

      S:calcolo_S(e),

      \;

      if listp(angolo) = true or matrixp(angolo) = true then return(0),

      norma2:sqrt((vet[1,1]^2)+(vet[2,1]^2)+(vet[3,1]^2)),

      if norma2 # 1 then theta:angolo*norma2 else theta:angolo,

      \;

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      sII:s*II,

      sIImS:sII-S,

      sIImS_inv:invert(sIImS),

      R:matrix([ilt(sIImS_inv[1,1],s,t),ilt(sIImS_inv[1,2],s,t),ilt(sIImS_inv[1,3],s,t)],[ilt(sIImS_inv[2,1],s,t),ilt(sIImS_inv[2,2],s,t),ilt(sIImS_inv[2,3],s,t)],[ilt(sIImS_inv[3,1],s,t),ilt(sIImS_inv[3,2],s,t),ilt(sIImS_inv[3,3],s,t)]),

      R:subst(t=theta,R),

      R:factor(R),

      return(R)

      )$
    </input>

    \;

    <\textput>
      \;

      La funzione \Pmat_avvitamento(vettore,angolo,spostamento)\Q riceve in
      ingresso tre parametri, con i primi due calcola la matrice di rotazione
      per mezzo della funzione precedente e con l'ultimo calcola la matrice
      di avvitamento.

      Prima di calcolare la matrice di rotazione, eseguo i controlli sul tipo
      di dato (per quanto riguarda le variabili vettore e angolo).
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      mat_avvitamento(vettore,angolo,spostamento):=block(

      [R,e,d,Q],

      /*controlli sul tipo di dato*/

      if scalar(vettore) = true or listp(vettore) = true then return(0),

      if listp(angolo) = true or matrixp(angolo) = true then return(0),

      \;

      R:mat_rotazione(vettore,angolo),

      /*la funzione restituisce 0 se la sotto-funzione per il calcolo del
      versore restiuisce 0 o se i tipi di dati non sono corretti*/

      if R = 0 then return(0),

      \;

      e:controllo_versore(vettore),

      d:spostamento*e,

      Q:matrix([R[1,1],R[1,2],R[1,3],d[1,1]],[R[2,1],R[2,2],R[2,3],d[2,1]],[R[3,1],R[3,2],R[3,3],d[3,1]],[0,0,0,1]),

      return(Q)

      )$
    </input>

    <\textput>
      La funzione \Pmat_Qi(\<theta\>,d,\<alpha\>,a)\Q prende in ingresso i
      quattro parametri relativi ad una riga della tabella D-H e calcola la
      matrice della cinematica tra il giunto (i-1)-esimo e il giunto i-esimo.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      mat_Qi(theta,d,alpha,a):=block(

      [Ex,Ez,AVz,AVx,Q],

      Ex:matrix([1],[0],[0]),

      Ez:matrix([0],[0],[1]),

      AVx:mat_avvitamento(Ex,alpha,a),

      AVz:mat_avvitamento(Ez,theta,d),

      Q:factor(AVz.AVx),

      return(Q)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><with|math-font-family|rm|mat_Qi><around*|(|\<vartheta\>,d,\<alpha\>,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|Ex>,<math-up|Ez>,<math-up|AVz>,<math-up|AVx>,Q|]>,<math-up|Ex>:<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,<math-up|Ez>:<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|1>>>>>,<math-up|AVx>:<with|math-font-family|rm|mat_avvitamento><around*|(|<math-up|Ex>,\<alpha\>,a|)>,<math-up|AVz>:<with|math-font-family|rm|mat_avvitamento><around*|(|<math-up|Ez>,\<vartheta\>,d|)>,Q:<math-up|factor><around*|(|<math-up|AVz>\<cdot\><math-up|AVx>|)>,<math-up|return><around*|(|Q|)>|)>>>
    </unfolded-io>

    <\textput>
      \;

      La funzione \Psemplifica(Q)\Q riceve in ingresso la matrice della
      cinematica ed esegue le semplificazioni di annotazione per
      rappresentare meglio ed in forma più compatta i valori x,y,\<phi\>.
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
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

      Q:letsimp(Q),

      return(Q)

      )$
    </input>

    \;

    \;

    Sotto-funzione che riceve in ingresso i valori di \<theta\>,d,\<alpha\>,a
    e restituisce in uscita la tabella di D-H e il numero di righe di cui si
    compone (= numero di DOF = numero di lettere R o P).

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      create_tab(theta,d,alpha,a):=block(

      [rows,tab,II,mat],

      rows:length(theta),

      tab:matrix([THETA,D,ALPHA,A]),

      II:matrix([1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]),

      for i:1 thru rows do (

      mat:matrix([theta[i],d[i],alpha[i],a[i]]),

      tab:addrow(tab,mat)

      ),

      return([tab,rows])

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><with|math-font-family|rm|create_tab><around*|(|\<vartheta\>,d,\<alpha\>,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|rows>,<math-up|tab>,<math-up|II>,<math-up|mat>|]>,<math-up|rows>:<math-up|length><around*|(|\<vartheta\>|)>,<math-up|tab>:<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>>>>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|rows><space|0.27em><math-bf|do><space|0.27em><around*|(|<math-up|mat>:<matrix|<tformat|<table|<row|<cell|\<vartheta\><rsub|i>>|<cell|d<rsub|i>>|<cell|\<alpha\><rsub|i>>|<cell|a<rsub|i>>>>>>,<math-up|tab>:<math-up|addrow><around*|(|<math-up|tab>,<math-up|mat>|)>|)>,<math-up|return><around*|(|<around*|[|<math-up|tab>,<math-up|rows>|]>|)>|)>>>
    </unfolded-io>

    \;

    <\textput>
      La funzione \Pcreate_Q(tab,lngth)\Q riceve in ingresso la tabella di
      D-H calcolata con la funzione precedente e calcola la matrice della
      cinematica diretta completa Q con espresse i valori delle variabili
      x,y,\<phi\>.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      create_Q(tab,lngth):=block(

      [reduce,prereduce,mat,mat1,Q_tot],

      /*inizializzo la variabile "reduce" la quale tiene conto del fatto che
      la matrice calcolata fino ad un determinato punto debba essere
      semplificata o meno, inoltre inizializzo la matrice Q come una matrice
      identità*/

      reduce:0,

      mat:matrix([1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]),

      \;

      for i:1 thru lngth do (

      /*l'indice di seguito usato nella funzione "mat_Qi" è i+1 poichè
      nell'indice i = 1 vi è la riga con i nomi delle variabili e nessun
      valore necessario al calcolo della matrice*/

      \ Q[i]:mat_Qi(tab[i+1,1],tab[i+1,2],tab[i+1,3],tab[i+1,4]),

      \ \ \ \ \ \ \ \ \ 

      \ if tab[i,1] # 0 and tab[i,3] = 0 then reduce:1 else reduce:0,

      \ if tab[i,1] = 0 and tab[i,3] = 0 and tab[i-1,1] # 0 and tab[i-1,3] =
      0 then reduce:1,

      \ if i \<gtr\> 2 and prereduce = 0 and reduce = 1 then
      (mat1:trigreduce(Q[i-1].Q[i]),mat:trigsimp(Q[i-2].mat1))

      \ else if reduce = 1 then mat:trigreduce(mat.Q[i]) else
      mat:trigsimp(mat.Q[i]),

      \;

      \ prereduce:reduce

      ),

      Q_tot:fullratsimp(semplifica(mat)),

      return(Q_tot)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><with|math-font-family|rm|create_Q><around*|(|<math-up|tab>,<math-up|lngth>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|reduce>,<math-up|prereduce>,<math-up|mat>,<with|math-font-family|rm|mat1>,<with|math-font-family|rm|Q_tot>|]>,<math-up|reduce>:0,<math-up|mat>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|lngth><space|0.27em><math-bf|do><space|0.27em><around*|(|Q<rsub|i>:<with|math-font-family|rm|mat_Qi><around*|(|<math-up|tab><rsub|i+1,1>,<math-up|tab><rsub|i+1,2>,<math-up|tab><rsub|i+1,3>,<math-up|tab><rsub|i+1,4>|)>,<math-bf|if><space|0.27em><math-up|tab><rsub|i,1>\<neq\>0\<wedge\><math-up|tab><rsub|i,3>=0<space|0.27em><math-bf|then><space|0.27em><math-up|reduce>:1<space|0.27em><math-bf|else><space|0.27em><math-up|reduce>:0,<math-bf|if><space|0.27em><math-up|tab><rsub|i,1>=0\<wedge\><math-up|tab><rsub|i,3>=0\<wedge\><math-up|tab><rsub|i-1,1>\<neq\>0\<wedge\><math-up|tab><rsub|i-1,3>=0<space|0.27em><math-bf|then><space|0.27em><math-up|reduce>:1,<math-bf|if><space|0.27em>i\<gtr\>2\<wedge\><math-up|prereduce>=0\<wedge\><math-up|reduce>=1<space|0.27em><math-bf|then><space|0.27em><around*|(|<with|math-font-family|rm|mat1>:<math-up|trigreduce><around*|(|Q<rsub|i-1>\<cdot\>Q<rsub|i>|)>,<math-up|mat>:<math-up|trigsimp><around*|(|Q<rsub|i-2>\<cdot\><with|math-font-family|rm|mat1>|)>|)><space|0.27em><math-bf|else><space|0.27em><around*|(|<math-bf|if><space|0.27em><math-up|reduce>=1<space|0.27em><math-bf|then><space|0.27em><math-up|mat>:<math-up|trigreduce><around*|(|<math-up|mat>\<cdot\>Q<rsub|i>|)><space|0.27em><math-bf|else><space|0.27em><math-up|mat>:<math-up|trigsimp><around*|(|<math-up|mat>\<cdot\>Q<rsub|i>|)>|)>,<math-up|prereduce>:<math-up|reduce>|)>,<with|math-font-family|rm|Q_tot>:<math-up|fullratsimp><around*|(|<math-up|semplifica><around*|(|<math-up|mat>|)>|)>,<math-up|return><around*|(|<with|math-font-family|rm|Q_tot>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      DH_RR:create_tab([q[1],q[2]],[0,0],[0,0],[L[1],L[2]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|0>|<cell|0>|<cell|L<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>>>>,2|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      Q_RR:create_Q(DH_RR[1],DH_RR[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|12>>|<cell|-s<rsub|12>>|<cell|0>|<cell|L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|12>>|<cell|c<rsub|12>>|<cell|0>|<cell|L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      DH_PPP:create_tab([0,-%pi/2,0],[q[1],q[2],q[3]],[-%pi/2,-%pi/2,0],[0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|0>|<cell|q<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|-<frac|\<pi\>|2>>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      Q_PPP:create_Q(DH_PPP[1],DH_PPP[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      DH_RPP:create_tab([q[1],0,0],[L[1],q[2],q[3]],[0,-%pi/2,0],[0,0,0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      Q_RPP:create_Q(DH_RPP[1],DH_RPP[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|0>|<cell|-s<rsub|1>>|<cell|-s<rsub|1>*q<rsub|3>>>|<row|<cell|s<rsub|1>>|<cell|0>|<cell|c<rsub|1>>|<cell|c<rsub|1>*q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      DH_SCARA:create_tab([q[1],q[2],0,q[4],q[5],q[6]],[L[1],L[2],q[3],0,0,L[6]],[0,0,0,-%pi/2,-%pi/2,0],[D[1],D[2],0,0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|D<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|q<rsub|4>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|5>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|6>>|<cell|L<rsub|6>>|<cell|0>|<cell|0>>>>>,6|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      Q_SCARA:create_Q(DH_SCARA[1],DH_SCARA[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><matrix|<tformat|<table|<row|<cell|s<rsub|6>*s<rsub|124>+c<rsub|5>*c<rsub|6>*c<rsub|124>>|<cell|c<rsub|6>*s<rsub|124>-c<rsub|5>*s<rsub|6>*c<rsub|124>>|<cell|-s<rsub|5>*c<rsub|124>>|<cell|-s<rsub|5>*L<rsub|6>*c<rsub|124>+D<rsub|2>*c<rsub|12>+D<rsub|1>*c<rsub|1>>>|<row|<cell|c<rsub|5>*c<rsub|6>*s<rsub|124>-s<rsub|6>*c<rsub|124>>|<cell|-c<rsub|5>*s<rsub|6>*s<rsub|124>-c<rsub|6>*c<rsub|124>>|<cell|-s<rsub|5>*s<rsub|124>>|<cell|-s<rsub|5>*L<rsub|6>*s<rsub|124>+D<rsub|2>*s<rsub|12>+D<rsub|1>*s<rsub|1>>>|<row|<cell|-s<rsub|5>*c<rsub|6>>|<cell|s<rsub|5>*s<rsub|6>>|<cell|-c<rsub|5>>|<cell|-c<rsub|5>*L<rsub|6>+q<rsub|3>+L<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      DH_SCARA_STRUTTURA:create_tab([q[1],q[2],0],[L[1],L[2],q[3]],[0,0,0],[D[1],D[2],0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|D<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      Q_SCARA_STRUTTURA:create_Q(DH_SCARA_STRUTTURA[1],DH_SCARA_STRUTTURA[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|12>>|<cell|-s<rsub|12>>|<cell|0>|<cell|D<rsub|2>*c<rsub|12>+D<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|12>>|<cell|c<rsub|12>>|<cell|0>|<cell|D<rsub|2>*s<rsub|12>+D<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>+L<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      DH_SFERICO1:create_tab([q[1],q[2],0,q[4],q[5],q[6]],[L[1],0,q[3],0,0,L[6]],[%pi/2,%pi/2,0,%pi/2,-%pi/2,0],[0,L[2],0,0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|L<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|q<rsub|4>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|5>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|6>>|<cell|L<rsub|6>>|<cell|0>|<cell|0>>>>>,6|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      Q_SFERICO1:create_Q(DH_SFERICO1[1],DH_SFERICO1[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><matrix|<tformat|<table|<row|<cell|<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*s<rsub|6>+<around*|(|c<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|s<rsub|1>*s<rsub|4>+c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|5>|)>*s<rsub|6>+<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>+c<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*s<rsub|6>+<around*|(|s<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|s<rsub|1>*c<rsub|2>*c<rsub|4>-c<rsub|1>*s<rsub|4>|)>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|5>|)>*s<rsub|6>+<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>+s<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|s<rsub|2>*c<rsub|4>*c<rsub|5>-c<rsub|2>*s<rsub|5>|)>*c<rsub|6>-s<rsub|2>*s<rsub|4>*s<rsub|6>>|<cell|<around*|(|c<rsub|2>*s<rsub|5>-s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*s<rsub|6>-s<rsub|2>*s<rsub|4>*c<rsub|6>>|<cell|-s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>>|<cell|<around*|(|-s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    <math|<matrix|<tformat|<table|<row|<cell|<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*s<rsub|6>+<around*|(|c<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|s<rsub|1>*s<rsub|4>+c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|5>|)>*s<rsub|6>+<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>+c<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*s<rsub|6>+<around*|(|s<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|s<rsub|1>*c<rsub|2>*c<rsub|4>-c<rsub|1>*s<rsub|4>|)>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|5>|)>*s<rsub|6>+<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>+s<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|s<rsub|2>*c<rsub|4>*c<rsub|5>-c<rsub|2>*s<rsub|5>|)>*c<rsub|6>-s<rsub|2>*s<rsub|4>*s<rsub|6>>|<cell|<around*|(|c<rsub|2>*s<rsub|5>-s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*s<rsub|6>-s<rsub|2>*s<rsub|4>*c<rsub|6>>|<cell|-s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>>|<cell|<around*|(|-s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      DH_SFERICO1_STRUTTURA:create_tab([q[1],q[2],0],[L[1],0,q[3]],[%pi/2,%pi/2,0],[0,L[2],0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|L<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      Q_SFERICO1_STRUTTURA:create_Q(DH_SFERICO1_STRUTTURA[1],DH_SFERICO1_STRUTTURA[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|2>>|<cell|0>|<cell|-c<rsub|2>>|<cell|-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      DH_SFERICO2:create_tab([q[1],q[2],0,q[4],q[5],q[6]],[L[1],L[2],q[3],0,0,L[6]],[-%pi/2,-%pi/2,0,%pi/2,-%pi/2,0],[0,0,0,0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|q<rsub|4>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|5>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|6>>|<cell|L<rsub|6>>|<cell|0>|<cell|0>>>>>,6|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      Q_SFERICO2:create_Q(DH_SFERICO2[1],DH_SFERICO2[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><matrix|<tformat|<table|<row|<cell|<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*s<rsub|6>+<around*|(|<around*|(|s<rsub|1>*s<rsub|4>+c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*s<rsub|6>+<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-c<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-c<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*s<rsub|6>+<around*|(|<around*|(|s<rsub|1>*c<rsub|2>*c<rsub|4>-c<rsub|1>*s<rsub|4>|)>*c<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|s<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*s<rsub|6>+<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-s<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-s<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>-s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|2>*s<rsub|4>*s<rsub|6>+<around*|(|-c<rsub|2>*s<rsub|5>-s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|2>*s<rsub|5>+s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*s<rsub|6>+s<rsub|2>*s<rsub|4>*c<rsub|6>>|<cell|s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>>|<cell|<around*|(|s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    <math|<matrix|<tformat|<table|<row|<cell|<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*s<rsub|6>+<around*|(|<around*|(|s<rsub|1>*s<rsub|4>+c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*s<rsub|6>+<around*|(|s<rsub|1>*c<rsub|4>-c<rsub|1>*c<rsub|2>*s<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-c<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|-s<rsub|1>*s<rsub|4>-c<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-c<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*s<rsub|6>+<around*|(|<around*|(|s<rsub|1>*c<rsub|2>*c<rsub|4>-c<rsub|1>*s<rsub|4>|)>*c<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|s<rsub|1>*s<rsub|2>*s<rsub|5>+<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*c<rsub|5>|)>*s<rsub|6>+<around*|(|-s<rsub|1>*c<rsub|2>*s<rsub|4>-c<rsub|1>*c<rsub|4>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-s<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|<around*|(|<around*|(|c<rsub|1>*s<rsub|4>-s<rsub|1>*c<rsub|2>*c<rsub|4>|)>*s<rsub|5>-s<rsub|1>*s<rsub|2>*c<rsub|5>|)>*L<rsub|6>-s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|2>*s<rsub|4>*s<rsub|6>+<around*|(|-c<rsub|2>*s<rsub|5>-s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*c<rsub|6>>|<cell|<around*|(|c<rsub|2>*s<rsub|5>+s<rsub|2>*c<rsub|4>*c<rsub|5>|)>*s<rsub|6>+s<rsub|2>*s<rsub|4>*c<rsub|6>>|<cell|s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>>|<cell|<around*|(|s<rsub|2>*c<rsub|4>*s<rsub|5>-c<rsub|2>*c<rsub|5>|)>*L<rsub|6>-c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      DH_SFERICO2_STRUTTURA:create_tab([q[1],q[2],0],[L[1],L[2],q[3]],[-%pi/2,%pi/2,0],[0,0,0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      Q_SFERICO2_STRUTTURA:create_Q(DH_SFERICO2_STRUTTURA[1],DH_SFERICO2_STRUTTURA[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|-s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|-s<rsub|2>>|<cell|0>|<cell|c<rsub|2>>|<cell|c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      DH_ANTROPOMORFO:create_tab([q[1],q[2],q[3],q[4],q[5],q[6]],[L[1],0,0,0,0,L[6]],[%pi/2,0,%pi/2,%pi/2,-%pi/2,0],[0,L[2],0,0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>|<row|<cell|q<rsub|3>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|4>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|5>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|6>>|<cell|L<rsub|6>>|<cell|0>|<cell|0>>>>>,6|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      Q_ANTROPOMORFO:create_Q(DH_ANTROPOMORFO[1],DH_ANTROPOMORFO[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|23>+<around*|(|c<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>-c<rsub|1>*s<rsub|4>*s<rsub|6>|)>*c<rsub|23>+s<rsub|1>*c<rsub|4>*s<rsub|6>+s<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-c<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|23>+<around*|(|-c<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|6>|)>*c<rsub|23>-s<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|5>*s<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|23>-s<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|c<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|23>-s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|23>+<around*|(|s<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|4>*s<rsub|6>|)>*c<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-s<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|23>+<around*|(|-s<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|6>|)>*c<rsub|23>+c<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|5>*s<rsub|23>-s<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|23>+c<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|s<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|23>-s<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|23>+c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>|)>*s<rsub|23>-s<rsub|5>*c<rsub|6>*c<rsub|23>>|<cell|<around*|(|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>|)>*s<rsub|23>+s<rsub|5>*s<rsub|6>*c<rsub|23>>|<cell|-c<rsub|4>*s<rsub|5>*s<rsub|23>-c<rsub|5>*c<rsub|23>>|<cell|-c<rsub|4>*s<rsub|5>*L<rsub|6>*s<rsub|23>-c<rsub|5>*L<rsub|6>*c<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|input>
      \;
    </input>

    \;

    <math|<matrix|<tformat|<table|<row|<cell|c<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|23>+<around*|(|c<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>-c<rsub|1>*s<rsub|4>*s<rsub|6>|)>*c<rsub|23>+s<rsub|1>*c<rsub|4>*s<rsub|6>+s<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-c<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|23>+<around*|(|-c<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|6>|)>*c<rsub|23>-s<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|5>*s<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|23>-s<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|c<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|23>-s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|23>+<around*|(|s<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|4>*s<rsub|6>|)>*c<rsub|23>-c<rsub|1>*c<rsub|4>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-s<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|23>+<around*|(|-s<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|6>|)>*c<rsub|23>+c<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|5>*s<rsub|23>-s<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|23>+c<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|s<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|23>-s<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|23>+c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|<around*|(|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>|)>*s<rsub|23>-s<rsub|5>*c<rsub|6>*c<rsub|23>>|<cell|<around*|(|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>|)>*s<rsub|23>+s<rsub|5>*s<rsub|6>*c<rsub|23>>|<cell|-c<rsub|4>*s<rsub|5>*s<rsub|23>-c<rsub|5>*c<rsub|23>>|<cell|-c<rsub|4>*s<rsub|5>*L<rsub|6>*s<rsub|23>-c<rsub|5>*L<rsub|6>*c<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>
  </session>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      DH_ANTROPOMORFO_STRUTTURA:create_tab([q[1],q[2],q[3]],[L[1],0,0],[%pi/2,0,0],[0,L[2],L[3]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>|<row|<cell|q<rsub|3>>|<cell|0>|<cell|0>|<cell|L<rsub|3>>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|unfolded-io>
      Q_ANTROPOMORFO_STRUTTURA:create_Q(DH_ANTROPOMORFO_STRUTTURA[1],DH_ANTROPOMORFO_STRUTTURA[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o32>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|23>>|<cell|-c<rsub|1>*s<rsub|23>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*L<rsub|3>*c<rsub|23>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|23>>|<cell|-s<rsub|1>*s<rsub|23>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*L<rsub|3>*c<rsub|23>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|23>>|<cell|c<rsub|23>>|<cell|0>|<cell|L<rsub|3>*s<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|unfolded-io>
      DH_POLSO_SFERICO:create_tab([q[1],q[2],q[3]],[0,0,L[3]],[-%pi/2,%pi/2,0],[0,0,0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o33>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<math-up|THETA>>|<cell|D>|<cell|<math-up|ALPHA>>|<cell|A>>|<row|<cell|q<rsub|1>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|3>>|<cell|L<rsub|3>>|<cell|0>|<cell|0>>>>>,3|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|unfolded-io>
      Q_POLSO_SFERICO:create_Q(DH_POLSO_SFERICO[1],DH_POLSO_SFERICO[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o34>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>*c<rsub|3>-s<rsub|1>*s<rsub|3>>|<cell|-c<rsub|1>*c<rsub|2>*s<rsub|3>-s<rsub|1>*c<rsub|3>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*L<rsub|3>>>|<row|<cell|c<rsub|1>*s<rsub|3>+s<rsub|1>*c<rsub|2>*c<rsub|3>>|<cell|c<rsub|1>*c<rsub|3>-s<rsub|1>*c<rsub|2>*s<rsub|3>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*L<rsub|3>>>|<row|<cell|-s<rsub|2>*c<rsub|3>>|<cell|s<rsub|2>*s<rsub|3>>|<cell|c<rsub|2>>|<cell|c<rsub|2>*L<rsub|3>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|a3>
    <associate|page-width|auto>
  </collection>
</initial>