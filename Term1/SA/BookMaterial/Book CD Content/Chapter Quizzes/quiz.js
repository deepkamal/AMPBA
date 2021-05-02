
// ********** Configure Images *******************************

var imgUsrAnswer = 'images/radioon.gif';
var imgCorrectAnswer = 'images/radiocrt.gif';
var imgOtherAnswer = 'images/radiooff.gif';


// ************************************************************

function setHTML(e, html) {
	if(navigator.appName.match(/^Microsoft.*$/)){
		e.outerHTML = html;
	} else {
		var range = e.ownerDocument.createRange();
		range.setStartBefore(e);
		var docFrag = range.createContextualFragment(html);
		e.parentNode.replaceChild(docFrag, e);
	}
}

// *************************************************************

function gradeTest(form)
{
	var numQuestions = 0;
	var numCorrectAnswers = 0;
	var numWrongAnswers = 0;
	
	qz = document.getElementById('quiz');
	questions = qz.getElementsByTagName('OL');
	numQuestions = questions.length;
	
	for(j=0;j<numQuestions;j++){
		var currQuestAnswered = false;	
		
		qblock = questions[j].parentNode;
		if(!qblock) continue;		
		
		paras = questions[j].getElementsByTagName('P');
		if(!paras) return;
	
		for(i=0;i<paras.length;i++){
			inputs = paras[i].getElementsByTagName('INPUT');
			if(inputs.length < 1) continue;
	
			m = inputs[0].name.match(/^answer(\d+)$/i);
			if(!m) continue;
			
			ansOption = inputs[0];	
			currQuestAnswered = (currQuestAnswered || ansOption.checked);
			
			if(ansOption.value == 1 && ansOption.checked){ // This is the Correct answer for Question Qnum
				numCorrectAnswers++;
				qblock.className='correct';
				setHTML(ansOption,'<img src="' + imgCorrectAnswer + '"/>');
			} else if (ansOption.checked) { //incorrect Answer checked.
				numWrongAnswers++;
				qblock.className='wrong';			
				setHTML(ansOption,'<img src="' + imgUsrAnswer + '"/>');
			} else if (ansOption.value==1) { //Correct Answer but was not checked
				setHTML(ansOption,'<img src="' + imgCorrectAnswer + '"/>');
			} else { // neither the correct answer nor the checked.
				setHTML(ansOption,'<img src="' + imgOtherAnswer + '"/>');
			}	
			
		}
		
		if(!currQuestAnswered)
			qblock.className = 'unanswered';
	}

	qzopt = document.getElementById('quizoption');
	if(qzopt) qzopt.innerHTML = '<input type="button" value="Retake Test" onclick="location.reload();"/>';
	
	correctPercentage = Math.round(100 * numCorrectAnswers/numQuestions);
	result = '<div id="quizresult">Score: <b>' + correctPercentage + '%</b> (';
	result += numCorrectAnswers + ' out of ' + numQuestions + ' correct)</div>';
	form.innerHTML = result + form.innerHTML;
	window.scroll(0,0);	
	alert('The Test has been graded.\nYou have Correctly answered ' + correctPercentage + '% of the Questions.');
}

// *************************************************************

