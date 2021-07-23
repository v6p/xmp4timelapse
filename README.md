# xmp4timelapse
When shooting timelapse, very often it becomes necessary to adjust the exposure parameters. For example, when shooting long timelapse with day-night transition. This perl script is written on the knee to simplify the process raw images. When changing the exposure, a luminance "step" inevitably appears in the final video. The script creates intermediate files from two base xmp files in which it smoothly changes exposure parameters, white balance and a number of other parameters affecting the final image. Thus, the process of calculating and automatically creating xmp files for processing images in the Adobe Camera raw converter is automated.

please help me translate readme to english ))

in russian:

При съёмке timelapse, очень часто возникает необходимость корректировать параметры экспозиции. Например при съёмке длинных timelapse c переходом день-ночь. Для упрощения процесса проявки сырых имиджей и написан на коленке этот скрипт. При смене экспозиции неизбежно возникает яркостная "ступенька" в итоговом видео. Скрипт создает из двух базовых xmp файлов промежуточные  в которых плавно меняет параметры экспозиции, баланса белого и ещё ряд параметров влияющих на конечную картинку. Таким образом автоматизируется процесс расчёта и автоматического  создания файлов xmp для проявки картинок в Adobe Camera raw converter.

Workfow получается такой:

TimeLapse снимаем в ручном режиме. При съёмке запоминаем номера файлов на которых происходит смена экспозиции (это проще, чем искать их потом в большом потоке). Открываем первый и последний raw file в серии в ACR для выравнивания параметров проявки. Сохраняем параметры проявки, ACR при этом сохраняет их в соотвествующих файлах xmp рядом с raw файлами.

Натравливаем этот скрипт на получивщиеся xmp: perl xmp.pl file0001.raw file 9999.raw

В результате получаем пачку промежуточных xmp в которых параметры съёмки плавно ихменяются от первого до последного кадра для устранения "ступенек".

Процесс повторяем для каждой группы снимков снятых с одной экспозицией.

Удобнее всего устанавливать параметры проявки в "средних группах" открывая сразу три картинки: последнюю в предыдущей группе и первую и последнюю в текущей. В данном случае всё очень наглядно и предсказуемо.
