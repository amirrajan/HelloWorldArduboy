set +x

mkdir ./out
mkdir ./cache

set -e

source_file=main.c

root_directory=$(pwd)
source_file_full_path=$root_directory/$source_file
output_directory=$root_directory/out
cache_directory=$root_directory/cache
serial_port=/dev/$(ls /dev | grep cu.usb | head -n1)

/Applications/Arduino.app/Contents/Java/arduino-builder -dump-prefs \
							-logger=machine -hardware /Applications/Arduino.app/Contents/Java/hardware \
							-hardware $HOME/Library/Arduino15/packages \
							-tools /Applications/Arduino.app/Contents/Java/tools-builder \
							-tools /Applications/Arduino.app/Contents/Java/hardware/tools/avr \
							-tools $HOME/Library/Arduino15/packages \
							-built-in-libraries /Applications/Arduino.app/Contents/Java/libraries \
							-libraries $HOME/Documents/Arduino/libraries \
							-fqbn=arduboy:avr:arduboy -vid-pid=0X2341_0X8036 -ide-version=10805 \
							-build-path $output_directory \
							-warnings=all \
							-build-cache $cache_directory \
							-prefs=build.warn_data_percentage=75 \
							-prefs=runtime.tools.avr-gcc.path=/Applications/Arduino.app/Contents/Java/hardware/tools/avr \
							-prefs=runtime.tools.avrdude.path=/Applications/Arduino.app/Contents/Java/hardware/tools/avr \
							-prefs=runtime.tools.arduinoOTA.path=/Applications/Arduino.app/Contents/Java/hardware/tools/avr \
							-verbose $source_file_full_path

/Applications/Arduino.app/Contents/Java/arduino-builder -compile \
							-logger=machine \
							-hardware /Applications/Arduino.app/Contents/Java/hardware \
							-hardware $HOME/Library/Arduino15/packages \
							-tools /Applications/Arduino.app/Contents/Java/tools-builder \
							-tools /Applications/Arduino.app/Contents/Java/hardware/tools/avr \
							-tools $HOME/Library/Arduino15/packages \
							-built-in-libraries /Applications/Arduino.app/Contents/Java/libraries \
							-libraries $HOME/Documents/Arduino/libraries \
							-fqbn=arduboy:avr:arduboy -vid-pid=0X2341_0X8036 -ide-version=10805 \
							-build-path $output_directory \
							-warnings=all \
							-build-cache $cache_directory \
							-prefs=build.warn_data_percentage=75 \
							-prefs=runtime.tools.avr-gcc.path=/Applications/Arduino.app/Contents/Java/hardware/tools/avr \
							-prefs=runtime.tools.avrdude.path=/Applications/Arduino.app/Contents/Java/hardware/tools/avr \
							-prefs=runtime.tools.arduinoOTA.path=/Applications/Arduino.app/Contents/Java/hardware/tools/avr \
							-verbose $source_file_full_path

set +e

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions \
									 -ffunction-sections -fdata-sections -fno-threadsafe-statics  \
									 -flto -w -x c++ -E -CC -mmcu=atmega32u4 -DF_CPU=16000000L \
									 -DARDUINO=10805 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  \
									 -DARDUBOY_10 -DUSB_VID=0x2341 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$output_directory/sketch/$source_file.cpp" \
									 -o "/dev/null"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions \
									 -ffunction-sections -fdata-sections -fno-threadsafe-statics  \
									 -flto -w -x c++ -E -CC -mmcu=atmega32u4 -DF_CPU=16000000L -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$HOME/Documents/Arduino/libraries/Arduboy/src/Arduboy.cpp" \
									 -o "/dev/null"


"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions \
									 -ffunction-sections -fdata-sections -fno-threadsafe-statics  \
									 -flto -w -x c++ -E -CC -mmcu=atmega32u4 -DF_CPU=16000000L -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 \
									 -DUSB_VID=0x2341 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$HOME/Documents/Arduino/libraries/Arduboy/src/ab_logo.c" \
									 -o "/dev/null"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions \
									 -ffunction-sections -fdata-sections -fno-threadsafe-statics  \
									 -flto -w -x c++ -E -CC -mmcu=atmega32u4 -DF_CPU=16000000L -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$HOME/Documents/Arduino/libraries/Arduboy/src/audio/audio.cpp" \
									 -o "/dev/null"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions \
									 -ffunction-sections -fdata-sections -fno-threadsafe-statics  \
									 -flto -w -x c++ -E -CC -mmcu=atmega32u4 -DF_CPU=16000000L -DARDUINO=10805 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$HOME/Documents/Arduino/libraries/Arduboy/src/core/core.cpp" \
									 -o "/dev/null"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions \
									 -ffunction-sections -fdata-sections -fno-threadsafe-statics  \
									 -flto -w -x c++ -E -CC -mmcu=atmega32u4 -DF_CPU=16000000L -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$HOME/Documents/Arduino/libraries/Arduboy/src/glcdfont.c" \
									 -o "/dev/null"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions \
									 -ffunction-sections -fdata-sections -fno-threadsafe-statics  \
									 -flto -w -x c++ -E -CC -mmcu=atmega32u4 -DF_CPU=16000000L -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src/SPI.cpp" \
									 -o "/dev/null"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions \
									 -ffunction-sections -fdata-sections -fno-threadsafe-statics  \
									 -flto -w -x c++ -E -CC -mmcu=atmega32u4 -DF_CPU=16000000L -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$output_directory/sketch/$source_file.cpp" \
									 -o "$output_directory/preproc/ctags_target_for_gcc_minus_e.cpp"

"/Applications/Arduino.app/Contents/Java/tools-builder/ctags/5.8-arduino11/ctags" -u --language-force=c++ -f - --c++-kinds=svpf --fields=KSTtzns \
										  --line-directives "$output_directory/preproc/ctags_target_for_gcc_minus_e.cpp"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics \
									 -MMD -flto -mmcu=atmega32u4 -DF_CPU=16000000L -DARDUINO=10805 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$output_directory/sketch/$source_file.cpp" \
									 -o "$output_directory/sketch/$source_file.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega32u4 \
									 -DF_CPU=16000000L -DARDUINO=10805 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$HOME/Documents/Arduino/libraries/Arduboy/src/ab_logo.c" \
									 -o "$output_directory/libraries/Arduboy/ab_logo.c.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega32u4 \
									 -DF_CPU=16000000L -DARDUINO=10805 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$HOME/Documents/Arduino/libraries/Arduboy/src/glcdfont.c" \
									 -o "$output_directory/libraries/Arduboy/glcdfont.c.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega32u4 \
									 -DF_CPU=16000000L -DARDUINO=10805 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$HOME/Documents/Arduino/libraries/Arduboy/src/Arduboy.cpp" \
									 -o "$output_directory/libraries/Arduboy/Arduboy.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega32u4 \
									 -DF_CPU=16000000L -DARDUINO=10805 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$HOME/Documents/Arduino/libraries/Arduboy/src/audio/audio.cpp" \
									 -o "$output_directory/libraries/Arduboy/audio/audio.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega32u4 \
									 -DF_CPU=16000000L -DARDUINO=10805 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "$HOME/Documents/Arduino/libraries/Arduboy/src/core/core.cpp" \
									 -o "$output_directory/libraries/Arduboy/core/core.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega32u4 \
									 -DF_CPU=16000000L -DARDUINO=10805 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR  -DARDUBOY_10 -DUSB_VID=0x2341 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "-I$HOME/Documents/Arduino/libraries/Arduboy/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/EEPROM/src" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/libraries/SPI/src/SPI.cpp" \
									 -o "$output_directory/libraries/SPI/SPI.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc" -c -g -x assembler-with-cpp -flto -MMD -mmcu=atmega32u4 \
									 -DF_CPU=16000000L -DARDUINO=10805 -DARDUINO_AVR_ARDUBOY -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/wiring_pulse.S" \
									 -o "$output_directory/core/wiring_pulse.S.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections \
									 -fdata-sections \
									 -MMD \
									 -flto \
									 -fno-fat-lto-objects \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/WInterrupts.c" \
									 -o "$output_directory/core/WInterrupts.c.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/hooks.c" \
									 -o "$output_directory/core/hooks.c.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/wiring.c" \
									 -o "$output_directory/core/wiring.c.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD \
									 -flto \
									 -fno-fat-lto-objects \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/wiring_analog.c" \
									 -o "$output_directory/core/wiring_analog.c.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/wiring_digital.c" \
									 -o "$output_directory/core/wiring_digital.c.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD \
									 -flto \
									 -fno-fat-lto-objects \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/wiring_pulse.c" \
									 -o "$output_directory/core/wiring_pulse.c.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc" -c -g -Os -Wall -Wextra -std=gnu11 -ffunction-sections -fdata-sections -MMD \
									 -flto \
									 -fno-fat-lto-objects \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/wiring_shift.c" \
									 -o "$output_directory/core/wiring_shift.c.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/CDC.cpp" \
									 -o "$output_directory/core/CDC.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/HardwareSerial.cpp" \
									 -o "$output_directory/core/HardwareSerial.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/HardwareSerial0.cpp" \
									 -o "$output_directory/core/HardwareSerial0.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/HardwareSerial1.cpp" \
									 -o "$output_directory/core/HardwareSerial1.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/HardwareSerial2.cpp" \
									 -o "$output_directory/core/HardwareSerial2.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/HardwareSerial3.cpp" \
									 -o "$output_directory/core/HardwareSerial3.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/IPAddress.cpp" \
									 -o "$output_directory/core/IPAddress.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/PluggableUSB.cpp" \
									 -o "$output_directory/core/PluggableUSB.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/Print.cpp" \
									 -o "$output_directory/core/Print.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/Stream.cpp" \
									 -o "$output_directory/core/Stream.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/Tone.cpp" \
									 -o "$output_directory/core/Tone.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/USBCore.cpp" \
									 -o "$output_directory/core/USBCore.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/WMath.cpp" \
									 -o "$output_directory/core/WMath.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/WString.cpp" \
									 -o "$output_directory/core/WString.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/abi.cpp" \
									 -o "$output_directory/core/abi.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/main.cpp" \
									 -o "$output_directory/core/main.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD \
									 -flto \
									 -mmcu=atmega32u4 \
									 -DF_CPU=16000000L \
									 -DARDUINO=10805 \
									 -DARDUINO_AVR_ARDUBOY \
									 -DARDUINO_ARCH_AVR \
									 -DARDUBOY_10 \
									 -DUSB_VID=0x2341 \
									 -DUSB_PID=0x8036 \
									 '-DUSB_MANUFACTURER="Unknown"' \
									 '-DUSB_PRODUCT="Arduboy"' \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino" \
									 "-I/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/variants/leonardo" \
									 "/Applications/Arduino.app/Contents/Java/hardware/arduino/avr/cores/arduino/new.cpp" \
									 -o "$output_directory/core/new.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/WInterrupts.c.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/wiring.c.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/wiring_analog.c.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/wiring_digital.c.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/wiring_pulse.c.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/wiring_shift.c.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/CDC.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/HardwareSerial.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/HardwareSerial0.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/HardwareSerial1.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/HardwareSerial2.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/HardwareSerial3.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/IPAddress.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/PluggableUSB.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/Print.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/Stream.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/Tone.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/USBCore.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/WMath.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/WString.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/abi.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/main.cpp.o"
"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc-ar" rcs "$output_directory/core/core.a" "$output_directory/core/new.cpp.o"

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-gcc" -Wall -Wextra -Os -g -flto -fuse-linker-plugin -Wl,--gc-sections -mmcu=atmega32u4 \
									 -o "$output_directory/$source_file.elf" \
									    "$output_directory/sketch/$source_file.cpp.o" \
									    "$output_directory/libraries/Arduboy/ab_logo.c.o" \
									    "$output_directory/libraries/Arduboy/glcdfont.c.o" \
									    "$output_directory/libraries/Arduboy/Arduboy.cpp.o" \
									    "$output_directory/libraries/Arduboy/audio/audio.cpp.o" \
									    "$output_directory/libraries/Arduboy/core/core.cpp.o" \
									    "$output_directory/libraries/SPI/SPI.cpp.o" \
									    "$output_directory/core/core.a" \
									    "-L$output_directory" \
									 -lm

"/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-objcopy" -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 \
									     "$output_directory/$source_file.elf" \
									     "$output_directory/$source_file.eep" \
									     "/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avr-objcopy" \
									     -O \
									     ihex \
									     -R \
									     .eeprom \
									     "$output_directory/$source_file.elf" \
									     "$output_directory/$source_file.hex"

python ./reset.py $serial_port

sleep 1

/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avrdude -C/Applications/Arduino.app/Contents/Java/hardware/tools/avr/etc/avrdude.conf \
								       -v \
								       -patmega32u4 \
								       -cavr109 \
								       -P$serial_port \
								       -b57600 \
								       -D \
								       -Uflash:w:$output_directory/$source_file.hex:i
