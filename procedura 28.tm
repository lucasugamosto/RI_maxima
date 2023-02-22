<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURE PER IL CALCOLO DELLE MATRICE DI INERZIA RELATIVE A VARIE FIGURE
  GEOMETRICHE COME SFERA,CILINDRO,PARALLELEPIPEDO, CAVI E NON CAVI.

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
      Smatrix:S(x,y,z)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-z>|<cell|y>>|<row|<cell|z>|<cell|0>|<cell|-x>>|<row|<cell|-y>|<cell|x>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      transposeSmatrix:transpose(Smatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|z>|<cell|-y>>|<row|<cell|-z>|<cell|0>|<cell|x>>|<row|<cell|y>|<cell|-x>|<cell|0>>>>>>>
    </unfolded-io>

    \;

    Verifico che la matrice S sia una matrice anti-simmetrica, controllando
    che vale la condizione S+S<math|<rsup|T>>=0. Se si ha riscontro positivo
    ritorna il prodotto della matrice S e S<math|<rsup|T>>, altrimenti torna
    0.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      controlMatrix(mat,transposeMat):=block(

      [II,finalMatrix],

      /*in questo caso la matrice II viene intesa come matrice identità e non
      delle inerzie*/

      II:0*ident(3),

      finalMatrix:mat+transposeMat,

      if finalMatrix # II then return(0),

      S1:transposeMat.mat,

      return(S1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      S1:controlMatrix(Smatrix,transposeSmatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|z<rsup|2>+y<rsup|2>>|<cell|-x*y>|<cell|-x*z>>|<row|<cell|-x*y>|<cell|z<rsup|2>+x<rsup|2>>|<cell|-y*z>>|<row|<cell|-x*z>|<cell|-y*z>|<cell|y<rsup|2>+x<rsup|2>>>>>>>>
    </unfolded-io>

    Gli elementi sulla diagonale principale di tale matrice danno luogo ai
    MOMENTI D'INERZIA.

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

    Calcolare i MOMENTI D'INERZIA (e quindi la MATRICE DI INERZIA) integrando
    gli elementi della matrice S1 rispetto ai tre assi x,y,z. Infine si
    moltiplica il risultato per la densità volumetrica dell'oggetto in esame
    che è pari a M/V.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      calcoloMatriceDiInerzia(V,S1):=block(

      [II,i,j],

      \;

      /*in questo algoritmo con II si indica la matrice d'inerzia*/

      II:0*ident(3),

      \;

      /*calcolo dei momenti d'inerzia*/

      for i:1 thru 3 do(

      \ for j:1 thru 3 do(

      \ \ II[i,j]:integrate(integrate(integrate(S1[i,j],x,-A/2,A/2),y,-B/2,B/2),z,-C/2,C/2),

      \ \ II[i,j]:factor(expand((M/V)*II[i,j]))

      \ )

      ),

      return(II)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      II:calcoloMatriceDiInerzia(V,S1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|<frac|<around*|(|C<rsup|2>+B<rsup|2>|)>*M|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|<around*|(|C<rsup|2>+A<rsup|2>|)>*M|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|<around*|(|B<rsup|2>+A<rsup|2>|)>*M|12>>>>>>>>
    </unfolded-io>
  </session>

  Che corrisponde alla matrice di inerzia del parallelepipedo di lati A,B,C
  riferita al baricentro.

  Avendo scelto gli assi x,y,z lungo i tre piani di simmetria allora gli
  elementi fuori diagonale principale sono tutti nulli

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
      Smatrix:S(x,y,z)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-z>|<cell|y>>|<row|<cell|z>|<cell|0>|<cell|-x>>|<row|<cell|-y>|<cell|x>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      transposeSmatrix:transpose(Smatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|z>|<cell|-y>>|<row|<cell|-z>|<cell|0>|<cell|x>>|<row|<cell|y>|<cell|-x>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      controlMatrix(mat,transposeMat):=block(

      [II,finalMatrix],

      /*in questo caso la matrice II viene intesa come matrice identità e non
      delle inerzie*/

      II:0*ident(3),

      finalMatrix:mat+transposeMat,

      if finalMatrix # II then return(0),

      S1:transposeMat.mat,

      return(S1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      S1:controlMatrix(Smatrix,transposeSmatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|z<rsup|2>+y<rsup|2>>|<cell|-x*y>|<cell|-x*z>>|<row|<cell|-x*y>|<cell|z<rsup|2>+x<rsup|2>>|<cell|-y*z>>|<row|<cell|-x*z>|<cell|-y*z>|<cell|y<rsup|2>+x<rsup|2>>>>>>>>
    </unfolded-io>

    \;

    \;

    CALCOLO VOLUME CILINDRO (PASSAGGI):

    Ora si deve calcolare il volume del cilindro e per farlo bisogna
    introdurre le coordinate cilindriche nel seguente modo: considero 'z'
    come l'asse di rotazione del cilindro e gli assi x, y nel piano, dove
    generano un cerchio di raggio minimo 0 e massimo R.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      Rz:matrix([cos(alpha),-sin(alpha),0],[sin(alpha),cos(alpha),0],[0,0,1])$
    </input>

    \;

    Il punto 'p' per noi ha coordinate (x,y,z), queste coordinate devo
    ottenerle come immagine della matrice Rz moltiplicata per un opportuno
    vettore. Questo vettore deve, con una delle componenti, generare l'asse
    del sistema e con l'altra andare a moltiplicare per la matrice del piano
    x,y.

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
      matriceJacobiana(p):=block(

      [J,i,j],

      J:0*ident(3),

      for i:1 thru 3 do(

      \ /*il primo indice dell'elemento J[i,j] indica la riga mentre il
      secondo la colonna,

      \ mentre nell'elemento p[i,1] si indica solo la riga poichè questo è un
      vettore di dimensione 3x1*/

      \ J[i,1]:diff(p[i,1],rho),

      \ J[i,2]:diff(p[i,1],alpha),

      \ J[i,3]:diff(p[i,1],h)

      ),

      return(J)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      J:matriceJacobiana(p)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
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
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      determinantJ:trigreduce(factor(determinant(J)))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>\<rho\>>>
    </unfolded-io>

    Si considera il determinante quando si fa un cambio di coordinate perchè
    il determinante ci dice il legame che c'è tra il prodotto degli elementi
    delle prime coordinate e il prodotto degli elementi delle secondo
    coordinate.

    \;

    Calcolo il volume del cilindro con le coordinate cilindriche appena
    trovate:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      V:expand(integrate(integrate(integrate(1*determinantJ,alpha,0,2*%pi),rho,0,R),h,-H/2,H/2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>\<pi\>*H*R<rsup|2>>>
    </unfolded-io>

    \;

    \;

    \;

    Calcolo la MATRICE DI INERZIA del cilindro di raggio R ed altezza H:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      calcoloMatriceDiInerzia(S1,V):=block(

      [S2,II,i,j],

      \;

      /*calcolo della matrice 'S.transposeS' in coordinate cilindriche,
      andando a prendere la matrice S1 che indica la stessa quantità solo in
      coordinate lineari e sostituire i valori del vettore 'p' ad essa*/

      S2:0*ident(3),

      for i:1 thru 3 do(

      \ for j:1 thru 3 do(

      \ \ S2[i,j]:subst([x=p[1,1],y=p[2,1],z=p[3,1]],S1[i,j])

      \ )

      ),

      \;

      /*calcolo della matrice di inerzia II*/

      II:0*ident(3),

      for i:1 thru 3 do(

      \ for j:1 thru 3 do(

      \ \ II[i,j]:integrate(integrate(integrate(S2[i,j]*determinantJ,alpha,0,2*%pi),rho,0,R),h,-H/2,H/2),

      \ \ II[i,j]:factor(expand((M/V)*II[i,j]))

      \ )

      ),

      return(II)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      II:calcoloMatriceDiInerzia(S1,V)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M*<around*|(|3*R<rsup|2>+H<rsup|2>|)>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M*<around*|(|3*R<rsup|2>+H<rsup|2>|)>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M*R<rsup|2>|2>>>>>>>>
    </unfolded-io>

    I momenti d'inerzia in coordinate (1,1) ed (2,2) sono uguali poichè sono
    simmetriche nel piano (x,y) mentre la componente (3,3) è diverso perchè
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
      Smatrix:S(x,y,z)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-z>|<cell|y>>|<row|<cell|z>|<cell|0>|<cell|-x>>|<row|<cell|-y>|<cell|x>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      transposeSmatrix:transpose(Smatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|z>|<cell|-y>>|<row|<cell|-z>|<cell|0>|<cell|x>>|<row|<cell|y>|<cell|-x>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      controlMatrix(mat,transposeMat):=block(

      [II,finalMatrix],

      /*in questo caso la matrice II viene intesa come matrice identità e non
      delle inerzie*/

      II:0*ident(3),

      finalMatrix:mat+transposeMat,

      if finalMatrix # II then return(0),

      S1:transposeMat.mat,

      return(S1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      S1:controlMatrix(Smatrix,transposeSmatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|z<rsup|2>+y<rsup|2>>|<cell|-x*y>|<cell|-x*z>>|<row|<cell|-x*y>|<cell|z<rsup|2>+x<rsup|2>>|<cell|-y*z>>|<row|<cell|-x*z>|<cell|-y*z>|<cell|y<rsup|2>+x<rsup|2>>>>>>>>
    </unfolded-io>

    \;

    \;

    Ora bisogna definire le coordinate sferiche, per farlo si prendono due
    matrici di rotazione qualsiasi, nel nostro caso svelgo
    <math|R<rsub|z>,R<rsub|y>>.

    \;

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
      p:(Rz.Ry).(matrix([rho],[0],[0]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|cos <around*|(|\<alpha\>|)>*cos
      <around*|(|\<beta\>|)>*\<rho\>>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>*cos <around*|(|\<beta\>|)>*\<rho\>>>|<row|<cell|sin
      <around*|(|\<beta\>|)>*\<rho\>>>>>>>>
    </unfolded-io>

    Dove il range delle variabili <math|\<alpha\>,\<beta\>,\<rho\>> sono:
    <math|\<alpha\> \<epsilon\><around*|[|0,2*\<pi\>|)>>, <math|\<beta\>
    \<epsilon\> <around*|[|-\<pi\>/2,\<pi\>/2|]>>,<math|\<rho\>
    \<epsilon\><around*|[|0,infinite|)>>

    \;

    \;

    Calcolo ora la matrice jacobiana:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      matriceJacobiana(p):=block(

      [J,i,j],

      J:0*ident(3),

      for i:1 thru 3 do(

      \ /*il primo indice dell'elemento J[i,j] indica la riga mentre il
      secondo la colonna,

      \ mentre nell'elemento p[i,1] si indica solo la riga poichè questo è un
      vettore di dimensione 3x1*/

      \ J[i,1]:diff(p[i,1],alpha),

      \ J[i,2]:diff(p[i,1],beta),

      \ J[i,3]:diff(p[i,1],rho)

      ),

      return(J)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      J:matriceJacobiana(p)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
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
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      determinantJ:trigreduce(factor(determinant(J)))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>cos <around*|(|\<beta\>|)>*\<rho\><rsup|2>>>
    </unfolded-io>

    \;

    Calcolo ora il volume della sfera:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      V:expand(integrate(integrate(integrate(1*determinantJ,alpha,0,2*%pi),beta,-%pi/2,%pi/2),rho,0,R))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><frac|4*\<pi\>*R<rsup|3>|3>>>
    </unfolded-io>

    \;

    Calcolo ora la MATRICE DI INERZIA della sfera di raggio R:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|input>
      calcoloMatriceDiInerzia(S1,V):=block(

      [S2,II,i,j],

      \;

      /*calcolo della matrice 'S.transposeS' in coordinate sferiche, andando
      a prendere la matrice S1 che indica la stessa quantità solo in
      coordinate lineari e sostituire i valori del vettore 'p' ad essa*/

      S2:0*ident(3),

      for i:1 thru 3 do(

      \ for j:1 thru 3 do(

      \ \ S2[i,j]:subst([x=p[1,1],y=p[2,1],z=p[3,1]],S1[i,j])

      \ )

      ),

      \;

      /*calcolo della matrice di inerzia II*/

      II:0*ident(3),

      for i:1 thru 3 do(

      \ for j:1 thru 3 do(

      \ \ II[i,j]:integrate(integrate(integrate(S2[i,j]*determinantJ,alpha,0,2*%pi),beta,-%pi/2,%pi/2),rho,0,R),

      \ \ II[i,j]:factor(expand((M/V)*II[i,j]))

      \ )

      ),

      return(II)

      )$
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

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      II:calcoloMatriceDiInerzia(S1,V)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2*M*R<rsup|2>|5>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|2*M*R<rsup|2>|5>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|2*M*R<rsup|2>|5>>>>>>>>
    </unfolded-io>

    Questa è la matrice di inerzia della sfera piena, inoltre si può
    affermare che è esatta poichè tutti i termini sulla diagonale principale
    sono uguali tra loro.
  </session>

  \;

  <\with|color|red>
    Procedura 4: Procedura per il calcolo della matrice di inerzia del
    parallelepipedo cavo di lati maggiori A, B e di lati minori \ a, b
    (a\<less\>A,b\<less\>B). Il lato C (quello lungo Z) è uguale per
    entrambi.
  </with>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      S(x,y,z):=matrix([0,-z,y],[z,0,-x],[-y,x,0])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      Smatrix:S(x,y,z)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-z>|<cell|y>>|<row|<cell|z>|<cell|0>|<cell|-x>>|<row|<cell|-y>|<cell|x>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      transposeSmatrix:transpose(Smatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|z>|<cell|-y>>|<row|<cell|-z>|<cell|0>|<cell|x>>|<row|<cell|y>|<cell|-x>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      controlMatrix(mat,transposeMat):=block(

      [II,finalMatrix],

      /*in questo caso la matrice II viene intesa come matrice identità e non
      delle inerzie*/

      II:0*ident(3),

      finalMatrix:mat+transposeMat,

      if finalMatrix # II then return(0),

      S1:transposeMat.mat,

      return(S1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      S1:controlMatrix(Smatrix,transposeSmatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|z<rsup|2>+y<rsup|2>>|<cell|-x*y>|<cell|-x*z>>|<row|<cell|-x*y>|<cell|z<rsup|2>+x<rsup|2>>|<cell|-y*z>>|<row|<cell|-x*z>|<cell|-y*z>|<cell|y<rsup|2>+x<rsup|2>>>>>>>>
    </unfolded-io>

    \;

    \;

    Calcolare il VOLUME del parallelepipedo interno di massa <math|M<rsub|1>>
    e di lati a(lungo x), b(lungo y), C(lungo z):

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      V:expand(integrate(integrate(integrate(1,x,-a/2,a/2),y,-b/2,b/2),z,-C/2,C/2))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>C*a*b>>
    </unfolded-io>

    \;

    Calcolare la MATRICE DI INERZIA del parallelepipedo interno di massa
    <math|M<rsub|1>> e di lati a(lungo x), b(lungo y), C(lungo z),
    utilizzando le coordinate lineari:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      calcoloMatriceDiInerzia(S1,M,V,latoX,latoY,latoZ):=block(

      [II,i,j],

      II:0*ident(3),

      for i:1 thru 3 do(

      \ for j:1 thru 3 do(

      \ \ II[i,j]:integrate(integrate(integrate(S1[i,j],x,-latoX/2,latoX/2),y,-latoY/2,latoY/2),z,-latoZ/2,latoZ/2),

      \ \ II[i,j]:factor(expand((M/V)*II[i,j]))

      \ )

      ),

      return(II)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      II:calcoloMatriceDiInerzia(S1,M[1],V,a,b,C)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M<rsub|1>*<around*|(|b<rsup|2>+C<rsup|2>|)>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M<rsub|1>*<around*|(|a<rsup|2>+C<rsup|2>|)>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M<rsub|1>*<around*|(|b<rsup|2>+a<rsup|2>|)>|12>>>>>>>>
    </unfolded-io>

    \;

    \;

    Adesso si calcola il VOLUME del parallelepipedo grande di massa
    <math|M<rsub|2>\<gtr\>M<rsub|1>> e di lati A(lungo x), B(lungo y) e
    C(lungo z).

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      V:expand(integrate(integrate(integrate(1,x,-A/2,A/2),y,-B/2,B/2),z,-C/2,C/2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>A*B*C>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      II2:calcoloMatriceDiInerzia(S1,M[2],V,A,B,C)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M<rsub|2>*<around*|(|C<rsup|2>+B<rsup|2>|)>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M<rsub|2>*<around*|(|C<rsup|2>+A<rsup|2>|)>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M<rsub|2>*<around*|(|B<rsup|2>+A<rsup|2>|)>|12>>>>>>>>
    </unfolded-io>

    \;

    Ora calcolo la MATRICE DI INERZIA del parallelepipedo cavo per
    sottrazione.

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      finalII:fullratsimp(II2-II)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><matrix|<tformat|<table|<row|<cell|-<frac|M<rsub|1>*b<rsup|2>+<around*|(|M<rsub|1>-M<rsub|2>|)>*C<rsup|2>-M<rsub|2>*B<rsup|2>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|-<frac|M<rsub|1>*a<rsup|2>+<around*|(|M<rsub|1>-M<rsub|2>|)>*C<rsup|2>-M<rsub|2>*A<rsup|2>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|M<rsub|1>*b<rsup|2>+M<rsub|1>*a<rsup|2>-M<rsub|2>*B<rsup|2>-M<rsub|2>*A<rsup|2>|12>>>>>>>>
    </unfolded-io>
  </session>

  \;

  \;

  <with|color|red|Procedura 5: Procedura per il calcolo della matrice di
  inerzia di un cilindro cavo. Sia \PR\Q il raggio del cilindro grande,
  mentre \Pr\Q il raggio del cilindro più piccolo interno a quello grande e
  con cui condivide l'asse di simmetria.>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      S(x,y,z):=matrix([0,-z,y],[z,0,-x],[-y,x,0])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      Smatrix:S(x,y,z)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-z>|<cell|y>>|<row|<cell|z>|<cell|0>|<cell|-x>>|<row|<cell|-y>|<cell|x>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      transposeSmatrix:transpose(Smatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|z>|<cell|-y>>|<row|<cell|-z>|<cell|0>|<cell|x>>|<row|<cell|y>|<cell|-x>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      controlMatrix(mat,transposeMat):=block(

      [II,finalMatrix],

      /*in questo caso la matrice II viene intesa come matrice identità e non
      delle inerzie*/

      II:0*ident(3),

      finalMatrix:mat+transposeMat,

      if finalMatrix # II then return(0),

      S1:transposeMat.mat,

      return(S1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      S1:controlMatrix(Smatrix,transposeSmatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|z<rsup|2>+y<rsup|2>>|<cell|-x*y>|<cell|-x*z>>|<row|<cell|-x*y>|<cell|z<rsup|2>+x<rsup|2>>|<cell|-y*z>>|<row|<cell|-x*z>|<cell|-y*z>|<cell|y<rsup|2>+x<rsup|2>>>>>>>>
    </unfolded-io>

    \;

    \;

    Ora introduco le coordinate cilindriche nel seguente modo:

    Scelgo l'asse z come asse di rotazione del cilindro e gli assi x,y nel
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

    Calcolo della matrice jacobiana associata al cambio di variabili e il
    determinante di quest'ultima:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      matriceJacobiana(p):=block(

      [J,i,j],

      J:0*ident(3),

      for i:1 thru 3 do(

      \ /*il primo indice dell'elemento J[i,j] indica la riga mentre il
      secondo la colonna,

      \ mentre nell'elemento p[i,1] si indica solo la riga poichè questo è un
      vettore di dimensione 3x1*/

      \ J[i,1]:diff(p[i,1],rho),

      \ J[i,2]:diff(p[i,1],alpha),

      \ J[i,3]:diff(p[i,1],h)

      ),

      return(J)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      J:matriceJacobiana(p)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>*\<rho\>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>*\<rho\>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      determinantJ:trigsimp(determinant(J))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>\<rho\>>>
    </unfolded-io>

    \;

    Calcolo il VOLUME del cilindro cavo di raggio minore \Pr\Q e raggio
    maggiore \PR\Q ed altezza H:

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      V:expand(integrate(integrate(integrate(1*determinantJ,alpha,0,2*%pi),rho,r,R),h,-H/2,H/2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>\<pi\>*H*R<rsup|2>-\<pi\>*H*r<rsup|2>>>
    </unfolded-io>

    \;

    Calcolo la MATRICE DI INERZIA del cilindro cavo:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      calcoloMatriceDiInerzia(S1,V):=block(

      [S2,II,i,j],

      \;

      /*calcolo della matrice 'S.transposeS' in coordinate cilindriche,
      andando a prendere la matrice S1 che indica la stessa quantità solo in
      coordinate lineari e sostituire i valori del vettore 'p' ad essa*/

      S2:0*ident(3),

      for i:1 thru 3 do(

      \ for j:1 thru 3 do(

      \ \ S2[i,j]:subst([x=p[1,1],y=p[2,1],z=p[3,1]],S1[i,j])

      \ )

      ),

      \;

      /*calcolo della matrice di inerzia II*/

      II:0*ident(3),

      for i:1 thru 3 do(

      \ for j:1 thru 3 do(

      \ \ II[i,j]:integrate(integrate(integrate(S2[i,j]*determinantJ,alpha,0,2*%pi),rho,r,R),h,-H/2,H/2),

      \ \ II[i,j]:factor(expand((M/V)*II[i,j]))

      \ )

      ),

      return(II)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      II:calcoloMatriceDiInerzia(S1,V)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M*<around*|(|3*r<rsup|2>+3*R<rsup|2>+H<rsup|2>|)>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M*<around*|(|3*r<rsup|2>+3*R<rsup|2>+H<rsup|2>|)>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M*<around*|(|r<rsup|2>+R<rsup|2>|)>|2>>>>>>>>
    </unfolded-io>

    \;
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
      Smatrix:S(x,y,z)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-z>|<cell|y>>|<row|<cell|z>|<cell|0>|<cell|-x>>|<row|<cell|-y>|<cell|x>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      transposeSmatrix:transpose(Smatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|z>|<cell|-y>>|<row|<cell|-z>|<cell|0>|<cell|x>>|<row|<cell|y>|<cell|-x>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      controlMatrix(mat,transposeMat):=block(

      [II,finalMatrix],

      /*in questo caso la matrice II viene intesa come matrice identità e non
      delle inerzie*/

      II:0*ident(3),

      finalMatrix:mat+transposeMat,

      if finalMatrix # II then return(0),

      S1:transposeMat.mat,

      return(S1)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      S1:controlMatrix(Smatrix,transposeSmatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|z<rsup|2>+y<rsup|2>>|<cell|-x*y>|<cell|-x*z>>|<row|<cell|-x*y>|<cell|z<rsup|2>+x<rsup|2>>|<cell|-y*z>>|<row|<cell|-x*z>|<cell|-y*z>|<cell|y<rsup|2>+x<rsup|2>>>>>>>>
    </unfolded-io>

    \;

    \;

    Calcolo la matrice di inerzia della sfera piena considerando l'asse z
    come l'asse di rotazione.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      Rz:matrix([cos(alpha),-sin(alpha),0],[sin(alpha),cos(alpha),0],[0,0,1])$
    </input>

    \;

    <\textput>
      Avendo preso <math|R<rsub|z>> come matrice di rotazione allora si
      prende ora Ry rispetto a -\<beta\>.
    </textput>

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

    \;

    Dove il range delle variabili <math|\<alpha\>,\<beta\>,\<rho\>> sono:
    <math|\<alpha\> \<epsilon\><around*|[|0,2*\<pi\>|)>>, <math|\<beta\>
    \<epsilon\> <around*|[|-\<pi\>/2,\<pi\>/2|]>>,<math|\<rho\>
    \<epsilon\><around*|[|0,infinite|)>>

    \;

    Ora calcolo la matrice jacobiana J e successivamente il determinante
    della matrice:

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      matriceJacobiana(p):=block(

      [J,i,j],

      J:0*ident(3),

      for i:1 thru 3 do(

      \ /*il primo indice dell'elemento J[i,j] indica la riga mentre il
      secondo la colonna,

      \ mentre nell'elemento p[i,1] si indica solo la riga poichè questo è un
      vettore di dimensione 3x1*/

      \ J[i,1]:diff(p[i,1],alpha),

      \ J[i,2]:diff(p[i,1],beta),

      \ J[i,3]:diff(p[i,1],rho)

      ),

      return(J)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      J:matriceJacobiana(p)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
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
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      determinantJ:trigsimp(determinant(J))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>cos <around*|(|\<beta\>|)>*\<rho\><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      V:expand(integrate(integrate(integrate(1*determinantJ,alpha,0,2*%pi),beta,-%pi/2,%pi/2),rho,r,R))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><frac|4*\<pi\>*R<rsup|3>|3>-<frac|4*\<pi\>*r<rsup|3>|3>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|input>
      calcoloMatriceDiInerzia(S1,V):=block(

      [S2,II,i,j],

      \;

      /*calcolo della matrice 'S.transposeS' in coordinate sferiche, andando
      a prendere la matrice S1 che indica la stessa quantità solo in
      coordinate lineari e sostituire i valori del vettore 'p' ad essa*/

      S2:0*ident(3),

      for i:1 thru 3 do(

      \ for j:1 thru 3 do(

      \ \ S2[i,j]:subst([x=p[1,1],y=p[2,1],z=p[3,1]],S1[i,j])

      \ )

      ),

      \;

      /*calcolo della matrice di inerzia II*/

      II:0*ident(3),

      for i:1 thru 3 do(

      \ for j:1 thru 3 do(

      \ \ II[i,j]:integrate(integrate(integrate(S2[i,j]*determinantJ,alpha,0,2*%pi),beta,-%pi/2,%pi/2),rho,r,R),

      \ \ II[i,j]:factor(expand((M/V)*II[i,j]))

      \ )

      ),

      return(II)

      )$
    </input>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      II:calcoloMatriceDiInerzia(S1,V)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2*M*<around*|(|r<rsup|4>+R*r<rsup|3>+R<rsup|2>*r<rsup|2>+R<rsup|3>*r+R<rsup|4>|)>|5*<around*|(|r<rsup|2>+R*r+R<rsup|2>|)>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|2*M*<around*|(|r<rsup|4>+R*r<rsup|3>+R<rsup|2>*r<rsup|2>+R<rsup|3>*r+R<rsup|4>|)>|5*<around*|(|r<rsup|2>+R*r+R<rsup|2>|)>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|2*M*<around*|(|r<rsup|4>+R*r<rsup|3>+R<rsup|2>*r<rsup|2>+R<rsup|3>*r+R<rsup|4>|)>|5*<around*|(|r<rsup|2>+R*r+R<rsup|2>|)>>>>>>>>>
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