// $.ready is from jquery
$(document).ready(function() {

	var scatterDiv = document.getElementById('scatter_box');
	var barDiv = document.getElementById('bar_box');
	var pieDiv = document.getElementById('pie_box');

	function resetAllSelections(){
		scatterDiv.className = 'span3 viz_selection_box_off';
		barDiv.className = 'span3 viz_selection_box_off';
		pieDiv.className = 'span3 viz_selection_box_off';
	}

	scatterDiv.onclick = 
	function(){
		resetAllSelections();
		//this.class = 'viz_selection_box_off';
		this.className = 'span3 viz_selection_box_on';
	}

	barDiv.onclick = 
	function(){
		resetAllSelections();
		this.className = 'span3 viz_selection_box_on';
	}

	pieDiv.onclick = 
	function(){
		resetAllSelections();
		this.className = 'span3 viz_selection_box_on';
	}

});