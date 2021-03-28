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

function deselectAnswer(id) {
  if (isAnswerRight(id) == true){
    $(id).addClass("btn-success");
    $(id).removeClass("btn-primary");
  } else {
    $(id).addClass("btn-danger");
    $(id).removeClass("btn-primary");
  }
  $(id).addClass("disabled");
  $('#answers_a').addClass("disabled");
  $('#answers_b').addClass("disabled");
  $('#answers_c').addClass("disabled");
  $('#answers_d').addClass("disabled");
  //alert("deselect");
}

function selectAnswer(id) {
  $(id).removeClass("btn-success");
  $(id).addClass("btn-primary");
  $(id).removeClass("disabled");
  //$("#button1").addClass("active");
  //alert("select"+id);
}

