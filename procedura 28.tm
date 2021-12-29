<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <with|color|red|Procedura 1: Procedura per il calcolo della matrice
  d'inerzia di un PARALLELEPIPEDO DI LATI A, B, C.>

  L'asse x si ha lungo A, l'asse y si ha lungo B e l'asse z si ha lungo C.
  Per calcolare il baricentro del parallelepipedo si considera il punto di
  mezzo dei tre lati.

  (x, y, z sono gli assi associati al sistema di riferimento solidale al
  corpo e non al sistema di riferimento inerziale).

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      S(x,y,z):=matrix([0,-z,y],[z,0,-x],[-y,x,0])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      SS:S(x,y,z)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-z>|<cell|y>>|<row|<cell|z>|<cell|0>|<cell|-x>>|<row|<cell|-y>|<cell|x>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      SS_T:transpose(SS)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|z>|<cell|-y>>|<row|<cell|-z>|<cell|0>|<cell|x>>|<row|<cell|y>|<cell|-x>|<cell|0>>>>>>>
    </unfolded-io>

    \;

    Verifico che la matrice SS sia una matrice anti-simmetrica, controllando
    che vale la proprietà. Se si ha riscontro positivo ritorna il prodotto
    della matrice S e la sua trasposta, altrimenti torna 0.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      control_matrix(mat,mat_T):=block(

      [mat_identità,mat_finale],

      mat_identità:0*ident(3),

      mat_finale:mat+mat_T,

      if mat_finale # mat_identità then return(0),

      S1:mat_T.mat,

      return(S1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      S1:control_matrix(SS,SS_T)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|z<rsup|2>+y<rsup|2>>|<cell|-x*y>|<cell|-x*z>>|<row|<cell|-x*y>|<cell|z<rsup|2>+x<rsup|2>>|<cell|-y*z>>|<row|<cell|-x*z>|<cell|-y*z>|<cell|y<rsup|2>+x<rsup|2>>>>>>>>
    </unfolded-io>

    \;

    Calcolo il volume del parallelepipedo nel seguente modo:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      V:expand(integrate(integrate(integrate(1,x,-A/2,A/2),y,-B/2,B/2),z,-C/2,C/2))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>A*B*C>>
    </unfolded-io>

    \;

    Calcolo tutti gli elementi della matrice di inerzia come segue:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      II:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ II[i,j]:factor(expand(integrate(integrate(integrate(S1[i,j],x,-A/2,A/2),y,-B/2,B/2),z,-C/2,C/2)*(M/V)))

      \ )

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      II
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|<frac|<around*|(|C<rsup|2>+B<rsup|2>|)>*M|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|<around*|(|C<rsup|2>+A<rsup|2>|)>*M|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|<around*|(|B<rsup|2>+A<rsup|2>|)>*M|12>>>>>>>>
    </unfolded-io>
  </session>

  Avendo scento gli assi x, y, z lungo i 3 piani di simmetria allora gli
  elementi fuori diagonale principale sono tutti nulli.

  \;

  <with|color|red|Procedura 2: Procedura per il calcolo della matrice di
  inerzia associata ad un cilindro di raggio R ed altezza H.>

  Per il cilindro si dovrà integrare lungo un volume cilindrico quindi è
  utile usare le coordinate cilindriche.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      S(x,y,z):=matrix([0,-z,y],[z,0,-x],[-y,x,0])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      SS:S(x,y,z)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-z>|<cell|y>>|<row|<cell|z>|<cell|0>|<cell|-x>>|<row|<cell|-y>|<cell|x>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      SS_T:transpose(SS)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|z>|<cell|-y>>|<row|<cell|-z>|<cell|0>|<cell|x>>|<row|<cell|y>|<cell|-x>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      control_matrix(mat,mat_T):=block(

      [mat_identità,mat_finale],

      mat_identità:0*ident(3),

      mat_finale:mat+mat_T,

      if mat_finale # mat_identità then return(0),

      S1:mat_T.mat,

      return(S1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      S1:control_matrix(SS,SS_T)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|z<rsup|2>+y<rsup|2>>|<cell|-x*y>|<cell|-x*z>>|<row|<cell|-x*y>|<cell|z<rsup|2>+x<rsup|2>>|<cell|-y*z>>|<row|<cell|-x*z>|<cell|-y*z>|<cell|y<rsup|2>+x<rsup|2>>>>>>>>
    </unfolded-io>

    \;

    Ora si deve calcolare il volume del cilindro e per farlo bisogna
    introdurre le coordinate colindriche nel seguente modo: considero 'z'
    come l'asse di rotazione del cilindro e gli assi x, y nel piano, dov
    generano un cerchio di raggio minimo 0 e massimo R.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      Rz:matrix([cos(alpha),-sin(alpha),0],[sin(alpha),cos(alpha),0],[0,0,1])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      p:Rz.matrix([rho],[0],[h])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>*\<rho\>>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>*\<rho\>>>|<row|<cell|h>>>>>>>
    </unfolded-io>

    Tale vettore contiene le equazioni delle coordinate cilindriche, dov 'h'
    va da -H/2 ad H/2, \<rho\> va da 0 ad R ed \<alpha\> va da 0 a 2\<pi\>.

    \;

    Calcolo lo jacobiano di p:\ 

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      dp:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ dp[i,1]:diff(p[i,1],rho),

      \ dp[i,2]:diff(p[i,1],alpha),

      \ dp[i,3]:diff(p[i,1],h)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      dp
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>*\<rho\>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>*\<rho\>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    Tale matrice è lo jacobiano della trasformazione che porta da coordinate
    lineari a coordinate cilindriche.

    \;

    Ora calcolo il determinante dello jacobiano:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      Ddp:trigreduce(factor(determinant(dp)))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>\<rho\>>>
    </unfolded-io>

    \;

    Calcolo il volume del cilindro con le coordinate cilindriche appena
    trovate:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      V:expand(integrate(integrate(integrate(1*Ddp,alpha,0,2*%pi),rho,0,R),h,-H/2,H/2))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>\<pi\>*H*R<rsup|2>>>
    </unfolded-io>

    \;

    Calcolo la matrice di inerzia del cilindro di raggio R ed altezza H:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|input>
      S2:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ S2[i,j]:subst([x=p[1,1],y=p[2,1],z=p[3,1]],S1[i,j])

      \ )

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      S2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><matrix|<tformat|<table|<row|<cell|sin
      <around*|(|\<alpha\>|)><rsup|2>*\<rho\><rsup|2>+h<rsup|2>>|<cell|-cos
      <around*|(|\<alpha\>|)>*sin <around*|(|\<alpha\>|)>*\<rho\><rsup|2>>|<cell|-cos
      <around*|(|\<alpha\>|)>*h*\<rho\>>>|<row|<cell|-cos
      <around*|(|\<alpha\>|)>*sin <around*|(|\<alpha\>|)>*\<rho\><rsup|2>>|<cell|cos
      <around*|(|\<alpha\>|)><rsup|2>*\<rho\><rsup|2>+h<rsup|2>>|<cell|-sin
      <around*|(|\<alpha\>|)>*h*\<rho\>>>|<row|<cell|-cos
      <around*|(|\<alpha\>|)>*h*\<rho\>>|<cell|-sin
      <around*|(|\<alpha\>|)>*h*\<rho\>>|<cell|sin
      <around*|(|\<alpha\>|)><rsup|2>*\<rho\><rsup|2>+cos
      <around*|(|\<alpha\>|)><rsup|2>*\<rho\><rsup|2>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      II:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ II[i,j]:factor(expand(integrate(integrate(integrate(S2[i,j]*Ddp,alpha,0,2*%pi),rho,0,R),h,-H/2,H/2)*(M/V)))

      \ )

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      II
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M*<around*|(|3*R<rsup|2>+H<rsup|2>|)>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M*<around*|(|3*R<rsup|2>+H<rsup|2>|)>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M*R<rsup|2>|2>>>>>>>>
    </unfolded-io>

    Gli elementi in coordinate (x,x) ed (y,y) sono uguali poichè sono
    simmetriche nel piano (x,y) mentre la componente (z,z) è diverso perchè
    il cilindro ha una simmetria diversa rispetto all'asse z.
  </session>

  \;

  <with|color|red|Procedura 3: Procedura per il calcolo della matrice di
  inerzia associato ad una sfera di raggio R.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      S(x,y,z):=matrix([0,-z,y],[z,0,-x],[-y,x,0])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      SS:S(x,y,z)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-z>|<cell|y>>|<row|<cell|z>|<cell|0>|<cell|-x>>|<row|<cell|-y>|<cell|x>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      SS_T:transpose(SS)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|z>|<cell|-y>>|<row|<cell|-z>|<cell|0>|<cell|x>>|<row|<cell|y>|<cell|-x>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      control_matrix(mat,mat_T):=block(

      [mat_identità,mat_finale],

      mat_identità:0*ident(3),

      mat_finale:mat+mat_T,

      if mat_finale # mat_identità then return(0),

      S1:mat_T.mat,

      return(S1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      S1:control_matrix(SS,SS_T)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|z<rsup|2>+y<rsup|2>>|<cell|-x*y>|<cell|-x*z>>|<row|<cell|-x*y>|<cell|z<rsup|2>+x<rsup|2>>|<cell|-y*z>>|<row|<cell|-x*z>|<cell|-y*z>|<cell|y<rsup|2>+x<rsup|2>>>>>>>>
    </unfolded-io>

    Ora bisogna definire le coordinate sferiche, per farlo si prendono due
    matrici di rotazione qualsiasi, per esempio Rx ed Ry.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      Rx:matrix([1,0,0],[0,cos(alpha),-sin(alpha)],[0,sin(alpha),cos(alpha)])$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      Ry:matrix([cos(beta),0,sin(beta)],[0,1,0],[-sin(beta),0,cos(beta)])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      p:(Rx.Ry).matrix([0],[0],[rho])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|sin
      <around*|(|\<beta\>|)>*\<rho\>>>|<row|<cell|-sin
      <around*|(|\<alpha\>|)>*cos <around*|(|\<beta\>|)>*\<rho\>>>|<row|<cell|cos
      <around*|(|\<alpha\>|)>*cos <around*|(|\<beta\>|)>*\<rho\>>>>>>>>
    </unfolded-io>

    \;

    \;

    Calcolo ora la matrice jacobiana:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      dp:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ dp[i,1]:diff(p[i,1],alpha),

      \ dp[i,2]:diff(p[i,1],beta),

      \ dp[i,3]:diff(p[i,1],rho)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      dp
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|cos
      <around*|(|\<beta\>|)>*\<rho\>>|<cell|sin
      <around*|(|\<beta\>|)>>>|<row|<cell|-cos <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)>*\<rho\>>|<cell|sin <around*|(|\<alpha\>|)>*sin
      <around*|(|\<beta\>|)>*\<rho\>>|<cell|-sin <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)>>>|<row|<cell|-sin <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)>*\<rho\>>|<cell|-cos <around*|(|\<alpha\>|)>*sin
      <around*|(|\<beta\>|)>*\<rho\>>|<cell|cos <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      Ddp:trigreduce(factor(determinant(dp)))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>cos <around*|(|\<beta\>|)>*\<rho\><rsup|2>>>
    </unfolded-io>

    \;

    \;

    Calcolo ora il volume della sfera:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      V:expand(integrate(integrate(integrate(1*Ddp,alpha,0,2*%pi),beta,-%pi/2,%pi/2),rho,0,R))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><frac|4*\<pi\>*R<rsup|3>|3>>>
    </unfolded-io>

    Calcolo ora la matrice di inerzia della sfera di raggio R:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|input>
      S2:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ S2[i,j]:subst([x=p[1,1],y=p[2,1],z=p[3,1]],S1[i,j])

      \ )

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><math-bf|done>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      S2$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|sin
      <around*|(|\<alpha\>|)><rsup|2>*cos
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>+cos
      <around*|(|\<alpha\>|)><rsup|2>*cos
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>>|<cell|sin
      <around*|(|\<alpha\>|)>*cos <around*|(|\<beta\>|)>*sin
      <around*|(|\<beta\>|)>*\<rho\><rsup|2>>|<cell|-cos
      <around*|(|\<alpha\>|)>*cos <around*|(|\<beta\>|)>*sin
      <around*|(|\<beta\>|)>*\<rho\><rsup|2>>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>*cos <around*|(|\<beta\>|)>*sin
      <around*|(|\<beta\>|)>*\<rho\><rsup|2>>|<cell|sin
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>+cos
      <around*|(|\<alpha\>|)><rsup|2>*cos
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>>|<cell|cos
      <around*|(|\<alpha\>|)>*sin <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>>>|<row|<cell|-cos
      <around*|(|\<alpha\>|)>*cos <around*|(|\<beta\>|)>*sin
      <around*|(|\<beta\>|)>*\<rho\><rsup|2>>|<cell|cos
      <around*|(|\<alpha\>|)>*sin <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>>|<cell|sin
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>+sin
      <around*|(|\<alpha\>|)><rsup|2>*cos
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>>>>>>
    </equation*>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|input>
      II:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ II[i,j]:factor(expand(integrate(integrate(integrate(S2[i,j]*Ddp,alpha,0,2*%pi),beta,-%pi/2,%pi/2),rho,0,R)*(M/V)))

      \ )

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      II
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2*M*R<rsup|2>|5>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|2*M*R<rsup|2>|5>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|2*M*R<rsup|2>|5>>>>>>>>
    </unfolded-io>

    Questa è la matrice di inerzia della sfera, esatta poichè tutti i termini
    sulla diagonale principale sono uguali tra loro.
  </session>

  \;

  <with|color|red|Procedura 4: Procedura per il calcolo della matrice di
  inerzia del parallelepipedo cavo. Per farlo calcolo la matrice di inerzia
  del parallelepipedo pieno di lati A, B, C e di quello più piccolo di lati
  a, b, c (a\<less\>A,b\<less\>B,c\<less\>C) e poi alla seconda sottraggo la
  prima.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      S(x,y,z):=matrix([0,-z,y],[z,0,-x],[-y,x,0])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      SS:S(x,y,z)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-z>|<cell|y>>|<row|<cell|z>|<cell|0>|<cell|-x>>|<row|<cell|-y>|<cell|x>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      SS_T:transpose(SS)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|z>|<cell|-y>>|<row|<cell|-z>|<cell|0>|<cell|x>>|<row|<cell|y>|<cell|-x>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      control_matrix(mat,mat_T):=block(

      [mat_identità,mat_finale],

      mat_identità:0*ident(3),

      mat_finale:mat+mat_T,

      if mat_finale # mat_identità then return(0),

      S1:mat_T.mat,

      return(S1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      S1:control_matrix(SS,SS_T)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|z<rsup|2>+y<rsup|2>>|<cell|-x*y>|<cell|-x*z>>|<row|<cell|-x*y>|<cell|z<rsup|2>+x<rsup|2>>|<cell|-y*z>>|<row|<cell|-x*z>|<cell|-y*z>|<cell|y<rsup|2>+x<rsup|2>>>>>>>>
    </unfolded-io>

    \;

    Adesso calcolo la matrice di inerzia del parallelepipedo di lati A, B, C,
    considerando l'asse x lungo il lato A, l'asse y lungo il lato B, l'asse z
    lungo il lato C:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      V[1]:expand(integrate(integrate(integrate(1,x,-A/2,A/2),y,-B/2,B/2),z,-C/2,C/2))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>A*B*C>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      II:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ II[i,j]:factor(expand(integrate(integrate(integrate(S1[i,j],x,-A/2,A/2),y,-B/2,B/2),z,-C/2,C/2)*(M[1]/V[1])))

      \ )

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      II
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M<rsub|1>*<around*|(|C<rsup|2>+B<rsup|2>|)>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M<rsub|1>*<around*|(|C<rsup|2>+A<rsup|2>|)>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M<rsub|1>*<around*|(|B<rsup|2>+A<rsup|2>|)>|12>>>>>>>>
    </unfolded-io>

    \;

    Adesso calcolo la matrice di inerzia del parallelepipedo più piccolo
    (interno a quello più grande e con lo stesso asse di simmetria z) di lati
    a, b, c:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      V[2]:expand(integrate(integrate(integrate(1,x,-a/2,a/2),y,-b/2,b/2),z,-c/2,c/2))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>a*b*c>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      II2:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ II2[i,j]:factor(expand(integrate(integrate(integrate(S1[i,j],x,-a/2,a/2),y,-b/2,b/2),z,-c/2,c/2)*(M[2]/V[2])))

      \ )

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      II2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M<rsub|2>*<around*|(|c<rsup|2>+b<rsup|2>|)>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M<rsub|2>*<around*|(|c<rsup|2>+a<rsup|2>|)>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M<rsub|2>*<around*|(|b<rsup|2>+a<rsup|2>|)>|12>>>>>>>>
    </unfolded-io>

    Ora calcolo la matrice di inerzia del parallelepipedo cavo per
    sottrazione.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|input>
      II_finale:factor(II-II2)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|-<frac|M<rsub|2>*c<rsup|2>+M<rsub|2>*b<rsup|2>-M<rsub|1>*C<rsup|2>-M<rsub|1>*B<rsup|2>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|-<frac|M<rsub|2>*c<rsup|2>+M<rsub|2>*a<rsup|2>-M<rsub|1>*C<rsup|2>-M<rsub|1>*A<rsup|2>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|M<rsub|2>*b<rsup|2>+M<rsub|2>*a<rsup|2>-M<rsub|1>*B<rsup|2>-M<rsub|1>*A<rsup|2>|12>>>>>>
    </equation*>
  </session>

  \;

  \;

  <with|color|red|Procedura 5: Procedura per il calcolo della matrice di
  inerzia di un cilindro cavo, adottando la sottrazione delle matrici di
  inerzia. Sia R il raggio del cilindro grande, mentre r il raggio del
  cilindro più piccolo interno a quello grande e con cui condivide l'asse di
  simmetria.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      S(x,y,z):=matrix([0,-z,y],[z,0,-x],[-y,x,0])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      SS:S(x,y,z)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-z>|<cell|y>>|<row|<cell|z>|<cell|0>|<cell|-x>>|<row|<cell|-y>|<cell|x>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      SS_T:transpose(SS)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|z>|<cell|-y>>|<row|<cell|-z>|<cell|0>|<cell|x>>|<row|<cell|y>|<cell|-x>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      control_matrix(mat,mat_T):=block(

      [mat_identità,mat_finale],

      mat_identità:0*ident(3),

      mat_finale:mat+mat_T,

      if mat_finale # mat_identità then return(0),

      S1:mat_T.mat,

      return(S1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      S1:control_matrix(SS,SS_T)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|z<rsup|2>+y<rsup|2>>|<cell|-x*y>|<cell|-x*z>>|<row|<cell|-x*y>|<cell|z<rsup|2>+x<rsup|2>>|<cell|-y*z>>|<row|<cell|-x*z>|<cell|-y*z>|<cell|y<rsup|2>+x<rsup|2>>>>>>>>
    </unfolded-io>

    \;

    Ora introduco le coordinate cilindriche nel seguente modo:

    Prendo l'asse z come asse di rotazione del cilindro e gli assi x,y nel
    piano, dove generano un cerchio di raggio che va da 0 ad R.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      Rz:matrix([cos(alpha),-sin(alpha),0],[sin(alpha),cos(alpha),0],[0,0,1])$
    </input>

    \;

    Calcolo i nuovi valori assunti da x, y, z nelle coordinate cilindriche:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      p:Rz.matrix([rho],[0],[h])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>*\<rho\>>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>*\<rho\>>>|<row|<cell|h>>>>>>>
    </unfolded-io>

    \;

    Calcolo lo jacobiano di p e in seguito il determinante dello jacobiano:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      dp:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ dp[i,1]:diff(p[i,1],rho),

      \ dp[i,2]:diff(p[i,1],alpha),

      \ dp[i,3]:diff(p[i,1],h)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      dp
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>*\<rho\>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>*\<rho\>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      Ddp:trigreduce(factor(determinant(dp)))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>\<rho\>>>
    </unfolded-io>

    \;

    Calcolo il volume del cilindro di raggio R (cilindro grande):

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      V1:expand(integrate(integrate(integrate(1*Ddp,alpha,0,2*%pi),rho,0,R),h,-H/2,H/2))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>\<pi\>*H*R<rsup|2>>>
    </unfolded-io>

    \;

    Calcolo la matrice di inerzia del cilindro di raggio R (cilindro grande):

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|input>
      S2:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ S2[i,j]:subst([x=p[1,1],y=p[2,1],z=p[3,1]],S1[i,j])

      \ )

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      S2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><matrix|<tformat|<table|<row|<cell|sin
      <around*|(|\<alpha\>|)><rsup|2>*\<rho\><rsup|2>+h<rsup|2>>|<cell|-cos
      <around*|(|\<alpha\>|)>*sin <around*|(|\<alpha\>|)>*\<rho\><rsup|2>>|<cell|-cos
      <around*|(|\<alpha\>|)>*h*\<rho\>>>|<row|<cell|-cos
      <around*|(|\<alpha\>|)>*sin <around*|(|\<alpha\>|)>*\<rho\><rsup|2>>|<cell|cos
      <around*|(|\<alpha\>|)><rsup|2>*\<rho\><rsup|2>+h<rsup|2>>|<cell|-sin
      <around*|(|\<alpha\>|)>*h*\<rho\>>>|<row|<cell|-cos
      <around*|(|\<alpha\>|)>*h*\<rho\>>|<cell|-sin
      <around*|(|\<alpha\>|)>*h*\<rho\>>|<cell|sin
      <around*|(|\<alpha\>|)><rsup|2>*\<rho\><rsup|2>+cos
      <around*|(|\<alpha\>|)><rsup|2>*\<rho\><rsup|2>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      II1:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ II1[i,j]:factor(expand(integrate(integrate(integrate(S2[i,j]*Ddp,alpha,0,2*%pi),rho,0,R),h,-H/2,H/2)*(M[1]/V1)))

      \ )

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      II1
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M<rsub|1>*<around*|(|3*R<rsup|2>+H<rsup|2>|)>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M<rsub|1>*<around*|(|3*R<rsup|2>+H<rsup|2>|)>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M<rsub|1>*R<rsup|2>|2>>>>>>>>
    </unfolded-io>

    \;

    Calcolo ora il volume e la matrice di inerzia del cilindro di raggio r
    (cilindro piccolo):

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      V2:expand(integrate(integrate(integrate(1*Ddp,alpha,0,2*%pi),rho,0,r),h,-H/2,H/2))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >>\<pi\>*H*r<rsup|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|input>
      II2:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ II2[i,j]:factor(expand(integrate(integrate(integrate(S2[i,j]*Ddp,alpha,0,2*%pi),rho,0,r),h,-H/2,H/2)*(M[2]/V2)))

      \ )

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      II2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M<rsub|2>*<around*|(|3*r<rsup|2>+H<rsup|2>|)>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M<rsub|2>*<around*|(|3*r<rsup|2>+H<rsup|2>|)>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M<rsub|2>*r<rsup|2>|2>>>>>>>>
    </unfolded-io>

    \;

    \;

    Matrice dell'inerzia del cilindro cavo di raggio inferiore r e di raggio
    superiore R:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|input>
      II_finale:factor(II1-II2)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|-<frac|3*M<rsub|2>*r<rsup|2>-3*M<rsub|1>*R<rsup|2>+M<rsub|2>*H<rsup|2>-M<rsub|1>*H<rsup|2>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|-<frac|3*M<rsub|2>*r<rsup|2>-3*M<rsub|1>*R<rsup|2>+M<rsub|2>*H<rsup|2>-M<rsub|1>*H<rsup|2>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|M<rsub|2>*r<rsup|2>-M<rsub|1>*R<rsup|2>|2>>>>>>
    </equation*>
  </session>

  \;

  \;

  <with|color|red|Procedura 6: Procedura per il calcolo della matrice di
  inerzia di una sfera cava di raggio superiore R e raggio inferiore r.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      S(x,y,z):=matrix([0,-z,y],[z,0,-x],[-y,x,0])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      SS:S(x,y,z)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-z>|<cell|y>>|<row|<cell|z>|<cell|0>|<cell|-x>>|<row|<cell|-y>|<cell|x>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      SS_T:transpose(SS)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|z>|<cell|-y>>|<row|<cell|-z>|<cell|0>|<cell|x>>|<row|<cell|y>|<cell|-x>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      control_matrix(mat,mat_T):=block(

      [mat_identità,mat_finale],

      mat_identità:0*ident(3),

      mat_finale:mat+mat_T,

      if mat_finale # mat_identità then return(0),

      S1:mat_T.mat,

      return(S1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      S1:control_matrix(SS,SS_T)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|z<rsup|2>+y<rsup|2>>|<cell|-x*y>|<cell|-x*z>>|<row|<cell|-x*y>|<cell|z<rsup|2>+x<rsup|2>>|<cell|-y*z>>|<row|<cell|-x*z>|<cell|-y*z>|<cell|y<rsup|2>+x<rsup|2>>>>>>>>
    </unfolded-io>

    \;

    Calcolo la matrice di inerzia della sfera piena considerando l'asse z
    come l'asse di rotazione.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      Rz:matrix([cos(alpha),-sin(alpha),0],[sin(alpha),cos(alpha),0],[0,0,1])$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      Ry:matrix([cos(beta),0,-sin(beta)],[0,1,0],[sin(beta),0,cos(beta)])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      p:Rz.Ry.matrix([rho],[0],[0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|cos <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)>*\<rho\>>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>*cos <around*|(|\<beta\>|)>*\<rho\>>>|<row|<cell|sin
      <around*|(|\<beta\>|)>*\<rho\>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      dp:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ dp[i,1]:diff(p[i,1],alpha),

      \ dp[i,2]:diff(p[i,1],beta),

      \ dp[i,3]:diff(p[i,1],rho)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      dp
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><matrix|<tformat|<table|<row|<cell|-sin <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)>*\<rho\>>|<cell|-cos <around*|(|\<alpha\>|)>*sin
      <around*|(|\<beta\>|)>*\<rho\>>|<cell|cos <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)>>>|<row|<cell|cos <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)>*\<rho\>>|<cell|-sin <around*|(|\<alpha\>|)>*sin
      <around*|(|\<beta\>|)>*\<rho\>>|<cell|sin <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)>>>|<row|<cell|0>|<cell|cos
      <around*|(|\<beta\>|)>*\<rho\>>|<cell|sin <around*|(|\<beta\>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      Ddp:trigreduce(factor(determinant(dp)))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>cos <around*|(|\<beta\>|)>*\<rho\><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      V_sfera:expand(integrate(integrate(integrate(1*Ddp,alpha,0,2*%pi),beta,-%pi/2,%pi/2),rho,0,R))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><frac|4*\<pi\>*R<rsup|3>|3>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|input>
      S2:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ S2[i,j]:subst([x=p[1,1],y=p[2,1],z=p[3,1]],S1[i,j])

      \ )

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><math-bf|done>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      S2$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|sin
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>+sin
      <around*|(|\<alpha\>|)><rsup|2>*cos
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>>|<cell|-cos
      <around*|(|\<alpha\>|)>*sin <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>>|<cell|-cos
      <around*|(|\<alpha\>|)>*cos <around*|(|\<beta\>|)>*sin
      <around*|(|\<beta\>|)>*\<rho\><rsup|2>>>|<row|<cell|-cos
      <around*|(|\<alpha\>|)>*sin <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>>|<cell|sin
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>+cos
      <around*|(|\<alpha\>|)><rsup|2>*cos
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>>|<cell|-sin
      <around*|(|\<alpha\>|)>*cos <around*|(|\<beta\>|)>*sin
      <around*|(|\<beta\>|)>*\<rho\><rsup|2>>>|<row|<cell|-cos
      <around*|(|\<alpha\>|)>*cos <around*|(|\<beta\>|)>*sin
      <around*|(|\<beta\>|)>*\<rho\><rsup|2>>|<cell|-sin
      <around*|(|\<alpha\>|)>*cos <around*|(|\<beta\>|)>*sin
      <around*|(|\<beta\>|)>*\<rho\><rsup|2>>|<cell|sin
      <around*|(|\<alpha\>|)><rsup|2>*cos
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>+cos
      <around*|(|\<alpha\>|)><rsup|2>*cos
      <around*|(|\<beta\>|)><rsup|2>*\<rho\><rsup|2>>>>>>
    </equation*>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|input>
      II_sfera:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ II_sfera[i,j]:factor(expand(integrate(integrate(integrate(S2[i,j]*Ddp,alpha,0,2*%pi),beta,-%pi/2,%pi/2),rho,0,R)*(M[sfera]/V_sfera)))

      \ )

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      II_sfera
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2*R<rsup|2>*M<rsub|<math-up|sfera>>|5>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|2*R<rsup|2>*M<rsub|<math-up|sfera>>|5>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|2*R<rsup|2>*M<rsub|<math-up|sfera>>|5>>>>>>>>
    </unfolded-io>

    \;

    \;

    Ora calcolo la matrice di inerzia del cilindro di raggio r e di altezza H
    pari al diametro della sfera, quindi H = 2*R.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      p2:Rz.matrix([rho],[0],[h])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>*\<rho\>>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>*\<rho\>>>|<row|<cell|h>>>>>>>
    </unfolded-io>

    \;

    h va da -H/2 = -2R/2 = -R a H/2 = 2R/2 = R, \<rho\> va da 0 a r,
    \<alpha\> va da 0 a 2\<pi\>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|input>
      dp:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ dp[i,1]:diff(p2[i,1],rho),

      \ dp[i,2]:diff(p2[i,1],alpha),

      \ dp[i,3]:diff(p2[i,1],h)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      dp
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>*\<rho\>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>*\<rho\>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      Ddp:trigreduce(factor(determinant(dp)))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >>\<rho\>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      V_cilindro:expand(integrate(integrate(integrate(1*Ddp,alpha,0,2*%pi),rho,0,r),h,-R,R))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >>2*\<pi\>*R*r<rsup|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|input>
      S2:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ S2[i,j]:subst([x=p2[1,1],y=p2[2,1],z=p2[3,1]],S1[i,j])

      \ )

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      S2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >><matrix|<tformat|<table|<row|<cell|sin
      <around*|(|\<alpha\>|)><rsup|2>*\<rho\><rsup|2>+h<rsup|2>>|<cell|-cos
      <around*|(|\<alpha\>|)>*sin <around*|(|\<alpha\>|)>*\<rho\><rsup|2>>|<cell|-cos
      <around*|(|\<alpha\>|)>*h*\<rho\>>>|<row|<cell|-cos
      <around*|(|\<alpha\>|)>*sin <around*|(|\<alpha\>|)>*\<rho\><rsup|2>>|<cell|cos
      <around*|(|\<alpha\>|)><rsup|2>*\<rho\><rsup|2>+h<rsup|2>>|<cell|-sin
      <around*|(|\<alpha\>|)>*h*\<rho\>>>|<row|<cell|-cos
      <around*|(|\<alpha\>|)>*h*\<rho\>>|<cell|-sin
      <around*|(|\<alpha\>|)>*h*\<rho\>>|<cell|sin
      <around*|(|\<alpha\>|)><rsup|2>*\<rho\><rsup|2>+cos
      <around*|(|\<alpha\>|)><rsup|2>*\<rho\><rsup|2>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|input>
      II_cilindro:0*ident(3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ II_cilindro[i,j]:factor(expand(integrate(integrate(integrate(S2[i,j]*Ddp,alpha,0,2*%pi),rho,0,r),h,-R,R)*(M[cilindro]/V_cilindro)))

      \ )

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      II_cilindro
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M<rsub|<math-up|cilindro>>*<around*|(|3*r<rsup|2>+4*R<rsup|2>|)>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M<rsub|<math-up|cilindro>>*<around*|(|3*r<rsup|2>+4*R<rsup|2>|)>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M<rsub|<math-up|cilindro>>*r<rsup|2>|2>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|input>
      II_finale:factor(II_sfera-II_cilindro)$
    </input>

    <\equation*>
      <matrix|<tformat|<table|<row|<cell|<frac|24*R<rsup|2>*M<rsub|<math-up|sfera>>-15*M<rsub|<math-up|cilindro>>*r<rsup|2>-20*R<rsup|2>*M<rsub|<math-up|cilindro>>|60>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|24*R<rsup|2>*M<rsub|<math-up|sfera>>-15*M<rsub|<math-up|cilindro>>*r<rsup|2>-20*R<rsup|2>*M<rsub|<math-up|cilindro>>|60>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|4*R<rsup|2>*M<rsub|<math-up|sfera>>-5*M<rsub|<math-up|cilindro>>*r<rsup|2>|10>>>>>>
    </equation*>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>