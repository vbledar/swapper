<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 11/19/14
  Time: 14:18
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>
        <g:message code="page.title.administration.main" default="Administration"/>
    </title>
</head>

<body>

<content tag="title">
    <g:message code="page.title.administration.main" default="Administration"/>
</content>

<content tag="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-2">

                <g:img dir="images" file="logo-sb.png" class="img-thumbnail"/>

            </div>

            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-12">
                        <h4>
                            Application Build Information
                        </h4>
                    </div>
                </div>
                <div class="copyright">
                    <div class="row">
                        <div class="col-sm-12">
                            <h5>Application Version: <span class="text-muted">${grailsApplication.metadata['app.version']}</span></h5>
                        </div>
                        <div class="col-sm-12">
                            <h5>Build Number: <span class="text-muted">#${grailsApplication.metadata['app.buildNumber']}</span></h5>
                        </div>
                        <div class="col-sm-12">
                            <h5>Build Date: <span class="text-muted">${grailsApplication.metadata['app.buildDate']}</span></h5>
                        </div>
                        <div class="col-sm-12">
                            <h5>Build For: <span class="text-muted">${grailsApplication.metadata['app.buildProfile']}</span></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</content>
</body>
</html>