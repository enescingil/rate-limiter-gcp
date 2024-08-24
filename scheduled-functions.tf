module "log_slack_alerts_example" {
  source  = "terraform-google-modules/scheduled-function/google"
  version = "~> 4.0"

  project_id                = var.project_id
  job_name                  = "schedule-fill-the-tokens"
  job_description           = "Scheduled time to refresh the tokens for rate-limiter"
  job_schedule              = "55 * * * *"
  function_entry_point      = "query_for_tokens"
  function_source_directory = "${path.module}/function_source"
  function_name             = "logs_query_tokens"
  function_description      = "Cloud Function to query tokens"
  region                    = var.region
  topic_name                = "logs_query_topic"
  function_runtime          = "python37"

  function_environment_variables = {
    #This is just an example, feel free to modify them
    SLACK_WEBHOOK        = var.slack_webhook
    DATASET_NAME         = var.dataset_name
    AUDIT_LOG_TABLE      = var.audit_log_table
    TIME_COLUMN          = var.time_column
    ERROR_MESSAGE_COLUMN = var.error_message_column
  }
}