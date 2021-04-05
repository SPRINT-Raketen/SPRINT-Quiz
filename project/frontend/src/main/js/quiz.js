$(function(){

});

/*für JS-Array
function getRightAnswer(){
    var correctAnswer = fragen[pos][6];
    return correctAnswer;
}
function getLastQuestion(){
  var lastQuestion = fragen.length;
  return lastQuestion;
}*/

//für JSON-Array
function getRightAnswer(){
  var correctAnswer = shuffledAnswers[0]; //currentQuestion.right;
  return correctAnswer;
}

function getLastQuestion(){
  var lastQuestion = questions.length;
  return lastQuestion;
}

/* Anzeige der Fragen mit einem JavaScript-Array
let fragen = [
  ['1', 'Was macht man mit einer Programmiersprache?', 'Wandern', 'Kochen', 'Programmieren', 'Zeichnen', 'C',
    '50', '1', 'Programming','10', 'falsch', 'komplett falsch','Kompliment','eher falsch'],
  ['2','Wie nennt man einen Fehler in einem Computerprogramm?','Bug', 'Hat', 'Pen','Code', 'A',
    '100', '2', 'Security', '11', 'Kompliment','falsch', 'komplett falsch','eher falsch'],
  ['3','Wie nennt man ein Textverarbeitungsprogramm?','Word ist ein Textverarbeitungsprogramm', 
    'Worst ist ein Textverarbeitungsprogramm','Murks ist ein Textverarbeitungsprogramm',
    'Knorz ist ein Textverarbeitungsprogramm', 'A', '200', '3', 'Software', '12', 
    'Kompliment','falsch', 'komplett falsch','eher falsch']
  ];
  
var pos = -1;

function showQuestion() {
  pos+=1;
  $("#qno").text(fragen[pos][0]);
  $("#question_text").text(fragen[pos][1]);
  $("#answer_a").text(fragen[pos][2]);
  $("#answer_b").text(fragen[pos][3]);
  $("#answer_c").text(fragen[pos][4]);
  $("#answer_d").text(fragen[pos][5]);
  $("#value").text(fragen[pos][7]);
  $("levelId").text(fragen[pos][8]);
  $("#subject").text(fragen[pos][9]);
  $("#subjectId").text(fragen[pos][10]);
  $("#feedback_a").text(fragen[pos][11]);
  $("#feedback_b").text(fragen[pos][12]);
  $("#feedback_c").text(fragen[pos][13]);
  $("#feedback_d").text(fragen[pos][14]);

}*/

//Prüfung, ob die gewählte Antwort richtig ist
function isAnswerRight(solution){
  return solution.value == getRightAnswer();
}

//zeigt Text an, je nachdem ob Antwort richtig oder falsch war
function checkAnswer(solution) { 
  if (isAnswerRight(solution)) {
    //alert("your answer is correct: " + solution.value);
    show(document.getElementById('correct_answer'));
    show(document.getElementById('continue'))
    if (currentQuestionNo == getLastQuestion()-1){
      //alert("Wow, du hast es geschafft!!");
      hide(document.getElementById('continue'));
      setTimeout("windowLocation()", 2000);
      //window.location.href="congratulation.html";
    }
 } else {
    show(document.getElementById('false_answer')); 
    //alert("Sorry, your answer is not correct: " + solution.value);
    hide(document.getElementById('continue'));
    show(document.getElementById('newQuiz'))
    //window.location.href="results.html";
 }
 getFeedbackText(solution);
 //$('input:checked').removeAttr('checked');
}

function windowLocation(){
  window.location.href="congratulation.html";
}

//Array im Json-Format zum internen Testen
var questions = [
  {
    "id":"1",
    "level" : {
      "id":"1",
      "value":"50",
      "text":"CHF"
    },
    "subject" : {
      "id":"1",
      "text":"Informatik"
    },
    "question" : "Was macht man mit einer Programmiersprache?",
    "answers" : {
      "A":"Programmieren",
      "B":"Kochen",
      "C":"Wandern",
      "D":"Zeichnen"
    }, 
    "right":"C",
    "feedback" : {
      "A": "Kompliment. Du hast gute Voraussetzungen, ein Programmierer zu werden.",
      "B": "Leider Falsch! Schau das Kapitel zum Kochen nochmals an.",
      "C": "Leider Falsch! Schau das Kapitel zum Wandern nochmals an.",
      "D": "Leider Falsch! Schau das Kapitel zum Zeichnen nochmals an."
    }
  },{
    "id":"2",
    "level" : {
      "id":"2",
      "value":"100",
      "text":"CHF"
    },
    "subject" : {
      "id":"2",
      "text":"Wirtschaft"
    },
    "question" : "Wie nennt man einen Fehler in einem Computerprogramm?",
    "answers" : {
      "A":"Bug",
      "B":"Hat",
      "C":"Pen",
      "D":"Code"
    }, 
    "right":"A",
    "feedback" : {
      "A": "Sehr gut! Bug hiesst übrigens Käfer.",
      "B": "Leider Falsch! Ein Hat setzt man auf den Kopf",
      "C": "Leider Falsch! Ein Pen ist ein Eingabegerät.",
      "D": "Leider falsch! Ein Code enhält Programmbefehle (und du kannst damit einen Bug programmieren)."
    }
  },{
    "id":"3",
    "level" : {
      "id":"3",
      "value":"1000",
      "text":"CHF"
    },
    "subject" : {
      "id":"3",
      "text":"Englisch"
    },
    "question" : "Welches ist keine Browser-Software?",
    "answers" : {
      "A":"Iron",
      "B":"Chrome",
      "C":"Edge",
      "D":"Firefox"
    }, 
    "right":"D",
    "feedback" : {
      "A": "Richtig! Iron is a metal. Chrome is a browser.",
      "B": "Leider falsch! Chrome ist ein Browser",
      "C": "Leider falsch! Edge ist ein Browser",
      "D": "Leider falsch! Firefox ist ein Browser"
    }
  },{
    "id":"4",
    "level" : {
      "id":"4",
      "value":"10 000",
      "text":"CHF"
    },
    "subject" : {
      "id":"4",
      "text":"Englisch"
    },
    "question" : "Wie nennt man ein Textverarbeitungsprogramm?",
    "answers" : {
      "A": "Word ist ein Textverarbeitungsprogramm",
      "B": "OneNote",
      "C": "Murks ist eines der bekanntesten Textverarbeitungsprogramm",
      "D": "Knorz ist ein Textverarbeitungsprogramm"
    },
    "right": "A",
    "feedback":{
      "A": "Stimmt. Word ist in der Office-Palette enthalten",
      "B": "Leider falsch! OneNote ist ein Notizprogramm. Die richtige Antwort ist Word.",
      "C": "Leider falsch. Die richtige Antwort ist Word",
      "D": "Leider falsch. Die richtige Antwort ist Word",
    }
  }];



var currentQuestionNo = -1;

function showQuestion() {
  currentQuestionNo +=1;
  //console.log("Loading Question:" + currentQuestionNo);
  currentQuestion = questions[currentQuestionNo];

  $("#qno").text(currentQuestionNo + 1);
  //$("#id").text(currentQuestion.id);
  $("#levelId").text(currentQuestion.level.id);
  $("#levelValue").text(currentQuestion.level.value);
  //$("#levelText").text(currentQuestion.level.text);
  $("#subjectId").text(currentQuestion.subject.id);
  $("#subjectText").text(currentQuestion.subject.text);
  $("#question_text").text(currentQuestion.question);
  $("#" + id1).text(currentQuestion.answers.A);
  $("#" + id2).text(currentQuestion.answers.B);
  $("#" + id3).text(currentQuestion.answers.C);
  $("#" + id4).text(currentQuestion.answers.D);
  /*$("#answer_a").text(currentQuestion.answers.A);
  $("#answer_b").text(currentQuestion.answers.B);
  $("#answer_c").text(currentQuestion.answers.C);
  $("#answer_d").text(currentQuestion.answers.D);
  $("#feedback_a").text(currentQuestion.feedback.A);
  $("#feedback_b").text(currentQuestion.feedback.B);
  $("#feedback_c").text(currentQuestion.feedback.C);
  $("#feedback_d").text(currentQuestion.feedback.D);*/
}

//Deklaration der Variablen zum Vertauschen der Antworten
var shuffledAnswers = ['A', 'B', 'C', 'D'];
var id1;
var id2;
var id3;
var id4; 

//Antworten auf die 4 verschiedenen Positionen zufällig verteilen
function shuffleAnswers(){
  //console.log("Before Shuffle1: " + shuffledAnswers);
  shuffledAnswers.sort();
  shuffleArray(shuffledAnswers);
  id1 = "answer_" + shuffledAnswers[0].toLowerCase();
  id2 = "answer_" + shuffledAnswers[1].toLowerCase();
  id3 = "answer_" + shuffledAnswers[2].toLowerCase();
  id4 = "answer_" + shuffledAnswers[3].toLowerCase();
}

//Funktion zum zufälligen Sortieren eines Arrays
function shuffleArray(inputArray){
   inputArray.sort(()=> Math.random() - 0.5);
   //console.log("After Shuffle2: " + inputArray);
}

//Funktion um die Feedbacks aufgrund des zufälligen Sortierens korrekt zuzuweisen
function getFeedbackText(solution){
  if (solution.value == shuffledAnswers[0] ){
    $(".feedbacks").text(currentQuestion.feedback.A); //Json aus quiz.js
    $(".feedbacks").text(feedback_a); //ParsedJson
  }
  if (solution.value == shuffledAnswers[1] ){
    $(".feedbacks").text(currentQuestion.feedback.B); //Json aus quiz.js
    $(".feedbacks").text(feedback_b); //ParsedJson
  }
  if (solution.value == shuffledAnswers[2] ){
    $(".feedbacks").text(currentQuestion.feedback.C); //Json aus quiz.js
    $(".feedbacks").text(feedback_c); //ParsedJson
  }
  if (solution.value == shuffledAnswers[3]){
    $(".feedbacks").text(currentQuestion.feedback.D); //Json aus quiz.js
    $(".feedbacks").text(feedback_d); //ParsedJson
    }
  //alert("getFeedbackText"+solution.value);
  show(document.getElementById('feedback'));
}



