$("#start_btn").click(function() {
    console.log( "Start" );
    alert("I am an alert box!");
    startQuiz();
  });
  
  $("#continue_btn").click(function() {
    console.log( "Continue" );
    showNextQuestion();
  });

function startQuiz() {
    showQuestion();

  }

  function ShowAndHide() {
    var x = document.getElementById('quiz1');
    if (x.style.display == 'none') {
        x.style.display = 'block';
    } else {

    }
}

function show(x) {
  //var x = document.getElementById('correct_answer');
  if (x.style.display == 'none') {
      x.style.display = 'block';
  } else {

  }
}

function hide(x){
  //var x = document.getElementById('correct_answer');
  if (x.style.display == 'block') {
      x.style.display = 'none';
  } else {

  }
}

