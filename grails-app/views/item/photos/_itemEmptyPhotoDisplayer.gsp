<li>
    <div class="image-show image-show-${index}">
        <span>${index}</span>
    </div>
    <!-- Upload photo button -->
    <div style="width: 0px; height: 0px; overflow:hidden">
        <input id="photo_input_${index}" type="file" name="photoFile" class="btn btn-default file-uploader" placeholder-id="${index}">
    </div>
    <button id="add-button-${index}" type="button" onclick="chooseFile(${index});" class="btn btn-primary add-button-photo" style="width: 150px" >
        <span class="glyphicon glyphicon-camera"></span> <g:message code="button.label.add"/>
    </button>
    <button id="remove-button-${index}" placeholder-id="${index}" type="button" class="remove-button btn btn-primary" style="width: 150px; display: none">
        <span class="glyphicon glyphicon-remove"></span> <g:message code="button.label.remove"/>
    </button>
</li>


<g:javascript>
	$(function() {
		//upload photo file
        $('input[type="file"]').ajaxfileupload({
            'action': '${createLink(controller: 'swapShop', action: 'uploadPhoto')}',
            'params': {
                'id' :   "${item?.id}"
            },
            'onComplete': function(response) {
                $(this).next('img.spinner-img').remove();

                $('.add-button-photo').removeAttr('disabled');
            	$('.remove-button').removeAttr('disabled');
                $('#nextStep').removeAttr('disabled');
				$('#previousStep').removeAttr('disabled');

				var placeHolderId = $(this).attr('placeholder-id');
				$('.image-show-' + placeHolderId).removeClass('image-show-with-spinner');

                if(response.target.error != null){
                    infoNotify(response.target.error);
                }
                else{
                    fillAreaWithPhoto(response.target, $(this));
                    hideAddShowRemove($(this));
                    addNewPhotoToBeSaved(response.target, $(this));
                    $('iframe#ajaxUploader-iframe').remove();
                    console.log('Uploading url... finished');
                }
            },
            'onStart': function() {

            	$('.add-button-photo').attr('disabled', 'disabled')
            	$('.remove-button').attr('disabled', 'disabled')
				$('#nextStep').attr('disabled', 'disabled')
				$('#previousStep').attr('disabled', 'disabled')

            	console.log('Started uploading url...');
				console.log($(this).attr('placeholder-id'));

				var placeHolderId = $(this).attr('placeholder-id');
				$('.image-show-' + placeHolderId).addClass('image-show-with-spinner');
            },
            'onCancel': function() {
            	$('.add-button-photo').removeAttr('disabled');
            	$('.remove-button').removeAttr('disabled');
            	$('#nextStep').removeAttr('disabled');
				$('#previousStep').removeAttr('disabled');

				var placeHolderId = $(this).attr('placeholder-id');
				$('.image-show-' + placeHolderId).removeClass('image-show-with-spinner');
            }
        });

		$('.remove-button').off('click').on('click', function() {
			var contextPath = "${request.contextPath}";
			clearPhoto($(this), contextPath);
            hideRemoveShowAdd($(this));
            removePhotoToBeSaved($(this));
		});

		$('.image-show-exists').each(function() {
			var photoUrl = $(this).attr('photo-url');
			var photoIndex = $(this).attr('placeholder-id');
			updateWithActualPhotoUrl(photoUrl, photoIndex);
			hideAddShowRemove($(this));
		});
	});

	function clearPhoto($self, contextPath){
		var placeholderId = $self.attr('placeholder-id');
		$('.image-show-' + placeholderId).css("background-image", "url('" + contextPath + "/images/camera.png')");
    }

	function addPhotoUrl(self, urlLink){
        if(urlLink == ''){
            errorNotify("${message(code:'link.empty.insert.valid.link')}");
            return false;
        }

        var dot = urlLink.lastIndexOf('.');
        if(dot == -1){
            errorNotify("${message(code:'image.type.is.not.valid')}");
            return false;
        }

        var extension = urlLink.substring(dot + 1).toLowerCase();
        if(!(extension == 'jpg' || extension == 'jpeg' || extension == 'png' || extension == 'gif')){
            errorNotify("${message(code:'image.type.is.not.valid')}");
            return false;
        }

        self.after($('#spinner').html());
        $.post(
              '${createLink(controller: 'swapShop', action: 'uploadPhotoFromUrl')}',
              {photoUrlLink: urlLink},
              function(response){
                    fillAreaWithPhoto(response, self);
                    hideAddShowRemove(self);
                    addNewPhotoToBeSaved(response, self);
                    self.next('img.spinner-img').remove();
              }
        );
        return false;
    }

	function fillAreaWithPhoto(target, $self){
        var placeholderId = $self.attr('placeholder-id');
        var photoUrl = target.photoUrl;
        var name = photoUrl.substring(0, photoUrl.lastIndexOf("."));
        var extension = photoUrl.substring(photoUrl.lastIndexOf("."), photoUrl.length);
        var finalPhotoUrl = name + '_q' + extension;
        $('.image-show-' + placeholderId).css("background-image", "url(" + finalPhotoUrl + ")");
        console.log("retrieving empty photo item")
        var url = '<g:createLink controller="swapShop" action="renderEmptyPhotoItemList"/>' + "/" + placeholderId;

        $("<li>").load(url, function() {
$(".image-list-pop").append($(this).html());
});
}

function hideRemoveShowAdd($self){
var placeholderId = $self.attr('placeholder-id');
$("#remove-button-" + placeholderId).hide();
$("#add-button-" + placeholderId).show();
}

function hideAddShowRemove($self){
var placeholderId = $self.attr('placeholder-id');
$("#add-button-" + placeholderId).hide();
$("#remove-button-" + placeholderId).show();
}

function addNewPhotoToBeSaved(target, $self){
var placeholderId = $self.attr('placeholder-id');

var $newDiv = $('<div>').attr({
'data-id': placeholderId
}).attr({
'id': 'existing-photo-id-'+ placeholderId
});

$('<input>').attr({
type: 'hidden',
name: 'photoID',
value: target.photoID
}).appendTo($newDiv);

$('<input>').attr({
type: 'hidden',
name: 'photoUrl',
value: target.photoUrl
}).appendTo($newDiv);

$newDiv.appendTo('#existing_photos_container');
}

function removePhotoToBeSaved($self){
var placeholderId = $self.attr('placeholder-id');
$('div#existing_photos_container form').children('div[data-id="' + placeholderId + '"]').remove();
$('#existing-photo-id-'+placeholderId).remove();
console.log('Removing image.')
console.log(placeholderId);
console.log($('div#existing_photos_container form').children('div[data-id="' + placeholderId + '"]'));
}

function updateWithActualPhotoUrl(photoUrl, placeholderId) {
var name = photoUrl.substring(0, photoUrl.lastIndexOf("."));
var extension = photoUrl.substring(photoUrl.lastIndexOf("."), photoUrl.length);
var finalPhotoUrl = name + '_q' + extension;
$('.image-show-' + placeholderId).css("background-image", "url(" + finalPhotoUrl + ")");
}

function chooseFile(photoIndex) {
$("#photo_input_"+photoIndex).click();
}
</g:javascript>