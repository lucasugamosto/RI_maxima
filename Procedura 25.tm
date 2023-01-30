<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA 25: Calcolare le singolarità di velocità di tutte le strutture
  portanti.

  \;

  Dalla cinematica di posizione <math|P:h<around*|(|q|)>> è possibile passare
  alla cinematica di velocità <math|P<rprime|'>=J<rsub|h><rsup|><around*|(|q|)>*q<rprime|'><text|>>
  per mezzo della matrice Jacobiana <math|J<rsub|h>>. Questo passaggio è
  molto importante poichè si passa ad uno studio meno complesso e LINEARE,
  contrariamente a quella di posizione.

  \;

  Le matrici della cinematica diretta completa Q inserite in questa procedura
  sono state calcolate e prese dalla procedura 16.

  La funzione \PcalcoloSingolarita\Q riceve in ingresso la matrice della
  cinematica diretta completa Q, controlla che il tipo di dato del parametro
  sia corretto e come prima cosa calcola quante sono le equazioni che
  regolano la posizione del robot. Successivamente riempe la matrice J
  (inizialmente tutta nulla) con le derivate delle equazioni rispetto alle
  varibili di giunto q ed infine calcola il determinante della matrice
  Jacobiana.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      calcoloSingolarita(Q):=block(

      [numeroEquazioni,J,det],

      /*controllare che il parametro in ingresso sia di tipo matriciale*/

      if scalarp(R) = true or listp(R) = true then return(0),

      \;

      /*calcolare matrice jacobiana J*/

      numeroEquazioni:length(Q)-1,

      if numeroEquazioni = 2 then J:matrix([0,0],[0,0]),

      if numeroEquazioni = 3 then J:matrix([0,0,0],[0,0,0],[0,0,0]),

      if numeroEquazioni # 2 and numeroEquazioni # 3 then return(0),

      \;

      for i:1 thru numeroEquazioni do (

      \ for j:1 thru numeroEquazioni do (

      \ \ J[i,j]:diff(Q[i,length(Q)],q[j])

      \ )

      ),

      \;

      det:trigsimp(trigreduce(factor(determinant(J)))),

      return([J,det])

      )$
    </input>

    \;

    \;

    ROBOT 2DOF PLANARE

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      RRmatrix:matrix([c[12],-s[12],L[2]*c[12]+L[1]*c[1]],[s[12],c[12],L[2]*s[12]+L[1]*s[1]],[0,0,1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|12>>|<cell|-s<rsub|12>>|<cell|L<rsub|2>*c<rsub|12>+L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|12>>|<cell|c<rsub|12>>|<cell|L<rsub|2>*s<rsub|12>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      RRmatrix:subst([c[12]=cos(q[1]+q[2]),s[12]=sin(q[1]+q[2]),c[1]=cos(q[1]),s[1]=sin(q[1])],RRmatrix)$
    </input>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      calcoloSingolarita(RRmatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-L<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>-L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>|<cell|-L<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>>|<row|<cell|L<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>|<cell|L<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>>>>>,L<rsub|1>*L<rsub|2>*sin
      <around*|(|q<rsub|2>|)>|]>>>
    </unfolded-io>

    Si hanno casi di singolarità quando il determinante della matrice
    Jacobiana è pari a zero.

    Nel caso del robot 2 DOF planare (RR) si ha singolarità se e solo se la
    quantita <math|L<rsub|1>*L<rsub|2>*sin<around*|(|q<rsub|2>|)>=0>, e cioè
    se almeno una delle due lunghezze è nulla o se la variabile
    trigonometrica <math|q<rsub|2>=0<space|1em>o<space|1em>\<pi\>>.

    \;

    \;

    ROBOT CARTESIANO

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      CARTESIANOmatrix:matrix([0,0,1,q[3]],[0,-1,0,q[2]],[1,0,0,q[1]],[0,0,0,1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      calcoloSingolarita(CARTESIANOmatrix)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|1>|<cell|0>|<cell|0>>>>>,-1|]>>>
    </unfolded-io>

    Il robot cartesiano non ha CASI DI SINGOLARITA' poichè il suo
    determinante è un valore costante diverso da zero.

    \;

    \;

    ROBOT CILINDRICO

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      CILINDRICOmatrix:matrix([cos(q[1]),0,-sin(q[1]),-sin(q[1])*q[3]],[sin(q[1]),0,cos(q[1]),cos(q[1])*q[3]],[0,-1,0,L[1]+q[2]],[0,0,0,1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|-sin
      <around*|(|q<rsub|1>|)>>|<cell|-q<rsub|3>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|q<rsub|3>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      calcoloSingolarita(CILINDRICOmatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-q<rsub|3>*cos
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|-sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|-q<rsub|3>*sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>>>>,q<rsub|3>|]>>>
    </unfolded-io>

    \;

    Quindi si ha il CASO DI SINGOLARITA' quando la variabile lineare
    <math|q<rsub|3>> è nulla.

    \;

    \;

    ROBOT SCARA

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      SCARAmatrix:matrix([c[12],s[12],0,D[2]*c[12]+D[1]*c[1]],[s[12],-c[12],0,D[2]*s[12]+D[1]*s[1]],[0,0,-1,-q[3]+L[2]+L[1]],[0,0,0,1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|12>>|<cell|s<rsub|12>>|<cell|0>|<cell|D<rsub|2>*c<rsub|12>+D<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|12>>|<cell|-c<rsub|12>>|<cell|0>|<cell|D<rsub|2>*s<rsub|12>+D<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|-1>|<cell|-q<rsub|3>+L<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      SCARAmatrix:subst([c[12]=cos(q[1]+q[2]),s[12]=sin(q[1]+q[2]),c[1]=cos(q[1]),s[1]=sin(q[1])],SCARAmatrix)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|D<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+D<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|D<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>+D<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|-1>|<cell|-q<rsub|3>+L<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      calcoloSingolarita(SCARAmatrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-D<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>-D<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>|<cell|-D<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>>|<row|<cell|D<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+D<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>|<cell|D<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>>>>,-D<rsub|1>*D<rsub|2>*sin
      <around*|(|q<rsub|2>|)>|]>>>
    </unfolded-io>

    \;

    Quindi si hanno CASI DI SINGOLARITA' se e solo se vale la condizione
    <math|D<rsub|1>*D<rsub|2>*sin<around*|(|q<rsub|2>|)>=0>, e questo si avrà
    se e solo se una delle lunghezze è nulla o se <math|q<rsub|2>> è pari a 0
    o \<pi\>.

    \;

    \;

    ROBOT SFERICO DI PRIMO TIPO

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      SFERICO1matrix:matrix([c[1]*c[2],s[1],c[1]*s[2],c[1]*s[2]*q[3]+c[1]*L[2]*c[2]],[s[1]*c[2],-c[1],s[1]*s[2],s[1]*s[2]*q[3]+s[1]*L[2]*c[2]],[s[2],0,-c[2],-c[2]*q[3]+L[2]*s[2]+L[1]],[0,0,0,1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|2>>|<cell|0>|<cell|-c<rsub|2>>|<cell|-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|input>
      SFERICO1matrix:subst([c[1]=cos(q[1]),s[1]=sin(q[1]),c[2]=cos(q[2]),s[2]=sin(q[2])],SFERICO1matrix)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|input>
      calcoloSingolarita(SFERICO1matrix)$
    </input>

    <\equation*>
      <around*|[|<matrix|<tformat|<table|<row|<cell|-q<rsub|3>*sin
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>-L<rsub|2>*sin
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>>|<cell|q<rsub|3>*cos
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>-L<rsub|2>*cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>>|<cell|cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>>>|<row|<cell|q<rsub|3>*cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>+L<rsub|2>*cos
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>>|<cell|q<rsub|3>*sin
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>-L<rsub|2>*sin
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>>|<cell|sin
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>>>|<row|<cell|0>|<cell|q<rsub|3>*sin
      <around*|(|q<rsub|2>|)>+L<rsub|2>*cos
      <around*|(|q<rsub|2>|)>>|<cell|-cos
      <around*|(|q<rsub|2>|)>>>>>>,q<rsub|3><rsup|2>*sin
      <around*|(|q<rsub|2>|)>+L<rsub|2>*q<rsub|3>*cos
      <around*|(|q<rsub|2>|)>|]>
    </equation*>

    \;

    Quindi si hanno CASI DI SINGOLARITA' se vale la condizione
    <math|q<rsub|3><rsup|2>*s<rsub|2>+L<rsub|2>*q<rsub|3>*c<rsub|2>=0.>

    Questa condizione è verificata se e solo se la variabile lineare
    <math|q<rsub|3>=0> o se ipotizzando <math|q<rsub|3>,L<rsub|2>> diversi da
    0 si ha che <math|q<rsub|3>*s<rsub|2>=-L<rsub|2>*c<rsub|2>>.

    <\equation*>
      q<rsub|3><rsup|2>*<around*|(|1-c<rsub|2>|)><rsup|2>=L<rsub|2><rsup|2>*c<rsub|2><rsup|2>\<rightarrow\>q<rsub|3><rsup|2>=q<rsub|3><rsup|2>*c<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>*\<rightarrow\>c<rsub|2><rsup|2>=q<rsub|3><rsup|2>/<around*|(|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>|)>\<rightarrow\>c<rsub|2>=\<pm\>sqrt<around*|(|q<rsub|3><rsup|2>/<around*|(|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>|)>|)>
    </equation*>

    <\equation*>
      s<rsub|2>=\<pm\>sqrt<around*|(|1-c<rsub|2><rsup|2>|)>
    </equation*>

    <\equation*>
      q<rsub|2>=atan2<around*|(|\<pm\>sqrt<around*|(|1-c<rsub|2><rsup|2>|)>,\<pm\>sqrt<around*|(|q<rsub|3><rsup|2>/<around*|(|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>|)>|)>|)>
    </equation*>

    \;

    \;

    ROBOT SFERICO DI SECONDO TIPO

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      SFERICO2matrix:matrix([c[1]*c[2],-s[1],c[1]*s[2],c[1]*s[2]*q[3]-s[1]*L[2]],[s[1]*c[2],c[1],s[1]*s[2],s[1]*s[2]*q[3]+c[1]*L[2]],[-s[2],0,c[2],c[2]*q[3]+L[1]],[0,0,0,1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|-s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|-s<rsub|2>>|<cell|0>|<cell|c<rsub|2>>|<cell|c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|input>
      SFERICO2matrix:subst([c[1]=cos(q[1]),s[1]=sin(q[1]),c[2]=cos(q[2]),s[2]=sin(q[2])],SFERICO2matrix)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      calcoloSingolarita(SFERICO2matrix)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-q<rsub|3>*sin
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>-L<rsub|2>*cos
      <around*|(|q<rsub|1>|)>>|<cell|q<rsub|3>*cos
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>>|<cell|cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>>>|<row|<cell|q<rsub|3>*cos
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>-L<rsub|2>*sin
      <around*|(|q<rsub|1>|)>>|<cell|q<rsub|3>*sin
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>>|<cell|sin
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>>>|<row|<cell|0>|<cell|-q<rsub|3>*sin
      <around*|(|q<rsub|2>|)>>|<cell|cos <around*|(|q<rsub|2>|)>>>>>>,-q<rsub|3><rsup|2>*sin
      <around*|(|q<rsub|2>|)>|]>>>
    </unfolded-io>

    \;

    In questo caso si hanno CASI DI SINGOLARITA' se e solo se vale la
    condizione <math|-q<rsub|3><rsup|2>*sin <around*|(|q<rsub|2>|)>=0> e cioè
    se la variabile lineare <math|q<rsub|3>> è nulla o se la variabile
    trigonometrica <math|q<rsub|2>> è pari a 0 o a \<pi\>.

    \;

    ROBOT ANTROPOMORFO

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      ANTROPOMORFOmatrix:matrix([c[1]*c[23],-c[1]*s[23],s[1],c[1]*L[3]*c[23]+c[1]*L[2]*c[2]],[s[12]*c[23],-s[1]*s[23],-c[1],s[1]*L[3]*c[23]+s[1]*L[2]*c[2]],[s[23],c[23],0,L[3]*s[23]+L[2]*s[2]+L[1]],[0,0,0,1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|23>>|<cell|-c<rsub|1>*s<rsub|23>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*L<rsub|3>*c<rsub|23>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|12>*c<rsub|23>>|<cell|-s<rsub|1>*s<rsub|23>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*L<rsub|3>*c<rsub|23>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|23>>|<cell|c<rsub|23>>|<cell|0>|<cell|L<rsub|3>*s<rsub|23>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|input>
      ANTROPOMORFOmatrix:subst([c[1]=cos(q[1]),s[1]=sin(q[1]),c[2]=cos(q[2]),s[2]=sin(q[2]),c[23]=cos(q[2]+q[3]),s[23]=sin(q[2]+q[3])],ANTROPOMORFOmatrix)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|input>
      calcoloSingolarita(ANTROPOMORFOmatrix)$
    </input>

    <math|<around*|[|<matrix|<tformat|<table|<row|<cell|-L<rsub|3>*sin
    <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|3>+q<rsub|2>|)>-L<rsub|2>*sin
    <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>>|<cell|-L<rsub|3>*cos
    <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|3>+q<rsub|2>|)>-L<rsub|2>*cos
    <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>>|<cell|-L<rsub|3>*cos
    <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|3>+q<rsub|2>|)>>>|<row|<cell|L<rsub|3>*cos
    <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|3>+q<rsub|2>|)>+L<rsub|2>*cos
    <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>|)>>|<cell|-L<rsub|3>*sin
    <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|3>+q<rsub|2>|)>-L<rsub|2>*sin
    <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>|)>>|<cell|-L<rsub|3>*sin
    <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|3>+q<rsub|2>|)>>>|<row|<cell|0>|<cell|L<rsub|3>*cos
    <around*|(|q<rsub|3>+q<rsub|2>|)>+L<rsub|2>*cos
    <around*|(|q<rsub|2>|)>>|<cell|L<rsub|3>*cos
    <around*|(|q<rsub|3>+q<rsub|2>|)>>>>>>,-<frac|L<rsub|2>*L<rsub|3><rsup|2>*sin
    <around*|(|2*q<rsub|3>+q<rsub|2>|)>+L<rsub|2><rsup|2>*L<rsub|3>*sin
    <around*|(|q<rsub|3>+q<rsub|2>|)>+L<rsub|2><rsup|2>*L<rsub|3>*sin
    <around*|(|q<rsub|3>-q<rsub|2>|)>-L<rsub|2>*L<rsub|3><rsup|2>*sin
    <around*|(|q<rsub|2>|)>|2>|]>>

    \;

    Si hanno CASI DI SINGOLARITA' se e solo se è verificata la condizione\ 

    <\equation*>
      L<rsub|2>*L<rsub|3><rsup|2>*sin <around*|(|2*q<rsub|3>+q<rsub|2>|)>+L<rsub|2><rsup|2>*L<rsub|3>*sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>+L<rsub|2><rsup|2>*L<rsub|3>*sin
      <around*|(|q<rsub|3>-q<rsub|2>|)>-L<rsub|2>*L<rsub|3><rsup|2>*sin
      <around*|(|q<rsub|2>|)>=0
    </equation*>

    \;

    \;

    \;

    \;

    LA MATRICE JACOBIANA UTILIZZATA E' LA SEGUENTE:

    <image|<tuple|<#4749463839617A01AB00840000FFFFFF000000BABABA666666222222EEEEEE444444545454989898CCCCCCDCDCDC767676323232AAAAAA101010888888A3A3A3DFDFDF00000000000000000000000000000000000000000000000000000000000000000000000000000000000021F90401000000002C000000007A01AB000005FE20208E64699E68AAAEECD9BCA6B01C6D6DDB6F53CAF4EDFFC06029179B098FC8A472C9143E1400C5A04428E89ACC67743AAA5EB1E0F0482BA55AC5E8B47A7D0AB8DFA64741C4988B0A04B6D35EBFE7F5804072747600786B046F6E09818D8E2D010F395F23560D788C0009070C0F2D05082DA14C96989A9C9E2CA0A28F49A504999B9D9FA32BB52302930199ADBDBDBB290A067308018508A90203022903852A055C49C2C4C622C822CACC28CE9FD2BE37D400C5C7C9CBCDCF29D12AC0E0EE81ED27B0220D0E24035F0BDB71FB2C0DB742E601A83702DF087D281EF45BF1EF9D0D81040BE65B3886628A8628E239DC2846238904010EA6A2034504C2130CFE7CA4440252E4080625019C34B1D2464D8E285A9A1C0900E6418B3D55A6F088B36812A22212D4AC42C2DE4F1700593C88EA436997424E4D5AC46863AAD1135645301D9155E656AA2ABCB6E1F5B56D10A4220E249012D3D01FAD270CD46D91C04012B9742BDD359B772F8BBE6E4B001E50F7D053137AABFA5D9BB8B20FB849292AC36560005B1165113070E3494000077DC82A49B07073B6CE9F01841E1D098069D4CFCA56661D439A00D8266693B67D3A35E88CB12D2BA76C438AC216BA011CA8ADC0F88890589C032D117DBAA7EAE900605F5E423B7413DEA3581731BE0466F2CBE12A9A4FBFBE0805835F06106D18C05820F505685F14F9D1B19F4F26FCFE774302028DC0E0670F1E21E0848ADC57604F07F6A7E075C9C147DE7B47E07742010EEC87C286818868028926CA131E5F0E2C94408C25CCB89D1E2A96C0225A288AD7A187CA81280489281870DA8BD10542645E479E902490AA3C69A40348220725942012F14392034812C04DAA25A1A50F5C7A09E671CB8D49E6095D36F0A593565EE9E17B647C534364243CB0804901F4E0E06447D4F9039E63EC29539F35025A99A083EEA5279F7E26A5280942CA59149D7CBCA80202B52C90C8640BB8C1402D922431484F9AA6C0E9419FF2F925A9942476EA7AA274DAEAA1AF8E112B8796C2F7DE2B09FC83CF033C8D38290B670201EC40080C5BAC8EC7AE906C5BCBFE0ADB00B12B1410AD0AD3FAD8EB873F8A534C043A1C80402E2C2CF0630C688533CC38C69C612EBA2AA86B8300ED16256EBCE59EBBAB09F6D680EF50EB7E8B1366106545404CDA3453C33A49244CC2C22320D0C03926D8A98EC66E49DC457FDC3CCC31AF065B06974E328DA4DB4C2BE65B71AA36A0BC004F5925F0DD85ABB08000CC38C94CF30D39DB0273A525BB73F2529634E0970025B1EC4B58FECD91C3D20C475A3458480FF402D505E879ED8D47157CB5D13F2E0645030B2090F6441B994D4FDA6B57D2CDD829B83D10DC164781185761104DF723EFF1B682D3E008AE8202A1803DB6E1293C778002202BE1F7DF8D4C7EC26F9E91A7800304106035E5FE3E7031C0CE68580E3A1BA69FAEFAC162AF0E48EAAEC7EE0BECB237417BEDB8EB717BEE48ECCEFBEF60F80EFC0FC20F6FBC84AD1FBF44F1CA376F03F3CE131CFDF46A404FBD7BC95FAFFDF3D96FCFBDF7E0F7DE7DF82B38303EF9E89B8FFEFAECB70FAEFBF03317FF65E7CF3FBDF5DEE36F7FEDFA6BDFFFFEAEFB1FF50408C0D311307A072CE0DF12D83C062AF06A0E3C5E041F68B0090ECF8214B414067FB7C10C62A97EF1CB120C766084AFA8C9362504DE0951F8B9D281107E74824219267606A3304A2C35FCDD0D71F8AF8EBCD07D98228460DC322B3B386678451C223C7ED8BE5FBDC014A798852A5C768D262C4B16CF1A1115C701A46545318B2D63FE053B98C83ECCECAB1C35985BB646F683335E038C19E3D91DD8F81537BE318D7234041D3B983B846522222230C8382E6691E7D4806F01F963560469318C95C0902D4064623C16C82B34B2908A1B812449E641F9D5683C3323814F6C462094088525A01CC9286F66CA1B74AB283E132514489923519ED2939DA45487A0A620DD08E0739B4CCB1655C04BACEC0098C31C43320B97B530E102993E508B09F8883BCCD8CD0F24884678085503C420E19A47D4E3362397936D19E59A76C9A61A47C04DBE6C8B9AFC5B17E3B2210DC4D926382410CD706E639D2755A535F54C1C3E2B469BD2142737E499A76D027A4FEEE4B3A0C4C14D53E2944BEC85A34BDBD85CFEE73ED71DEAD0AA3D4B304F1438E7B98192203DE099A69C44AAD1923A54311E0D0F483959D1EB40E0A2865A412DF5C31F17656700393DDC8546D3D304E5D10411FA488392B254264821A8C1186A867C3ACD9BD6549719A1D0842C34A212F1E8A86DD0AA80B8BA22AF9E08AC1FA1515A65A4D6B78875ACA52C6B8B8C8ACB9AF66F49906992491F81D7124CA94AABEB2B09FE0AA7BA56F47F657253B2FCA987C4BE69AFA773EC62297A556FA960852D68E7A30E65356F2201B32CD0ACA142D559731A05B4A175D46811F5917792717D31DCC20F5665925B852A5722281512765803DACAC4B6A282D57278DB5B5B050054C1D51565AF1A4454F9405BB70C54A6FE9E6BDA562A2789D48DAE452BCB9E7501CB5AD81A5CF606E68A27CE03BC7034C97897E98E6A35EB5AE955EFBDDA054FD999F15DE3EA17BA1A16326F28E18CF2F2D7201D790F91690EBFFC928E80594047758E91BBDD4D012529F6182D8A02AD1256E4C44A424B9C6D9174CBA1A47FC8A9A30F0FEDB5E83B592A9D899777C492C5D968E1DF5E8C2643780D927D4331F98E7695A9D9A66999644331B5A6B41FCF11C3721AB28F99A680BDB1977E10B6EC09DC8636B5E5ADC5EFB05B95E3160581C64ECB78BB82E320E7C228070E6C98D37112145A1E92CA98726C2E81E8409C6333AB39CA15BC73FEF48C670DF2D97F7FEEF307ED2CE806069A2341DB54F50EFE5DE8F7A96E9D1B4B437D1B4DB6262080000C3800A60D400003D4A26BFA40C0E338652750E38B31BD4904A4F31464669599D217BCB302F6D403295C8C1EDE7AC06474A30360A4AD486FA683766DC7685857C67AEBF0130DCE25A9B8E8209CCD964E87E60A95683EB9069336762B88366B0378DB00604CF60868404A00849729CD8A432A9E041272B6F330D51542B6B5ED884A21C000AD13775CC6B10D7CA7533A0313801DFCFD4B0550C453E57BE83E0F3AD13AD3BB8F62738D7F7BF0CB0748633232782333C02D82C914C05C28697047BFF3511F3E1CE2C802DA14BCCD804EB77A200F0B40AC7840D6121015416660D30176CEF39E43D5B0273760C166ADFE72E97C1C00F1CE660F4DE0A67478A1E6D9342B55B130EFA0A3AE6002E8F4B7BF1DEE29D04021D7C2810D0600A6700A969D7A7D69F08A6D758E80688606EE010D1EA7040138A0240EE009161B2E67331536633D0FFC017E3E4DB6B7DD21427AE58ABC9E0D3904BB2B5C78C099B03158D5422A51263FFCEA84B489E6D0BA200590F89038B55939C7CAB79E3AAEAB46A55C876B5EE891344003487CE94C639A19DA3A80031A9C049CDF21E9B6CCFCEB414734500C80EB464952C05A405ED70F7F81866703B40B62E0573F1FFA25137D364D2CE9E85FBFDEDE478348DB52F5EF33A1FC4078EAB1C36F7EDDB11F78E86FBFF8082DFFA2C51FFBF52FD9FDE9B6FFFEFC4319C2FDE77FDF0380EF27806B477F06282701687FB2760048060E0AE080DA13810FB8020BA87F7736230528041AA83D1D48751B8872B0468122C85D17083A1F184F0898808346802CA88021584D0D5881BD40820E6183EF8083E717832AD80429A81C3F5838EAE3104128393C685F47F8826F918401C4844AF87F26E8844F388051F87D3AF82D27888533081F57D83343E8085D18362BB81A5F088465183D4528862E3885BE2285B0C7868E568570181F6E487C753887CB65577788878537867CF81559D82B81C8868308837FB87E7E7888AC93888AB8118578258FA88491082493C88295D8868D487E7BC87F9BA88897188799B8886B188AA22887A4FEE8769D0841A9F8879FB81CBE778AEFF08A7A088BA8C888B40838AB8881B78878B99867BBF80EAD1824BD3887C16832C30887C58888BF080EC99818CDD87ECFA889CBC88CC7E867D3383BD5688828B04234775A234402DDA842DF880B29E47E8CC85B4F5714E89843BCB38E4B277C950517D8F56F36345DD8643CF3387D57C7885EB47740F36148D08FA8F05C00A91C0229450F5390797858C96147E3105F6C924710937E088646A12391BC978315593110296718293DA338311A2611D1D46AC1C4022226485D6192D7D60829F98EFC800368118D80181B34D61350006AD762310F901C8A47134070933EA19353712D3E396C3DB3622F919337C693B1F193FE36B790B944144316264DB634CB16152799104F5695687295B691954CC75ED264145E291BF78118BF340E00B19527509634C55CC9814E47F41CF6E2807BF16E2BE0593740977761978C80977E456248057CBDE09715211381590075A197C4142D34691427A319D2203A81446735360E10C54F08159494497D003067E9201CB5C1997CD7160A257196199A98499A06255130166121793818B526304572321552B5790323A71EB9C985BB5903BD9952EE01749D44146F452123B053065254397703C9B95550C753B2183555D15449E5204D059DD11920D3D99CD5892291792987C69C86207574D50AE6B9236755156D9514EFA909F1F908EB899ECF8955B389FE0567D77169779A8EB09F48D79FB14937004A5890259BA6B88DE3689B7DA7587F1704A8C50292F5A06E11A10997317E77A052168FEB425C7762799C85794E20431959188FB45AA565191E9A59204A5A22BA5D091A07F6E803A8075CB8656E30B902F3780335AA7AB8C27AB995A3EFB0A336D0A3C875A3BA05A31C0A0DE6152CEF155ED96298C27604EEE52CAA20A5416119550A5F578A941B2A97C18060E4A260F4922EEB1522151960655A2F675A1900A65F42BA7C2CD07C4A0AA627329223860B04C626D59748F45016143660DB51A2133949789AA763D7A77D0880B307397541632B033689A62A34A8094A59631DA60EDCB71B978A967770634031A9286780998EDA64E37930F3F11148B36440468459C3AACF143B4AB6353F06966EB925F3918D575200BCDAAB8A3117A8B6655746180E016656F605DA243BC6CA6563469840D3ABBC1A7471460284F3348A634F2FF72DD30A9AA353A97098669AE366D738AEE44A022100003B>|matrice
    jacobiana.gif>|283pt|128pt||>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>