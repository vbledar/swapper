<li>
    <div class="image-show image-show-exists image-show-${index+1}" photo-url="${photo?.url}" placeholder-id="${index+1}">
        <span>${index+1}</span>
    </div>
    <!-- Upload photo button -->
    <div style="width: 0px; height: 0px; overflow:hidden">
        <input id="photo_input_${index+1}" type="file" name="photoFile" class="btn btn-default file-uploader" placeholder-id="${index+1}">
    </div>
    <button id="add-button-${index+1}" type="button" onclick="chooseFile(${index+1});" class="btn btn-primary add-button-photo" style="width: 150px" >
        <span class="glyphicon glyphicon-camera"></span> <g:message code="button.label.add"/>
    </button>
    <button id="remove-button-${index+1}" placeholder-id="${index+1}" type="button" class="remove-button btn btn-primary" style="width: 150px; display: none">
        <span class="glyphicon glyphicon-remove"></span> <g:message code="button.label.remove"/>
    </button>
</li>