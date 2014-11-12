<g:form name="addNewAddressForm" controller="myProfile" action="addAddress">
    <blockquote>
        <div class="checkbox">
            <label>
                <input id="mainAddress" name="mainAddress" type="checkbox" ${address?.mainAddress ? 'checked': ''}> <g:message code="form.field.main.address"/>
            </label>
        </div>
    </blockquote>

    <blockquote>
        <label class="text-muted"><g:message code="form.field.first.address"/></label>
        <input id="firstAddress" name="firstAddress" type="text" class="form-control" required="true" value="${address?.firstAddress}">
    </blockquote>

    <blockquote>
        <label class="text-muted"><g:message code="form.field.second.address"/></label>
        <input id="secondAddress" name="secondAddress" type="text" class="form-control" value="${address?.secondAddress}">
    </blockquote>

    <blockquote>
        <label class="text-muted"><g:message code="form.field.postal.code"/></label>
        <input id="postalCode" name="postalCode" type="text" class="form-control" required="true" value="${address?.postalCode}">
    </blockquote>

    <blockquote>
        <label class="text-muted"><g:message code="form.field.city"/></label>
        <input id="city" name="city" type="text" class="form-control" required="true" value="${address?.city}">
    </blockquote>

    <blockquote>
        <label class="text-muted"><g:message code="form.field.country"/></label>
        <input id="county" name="country" type="text" class="form-control" required="true" value="${address?.country}">
    </blockquote>

    <blockquote>
        <label class="text-muted"><g:message code="form.field.further.information"/></label>
        <g:textArea id="furtherInformation" name="furtherInformation" cols="80" rows="5" class="form-control" value="${address?.furtherInformation}"/>
    </blockquote>
</g:form>