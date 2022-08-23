@ECHO OFF
CHCP 65001

SET HANDLERS_DIR="handlers"
SET UTILS_DIR="utils"
SET KEYBOARDS_DIR="keyboards"
SET DATA_DIR="data"

SET ENV_FILE=".env"
SET APP_FILE="app.py"
SET LOADER_FILE="loader.py"
SET INIT_FILE="__init__.py"

SET /p name="Название проекта: "

MD %name%
CD %name%

MD %HANDLERS_DIR% %UTILS_DIR% %KEYBOARDS_DIR% %DATA_DIR%
TYPE > %ENV_FILE%
TYPE > %APP_FILE%
TYPE > %LOADER_FILE%

CD %DATA_DIR%
TYPE > "config.py"
TYPE from . import config > %INIT_FILE%

CD ..
CD %UTILS_DIR%
TYPE > "set_bot_commands.py"
(ECHO from . import set_bot_commands
	ECHO from . import misc) > %INIT_FILE%
MD misc
CD misc
TYPE > logging.py
TYPE from . import logging > %INIT_FILE%

CD ..
CD ..
CD %HANDLERS_DIR%
TYPE from . import users > %INIT_FILE%
MD users
CD users
TYPE from . import start > %INIT_FILE%
TYPE > start.py

CD ..
CD ..
CD %KEYBOARDS_DIR%
TYPE from . import keyboard > %INIT_FILE%
TYPE > keyboard.py