            // https://raw... = Link zum JSON-Objekt nach Spezifikation des API. Genutzt als default-Wert
            var json_url = 'https://raw.githubusercontent.com/SPRINT-Raketen/SPRINT-Quiz/main/project/frontend/src/main/officialJSONdummy.json';
            
            //Variablen zum Zwischenspeichern der Werte aus JSON
            var questionId;
            var levelId=0; //0=Startwert
            var value;    //entspricht Wert einer Frage -> nötig für Punkte bei Ausstieg
            var levelText;
            var subject;
            var subjectId; 
            var feedback_a;
            var feedback_b;
            var feedback_c;
            var feedback_d; 

            //generiert Anfrage an API mit Parametern Level & subject
            function buildAPIrequest (level, subjectId) {
                var baseURL = "http://localhost:80/sprintquiz/api/questions/question.php";
                var APIcommand = "GET "; //GET ist eh default bei fetch(). Da ich vom frontend her nur GET brauche, kann ich das weglassen
                var endpointLevel;
                var endpointSubjectId=1; //Vorläufig per default "1", weil nur Fragen aus der Kategorie 1 (="Allgemein") bestehen

                level = Number(level);
                endpointLevel=level;

                json_url=baseURL+"?level="+endpointLevel+"&subject="+endpointSubjectId;

            }

            //holt JSON-Objekt ab (vorläufig auf GitHub, später beim API)
            function getJSON (){
                console.log ("getJSON: "+json_url);
                fetch(json_url)
                .then(response => {
                    if (response.status === 200) {    // okay
                        const json_obj = response.json();   // consume json, only once possible!
                        return json_obj;    // return consumed json to second .then() 
                    } else {    // nok, so print error
                        alert(response.status.toString() + ": " + response.statusText);
                    }
                })

                .then(myJson => { // lambda to manage consumed jso
                    var parsedJSON = myJson; 

                    //05.04.21 Markus: Zur Kontrolle im browser
                    console.log ("Anzahl Datensätze: "+myJson.length);

                    //05.04.21 Markus: Wenn mehrere passende Fragen angeboten werden, wird per Zufall ausgewählt
                    var index = Math.floor((Math.random())*myJson.length);
                    parsedJSON = myJson [index];

                    //05.04.21 Markus: Zur Kontrolle im browser
                    console.log (JSON.stringify(parsedJSON));

                    //07.03.21 Markus: Ich lese aus der API-Spezifikation von oben nach unten, egal ob's Variablen oder html-Inhalte sind
                    questionId                                          =   parsedJSON.id;
                    levelId                                             =   parsedJSON.level.id;
                    value                                               =   parsedJSON.level.value;
                    levelText                                           =   parsedJSON.level.text;
                    subjectId                                           =   parsedJSON.subject.id;
                    document.getElementById("levelId").innerHTML        =   parsedJSON.level.id;
                    document.getElementById("levelValue").innerHTML     =   parsedJSON.level.value;
                    document.getElementById("subjectId").innerHTML      =   parsedJSON.subject.id;
                    document.getElementById("subjectText").innerHTML    =   parsedJSON.subject.text;
                    document.getElementById("question_text").innerHTML  =   parsedJSON.question;
                    $("#" + id1).text(parsedJSON.answers[0].text);
                    feedback_a                                          =   parsedJSON.answers[0].feedback;
                    $("#" + id2).text(parsedJSON.answers[1].text);
                    feedback_b                                          =   parsedJSON.answers[1].feedback;
                    $("#" + id3).text(parsedJSON.answers[2].text);
                    feedback_c                                          =   parsedJSON.answers[2].feedback;
                    $("#" + id4).text(parsedJSON.answers[3].text);
                    feedback_d                                          =   parsedJSON.answers[3].feedback;
                })
            }
        
            //REST-API-requests generieren.
            function getNewQuestion (levelId, subject){
                /*
                Markus 05.04.21: +1, damit nicht vom gleichen, sondern vom nächsthöheren Level Fragen requestet werden.
                Nur nötig, wenn +1 nirgends sonst gemacht wird!
                */
                levelId++;

                buildAPIrequest (levelId, subject);
                json_obj_global= getJSON();

                //Markus 05.04.21: folgende Funktionen sind nicht notwendig, nur zur Überprüfung
                //displayCurrentValues ();
                console.log("LevelID 1: " + levelId);

            }

