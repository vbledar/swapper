<div class="row">
    <div class="col-sm-12">
        <h3>
            <g:message code="profile.management.basic.information"/>
        </h3>
    </div>
</div>
<g:form controller="myProfile" action="updateProfile">
    <blockquote>
        <label class="text-muted"><g:message code="form.field.first.name"/></label>
        <strong>
            ${person?.firstName}
        </strong>
    </blockquote>
    <blockquote>
        <label class="text-muted"><g:message code="form.field.last.name"/></label>
        <strong>
            ${person?.lastName}
        </strong>
    </blockquote>
    <blockquote>
        <label class="text-muted"><g:message code="form.field.email"/></label>
        <input id="email" name="email" type="email" class="form-control" placeholder="Enter your email" value="${person?.email}">
    </blockquote>
    <blockquote>
        <div class="checkbox">
            <label>
                <input name="receiveNotifications" type="checkbox" ${person.receiveNotifications ? 'checked': ''}> <g:message code="profile.management.receive.email.notifications"/>
            </label>
        </div>
    </blockquote>
    <blockquote>
        <label class="text-muted"><g:message code="form.field.user.gender"/></label>
        <g:select name="genderType"
                  from="${com.swapper.enums.person.GenderType.values()*.getDescription()}"
                  keys="${com.swapper.enums.person.GenderType.values()*.name()}"
                  value="${person?.genderType?.name()}"
                  class="form-control"/>
    </blockquote>
    <blockquote>
        <label class="text-muted"><g:message code="form.field.locale"/></label>
        <g:select name="localeType"
                  from="${com.swapper.enums.person.LocaleType.values()*.getDescription()}"
                  keys="${com.swapper.enums.person.LocaleType.values()*.name()}"
                  value="${person?.localeType?.name()}"
                  class="form-control"/>
    </blockquote>
    <div class="row">
        <div class="col-sm-12">
            <button class="btn btn-primary pull-right">
                <g:message code="button.label.update"/>
            </button>
        </div>
    </div>
</g:form>