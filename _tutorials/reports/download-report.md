---
title: Download a report
---

# Download a report

Once the report has been generated, you can download the results using the Media API.


```bash
curl -u $API_KEY:$API_SECRET -o ./report.zip https://api.nexmo.com/v3/media/REPORT_ID
```

Replace `FILE_ID` with the value of the `file_id` field in the [report status response](/reports/tutorials/create-and-retrieve-a-report/reports/check-report-status). Alternatively, you can use the complete URL in the `url` field of the status response.

Running the above command will download the report in to the current folder as a file named `report.zip`. Unzip this compressed file to see your report.

