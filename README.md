# xmp4timelapse

## Info
Снимая timelapse, очень часто необходимо корректировать параметры экспозиции. При съёмке длинных timelapse c переходом день-ночь это неизбежно, поскольку сюжет не влезает в динамический диапазон матрицы. А при смене экспозиции неизбежно возникает яркостная "ступенька", которую нужно избежать в итоговом видео. Для этого нужно плавно изменять параметры проявки сырых файлов в каждом блоке. При этом вручную выставлять параметры проявки только на кадрах граничных с сменой экспозиции. Остальные параметры расчитает этот сценарий автоматически, создав необходимые промежуточные файлы на основе двух базовых начала и конца блока с одной экспозицией.

### Расчитываемые между кадрами параметры:
- WhiteBalance
- Temperature
- Tint
- Vibrance
- Exposure2012
- Contrast2012
- Highlights2012
- Shadows2012
- Whites2012
- Blacks2012
- Clarity2012
- Dehaze

Таким образом автоматизируется процесс расчёта и создания файлов __xmp__ в которых хранятся параметры "проявки" картинок в **Adobe Camera Raw converter**.

## Workfow:

TimeLapse снимаем в ручном режиме. При съёмке запоминаем номера файлов на которых происходит смена экспозиции (это проще, чем искать их потом в большом потоке). Открываем первый и последний raw file в серии в ACR для выравнивания параметров проявки. Сохраняем параметры проявки, ACR при этом записывает их в соотвествующие **xmp** рядом с **raw** файлами.

Натравливаем этот скрипт на получившиеся xmp:
 > perl xmp.pl file1001.cr2 file1099.cr2

В результате получаем пачку промежуточных xmp в которых параметры съёмки плавно ихменяются от первого до последного кадра для устранения "ступенек".

Процесс повторяем для каждой группы снимков снятых с одной экспозицией.
 > perl xmp.pl file1100.cr2 file1199.cr2
 > perl xmp.pl file1200.cr2 file1299.cr2

##Hint:
Удобнее всего устанавливать параметры проявки в "средних группах" открывая сразу три картинки: последнюю в предыдущей группе и первую и последнюю в текущей. При таком подходе все можно настроить наглядно и с предсказуемым результатом.

## Crop режим
Вторым этапом есть возможность сделать программный "слайдер/зум", это реализовано c помощью иструмента crop в ACR.

Сами параметры кропа устанавливаются визуально на первом и последнем кадре, а скрипт посчитает и запишет плавно изменяемые параметры кропа.
В параметрах кропа необходимо следить за разрешением и пропорциями картинки, иначе могут возникнуть проблемы при сборке итогового видео.

### Плавно изменяются следующие параметры:

- CropTop
- CropLeft
- CropBottom
- CropRight

> perl xmp.pl file1001.cr2 file1299.cr2 -crop
# ---

When shooting timelapse, very often it becomes necessary to adjust the exposure parameters. For example, when shooting long timelapse with day-night transition. This perl script is written on the knee to simplify the process raw images. When changing the exposure, a luminance "step" inevitably appears in the final video. The script creates intermediate files from two base xmp files in which it smoothly changes exposure parameters, white balance and a number of other parameters affecting the final image. Thus, the process of calculating and automatically creating xmp files for processing images in the Adobe Camera raw converter is automated.

AutoCalculated parameters:

WhiteBalance, Temperature, Tint, Vibrance, Exposure2012, Contrast2012, Highlights2012, Shadows2012, Whites2012, Blacks2012, Clarity2012, Dehaze

In crop mode also calculated:

CropTop, CropLeft, CropBottom, CropRight

### please help me translate readme to english ))
