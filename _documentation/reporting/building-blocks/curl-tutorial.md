---
title: Reports API How-To
description: How to create a new report
navigation_weight: 1
---

# Create report

To [create a report](/api/reports#createReport), you have to specify api_key and product that you're interested in (plus any additional filters). For a full list of available products and filters, see the [reports API reference](/api/reports#createReport).
Reports API works asynchronously, therefore a report gets generated some time after you submitted a request to create a report.

## Request example

Replace the following variables in the example code:

Key |	Description
-- | --
`REPORT_PRODUCT` |	The product you'd like to generate a report for.
`API_KEY` |	The API key (account ID) you'd like to generate a report for.
`API_SECRET` |	The API secret associated with the API key.

```building_blocks
source: '_examples/reporting/create-report'
```

## Response example
```building_blocks
source: '_examples/reporting/create-report-response'
```

# Get report status
Since Reports API works asynchronously, one has to either periodically poll [check report status](/api/reports#checkReportStatus) or upon report creation submit a callback URL to receive a notification once the report has been successfully generated. 
The request described below returns `"SUCCESS"` as a `request_status` once the report is available for download. The response (or the notification) contains a URL that you can use to [download the report](/reporting/building-blocks/download-report)

## Request example

Replace the following variables in the example code:

Key |	Description
-- | --
`REPORT_ID` |	The ID of the report you want to check. Returned in the [create report](/reporting/building-blocks/create-report) response

```building_blocks
source: '_examples/reporting/check-report-status'
```

## Response example
```building_blocks
source: '_examples/reporting/check-report-status-response'
```

# Download report

Once the report has been successfully generated, use the URL ( `url` field) received in the previous step to download the report.

## Request example

Replace the following variables in the example code:

Key |	Description
-- | --
`REPORT_URL` |	The URL of the report to download. Returned in the [check report status](/reporting/building-blocks/check-report-status) response

```building_blocks
source: '_examples/reporting/download-report'
```
