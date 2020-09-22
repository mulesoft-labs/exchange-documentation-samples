<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>MUnit Coverage Report</title>
    <link rel="stylesheet" type="text/css" href="assets/styles/mulesoft-styles.css">
    <link rel="stylesheet" type="text/css" href="assets/styles/tsorter.css">
</head>
<body>
<div class="mulesoft-topbar">
    <div class="mulesoft-appbar">
        <div class="muleicon muleicon-logo"></div>
        <div class="anypoint-brand">MUnit Coverage Report - Mule Configuration Files</div>
    </div>
</div>
<div class="col-md-8 col-md-offset-2">
    <h2 class="text-bold">Application Coverage*</h2>
<#if applicationFlowCount gt 0>
    <div class="progress">
        <span>${applicationCoverage?string["0.##"]}%</span>
        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${applicationCoverage}" aria-valuemin="0"
             aria-valuemax="100" style="width: ${applicationCoverage}%;">
        </div>
    </div>
<#else>
    <div class="progress">
        <span>N/A</span>
        <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow=100
             aria-valuemin="0"
             aria-valuemax="100" style="width: 100%;">
        </div>
    </div>
</#if>
    <ul class="list-unstyled">
        <li>
            <h4><b>Required Application Coverage :</b>
            <#if coverageLimits.requiredApplicationCoverage gte 0>
            ${coverageLimits.requiredApplicationCoverage}%
            <#else>
                N/A
            </#if>
            </h4>
        </li>
    </ul>
    <h2 class="text-bold">Mule Configuration Files</h2>
    <table id="resources_table" class="table table-featured table-hover sortable">
        <thead>
        <tr>
            <th colspan="2" data-tsorter="link">Resource</th>
            <th data-tsorter="numeric">#Containers</th>
            <th data-tsorter="numeric">Weight%**</th>
            <th data-tsorter="coverage">Coverage*</th>
        </tr>
        </thead>
        <tbody id="table-body">
        <#list applicationResourceLines as resource>
        <tr>
            <td colspan="2"><a href=${resource.getName()?remove_ending(".xml") + "-report.html"}>${resource.name}</a></td>
            <td>${resource.flows?size}</td>
            <td>${resource.getWeightFormatted()}</td>
            <td>
                <#if resource.coverage gte 0>
                    <div class="progress">
                        <span>${resource.coverage?string["0.##"]}%</span>
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${resource.coverage}"
                             aria-valuemin="0" aria-valuemax="100" style="width: ${resource.coverage}%;">
                        </div>
                    </div>
                <#else>
                    <div class="progress">
                        <span>N/A</span>
                        <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow=-1
                             aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                        </div>
                    </div>
                </#if>
            </td>
        </tr>
        </#list>
        </tbody>
    </table>
    <h4>(*) Number of processors executed during test</h4>
    <h4>(**) Number of processors inside the resource over the total number of processors in the application</h4>
</div>
<script type="text/javascript" src="assets/js/tsorter.min.js"></script>
<script type="text/javascript">
    function init() {
        var sorter = tsorter.create('resources_table', 0, {
            coverage: function (row) {
                var cov = this.getCell(row).childNodes[1].childNodes[3].attributes['aria-valuenow'].textContent;
                return parseFloat(cov.substring(cov[0].length - 1), 10);
            }
        });
    }

    window.onload = init;

</script>
</body>
</html>
