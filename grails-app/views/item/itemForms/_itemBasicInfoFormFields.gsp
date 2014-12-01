<blockquote>
    <div class="${hasErrors(bean: item, field: 'name', 'has-error')}">
    <label class="text-muted"><g:message code="form.field.name"/></label>
    <g:textField name="name"
                 class="form-control"
                 value="${item?.name}"
                 required=""
                 placeholder="${message(code: 'form.field.input.placeholder.item.name')}"/>
    </div>
</blockquote>

<blockquote>
    <div class="${hasErrors(bean: item, field: 'category', 'has-error')}">
    <label class="text-muted"><g:message code="form.field.main.category"/></label>
    <g:select id="rootCategory"
              name="rootCategory"
              from="${rootCategories}"
              optionValue="name"
              optionKey="id"
              required=""
              value="${item?.category?.parent?.id}"
              class="many-to-one form-control"
              noSelection="['':message(code: 'form.field.input.choose.category')]"/>
    </div>
</blockquote>

<blockquote>
    <div class="${hasErrors(bean: item, field: 'category', 'has-error')}">
    <label class="text-muted"><g:message code="form.field.sub.category"/></label>
    <span id="categoryContainer">
        <g:select id="category"
                  name="category.id"
                  from="${categories}"
                  optionValue="name"
                  optionKey="id"
                  required=""
                  value="${item?.category?.id}"
                  class="many-to-one form-control"
                  noSelection="['':message(code: 'form.field.input.choose.subcategory')]"/>
</div>
</span>
</blockquote>

<blockquote>
    <div class="${hasErrors(bean: item, field: 'description', 'has-error')}">
    <label class="text-muted"><g:message code="form.field.description"/></label>
    <g:textArea name="description"
                class="form-control"
                cols="60"
                rows="4"
                maxlength="2000"
                required=""
                value="${item?.description}"
                placeholder="${message(code: 'form.field.input.enter.description')}"/>
    </div>
</blockquote>

<blockquote>
    <div class="${hasErrors(bean: item, field: 'designer', 'has-error')}">
    <label class="text-muted"><g:message code="form.field.designer"/></label>
    <g:textArea name="designer"
                class="form-control"
                cols="80"
                rows="3"
                maxlength="2000"
                value="${item?.designer}"
                placeholder="${message(code: 'form.field.input.enter.designer.info')}"/>
    </div>
</blockquote>

<blockquote>
    <div class="${hasErrors(bean: item, field: 'itemConditionType', 'has-error')}">
    <label class="text-muted"><g:message code="form.field.item.condition"/></label>
    <g:select id="itemConditionType"
              name="itemConditionType"
              from="${com.swapper.enums.item.ItemConditionType.values()*.description}"
              keys="${com.swapper.enums.item.ItemConditionType.values()*.name()}"
              required=""
              value="${item?.itemConditionType?.name()}"
              noSelection="['':message(code: 'form.field.input.condition.type')]"
              class="many-to-one form-control" />
    </div>
</blockquote>

<blockquote>
    <div class="${hasErrors(bean: item, field: 'itemExchangeType', 'has-error')}">
    <label class="text-muted"><g:message code="form.field.exchange.type"/></label>
    <g:select id="itemExchangeType"
              name="itemExchangeType"
              from="${com.swapper.enums.item.ItemExchangeType.values()*.description}"
              keys="${com.swapper.enums.item.ItemExchangeType.values()*.name()}"
              required=""
              noSelection="['':message(code: 'form.field.input.exchange.type')]"
              value="${ item?.itemExchangeType?.name() }"
              class="many-to-one form-control"/>
    </div>
</blockquote>

<div id="priceDiv">
    <blockquote>
        <div class="${hasErrors(bean: item, field: 'price', 'has-error')}">
        <label for="price" class="text-muted"><g:message code="form.field.item.price" default="Desired Price ( &euro; )" /></label>
        <div class="input-group input-group-sm col-sm-3">
            <span class="input-group-addon">&euro;</span>
            <g:textField type="number"
                         id="price"
                         name="price"
                         class="form-control pricing text-right intNumeric priceDiv"
                         autocomplete="off"
                         min="0.0"
                         value="${ !item?.price ? '0.0' : item?.price}"
                         required=""/>
        </div>

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
        if("${item?.category}" == "")
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