$(function(){

});

function getRightAnswer(){
    return currentQuestion.right;
}

var currentQuestionNo = 0;
var value =0;
var currentQuestion;


let fragen = [['1', 'Was macht man mit einer Programmiersprache?', 'Wandern', 'Kochen', 'Programmieren', 'Zeichnen'],
  ['2', 'Wie nennt man einen Fehler in einem Computerprogramm?','Bug', 'Hat', 'Pen','Code']];
var pos = 0;

function showQuestion() {
  $("#qno").text(fragen[pos][0]);
  $("#question_text").text(fragen[pos][1]);
  $("#answer_a").text(fragen[pos][2]);
  $("#answer_b").text(fragen[pos][3]);
  $("#answer_c").text(fragen[pos][4]);
  $("#answer_d").text(fragen[pos][5]);
  pos+=1;
}

function checkAnswer() {
    alert("your answer is correct " + value);

}