<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  PROCEDURA CHE CALCOLA IL PRODOTTO VETTORIALE TRA DUE VETTORI COME PRODOTTO
  MATRICIALE TRA LA MATRICE ANTISIMMETRICA ASSOCIATA AD UN VETTORE ED IL
  SECONDO VETTORE.

  <with|color|black|Scrivere una procedura che calcoli il prodotto vettoriale
  tra due vettori come prodotto matriciale, cioè deve valere: <math|v x
  w=S<around*|(|v|)>.w>>.

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      prodottoVettoriale(v,w):=block(

      [mat,result],

      /*Controllo che i due elementi passati in input siamo vettori*/

      if scalarp(v) = true or listp(v) = true then return(-1),

      if scalarp(w) = true or listp(w) = true then return(-1),

      \;

      /*Controllo che il numero di righe dei due vettori sia lo stesso*/

      if length(v) # length(w) then return(-1),

      \;

      /*calcolo del prodotto vettoriale per mezzo del calcolo del
      determinante della matrice costituita dai versori, dalle componenti di
      v e le componenti di w*/

      mat:matrix([e[x],e[y],e[z]],[v[1],v[2],v[3]],[w[1],w[2],w[3]]),

      result:trigsimp(determinant(mat)),

      return(result)

      )$
    </input>

    \;

    \;

    La funzione \PprodottoMatriciale\Q calcola al suo interno il prodotto
    matriciale S(v).w e per mezzo della funzione \PprodottoVettoriale\Q
    calcola v <math|\<b-x\>> w, infine paragona se sono uguali o meno.

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      prodottoMatriciale(v,w):=block(

      [S,result],

      /*controllare che i due elementi passati in input siamo vettori*/

      if scalarp(v) = true or listp(v) = true then return(-1),

      if scalarp(w) = true or listp(w) = true then return(-1),

      \;

      /*controllare che il numero di righe dei due vettori sia lo stesso*/

      if length(v) # length(w) then return(-1),

      \;

      S:matrix([0,-v[3,1],v[2,1]],[v[3,1],0,-v[1,1]],[-v[2,1],v[1,1],0]),

      result[1]:trigreduce(S.w),

      result[1]:(transpose(result[1])).matrix([e[x]],[e[y]],[e[z]]),

      result[2]:prodottoVettoriale(v,w),

      if result[1] = result[2][1] then return(1) else return(0)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      prodottoVettoriale(matrix([1],[2],[3]),matrix([4],[5],[6]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><around*|[|-3*e<rsub|z>+6*e<rsub|y>-3*e<rsub|x>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      prodottoMatriciale(matrix([1],[2],[3]),matrix([4],[5],[6]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      prodottoVettoriale(matrix([a],[0],[c]),matrix([2],[a],[b]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|a<rsup|2>*e<rsub|z>+<around*|(|2*c-a*b|)>*e<rsub|y>-a*c*e<rsub|x>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      prodottoMatriciale(matrix([a],[0],[c]),matrix([2],[a],[b]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      prodottoMatriciale(matrix([1],[0]),matrix([1],[1],[1]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >>-1>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>