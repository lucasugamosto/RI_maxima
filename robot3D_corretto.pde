//ISTRUZIONI PER L'UTILIZZO DEL CODICE:
//1.I giunti prismatici sono rappresentati in metri. I giunti prismatici, sull'oscilloscopio hanno come unità di misura i radianti. mentre nelle variabili
//  stampate a schermo hanno come unità di misura i gradi.


//le seguenti variabili sono usate per ruotare lungo l'asse x e l'asse y il manipolatore planare
float angoloX = 0.0;
float angoloY = 0.0;
float angoloXp = 0.0;
float angoloYp = 0.0;

//Le seguenti inizializzazioni indicano le variabili di giunto (rotoidale o prismatico)
float q1 = 0.0;
float q2 = 0.0;
float q3 = 0.0;
float q4 = 0.0;
float q5 = 0.0;
float q6 = 0.0;

float q1ref = 0.0;
float q2ref = 0.0;
float q3ref = 0.0;
float q4ref = 0.0;
float q5ref = 0.0;
float q6ref = 0.0;

float L = 100.0;                                    //lunghezza del link fisso del robot
float D = 60.0;                                     //seconda lunghezza del link fisso del robot
float d = 35.0;                                     //distanza tra i giunti del polso sferico (che in teoria deve essere 0)
int[] typesOfJoint = new int[3];                    //utilizzo questo array di interi per definire se un giunto è rotoidale ( = 0) oppure prismatico (= 1);          

float TT = -0.04;
int numRobot = 0;                                   //questa variabile serve per indicare queale robot rappresentare nella finestra di lavoro
int numVariable = 1;                                //questa variabile serve per indicare quale giunto far variare tra tutti i giunti possibili

//le seguenti liste tengon traccia dei valori passati e presente della variabile di giunto q per la rappresentazione sull'oscilloscopio
IntList andamento_q1;
IntList andamento_q2;
IntList andamento_q3;
IntList andamento_q4;
IntList andamento_q5;
IntList andamento_q6;

//la funzione seguente viene eseguita una sola volta all'inizio dell'esecuzione del programma
void setup() {
  size(900,700,P3D);
  background(#6FB2C4);
  directionalLight(126,126,126,0,0,0);              //funzione che permette di creare nella finestra di lavoro una luce direzionata
  
  fill(#F2CB2E);
  
  //inizializzo l'array che tiene conto del tipo di giunti tutti a 0
  for(int i = 0; i < 3; i=i+1) {
  typesOfJoint[i] = 0;
  }
  
  //inizializzo la lista contenente i valori delle variabili di giunto
  andamento_q1 = new IntList();
  for(int i  = 0; i < 400; i=i+1) {
    andamento_q1.append(int(q1ref));
  }
  andamento_q2 = new IntList();
  for(int i  = 0; i < 400; i=i+1) {
    andamento_q2.append(int(q2ref));
  }
  andamento_q3 = new IntList();
  for(int i  = 0; i < 400; i=i+1) {
    andamento_q3.append(int(q3ref));
  }
  andamento_q4 = new IntList();
  for(int i  = 0; i < 400; i=i+1) {
    andamento_q4.append(int(q4ref));
  }
  andamento_q5 = new IntList();
  for(int i  = 0; i < 400; i=i+1) {
    andamento_q5.append(int(q5ref));
  }
  andamento_q6 = new IntList();
  for(int i  = 0; i < 400; i=i+1) {
    andamento_q6.append(int(q6ref));
  }
}

//la funzione seguente viene eseguita ripetutamente con una certa frequenza a partire dall'esecuzione del programma e per tutta la sua durata
void draw() {
  background(#6FB2C4);
  
  //tramite la seguente funzione rappresento l'oscilloscopio che permette di osservare l'andamento delle variabili di giunto
  oscilloscopio();
  andamenti_variabili_q(andamento_q1,andamento_q2);

  //rappresento a schermo tutte le variabili di giunto con i rispettivi valori ed il nome del robot disegnato
  fill(0);
  textSize(15);
  if(typesOfJoint[0] == 1) {
    text("q1:",10,25);
    text(q1,35,25);
  }
  if(typesOfJoint[0] == 0) {
    text("q1:",10,25);
    text((q1*180)/PI,35,25);
  }
  if(typesOfJoint[1] == 1) {
    text("q2:",10,50);
    text(q2,35,50);
  }
  if(typesOfJoint[1] == 0) {
    text("q2:",10,50);
    text((q2*180)/PI,35,50);
  }
  if(typesOfJoint[2] == 1) {
    text("q3:",10,75);
    text(q3,35,75);
  }
  if(typesOfJoint[2] == 0) {
    text("q3:",10,75);
    text((q3*180)/PI,35,75);
  }
  text("q4:",90,25);
  text("q5:",90,50);
  text("q6:",90,75);
  text((q4*180)/PI,115,25);
  text((q5*180)/PI,115,50);
  text((q6*180)/PI,115,75);
  text("TT:",10,100);
  text(TT,35,100);
  
  textSize(20);
  if(numRobot == 1) {
    text("Cartesiano",400,25);
  }
  else if(numRobot == 2) {
    text("Cilindrico",400,25);
  }
  else if(numRobot == 3) {
    text("Scara",400,25);
  }
  else if(numRobot == 4) {
    text("Sferico 1° tipo",400,25);
  }
  else if(numRobot == 5) {
    text("Sferico 2° tipo",400,25);
  }
  else if(numRobot == 6) {
    text("Antropomorfo",400,25);
  }
  
  
  translate(200,450);                               //spostamento dell'origine del sistema di riferimento nel centro della finestra di lavoro

  //le due successive funzioni sono utilizzate per ruotare la visuale del robot.
  //La rotazione lungo l'asse y è con segno negativo perchè quest'ultimo in processing è positivo verso il basso (e non verso l'alto)
  rotateY(-angoloY);
  rotateX(angoloX);
  
  rotateX(PI/2);                                    //con questa rotazione di PI/2 rispetto all'asse x, porto l'asse z ad avere direzione verticale con verso in su
  //rappresento sulla finestra di lavoro il sistema di riferimento solidale con la base del robot
  stroke(255,0,0);
  line(0,0,0,100,0,0);
  translate(100,0,0);
  fill(255,0,0);
  textSize(15);
  text("x",0,0);
  translate(-100,0,0);
  
  stroke(0,255,0);
  line(0,0,0,0,100,0);
  translate(0,100,0);
  fill(0,255,0);
  textSize(15);
  text("y",0,0);
  translate(0,-100,0);
  
  stroke(0,0,255);
  line(0,0,0,0,0,100);
  translate(0,0,100);
  fill(0,0,255);
  textSize(15);
  text("z",0,0);
  translate(0,0,-100);
  
  //rappresento sulla finestra di lavoro la base su cui poggia il robot
  stroke(0);                                        //cambio il colore dei bordi della base di nero
  fill(0);                                          //cambio il colore interno della base di nero
  box(100,100,10);
  
  //rappresento sulla finestra di lavoro il robot preso in esame
  fill(#F2CB2E);
  strokeWeight(1);
  robot();
  
  //evoluzione delle variabili di giunto
  q1 = q1 + TT*(q1 - q1ref);
  q2 = q2 + TT*(q2 - q2ref);
  q3 = q3 + TT*(q3 - q3ref);
  q4 = q4 + TT*(q4 - q4ref);
  q5 = q5 + TT*(q5 - q5ref);
  q6 = q6 + TT*(q6 - q6ref);
  
  //assegno il sistema di riferimento all'end-effector e disegno gli assi x,y,z in punta
  if(numRobot != 0) {
    stroke(255,0,0);
    line(0,0,0,100,0,0);
    translate(100,0,0);
    fill(255,0,0);
    textSize(15);
    text("x",0,0);
    translate(-100,0,0);
    
    stroke(0,255,0);
    line(0,0,0,0,100,0);
    translate(0,100,0);
    fill(0,255,0);
    textSize(15);
    text("y",0,0);
    translate(0,-100,0);
    
    stroke(0,0,255);
    line(0,0,0,0,0,100);
    translate(0,0,100);
    fill(0,0,255);
    textSize(15);
    text("z",0,0);
    translate(0,0,-100);
  }
}

void robot() {
  //funzione utilizzata per la progettazione del robot richiesto, infatti a seconda del valore della variabile
  //numRobot si andrà a progettare un deteminato robot
  if(numRobot == 1) {
    //progettazione del robot CARTESIANO + POLSO SFERICO
    link(0,q1,-PI/2,0);
    link(-PI/2,q2,-PI/2,0);
    link(0,q3,0,0);
    link(q4,d,-PI/2,0);
    link(q5,0,PI/2,0);
    link(q6,d,0,0);
  }
  else if(numRobot == 2) {
    //progettazione del robot CILINDRICO + POLSO SFERICO
    link(q1,L,0,0);
    link(0,q2,-PI/2,0);
    link(0,q3,0,0);
    link(q4,d,-PI/2,0);
    link(q5,0,PI/2,0);
    link(q6,d,0,0);
  }
  else if(numRobot == 3) {
    //progettazione del robot SCARA + POLSO SFERICO
    link(q1,L,0,D);
    link(q2,L,0,D);
    link(0,q3,0,0);
    link(q4,d,-PI/2,0);
    link(q5,0,PI/2,0);
    link(q6,d,0,0);
  }
  else if(numRobot == 4) {
    //progettazione del robot SFERICO DI 1°TIPO + POLSO SFERICO
    link(q1,L,PI/2,0);
    link(q2,0,PI/2,L);
    link(0,q3,0,0);
    link(q4,d,-PI/2,0);
    link(q5,0,PI/2,0);
    link(q6,d,0,0);
  }
  else if(numRobot == 5) {
    //progettazione del robot SFERICO DI 2°TIPO  + POLSO SFERICO
    link(q1,L,-PI/2,0);
    link(q2,L,PI/2,0);
    link(0,q3,0,0);
    link(q4,d,-PI/2,0);
    link(q5,0,PI/2,0);
    link(q6,d,0,0);
  }
  else if(numRobot == 6) {
    //progettazione del robot ANTROPOMORFO + POLSO SFERICO
    link(q1,L,PI/2,0);
    link(q2,0,0,L);
    link(q3,0,PI/2,0);
    link(q4,d,-PI/2,0);
    link(q5,0,PI/2,0);
    link(q6,d,0,0);
  }
}
  
void link(float theta, float d, float alpha, float a) {
  //la funzione seguente serve per progettare i singoli link del robot
  //eseguo prima le operazioni lungo l'asse z
  rotateZ(theta);
  sphere(10);
  //le due traslazioni lungo l'asse z di d/2 sono presenti perchè in totale la traslazione deve essere di lunghezza d
  translate(0,0,d/2);
  box(15,15,d);
  translate(0,0,d/2);
  //eseguo poi le operazioni lungo l'asse x
  rotateX(alpha);
  sphere(10);
  translate(a/2,0,0);
  box(a,15,15);
  translate(a/2,0,0);
}

//Nelle successive due funzioni viene calcolato l'angolo usato per la visualizzazione del robot nello spazio
void mousePressed() {
  //con questa funzione si tiene conto del fatto che si clicca il pulsante del mouse
  angoloXp = angoloX + (PI*mouseY)/float(500);
  angoloYp = angoloY + (PI*mouseX)/float(500);
}

void mouseDragged() {
  //con questa funzione si tiene conto del tempo in cui tengo premuto il tasto del mouse
  angoloX = angoloXp - (PI*mouseY)/float(500);
  angoloY = angoloYp - (PI*mouseX)/float(500);
}

void keyPressed() {
  float incremento = 1.5;
  
  //premento il tasto 0 le variabili di riferimento qiref vengono resettate a 0
  if(keyCode == '0') {
    q1ref = q2ref = q3ref = q4ref = q5ref = q6ref = 0;
    //reset variabili dell'oscilloscopio
    for(int i  = 0; i < 400; i=i+1) {
    andamento_q1.append(int(q1ref));
    }
  }
  
  //le seguenti istruzioni sono utilizzate per selezionare le variabili di giunto da esaminare
  if(keyCode == 'A') {
    numVariable = 1;
  }
  else if(keyCode == 'B') {
    numVariable = 2;
  }
  else if(keyCode == 'C') {
    numVariable = 3;
  }
  else if(keyCode == 'D') {
    numVariable = 4;
  }
  else if(keyCode == 'E') {
    numVariable = 5;
  }
  else if(keyCode == 'F') {
    numVariable= 6;
  }
  
  //le seguenti istruzioni sono utilizzate per far variare il valore del giunto selezionato
  if(keyCode == LEFT) {
    if(numVariable == 1) {
      if(typesOfJoint[0] == 1 & q1ref <= 20) {
        q1ref = 20;
      }
      else {
        if(typesOfJoint[0] == 1) {
          q1ref = q1ref - 2*incremento;
        }
        else {
          q1ref = q1ref - incremento/5;
        }
      }
    }
    else if(numVariable == 2) {
      if(typesOfJoint[1] == 1 & q2ref <= 20) {
        q2ref = 20;
      }
      else {
        if(typesOfJoint[1] == 1) {
          q2ref = q2ref - 2*incremento;
        }
        else {
          q2ref = q2ref - incremento/5;
        }
      }
    }
    else if(numVariable == 3) {
      if(typesOfJoint[2] == 1 & q3ref <= 20) {
        q3ref = 20;
      }
      else {
        if(typesOfJoint[2] == 1) {
          q3ref = q3ref - 2*incremento;
        }
        else {
          q3ref = q3ref - incremento/5;
        }
      }
    }
    else if(numVariable == 4) {
      q4ref = q4ref - incremento/5;
    }
    else if(numVariable == 5) {
      q5ref = q5ref - incremento/5;
    }
    else if(numVariable == 6) {
      q6ref = q6ref - incremento/5;
    }
  }
  if(keyCode == RIGHT) {
    if(numVariable == 1) {
      if(typesOfJoint[0] == 1) {
        q1ref = q1ref + 2*incremento;
      }
      else {
        q1ref = q1ref + incremento/5;
      }
    }
    else if(numVariable == 2) {
      if(typesOfJoint[1] == 1) {
        q2ref = q2ref + 2*incremento;
      }
      else {
        q2ref = q2ref + incremento/5;
      }
    }
    else if(numVariable == 3) {
      if(typesOfJoint[2] == 1) {
        q3ref = q3ref + 2*incremento;
      }
      else {
        q3ref = q3ref + incremento/5;
      }
    }
    else if(numVariable == 4) {
      q4ref = q4ref + incremento/5;
    }
    else if(numVariable == 5) {
      q5ref = q5ref + incremento/5;
    }
    else if(numVariable == 6) {
      q6ref = q6ref + incremento/5;
    }
  }
  
  //con le seguenti funzioni si va a selezionare il robot da rappresentare sulla finestra di lavoro
  if(keyCode == '1') {
    //cartesiano + polso sferico
    numRobot = 1;
    typesOfJoint[0] = 1;
    typesOfJoint[1] = 1;
    typesOfJoint[2] = 1;
    //inizializzo delle grandezze standard per i link
    q1ref = 50;
    q2ref = 50;
    q3ref = 50;
  }
  else if(keyCode == '2') {
    //cilindrico + polso sferico
    numRobot= 2;
    typesOfJoint[0] = 0;
    typesOfJoint[1] = 1;
    typesOfJoint[2] = 1;
    //inizializzo delle grandezze standard per i link
    q2ref = 50;
    q3ref = 50;
  }
  else if(keyCode == '3') {
    //scara + polso sferico
    numRobot= 3;
    typesOfJoint[0] = 0;
    typesOfJoint[1] = 0;
    typesOfJoint[2] = 1;
    //inizializzo delle grandezze standard per i link
    q3ref = 50;
  }
  else if(keyCode == '4') {
    //sferico di 1°tipo + polso sferico
    numRobot= 4;
    typesOfJoint[0] = 0;
    typesOfJoint[1] = 0;
    typesOfJoint[2] = 1;
    //inizializzo delle grandezze standard per i link
    q3ref = 50;
  }
  else if(keyCode == '5') {
    //sferico di 2°tipo + polso sferico
    numRobot= 5;
    typesOfJoint[0] = 0;
    typesOfJoint[1] = 0;
    typesOfJoint[2] = 1;
    //inizializzo delle grandezze standard per i link
    q3ref = 50;
  }
  else if(keyCode == '6') {
    //antropomorfo + polso sferico
    numRobot= 6;
    typesOfJoint[0] = 0;
    typesOfJoint[1] = 0;
    typesOfJoint[2] = 0;
  }
  
  //con le seguenti istruzioni si può far variare la variabile TT
  if(keyCode == UP) {
    TT = TT - 0.01;
  }
  else if(keyCode == DOWN) {
    if(TT == 0.0) {
      TT = 0.0;
    }
    else {
      TT = TT + 0.01;
    }
  }
}

//funzione che permette di disegnare sulla finestra di lavoro lo sfondo dell'oscilloscopio
void oscilloscopio() {
  //rappresento sulla finestra di lavoro l'oscilloscopio
  strokeWeight(1);
  stroke(0);
  fill(255);
  rect(500,150,400,500);
  
  line(500,600,900,600);
  line(500,550,900,550);
  line(500,500,900,500);
  line(500,450,900,450);
  line(500,400,900,400);
  line(500,350,900,350);
  line(500,300,900,300);
  line(500,250,900,250);
  line(500,200,900,200);
  
  fill(0);
  textSize(20);
  //asse y del grafico
  text("-200",455,600);
  text("-150",455,550);
  text("-100",455,500);
  text("-50",465,450);
  text("0",485,400);
  text("50",475,350);
  text("100",465,300);
  text("150",465,250);
  text("200",465,200);
  //asse x del grafico
  text("[sec]",850,670);
}

void andamenti_variabili_q(IntList lista1, IntList lista2) {
  if(numRobot != 0) {
    //aggiornamento della lista contenente i valori di q1
    stroke(255,0,0);
    strokeWeight(1.5);
    
    //variabile di giunto q1
    if(typesOfJoint[0] == 0) {
      //allora il primo giunto è di tipo rotoidale
      int val_q1 = int(q1);
      for(int i = 0; i < 399; i=i+1) {
        int val_q1_next = lista1.get(i+1);
        lista1.set(i+1,val_q1);
        if(400-val_q1_next < 150 || 400-val_q1_next > 650) {
          noStroke();
        }
        else {
          line(900-i,400-val_q1,899-i,400-val_q1_next);
          val_q1 = val_q1_next;
        }
      }
    }
    if(typesOfJoint[0] == 1) {
      //allora il primo giunto è di tipo prismatico
      int val_q1 = int(q1);
      for(int i = 0; i < 399; i=i+1) {
        int val_q1_next = lista1.get(i+1);
        lista1.set(i+1,val_q1);
        if(400-val_q1_next < 150 || 400-val_q1_next > 650) {
          noStroke();
        }
        else {
          line(900-i,400-val_q1,899-i,400-val_q1_next);
          val_q1 = val_q1_next;
        }
      }
    }
    
    stroke(234,132,28);
    //variabile di giunto q2
    if(typesOfJoint[1] == 0) {
      //allora il primo giunto è di tipo rotoidale
      int val_q2 = int(q2);
      for(int i = 0; i < 399; i=i+1) {
        int val_q2_next = lista2.get(i+1);
        lista2.set(i+1,val_q2);
        if(400-val_q2_next < 150 || 400-val_q2_next > 650) {
          noStroke();
        }
        else {
          line(900-i,400-val_q2,899-i,400-val_q2_next);
          val_q2 = val_q2_next;
        }
      }
    }
    if(typesOfJoint[1] == 1) {
      //allora il primo giunto è di tipo prismatico
      int val_q2 = int(q2);
      for(int i = 0; i < 399; i=i+1) {
        int val_q2_next = lista2.get(i+1);
        lista2.set(i+1,val_q2);
        if(400-val_q2_next < 150 || 400-val_q2_next > 650) {
          noStroke();
        }
        else {
          line(900-i,400-val_q2,899-i,400-val_q2_next);
          val_q2 = val_q2_next;
        }
      }
    }
  }
}
