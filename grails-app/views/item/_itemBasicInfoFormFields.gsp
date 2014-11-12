<blockquote>
    <label class="text-muted"><g:message code="form.field.name"/></label>
    <g:textField name="name"
                 class="form-control ${hasErrors(bean: itemInstance, field: 'name', 'alert alert-danger')}"
                 value="${itemInstance?.name}"
                 required=""
                 placeholder="${message(code: 'form.field.input.placeholder.item.name')}"/>
</blockquote>

<blockquote>
    <label class="text-muted"><g:message code="form.field.main.category"/></label>
    <g:select id="rootCategory"
              name="rootCategory"
              from="${rootCategories}"
              optionValue="name"
              optionKey="id"
              required=""
              value="${itemInstance?.category?.parent?.id}"
              class="many-to-one form-control ${hasErrors(bean: itemInstance, field: 'category', 'alert alert-danger')}"
              noSelection="['':message(code: 'form.field.input.choose.category')]"/>
</blockquote>

<blockquote>
    <label class="text-muted"><g:message code="form.field.sub.category"/></label>
    <span id="categoryContainer">
        <g:select id="category"
                  name="category.id"
                  from="${categories}"
                  optionValue="name"
                  optionKey="id"
                  required=""
                  value="${itemInstance?.category?.id}"
                  class="many-to-one form-control ${hasErrors(bean: itemInstance, field: 'category', 'alert alert-danger')}"
                  noSelection="['':message(code: 'form.field.input.choose.subcategory')]"/>
    </span>
</blockquote>

<blockquote>
    <label class="text-muted"><g:message code="form.field.description"/></label>
    <g:textArea name="description"
                class="form-control ${hasErrors(bean: itemInstance, field: 'description', 'alert alert-danger')}"
                cols="60"
                rows="4"
                maxlength="2000"
                required=""
                value="${itemInstance?.description}"
                placeholder="${message(code: 'form.field.input.enter.description')}"/>
</blockquote>

<blockquote>
    <label class="text-muted"><g:message code="form.field.designer"/></label>
    <g:textArea name="designer"
                class="form-control ${hasErrors(bean: itemInstance, field: 'designer', 'alert alert-danger')}"
                cols="80"
                rows="3"
                maxlength="2000"
                value="${itemInstance?.designer}"
                placeholder="${message(code: 'form.field.input.enter.designer.info')}"/>
</blockquote>

<blockquote>
    <label class="text-muted"><g:message code="form.field.item.condition"/></label>
    <g:select id="itemConditionType"
              name="itemConditionType"
              from="${com.swapper.enums.item.ItemConditionType.values()*.description}"
              keys="${com.swapper.enums.item.ItemConditionType.values()*.name()}"
              required=""
              value="${itemInstance?.itemConditionType?.name()}"
              noSelection="['':message(code: 'form.field.input.condition.type')]"
              class="many-to-one form-control ${hasErrors(bean: itemInstance, field: 'itemConditionType', 'alert alert-danger')}" />
</blockquote>

<blockquote>
    <label class="text-muted"><g:message code="form.field.exchange.type"/></label>
    <g:select id="itemExchangeType"
              name="itemExchangeType"
              from="${com.swapper.enums.item.ItemExchangeType.values()*.description}"
              keys="${com.swapper.enums.item.ItemExchangeType.values()*.name()}"
              required=""
              noSelection="['':message(code: 'form.field.input.exchange.type')]"
              value="${ itemInstance?.itemExchangeType?.name() }"
              class="many-to-one form-control ${hasErrors(bean: itemInstance, field: 'itemExchangeType', 'alert alert-danger')}"/>
</blockquote>

<div id="priceDiv">
    <blockquote>
        <label for="price" class="text-muted"><g:message code="form.field.item.price" default="Desired Price ( &euro; )" /></label>
        <div class="input-group input-group-sm col-sm-3">
            <span class="input-group-addon">&euro;</span>
            <g:textField type="number"
                         id="price"
                         name="price"
                         class="form-control pricing text-right intNumeric priceDiv ${hasErrors(bean: itemInstance, field: 'price', 'alert alert-danger')}"
                         autocomplete="off"
                         min="0.0"
                         value="${ !itemInstance?.price ? '0.0' : itemInstance?.price}"
                         required=""/>
        </div>
    </blockquote>
</div>

<g:if test="${ !hasPaymentMethod }">
    <div class="spacer5"></div>
    <div class="row center-block">
        <div class="col-sm-12 alert alert-warning">
            <g:message code="user.message.no.paypal.account"/>
        </div>
    </div>
</g:if>


<g:javascript>

    $(function() {
        if("${itemInstance?.category}" == "")
            $("#category").attr("disabled","disabled")
        else {
           $('option[value=""]',"#category").remove()
           $('option[value=""]',"#rootCategory").remove()
        }

        if ("${hasPaymentMethod}" == 'false') {
			$("#itemExchangeType option[value='SWAPORSELL']").remove();
			$("#itemExchangeType option[value='SELL']").remove();
		}

        $("#rootCategory").change(function(){
            $.get('${createLink(controller: 'category', action: 'subcategories')}',
                    {id:$(":selected",this).attr("value")},
                    function(response){
                        $("span#categoryContainer").html(response)
                    }) ;

            $("#category").removeAttr("disabled")
            $('option[value=""]',this).remove()
        });

        var selectedExchangeType = $(":selected", $("#itemExchangeType")).attr("value")
        if ("${com.swapper.enums.item.ItemExchangeType.SELL}" == selectedExchangeType || "${com.swapper.enums.item.ItemExchangeType.SWAPORSELL}" == selectedExchangeType) {
            $("#priceDiv").removeClass("hidden");
            $("input","#priceDiv").attr("required","")
        } else {
            $("#priceDiv").fadeToggle(0);
        }

        $("#itemExchangeType").change(function(){

            $('option[value=""]',"#itemExchangeType").remove()

            if("${com.swapper.enums.item.ItemExchangeType.SELL}" == $(":selected",this).attr("value")
                || "${com.swapper.enums.item.ItemExchangeType.SWAPORSELL}" == $(":selected",this).attr("value")){
                $("#priceDiv").fadeIn(300);
                $("input","#priceDiv").attr("required","")
            }
            else{
                $("input","#priceDiv").removeAttr("required")
                $("#priceDiv").fadeOut(300);
            }
        });
    });

</g:javascript>