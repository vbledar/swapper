<div class="col-xs-12 col-sm-6 col-md-3">
    <div class="thumbnail">
        <img src="${itemPhoto?.url}" alt="...">
        <div class="caption">
            <button id="add-button-${index+1}" type="button" onclick="chooseFile(${index+1});" class="btn btn-primary add-button-photo" style="width: 100%;" >
                <span class="glyphicon glyphicon-camera"></span> Add
            </button>
            <button id="remove-button-${index+1}" placeholder-id="${index+1}" type="button" class="remove-button btn btn-primary" style="width: 100%; display: none">
                <span class="glyphicon glyphicon-remove"></span> Remove
            </button>
        </div>
    </div>
</div>