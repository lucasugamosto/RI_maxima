<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURE CHE CALCOLANO LA MATRICE DI AVVITAMENTO LUNGO L'ASSE X E L'ASSE Z
  ED INFINE CALCOLANO LA MATRICE DELLA CINEMATICA DIRETTA i-ESIMA.

  <with|color|red|Proedura 1: Procedura che riceve in ingresso (asse, angolo,
  spostamento) e genera la matrice di avvitamento corrispondente.>

  Con queste due sotto-funzioni calcolo la matrice di rotazione R che fa
  parte della matrice di avvitamento Av completa:

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
      mat_R(vet,angolo):=block(

      [e,S,norma2,theta,II,sII,sIImS,sIImS_inv,mat],

      e:calcolo_versore(vet),

      if e = 0 then return(0),

      S:matrix([0,-e[3,1],e[2,1]],[e[3,1],0,-e[1,1]],[-e[2,1],e[1,1],0]),

      \;

      if listp(angolo) = true or matrixp(angolo) = true then return(0),

      norma2:sqrt((vet[1,1])^2+(vet[2,1])^2+(vet[3,1])^2),

      theta:%pi*(angolo/180),

      if norma2 # 1 then theta:norma2*theta,

      \;

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      sII:s*II,

      sIImS:sII-S,

      sIImS_inv:trigsimp(invert(sIImS)),

      R:matrix([ilt(sIImS_inv[1,1],s,t),ilt(sIImS_inv[1,2],s,t),ilt(sIImS_inv[1,3],s,t)],[ilt(sIImS_inv[2,1],s,t),ilt(sIImS_inv[2,2],s,t),ilt(sIImS_inv[2,3],s,t)],[ilt(sIImS_inv[3,1],s,t),ilt(sIImS_inv[3,2],s,t),ilt(sIImS_inv[3,3],s,t)]),

      R:subst(t=theta,R),

      R:trigsimp(factor(R)),

      return(R)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|mat_R><around*|(|<math-up|vet>,<math-up|angolo>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|e,S,<with|math-font-family|rm|norma2>,\<vartheta\>,<math-up|II>,<math-up|sII>,<math-up|sIImS>,<with|math-font-family|rm|sIImS_inv>,<math-up|mat>|]>,e:<with|math-font-family|rm|calcolo_versore><around*|(|<math-up|vet>|)>,<math-bf|if><space|0.27em>e=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-e<rsub|3,1>>|<cell|e<rsub|2,1>>>|<row|<cell|e<rsub|3,1>>|<cell|0>|<cell|-e<rsub|1,1>>>|<row|<cell|-e<rsub|2,1>>|<cell|e<rsub|1,1>>|<cell|0>>>>>,<math-bf|if><space|0.27em><math-up|listp><around*|(|<math-up|angolo>|)>=<math-bf|true>\<vee\><math-up|matrixp><around*|(|<math-up|angolo>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<with|math-font-family|rm|norma2>:<sqrt|<math-up|vet><rsub|1,1><rsup|2>+<math-up|vet><rsub|2,1><rsup|2>+<math-up|vet><rsub|3,1><rsup|2>>,\<vartheta\>:\<pi\>*<around*|(|<frac|<math-up|angolo>|180>|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|norma2>\<neq\>1<space|0.27em><math-bf|then><space|0.27em>\<vartheta\>:<with|math-font-family|rm|norma2>*\<vartheta\>,<math-up|II>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|sII>:s*<math-up|II>,<math-up|sIImS>:<math-up|sII>-S,<with|math-font-family|rm|sIImS_inv>:<math-up|trigsimp><around*|(|<math-up|invert><around*|(|<math-up|sIImS>|)>|)>,R:<matrix|<tformat|<table|<row|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|1,1>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|1,2>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|1,3>,s,t|)>>>|<row|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|2,1>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|2,2>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|2,3>,s,t|)>>>|<row|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|3,1>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|3,2>,s,t|)>>|<cell|<math-up|ilt><around*|(|<with|math-font-family|rm|sIImS_inv><rsub|3,3>,s,t|)>>>>>>,R:<math-up|subst><around*|(|t=\<vartheta\>,R|)>,R:<math-up|trigsimp><around*|(|<math-up|factor><around*|(|R|)>|)>,<math-up|return><around*|(|R|)>|)>>>
    </unfolded-io>

    <\textput>
      \;

      Funzione con la quale viene calcolata la matrice di avvitamento intorno
      ad un determinato asse, di un certo angolo e con un certo spostamento:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      mat_Av(asse,angolo,spostamento):=block(

      [R,e,D,Q],

      R:mat_R(asse,angolo),

      if R = 0 then return(0),

      \;

      e:calcolo_versore(asse),

      D:spostamento*e,

      Av:matrix([R[1,1],R[1,2],R[1,3],D[1,1]],[R[2,1],R[2,2],R[2,3],D[2,1]],[R[3,1],R[3,2],R[3,3],D[3,1]],[0,0,0,1]),

      return(Av)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|mat_Av><around*|(|<math-up|asse>,<math-up|angolo>,<math-up|spostamento>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|R,e,D,Q|]>,R:<with|math-font-family|rm|mat_R><around*|(|<math-up|asse>,<math-up|angolo>|)>,<math-bf|if><space|0.27em>R=0<space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,e:<with|math-font-family|rm|calcolo_versore><around*|(|<math-up|asse>|)>,D:<math-up|spostamento>*e,<math-up|Av>:<matrix|<tformat|<table|<row|<cell|R<rsub|1,1>>|<cell|R<rsub|1,2>>|<cell|R<rsub|1,3>>|<cell|D<rsub|1,1>>>|<row|<cell|R<rsub|2,1>>|<cell|R<rsub|2,2>>|<cell|R<rsub|2,3>>|<cell|D<rsub|2,1>>>|<row|<cell|R<rsub|3,1>>|<cell|R<rsub|3,2>>|<cell|R<rsub|3,3>>|<cell|D<rsub|3,1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|return><around*|(|<math-up|Av>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      mat_Av(matrix([1],[0],[0]),alpha,a)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|a>>|<row|<cell|0>|<cell|cos
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>|<cell|-sin
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>|<cell|0>>|<row|<cell|0>|<cell|sin
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>|<cell|cos
      <around*|(|<frac|\<pi\>*\<alpha\>|180>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      mat_Av(matrix([0],[0],[1]),theta,d)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|\<pi\>*\<vartheta\>|180>|)>>|<cell|-sin
      <around*|(|<frac|\<pi\>*\<vartheta\>|180>|)>>|<cell|0>|<cell|0>>|<row|<cell|sin
      <around*|(|<frac|\<pi\>*\<vartheta\>|180>|)>>|<cell|cos
      <around*|(|<frac|\<pi\>*\<vartheta\>|180>|)>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|d>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    \;

    <\with|color|red>
      \;

      Procedura 3: Utilizzando le procedure precedenti si calcola la matrice
      di cinematica diretta i-esima come prodotto di due matrici di
      avvitamento, una intorno all'asse z ed una intorno all'asse x.
    </with>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      mat_Qi(theta,alpha,d,a):=block(

      [AVz,AVx,Q],

      AVz:mat_Av(matrix([0],[0],[1]),theta,d),

      AVx:mat_Av(matrix([1],[0],[0]),alpha,a),

      Q:factor(AVz.AVx),

      return(Q)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><with|math-font-family|rm|mat_Qi><around*|(|\<vartheta\>,\<alpha\>,d,a|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|AVz>,<math-up|AVx>,Q|]>,<math-up|AVz>:<with|math-font-family|rm|mat_Av><around*|(|<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|1>>>>>,\<vartheta\>,d|)>,<math-up|AVx>:<with|math-font-family|rm|mat_Av><around*|(|<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,\<alpha\>,a|)>,Q:<math-up|factor><around*|(|<math-up|AVz>\<cdot\><math-up|AVx>|)>,<math-up|return><around*|(|Q|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      mat_Qi(theta[i],alpha[i],d[i],a[i])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|\<pi\>*\<vartheta\><rsub|i>|180>|)>>|<cell|-cos
      <around*|(|<frac|\<pi\>*\<alpha\><rsub|i>|180>|)>*sin
      <around*|(|<frac|\<pi\>*\<vartheta\><rsub|i>|180>|)>>|<cell|sin
      <around*|(|<frac|\<pi\>*\<alpha\><rsub|i>|180>|)>*sin
      <around*|(|<frac|\<pi\>*\<vartheta\><rsub|i>|180>|)>>|<cell|a<rsub|i>*cos
      <around*|(|<frac|\<pi\>*\<vartheta\><rsub|i>|180>|)>>>|<row|<cell|sin
      <around*|(|<frac|\<pi\>*\<vartheta\><rsub|i>|180>|)>>|<cell|cos
      <around*|(|<frac|\<pi\>*\<alpha\><rsub|i>|180>|)>*cos
      <around*|(|<frac|\<pi\>*\<vartheta\><rsub|i>|180>|)>>|<cell|-sin
      <around*|(|<frac|\<pi\>*\<alpha\><rsub|i>|180>|)>*cos
      <around*|(|<frac|\<pi\>*\<vartheta\><rsub|i>|180>|)>>|<cell|a<rsub|i>*sin
      <around*|(|<frac|\<pi\>*\<vartheta\><rsub|i>|180>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|<frac|\<pi\>*\<alpha\><rsub|i>|180>|)>>|<cell|cos
      <around*|(|<frac|\<pi\>*\<alpha\><rsub|i>|180>|)>>|<cell|d<rsub|i>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>