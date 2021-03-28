$(function(){

});

function getRightAnswer(){
    var correctAnswer = fragen[pos][6];
    return correctAnswer;
}

function getLastQuestion(){
  var lastQuestion = fragen.length;
  return lastQuestion;
}


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

}

//Prüfung, ob die gewählte Antwort richtig ist
function isAnswerRight(solution){
  return solution.value == getRightAnswer();
}

//zeigt Text an, je nachdem ob Antwort richtig oder falsch war
function checkAnswer(solution) { 
  if (solution.value == getRightAnswer()) {
    //alert("your answer is correct: " + solution.value);
    show(document.getElementById('correct_answer'));
    show(document.getElementById('continue'))
    if (pos == getLastQuestion()-1){
      alert("Wow, du hast es geschafft!!");
      window.location.href="congratulation.html";
    }
 } else {
    show(document.getElementById('false_answer')); 
    //alert("Sorry, your answer is not correct: " + solution.value);
    hide(document.getElementById('continue'));
    show(document.getElementById('newQuiz'))
    //window.location.href="results.html";
 }
 //$('input:checked').removeAttr('checked');
}
