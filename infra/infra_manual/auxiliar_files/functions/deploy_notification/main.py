import os
from telegram import Bot
from telegram.constants import ParseMode
import asyncio


def lambda_handler(event, context):
    pipeline_name = event["detail"]["pipeline"]
    pipeline_state = event["detail"]["state"]
    pipeline_execution = event["detail"]["execution-id"]
    bot_token = os.environ['TELEGRAM_BOT_TOKEN']

    pipeline_execution_id = pipeline_execution.split('-')[0]

    bot = Bot(token=bot_token)

    url = "https://us-east-1.console.aws.amazon.com/codesuite/codepipeline/pipelines/" + pipeline_name + "/view?region=us-east-1"

    # text = "The execution of the pipeline " + pipeline_name + " has been " + pipeline_state
    message = "The execution <a href='" + url + "'>" + pipeline_execution_id + "</a> of the pipeline <a href='" + url + "'>" + pipeline_name + "</a> has been " + pipeline_state
    channel_or_chat_id = os.environ['TELEGRAM_CHANNEL']
    message_thread_id = os.environ['TELEGRAM_THREAD_ID']
    asyncio.run(bot.send_message(message_thread_id=message_thread_id, chat_id=channel_or_chat_id, text=message, parse_mode=ParseMode.HTML))

    return {
        'statusCode': 200,
        'body': 'Mensaje enviado a Telegram'
    }
