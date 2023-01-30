<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA 13 : Scrivere una procedura che dati: asse, angolo, spostamento;
  generi la corrispondente matrice di avvitamento.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      calcoloVersore(vettore):=block(

      [norma2,e],

      /*controllare il tipo di dato del parametro in ingresso*/

      if scalarp(vettore) = true or listp(vettore) = true then return(0),

      \;

      norma2:sqrt((vettore[1,1]^2)+(vettore[2,1]^2)+(vettore[3,1]^2)),

      if norma2 = 0 then return(0),

      if norma2 # 1 then e:(1/norma2)*vettore else e:vettore,

      return(e)

      )$
    </input>

    \;

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      matrixR(vettore,angolo):=block(

      [e,S,norma2,II,sII,sIImS,sIImSInv,mat],

      \;

      /*la funzione restituisce valore nullo se l'elemento passato in input
      non è un vettore o è un vettore completamente nullo*/

      e:calcoloVersore(vettore),

      if e = 0 then return(0),

      \;

      /*inizializzazione della matrice antisimmetrica*/

      S:matrix([0,-e[3,1],e[2,1]],[e[3,1],0,-e[1,1]],[-e[2,1],e[1,1],0]),

      \;

      if listp(angolo) = true or matrixp(angolo) = true then return(0),

      norma2:sqrt((vettore[1,1]^2)+(vettore[2,1]^2)+(vettore[3,1]^2)),

      if norma2 # 1 then angolo:norma2*angolo,

      \;

      /*calcolare la matrice di rotazione tramite la trasformata di Laplace*/

      II:matrix([1,0,0],[0,1,0],[0,0,1]),

      sII:s*II,

      sIImS:factor(sII-S),

      sIImSInv:trigsimp(trigreduce(invert(sIImS))),

      R:matrix([ilt(sIImSInv[1,1],s,t),ilt(sIImSInv[1,2],s,t),ilt(sIImSInv[1,3],s,t)],[ilt(sIImSInv[2,1],s,t),ilt(sIImSInv[2,2],s,t),ilt(sIImSInv[2,3],s,t)],[ilt(sIImSInv[3,1],s,t),ilt(sIImSInv[3,2],s,t),ilt(sIImSInv[3,3],s,t)]),

      R:subst(t=angolo,R),

      R:trigsimp(trigreduce(factor(R))),

      return(R)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      matriceAvvitamento(vettore,angolo,spostamento):=block(

      [R,e,D,AvMatrix],

      /*controllare il tipo di dato di tutti gli elementi passati in input*/

      if scalarp(asse) = true or listp(asse) = true then return(-1),

      if listp(angolo) = true or matrixp(angolo) = true then return(-1),

      if listp(spostamento) = true or matrixp(spostamento) = true then
      return(-1),

      \;

      /*tramite le due funzioni implementate in precedenza si calcola la
      matrice di rotazione R ed il versore per definire il vettore di
      spostamento D*/

      R:matrixR(vettore,angolo),

      if R = 0 then return(0),

      e:calcoloVersore(vettore),

      D:spostamento*e,

      \;

      AvMatrix:matrix([R[1,1],R[1,2],R[1,3],D[1,1]],[R[2,1],R[2,2],R[2,3],D[2,1]],[R[3,1],R[3,2],R[3,3],D[3,1]],[0,0,0,1]),

      return(AvMatrix)

      )$
    </input>

    \;

    \;

    \;

    PROCEDURA 14: Utilizzando la procedura precedente, calcolare
    Av(z,\<theta\>,d) e Av(x,\<alpha\>,a).

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      Ax:matriceAvvitamento(matrix([1],[0],[0]),alpha,a)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|a>>|<row|<cell|0>|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>|<cell|0>>|<row|<cell|0>|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      Az:matriceAvvitamento(matrix([0],[0],[1]),theta,d)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|0>>|<row|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|d>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    \;

    \;

    PROCEDURA 15: Utilizzando la procedura precedente, calcolare
    <math|Q<rsub|i-1,i>=Av<around*|(|z,\<theta\>,d|)>*Av<around*|(|x,\<alpha\>,a|)>>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      matrixQi(theta,alpha,d,a):=block(

      [AVz,AVx,Q],

      AVz:matriceAvvitamento(matrix([0],[0],[1]),theta,d),

      AVx:matriceAvvitamento(matrix([1],[0],[0]),alpha,a),

      Q:AVz.AVx,

      return(Q)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      matrixQi(theta,alpha,d,a)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-cos <around*|(|\<alpha\>|)>*sin
      <around*|(|\<vartheta\>|)>>|<cell|sin <around*|(|\<alpha\>|)>*sin
      <around*|(|\<vartheta\>|)>>|<cell|a*cos
      <around*|(|\<vartheta\>|)>>>|<row|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos <around*|(|\<alpha\>|)>*cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin <around*|(|\<alpha\>|)>*cos
      <around*|(|\<vartheta\>|)>>|<cell|a*sin
      <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>|<cell|d>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>