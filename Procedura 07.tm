<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <with|color|red|Procedura 1: Procedura che dimostra come poter calcolare il
  prodotto vettoriale tra due vettori generici usando la matrice
  antisimmetrica associata ad uno dei due vettori, infatti deve valere che
  <math|v x w=S<around*|(|v|)>.w>:>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      prodotto_vettoriale(a,b):=block(

      [mat,res],

      mat:matrix([e[x],e[y],e[z]],[a[1],a[2],a[3]],[b[1],b[2],b[3]]),

      res:trigsimp(determinant(mat))

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><with|math-font-family|rm|prodotto_vettoriale><around*|(|a,b|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|mat>,<math-up|res>|]>,<math-up|mat>:<matrix|<tformat|<table|<row|<cell|e<rsub|x>>|<cell|e<rsub|y>>|<cell|e<rsub|z>>>|<row|<cell|a<rsub|1>>|<cell|a<rsub|2>>|<cell|a<rsub|3>>>|<row|<cell|b<rsub|1>>|<cell|b<rsub|2>>|<cell|b<rsub|3>>>>>>,<math-up|res>:<math-up|trigsimp><around*|(|<math-up|determinant><around*|(|<math-up|mat>|)>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      prod_mat(v,w):=block(

      [S,p1,p2],

      S:matrix([0,-v[3,1],v[2,1]],[v[3,1],0,-v[1,1]],[-v[2,1],v[1,1],0]),

      p1:S.w,

      p1:(matrix([e[x]],[e[y]],[e[z]])).p1,

      p2:prodotto_vettoriale(v,w),

      if p1 = p2[1] then return(1) else return(0)

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|prod_mat><around*|(|v,w|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|S,<with|math-font-family|rm|p1>,<with|math-font-family|rm|p2>|]>,S:<matrix|<tformat|<table|<row|<cell|0>|<cell|-v<rsub|3,1>>|<cell|v<rsub|2,1>>>|<row|<cell|v<rsub|3,1>>|<cell|0>|<cell|-v<rsub|1,1>>>|<row|<cell|-v<rsub|2,1>>|<cell|v<rsub|1,1>>|<cell|0>>>>>,<with|math-font-family|rm|p1>:S\<cdot\>w,<with|math-font-family|rm|p1>:<matrix|<tformat|<table|<row|<cell|e<rsub|x>>>|<row|<cell|e<rsub|y>>>|<row|<cell|e<rsub|z>>>>>>\<cdot\><with|math-font-family|rm|p1>,<with|math-font-family|rm|p2>:<with|math-font-family|rm|prodotto_vettoriale><around*|(|v,w|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|p1>=<with|math-font-family|rm|p2><rsub|1><space|0.27em><math-bf|then><space|0.27em><math-up|return><around*|(|1|)><space|0.27em><math-bf|else><space|0.27em><math-up|return><around*|(|0|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      prod_mat(matrix([1],[2],[3]),matrix([2],[1],[3]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >>1>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>