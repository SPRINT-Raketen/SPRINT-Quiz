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


let fragen = [['1', 'Was macht man mit einer Programmiersprache?', 'Wandern', 'Kochen', 'Programmieren', 'Zeichnen', 'C', '50'],
  ['2','Wie nennt man einen Fehler in einem Computerprogramm?','Bug', 'Hat', 'Pen','Code', 'A', '100'],
  ['3','Wie nennt man ein Textverarbeitungsprogramm?','Word ist ein Textverarbeitungsprogramm', 'Worst ist ein Textverarbeitungsprogramm',
     'Murks ist ein Textverarbeitungsprogramm','Knorz ist ein Textverarbeitungsprogramm', 'A', '200']];
var pos = -1;

function showQuestion() {
  pos+=1;
  $("#qno").text(fragen[pos][0]);
  $("#question_text").text(fragen[pos][1]);
  $("#answer_a").text(fragen[pos][2]);
  $("#answer_b").text(fragen[pos][3]);
  $("#answer_c").text(fragen[pos][4]);
  $("#answer_d").text(fragen[pos][5]);
  $("#level").text(fragen[pos][7]);
}

function checkAnswer(radio) { 
  if (radio.value == getRightAnswer()) {
    show(document.getElementById('correct_answer'));
    show(document.getElementById('continue'))
    if (pos == getLastQuestion()-1){
      //alert("Won");
      window.location.href="congratulation.html";
    }
 } else {
   alert("Sorry, your answer is not correct: " + radio.value);
   hide(document.getElementById('continue'));
   window.location.href="results.html";
 }
 $('input:checked').removeAttr('checked');
}
