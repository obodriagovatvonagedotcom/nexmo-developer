---
title: Overview
---

## Contents

In this document you can learn about:

* [Reports API Overview](#overview)
* [Features](#features)
* [Performance considerations when implementing the Reports API](#performance-considerations)
* [Products supported by Reports API](#products-supported)
* [Tutorial](#tutorial)
* [API Reference](#reference)

# Overview
Reports API allows to download call data records (CDRs). Records can be queried using a variety of parameters such as origin and destination phone numbers, status, time period, etc. (see report filters for more information). It is also possible to include the message body/text and to download reports for any of your subaccounts.

Use case examples:

* Customer billing - download your transactions and use the included price data to determine what to bill your customers
* Invoice reconciliation - compare your usage data with the invoice you have received
* Monitoring & analytics - Add CDR data to your business intelligence or analytics system to correlate it with other events

> The Reports API Beta is available free of charge for all customers until the 1st of March 2020. Once this period is over, charges will be applied if the number of requests exceeds the Free Usage Tier. Please use the following form to request the API pricing: https://info.nexmo.com/ReportsAPI.html

## Features

- Variety of filters - query exactly the data you need
- Compressed CSV - Reports are formatted as CSV and compressed for faster downloads
- Privacy - Report files are automatically deleted after 72 hours
- Full coverage - Reports can fetch up to 13 months of data (maximum retention period for CDRs).
- Callbacks - An HTTP(S) POST callback can be generated to notify when report is completed

## Performance considerations

Be advised, even though the Reports API Beta is quite fast and can deal with enormous amounts of data, it may seem to be slow when trying to download data for realtime analytics. Usage of filters can speed up processing considerably.

## Supported products

* SMS API
* Messages API
* Voice API
* Conversations API
* Verify API
* Number Insight

## API Reference

* [Reports API Reference](/api/reports)

## Tutorial
* [How to generate a report via Postman for non-technical users](link to be added when available)
