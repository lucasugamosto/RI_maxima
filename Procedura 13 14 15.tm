<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <with|color|red|Proedura 1: Procedura che riceve in ingresso asse, angolo,
  spostamento e genera ma matrice di avvitamento corrispondente.>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
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

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|mat_rotazione><around*|(|<math-up|vet>,<math-up|angolo>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<with|math-font-family|rm|norma2>,S,\<vartheta\>,<math-up|II>,<math-up|sII>,<math-up|sIImS>,<with|math-font-family|rm|sIImS_inv>,<math-up|mat>|]>,<with|math-font-family|rm|norma2>:<sqrt|<math-up|vet><rsub|1,1><rsup|2>+<math-up|vet><rsub|2,1><rsup|2>+<math-up|vet><rsub|3,1><rsup|2>>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>S:<around*|(|<frac|1|<with|math-font-family|rm|norma2>>|)>\<cdot\><matrix|<tformat|<table|<row|<cell|0>|<cell|-<math-up|vet><rsub|3,1>>|<cell|<math-up|vet><rsub|2,1>>>|<row|<cell|<math-up|vet><rsub|3,1>>|<cell|0>|<cell|-<math-up|vet><rsub|1,1>>>|<row|<cell|-<math-up|vet><rsub|2,1>>|<cell|<math-up|vet><rsub|1,1>>|<cell|0>>>>><space|0.27em><math-bf|else><space|0.27em>S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-<math-up|vet><rsub|3,1>>|<cell|<math-up|vet><rsub|2,1>>>|<row|<cell|<math-up|vet><rsub|3,1>>|<cell|0>|<cell|-<math-up|vet><rsub|1,1>>>|<row|<cell|-<math-up|vet><rsub|2,1>>|<cell|<math-up|vet><rsub|1,1>>|<cell|0>>>>>,\<vartheta\>:<math-up|angolo>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>\<vartheta\>:\<vartheta\>\<cdot\><with|math-font-family|rm|norma2>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|sII>:s*<math-up|II>,<math-up|sIImS>:<math-up|sII>-S,<with|math-font-family|rm|sIImS_inv>:<math-up|invert><around*|(|<math-up|sIImS>|)>,<math-up|mat>:<matrix|<tformat|<table|<row|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|1,1>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|1,2>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|1,3>,s,t|)>>>|<row|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|2,1>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|2,2>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|2,3>,s,t|)>>>|<row|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|3,1>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|3,2>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|3,3>,s,t|)>>>>>>,<math-up|mat>:<math-up|subst><around*|(|t=\<vartheta\>,<math-up|mat>|)>,<math-up|mat>:<math-up|factor><around*|(|<math-up|mat>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      mat_avvitamento(vettore,angolo,spostamento):=block(

      [R,norma2,D,Q],

      R:mat_rotazione(vettore,angolo),

      norma2:sqrt((vettore[1,1]^2)+(vettore[2,1])^2+(vettore[3,1]^2)),

      if norma2 # 1 then D:spostamento*(vettore/norma2) else
      D:spostamento*vettore,

      Q:matrix([R[1,1],R[1,2],R[1,3],D[1,1]],[R[2,1],R[2,2],R[2,3],D[2,1]],[R[3,1],R[3,2],R[3,3],D[3,1]],[0,0,0,1]),

      Q

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|mat_avvitamento><around*|(|<math-up|vettore>,<math-up|angolo>,<math-up|spostamento>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|R,<with|math-font-family|rm|norma2>,D,Q|]>,R:<with|math-font-family|rm|mat_rotazione><around*|(|<math-up|vettore>,<math-up|angolo>|)>,<with|math-font-family|rm|norma2>:<sqrt|<math-up|vettore><rsub|1,1><rsup|2>+<math-up|vettore><rsub|2,1><rsup|2>+<math-up|vettore><rsub|3,1><rsup|2>>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>D:<math-up|spostamento>*<around*|(|<frac|<math-up|vettore>|<with|math-font-family|rm|norma2>>|)><space|0.27em><math-bf|else><space|0.27em>D:<math-up|spostamento>*<math-up|vettore>,Q:<matrix|<tformat|<table|<row|<cell|R<rsub|1,1>>|<cell|R<rsub|1,2>>|<cell|R<rsub|1,3>>|<cell|D<rsub|1,1>>>|<row|<cell|R<rsub|2,1>>|<cell|R<rsub|2,2>>|<cell|R<rsub|2,3>>|<cell|D<rsub|2,1>>>|<row|<cell|R<rsub|3,1>>|<cell|R<rsub|3,2>>|<cell|R<rsub|3,3>>|<cell|D<rsub|3,1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,Q|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      mat_avvitamento(matrix([1],[1],[0]),gamma,L)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|<frac|cos
      <around*|(|<sqrt|2>*\<gamma\>|)>+1|2>>|<cell|-<frac|cos
      <around*|(|<sqrt|2>*\<gamma\>|)>-1|2>>|<cell|<frac|sin
      <around*|(|<sqrt|2>*\<gamma\>|)>|<sqrt|2>>>|<cell|<frac|L|<sqrt|2>>>>|<row|<cell|-<frac|cos
      <around*|(|<sqrt|2>*\<gamma\>|)>-1|2>>|<cell|<frac|cos
      <around*|(|<sqrt|2>*\<gamma\>|)>+1|2>>|<cell|-<frac|sin
      <around*|(|<sqrt|2>*\<gamma\>|)>|<sqrt|2>>>|<cell|<frac|L|<sqrt|2>>>>|<row|<cell|-<frac|sin
      <around*|(|<sqrt|2>*\<gamma\>|)>|<sqrt|2>>>|<cell|<frac|sin
      <around*|(|<sqrt|2>*\<gamma\>|)>|<sqrt|2>>>|<cell|cos
      <around*|(|<sqrt|2>*\<gamma\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    \;

    <with|color|red|Procedura 2: Utilizzando la procedura precendente si
    calcolano le matrici di avvitamento lungo z Av(z,\<theta\>,d) e lungo x
    Av(x,\<alpha\>,a):>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      mat_avvitamento(matrix([0],[0],[1]),theta,d)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|0>>|<row|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|d>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      mat_avvitamento(matrix([1],[0],[0]),alpha,a)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|a>>|<row|<cell|0>|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>|<cell|0>>|<row|<cell|0>|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    \;

    <with|color|red|Procedura 3: Utilizzando le procedure precedenti si
    calcola la matrice di cinematica diretta i-esima come prodotto delle due
    matrici di avvitamento appena calcolate>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      mat_Qi(theta,alpha,d,a):=block(

      [AVz,AVx,Q],

      AVz:mat_avvitamento(matrix([0],[0],[1]),theta,d),

      AVx:mat_avvitamento(matrix([1],[0],[0]),alpha,a),

      Q:AVz.AVx,

      let(cos(theta)

      Q

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><with|math-font-family|rm|mat_Qi><around*|(|\<vartheta\>,\<alpha\>,d,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|AVz>,<math-up|AVx>,Q|]>,<math-up|AVz>:<with|math-font-family|rm|mat_avvitamento><around*|(|<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|1>>>>>,\<vartheta\>,d|)>,<math-up|AVx>:<with|math-font-family|rm|mat_avvitamento><around*|(|<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,\<alpha\>,a|)>,Q:<math-up|AVz>\<cdot\><math-up|AVx>,Q|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      mat_Qi(theta[i],alpha[i],d[i],a[i])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\><rsub|i>|)>>|<cell|-cos
      <around*|(|\<alpha\><rsub|i>|)>*sin
      <around*|(|\<vartheta\><rsub|i>|)>>|<cell|sin
      <around*|(|\<alpha\><rsub|i>|)>*sin
      <around*|(|\<vartheta\><rsub|i>|)>>|<cell|a<rsub|i>*cos
      <around*|(|\<vartheta\><rsub|i>|)>>>|<row|<cell|sin
      <around*|(|\<vartheta\><rsub|i>|)>>|<cell|cos
      <around*|(|\<alpha\><rsub|i>|)>*cos
      <around*|(|\<vartheta\><rsub|i>|)>>|<cell|-sin
      <around*|(|\<alpha\><rsub|i>|)>*cos
      <around*|(|\<vartheta\><rsub|i>|)>>|<cell|a<rsub|i>*sin
      <around*|(|\<vartheta\><rsub|i>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<alpha\><rsub|i>|)>>|<cell|cos
      <around*|(|\<alpha\><rsub|i>|)>>|<cell|d<rsub|i>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>