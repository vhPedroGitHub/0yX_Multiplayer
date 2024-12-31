import os
from telegram import Bot
import asyncio

def lambda_handler(event, context):
    alarmName = event["alarmData"]["alarmName"]
    state = event["alarmData"]["state"]["value"]
    previousState = event["alarmData"]["previousState"]["value"]
    alarmArn = event["alarmArn"]

    bot_token = os.environ['TELEGRAM_BOT_TOKEN']
    channel_or_chat_id = os.environ['TELEGRAM_CHANNEL']

    bot = Bot(token=bot_token)

    message = f"Alarm Name: {alarmName} \n State: {state} \n Previous State: {previousState} \n Alarm Arn: {alarmArn}"


    asyncio.run(bot.send_message(chat_id=channel_or_chat_id, text=message))

    return {
        'statusCode': 200,
        'body': 'Mensaje enviado a Telegram'
    }
