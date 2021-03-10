$(function(){

});

function getRightAnswer(){
    var correctAnswer = fragen[pos][6];
    return correctAnswer;
}

/*var currentQuestionNo = 0;
var value =0;
var currentQuestion;*/


let fragen = [['1', 'Was macht man mit einer Programmiersprache?', 'Wandern', 'Kochen', 'Programmieren', 'Zeichnen', 'C'],
  ['2','Wie nennt man einen Fehler in einem Computerprogramm?','Bug', 'Hat', 'Pen','Code', 'A'],
  ['3','Wie nennt man ein Textverarbeitungsprogramm?','Word', 'Works', 'Murks','Knorz', 'A']];
var pos = -1;

function showQuestion() {
  pos+=1;
  $("#qno").text(fragen[pos][0]);
  $("#question_text").text(fragen[pos][1]);
  $("#answer_a").text(fragen[pos][2]);
  $("#answer_b").text(fragen[pos][3]);
  $("#answer_c").text(fragen[pos][4]);
  $("#answer_d").text(fragen[pos][5]);
}

function checkAnswer(radio) { 
  if (radio.value == getRightAnswer()) {
   alert("Gratulation, your answer is correct " + radio.value);
   showQuestion();  
 } else {
   alert("Sorry, your answer is not correct: " + radio.value);
 }
 $('input:checked').removeAttr('checked');
}
