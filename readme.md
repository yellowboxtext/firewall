
# Service Hardening

"Service Hardening Rules" скрытые !
Не показываются в панели управления фаервола виндоус :(
Они доступны (для просмотра и управления) только через специальные системное вызовы (API).

## Скрипты

Запускать скрипты в консоли cmd.exe (или в far.exe).

Скрипт добавляющий правило Service Hardening Rule.
Добавляется сервис "c:\windows\myservice.exe".
Такого exe в виндоус нету. 
Это только пример сервиса.
Но правило всё же будет создано.
```
cscript service-hardening-rules-add-example.vbs
```

Скрипт показывающий все правила Service Hardening
```
cscript service-hardening-rules-list.vbs
```

Скрипт удаляющий все правила Service Hardening
```
cscript service-hardening-rules-delete-all.vbs
```

## Теория

Приоритет правила фаервола виндоус.

Те самые "Service Hardening Rules" находятся на самом верху, проверяются первыми.

Картинка "rules order processing.gif" показывает приоритет правил.

[Документация по Ordering of rules на сайте microsoft](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc755191(v=ws.10))

Priority ordering of rules:
1. Windows Service Hardening.
2. Connection security rules. (consec)
3. Authenticated bypass rules. (bypass)
4. Block rules.
5. Allow rules.
6. Default rules.

