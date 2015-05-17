// borrowed (and modified) from https://github.com/sul-dlss/revs/blob/master/app/assets/javascripts/annotate.js

anno.addHandler('onAnnotationCreated', function(annotation) {
	  annotation.context=annotation.context.split("?")[0]; // if the item page has querystring parameters, this causes the JSON.parse to fail on the server, so just strip them off here
    // FIXME:  this might fail on firefox
    image_id = window.location.pathname.match(/\/images\/([0-9]+)/)[1]
	  jQuery.ajax({
		    type: "POST",
		    url: "/images/"+image_id+"/annotations.json",
        contentType: "application/json; charset=utf-8",
		    dataType: "JSON",
		    data: JSON.stringify({annotation: annotation}),
		    success: function(data) {
	          annotation.id=data.id; // the annotation ID should match the database row ID so we can delete it if needed
			      // updateAnnotationsPanel(data.num_annotations);
            addAnnotationToTable(annotation);
			      annotation.updated_at=data.updated_at;
	  }
		});
});

anno.addHandler('onAnnotationUpdated', function(annotation) {
 	  annotation.context=annotation.context.split("?")[0]; // if the item page has querystring parameters, this causes the JSON.parse to fail on the server, so just strip them off here
    // nb:  annotations are a shallow resource
	jQuery.ajax({
	    type: "PUT",
		  dataType: "JSON",
	    url: "/annotations/" + annotation.id,
	    data: JSON.stringify({annotation: annotation}), 
		success: function(data) {
			  // updateAnnotationsPanel(data.num_annotations);
	  }	
	});
});

// this gets called when the user clicks the delete icon
anno.addHandler('beforeAnnotationRemoved', function(annotation) {
	var r=confirm("Are you sure you want to delete this annotation?");
	if (r==false) {	return false;}
});

// this is what gets called when the annotation is actually deleted (assuming the user clicks OK to the confirmation dialog)
anno.addHandler('onAnnotationRemoved', function(annotation) {
	jQuery.ajax({
	  type: "DELETE",
		dataType: "JSON",
	  url: "/annotations/" + annotation.id,
		  success: function(data) {
          // let's delete the appropriate row
          deleteAnnotationFromTable(annotation);
          
		      //	updateAnnotationsPanel(data.num_annotations);
	    }	
	});
});

// this plug allows us to add the username and date to each annotation and display it
// annotorious.plugin.addUsernamePlugin = function(opt_config_options) { }
// annotorious.plugin.addUsernamePlugin.prototype.onInitAnnotator = function(annotator) {
//   // A Field can be an HTML string or a function(annotation) that returns a string
// 	  annotator.popup.addField(function(annotation) { 
// 		 	if (annotation.username != '') {
// 	    	return '<em>from ' + annotation.username + ' - '+ annotation.updated_at +'</em>'
// 		  }
// 		else
// 		 {
// 			 return ''
// 			}
// 	  });
// }
// anno.addPlugin('addUsernamePlugin', {});	

//function updateAnnotationsPanel(num_annotations) {
//	  $(".num-annotations-badge").text(num_annotations); // update the total annotations badge
//	  $(".num-annotations-badge").removeClass('hidden');
//	  $("#all-annotations").load("/annotations/for_image/");// re-render the annotations panel
//	  $('#all-annotations').removeClass('hidden-offscreen hidden'); // be sure it is visible
//}

function addAnnotationToTable(annotation) {
    var table = document.getElementById("annotations-list-body");
    var row = table.insertRow();
    row.id = annotation.id
    
    // add the elements from annotation
    var text = document.createTextNode(annotation.text)
    row.insertCell().appendChild(text)

    text = document.createTextNode(annotation.shapes[0].geometry.x)
    row.insertCell().appendChild(text)

    text = document.createTextNode(annotation.shapes[0].geometry.y)
    row.insertCell().appendChild(text)

    text = document.createTextNode(annotation.shapes[0].geometry.width)
    row.insertCell().appendChild(text)

    text = document.createTextNode(annotation.shapes[0].geometry.height)
    row.insertCell().appendChild(text)
}

function deleteAnnotationFromTable(annotation) {
    var table = document.getElementById("annotations-list-body");
    var row = document.getElementById(annotation.id);
    table.deleteRow(row.rowIndex - 1);
}

function showAnnotations() {	
    //	togglePURLEmbed();
    //toggleThumbImage();
	  loadAnnotations();
	  // enableAnnotations();
}

function hideAnnotations() {
	togglePURLEmbed();
	toggleThumbImage();
}
	 
function enableAnnotations() {
	anno.makeAnnotatable(jQuery('#annotatable_image')[0]);	
}

function loadAnnotations() {
    var id = window.location.pathname.match(/\/images\/([0-9]+)/)[1]
    
	  jQuery.getJSON("/images/"+id+"/annotations.json",function(data) {
        var annotations = data.annotations
		    for (var i = 0; i < annotations.length; i++) {
            console.log(annotations[i])
            anno.addAnnotation(annotations[i]);
			  }
	  });
}

function togglePURLEmbed() {
	jQuery('#image_workspace').toggleClass('hidden');	
}

function toggleThumbImage() {
	jQuery('#annotatable_workspace').toggleClass('hidden');	
}

function disableNewAnnotations() {
	try{anno.setSelectionEnabled(false);}	
	catch(err) {}
}

function toggleLinks() {
  $('.annotation_links').toggleClass('hidden-offscreen');
  $('#hide_annotations_link').toggleClass('hidden-offscreen');
}

function toggleAnnotationList(){
  $('#all-annotations').slideToggle('slow');
}

$(document).ready(function(){

    
	$('#annotate_link').click(function() { 
		showAnnotations(); 
//    toggleLinks();
//    toggleAnnotationList();
		return false;
	 });
	
	$('#view_annotations_link').click(function() {
		 showAnnotations(); 
	//	 disableNewAnnotations(); 
  //   toggleLinks();
  //   toggleAnnotationList();
		 return false;
	 });

	//$('#hide_annotations_link').click(function() {
	//	 hideAnnotations(); 
	//	 toggleLinks();
	//	 toggleAnnotationList();
	//	 return false;
	// });
	
});
