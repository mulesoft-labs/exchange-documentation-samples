<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>MUnit Coverage Report</title>
    <link rel="stylesheet" type="text/css" href="${rootFolder}/assets/styles/mulesoft-styles.css">
    <link rel="stylesheet" type="text/css" href="${rootFolder}/assets/styles/tsorter.css">
</head>
<body>
<div class="mulesoft-topbar">
    <div class="mulesoft-appbar">
        <div class="muleicon muleicon-logo"></div>
        <div class="anypoint-brand">MUnit Coverage Report - ${resourceName}</div>
    </div>
</div>

<div class="col-md-2 col-md-offset-1 sidemenu">
    <ul class="sidemenu-back">
        <li><a href="${rootFolder}/summary.html">Resources</a></li>
    </ul>
</div>

<div class="col-md-8">
<#if resourceCoverage lt 0>
    <h2 class="text-bold">Resource Coverage - #Processors 0</h2>
    <div class="progress">
        <span>N/A</span>
        <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow=-1
             aria-valuemin="0"
             aria-valuemax="100" style="width: 100%;">
        </div>
    </div>
<#else>
    <h2 class="text-bold">Resource Coverage - #Processors ${resourceMpCovered} / ${resourceMpCount}</h2>
    <div class="progress">
        <span>${resourceCoverage?string["0.##"]}%</span>
        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${resourceCoverage}" aria-valuemin="0"
             aria-valuemax="100" style="width: ${resourceCoverage}%;">
        </div>
    </div>
</#if>
    <ul class="list-unstyled">
        <li><h4><b>Required Resource Coverage :</b>
        <#if coverageLimits.requiredResourceCoverage gte 0>
        ${coverageLimits.requiredResourceCoverage}%
        <#else>
            N/A
        </#if>
        </h4></li>
        <li><h4><b>Required Container Coverage :</b>
        <#if coverageLimits.requiredFlowCoverage gte 0>
        ${coverageLimits.requiredFlowCoverage}%
        <#else>
            N/A
        </#if>
        </h4></li>
    </ul>
    <h2 class="text-bold">Containers</h2>
    <table id="resources_table" class="table table-featured table-hover sortable">
        <thead>
        <tr>
            <th colspan="2">Name</th>
            <th>Type</th>
            <th data-tsorter="numeric">#Covered Processors</th>
            <th data-tsorter="numeric">#Processors</th>
            <th data-tsorter="coverage">Coverage*</th>
        </tr>
        </thead>
        <tbody id="table-body">
        <#list flowLines as flow>
        <tr>
            <td colspan="2">${flow.name}</td>
            <td>${flow.getPrintableType()}</td>
            <td>${flow.coveredLocations?size}</td>
            <td>${flow.locations?size}</td>
            <td>
                <div class="progress">
                    <span>${flow.coverage?string["0.##"]}%</span>
                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${flow.coverage}"
                         aria-valuemin="0" aria-valuemax="100" style="width: ${flow.coverage}%;">
                    </div>
                </div>
            </td>
        </tr>
        </#list>

        <table>
            <tbody>
            <#list xmlLines as xmlLine>
                <#if coveredLines?seq_contains(xmlLine?index + 1)>
                    <tr class="covered">
                <#elseif coveredLines?seq_contains(xmlLine?index + 1) && linesInFlow?seq_contains(xmlLine?index + 1)>
                    <tr class="not-full-covered">
                <#elseif linesInFlow?seq_contains(xmlLine?index + 1)>
                    <tr class="uncovered">
                <#else>
                    <tr class="no-flow-line">
                </#if>

                    <td class="code-line">
                        ${xmlLine?index + 1}
                    </td>
                    <#if xmlLine?contains("\t")>
                    <td style="text-indent:${xmlLine?matches("\t")?size * 10}px">
                    <#else>
                    <td>
                    </#if>

                        <#escape x as x?html>
                            ${xmlLine}
                        </#escape>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>

        </tbody>
    </table>
    <h4>(*) Number of processors executed during test</h4>
</div>
<script type="text/javascript" src="${rootFolder}/assets/js/tsorter.min.js"></script>
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
