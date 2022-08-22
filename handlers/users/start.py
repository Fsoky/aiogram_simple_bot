from aiogram import types

from loader import dp


@dp.message_handler(commands=["start", "menu", "help"])
async def start(message: types.Message):
    await message.answer("Welcome to ...")