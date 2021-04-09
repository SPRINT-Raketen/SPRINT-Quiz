
//für JSON-Array
function getRightAnswer(){
  var correctAnswer = shuffledAnswers[0]; //currentQuestion.right;
  return correctAnswer;
}

function getLastQuestion(){
  var lastQuestion = 6; //07.04.21 Markus: Achtung magic number! In späteren Stufen dynamisch mittels zusätzlichem REST-API-request  
  return lastQuestion;
}


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
    if (levelId == getLastQuestion()){
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
    $(".feedbacks").text(feedback_a); //ParsedJson
  }
  if (solution.value == shuffledAnswers[1] ){
    $(".feedbacks").text(feedback_b); //ParsedJson
  }
  if (solution.value == shuffledAnswers[2] ){
     $(".feedbacks").text(feedback_c); //ParsedJson
  }
  if (solution.value == shuffledAnswers[3]){
    $(".feedbacks").text(feedback_d); //ParsedJson
    }
  //alert("getFeedbackText"+solution.value);
  show(document.getElementById('feedback'));
}



