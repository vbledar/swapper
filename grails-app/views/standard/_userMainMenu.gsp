<g:if test="${session["loggeduser"]}">
    <g:set var="firstName" value="${session['loggeduser']?.firstName}"/>
    <g:set var="lastName" value="${session['loggeduser']?.lastName}"/>
    <div class="row">
        <div class="col-sm-12 text-right">
            <div class="thumbnail" style="background-color: rgb(49, 59, 75)">
                <sw:userPhoto user="${session["loggeduser"]}" size="s" cssClass="img-responsive img-rounder pull-left"/>
                <div class="caption">
                    <h3 class="">
                        <g:message code="user.menu.welcome.message" args="[firstName, lastName]"/>
                    </h3>
                </div>

                <div class="spacer10"></div>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="btn-group flat-btn-group btn-group-justified">
                            <div class="btn-group">
                                <g:link controller="landing" action="index" class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-home"></span>
                                    <span class="hidden-xs">
                                        <div class="row">
                                            <div class="col-sm-12">
                                        <g:message code="user.menu.home"/></div>
                                        </div>
                                    </span>
                                </g:link>
                            </div>
                            <div class="btn-group">
                                <g:link controller="myProfile" action="profileManagement" class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-user"></span>
                                    <span class="hidden-xs">
                                        <div class="row">
                                            <div class="col-sm-12">
                                        <g:message code="user.menu.profile"/></div>
                                        </div>
                                    </span>
                                </g:link>
                            </div>
                            <div class="btn-group">
                                <g:link controller="wallet" action="walletManagement" class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-credit-card"></span>
                                    <span class="hidden-xs">
                                        <div class="row">
                                            <div class="col-sm-12">
                                        <g:message code="user.menu.wallet"/></div>
                                        </div>
                                    </span>
                                </g:link>
                            </div>
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-envelope ${loggedInUser?.newNotificationsNumber > 0 ? 'blink' : '' }"></span> <g:message code="user.menu.new.messages.number" args="[loggedInUser?.newNotificationsNumber ? loggedInUser?.newNotificationsNumber : 0]"/>
                                    <span class="hidden-xs">
                                        <div class="row">
                                            <div class="col-sm-12">
                                        <g:message code="user.menu.messages"/></div>
                                        </div>
                                    </span>
                                </button>
                            </div>
                            <div class="btn-group">
                                <g:link controller="socialManager" action="userLoggedOut" class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-log-out"></span>
                                    <span class="hidden-xs">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <g:message code="user.menu.logout"/>
                                            </div>
                                        </div>
                                    </span>
                                </g:link>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="btn-group flat-btn-group btn-group-justified">
                            <div class="btn-group">
                                <g:link controller="admin" action="administration" class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-wrench"></span>
                                    <span class="hidden-xs">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <g:message code="user.menu.administration"/></div>
                                        </div>
                                    </span>
                                </g:link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:if>
<g:else>
    <oauth:connect provider="facebook">
        <g:img dir="assets/social" file="signinwithfacebook.png" class="img-responsive" style="margin-left: auto; margin-right: auto;"/>
    </oauth:connect>
</g:else>