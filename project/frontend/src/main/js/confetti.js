// präsentiert von kostenlose-javascripts.de 
    
    Amount=20; //Anzahl der Konfettis
     
    colors=new Array(5)
    colors[0]="red";
    colors[1]="green";
    colors[2]="yellow";
    colors[3]="magenta";
    colors[4]="blue";
     
    Ypos=new Array();
    Xpos=new Array();
    Speed=new Array();
    Step=new Array();
    Cstep=new Array();
    ns=(document.layers)?1:0;
    
    if (ns){
        for (i = 0; i < Amount; i++){
            var P=Math.floor(Math.random()*5);
            rndCol=colors[P];
            document.write("<layer name='sn"+i+"' left='0' top='0'><font size='24' color'" + rndCol + "'>.</font></layer>");
        }
    }
    else{
        document.write('<div style="position:absolute;top:0px;left:0px"><div style="position:relative">');
        for (i = 0; i < Amount; i++){
            var P=Math.floor(Math.random()*colors.length);
            rndCol=colors[P];
            document.write('<span style="position:absolute;top:0px;left:0px;color:' + rndCol + ';font-size:72px;font-family: \'Times New Roman\', Times, serif;" id="si'+i+'">.</span>');
        }
        document.write('</div></div>');
    }

    //Annmerkung Jan: Ich musst hier und auf den Zielen 49/50 WinHeight und WinWidth absolut setzen, weil es sonst zu unschönen Ruklern kam
    WinHeight=500;//(document.layers)?window.innerHeight:window.document.body.clientHeight;
    WinWidth=500;//(document.layers)?window.innerWidth:window.document.body.clientWidth;
    
    for (i=0; i < Amount; i++){
        Ypos[i] = Math.round(Math.random()*WinHeight);
        Xpos[i] = Math.round(Math.random()*WinWidth);
        Speed[i]= Math.random()*3+2;
        Cstep[i]=0;
        Step[i]=Math.random()*0.1+0.05;
    }

    function fall(){
        var WinHeight=500;//(document.layers)?window.innerHeight:window.document.body.clientHeight;
        var WinWidth=500;//(document.layers)?window.innerWidth:window.document.body.clientWidth;
        var hscrll=(document.layers)?window.pageYOffset:document.body.scrollTop;
        var wscrll=(document.layers)?window.pageXOffset:document.body.scrollLeft;
        for (i=0; i < Amount; i++){
            sy = Speed[i]*Math.sin(90*Math.PI/180);
            sx = Speed[i]*Math.cos(Cstep[i]);
            Ypos[i]+=sy;
            Xpos[i]+=sx;
        if (Ypos[i] > WinHeight){
            Ypos[i]=-60;
            Xpos[i]=Math.round(Math.random()*WinWidth);
            Speed[i]=Math.random()*5+2;
        }
        if (ns){
            document.layers['sn'+i].left=Xpos[i];
            document.layers['sn'+i].top=Ypos[i]+hscrll;
        }
        else{
            document.getElementById('si'+i).style.left=Xpos[i]+"px";
            document.getElementById('si'+i).style.top=Ypos[i]+hscrll+"px";
        }
            Cstep[i]+=Step[i];
        }
        setTimeout('fall()',40);
    }