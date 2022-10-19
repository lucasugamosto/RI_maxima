<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  Procedura che implementa le matrici di ROTO-TRASLAZIONE e TRASLO-ROTAZIONE
  e verifica che esse siano diverse l'una con l'altra, andando ad effettuare
  la differenza elemento per elemento.\ 

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      matR(theta):=block(

      [mat],

      mat:matrix([cos(theta),-sin(theta),0],[sin(theta),cos(theta),0],[0,0,1])

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><math-up|matR><around*|(|\<vartheta\>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|mat>|]>,<math-up|mat>:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      matT(d):=block(

      [mat],

      mat:matrix([1,0,d[1]],[0,1,d[2]],[0,0,1])

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><math-up|matT><around*|(|d|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|mat>|]>,<math-up|mat>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|d<rsub|1>>>|<row|<cell|0>|<cell|1>|<cell|d<rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      confronto_mat(theta,d):=block(

      [matRT,matTR,matF],

      matRT:matR(theta).matT(d),

      matTR:matT(d).matR(theta),

      matF:0*ident(3),

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ matF[i,j]:matRT[i,j]-matTR[i,j]

      \ )

      ),

      [matRT,matTR,matF]

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|confronto_mat><around*|(|\<vartheta\>,d|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|matRT>,<math-up|matTR>,<math-up|matF>|]>,<math-up|matRT>:<math-up|matR><around*|(|\<vartheta\>|)>\<cdot\><math-up|matT><around*|(|d|)>,<math-up|matTR>:<math-up|matT><around*|(|d|)>\<cdot\><math-up|matR><around*|(|\<vartheta\>|)>,<math-up|matF>:0*<math-up|ident><around*|(|3|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><math-up|matF><rsub|i,j>:<math-up|matRT><rsub|i,j>-<math-up|matTR><rsub|i,j>,<around*|[|<math-up|matRT>,<math-up|matTR>,<math-up|matF>|]>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      confronto_mat(alpha,d)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>|<cell|d<rsub|1>*cos
      <around*|(|\<alpha\>|)>-d<rsub|2>*sin
      <around*|(|\<alpha\>|)>>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>|<cell|d<rsub|1>*sin
      <around*|(|\<alpha\>|)>+d<rsub|2>*cos
      <around*|(|\<alpha\>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>|<cell|d<rsub|1>>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>|<cell|d<rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|-d<rsub|2>*sin
      <around*|(|\<alpha\>|)>+d<rsub|1>*cos
      <around*|(|\<alpha\>|)>-d<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|d<rsub|1>*sin
      <around*|(|\<alpha\>|)>+d<rsub|2>*cos
      <around*|(|\<alpha\>|)>-d<rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>|]>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>