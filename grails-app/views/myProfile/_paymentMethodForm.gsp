<g:form name="addNewPaymentMethodForm" controller="myProfile" action="addPaymentMethod">
    <blockquote>
        <div class="checkbox">
            <label>
                <input id="mainPaymentMethod" name="mainPaymentMethod" type="checkbox" ${paymentMethod?.mainPaymentMethod ? 'checked': ''}> <g:message code="form.field.main.payment.method"/>
            </label>
        </div>
    </blockquote>

    <blockquote>
        <label class="text-muted"><g:message code="form.field.payment.type"/></label>
        <g:select
                id="paymentType"
                name="paymentType"
                class="form-control"
                from="${com.swapper.enums.payment.PaymentType?.values()*.description}"
                keys="${com.swapper.enums.payment.PaymentType?.values()*.name()}"
                value="${ paymentMethod && paymentMethods.paymentType ? paymentMethod?.paymentType?.name() : com.swapper.enums.payment.PaymentType.PAYPAL }"/>
    </blockquote>

    <blockquote>
        <label class="text-muted"><g:message code="form.field.currency.type"/></label>
        <g:select
                id="currencyType"
                name="currencyType"
                class="form-control"
                from="${com.swapper.enums.payment.CurrencyType?.values()*.description}"
                keys="${com.swapper.enums.payment.CurrencyType?.values()*.name()}"
                value="${ paymentMethod && paymentMethods.currencyType ? paymentMethod?.currencyType?.name() : com.swapper.enums.payment.CurrencyType.EUR }"/>
    </blockquote>

    <blockquote>
        <label class="text-muted"><g:message code="form.field.account"/></label>
        <input id="account" name="account" type="text" class="form-control" required="true" value="${paymentMethod?.account}">
    </blockquote>

</g:form>