import asyncio
import dotenv
import os

from aiogram import Bot, Dispatcher, F
from aiogram.client.default import DefaultBotProperties
from aiogram.types import Message
from aiogram.filters import CommandStart
from aiogram.enums import ParseMode

dotenv.load_dotenv()
TOKEN = os.getenv("TOKEN")

bot = Bot(TOKEN, default=DefaultBotProperties(parse_mode=ParseMode.HTML))
dp = Dispatcher()


@dp.startup()
async def on_startup() -> None:
    await bot.delete_webhook(True)


@dp.message(CommandStart())
async def start(message: Message) -> None:
    await message.answer(f"Hello, <b>{message.from_user.first_name}</b>!")


@dp.message(F.text)
async def echo(message: Message) -> None:
    await message.send_copy(message.chat.id)


if __name__ == "__main__":
    asyncio.run(dp.start_polling(bot))