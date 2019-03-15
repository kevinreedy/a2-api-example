a2-api-example
==============

[Chef Automate 2](https://automate.chef.io/) has an API that the UI uses to access all of its data. While the [OpenAPI](https://swagger.io/docs/specification/about/) docs are exposed at https://automate.example.com/api/v0/openapi/ui/, there isn't a great getting started guide. I learn best by example, so this repository contains a quick script showing how to get data out of the Automate API using Ruby.

## Configuration

You'll need an API key. You can get this from the Automate UI or by running `chef-automate admin-token`. This script uses environment variables for configuration. The easiest way to get started is to `cp .env.example .env` and editing `.env` with your API key and Automate server hostname.

## Usage

After configuration, run `bundle install` to install dependencies. Example run:
```
$ ruby a2_api_example.rb
Node Counts:
{
  "total": 1,
  "success": 0,
  "failure": 0,
  "missing": 1
}

Run Counts:
{
  "total": 6,
  "success": 4,
  "failure": 2
}

Compliance Summary:
{
  "controls_summary": null,
  "node_summary": null,
  "report_summary": {
    "stats": {
      "nodes": "0",
      "platforms": 0,
      "environments": 0,
      "profiles": 0
    },
    "status": "unknown",
    "duration": 0,
    "start_date": ""
  }
}
```

## Notes

The Chef Automate API isn't complete yet. Breaking changes may be introduced that breaks this (or your own) code. Use at your own risk for now!

I'd love to turn all of the endpoints into a class that can be used. I'm sure there's a way to do this from the OpenAPI specifications. If you'd like to pair on this, please let me know!
