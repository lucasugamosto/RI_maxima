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
      mat_R(theta):=block(

      [mat],

      if listp(theta) = true or matrixp(theta) = true then return(0),

      mat:matrix([cos(theta),-sin(theta),0],[sin(theta),cos(theta),0],[0,0,1]),

      return(mat)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|mat_R><around*|(|\<vartheta\>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|mat>|]>,<math-bf|if><space|0.27em><math-up|listp><around*|(|\<vartheta\>|)>=<math-bf|true>\<vee\><math-up|matrixp><around*|(|\<vartheta\>|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|mat>:<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|return><around*|(|<math-up|mat>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      mat_T(d):=block(

      [mat],

      if scalarp(d) = true or listp(d) = true then return(0),

      mat:matrix([1,0,d[1]],[0,1,d[2]],[0,0,1]),

      return(mat)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|mat_T><around*|(|d|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|mat>|]>,<math-bf|if><space|0.27em><math-up|scalarp><around*|(|d|)>=<math-bf|true>\<vee\><math-up|listp><around*|(|d|)>=<math-bf|true><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|0|)>,<math-up|mat>:<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|d<rsub|1>>>|<row|<cell|0>|<cell|1>|<cell|d<rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>,<math-up|return><around*|(|<math-up|mat>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      confronto_mat(theta,d):=block(

      [R,T,mat_RT,mat_TR,mat_F],

      R:mat_R(theta),

      T:mat_T(theta),

      mat_RT:trigsimp(R.T),

      mat_TR:trigsimp(T.R),

      mat_F:0*ident(3),

      for i:1 thru 3 do (

      \ for j:1 thru 3 do (

      \ \ mat_F[i,j]:mat_RT[i,j]-mat_TR[i,j]

      \ )

      ),

      return(mat_F)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|confronto_mat><around*|(|\<vartheta\>,d|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|R,T,<with|math-font-family|rm|mat_RT>,<with|math-font-family|rm|mat_TR>,<with|math-font-family|rm|mat_F>|]>,R:<with|math-font-family|rm|mat_R><around*|(|\<vartheta\>|)>,T:<with|math-font-family|rm|mat_T><around*|(|\<vartheta\>|)>,<with|math-font-family|rm|mat_RT>:<math-up|trigsimp><around*|(|R\<cdot\>T|)>,<with|math-font-family|rm|mat_TR>:<math-up|trigsimp><around*|(|T\<cdot\>R|)>,<with|math-font-family|rm|mat_F>:0*<math-up|ident><around*|(|3|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em>3<space|0.27em><math-bf|do><space|0.27em><with|math-font-family|rm|mat_F><rsub|i,j>:<with|math-font-family|rm|mat_RT><rsub|i,j>-<with|math-font-family|rm|mat_TR><rsub|i,j>,<math-up|return><around*|(|<with|math-font-family|rm|mat_F>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      confronto_mat(alpha,d)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|-\<alpha\><rsub|2>*sin
      <around*|(|\<alpha\>|)>+\<alpha\><rsub|1>*cos
      <around*|(|\<alpha\>|)>-\<alpha\><rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|\<alpha\><rsub|1>*sin
      <around*|(|\<alpha\>|)>+\<alpha\><rsub|2>*cos
      <around*|(|\<alpha\>|)>-\<alpha\><rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>