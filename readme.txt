
# Service Hardening

"Service Hardening Rules" скрытые !
Не показываются в панели управления фаервола виндоус :(
Они доступны (для просмотра и управления) 
только через специальное системное вызовы (API).

## Скрипты

Запускать скрипты в консоли cmd.exe (или в far.exe).

Скрипт добавляющий правила Service Hardening Rule
Добавляется explorer.exe.
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
Картинка rules order processing.gif" показывает приоритет правил.
[Ordering of rules](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc755191(v=ws.10))

1. Windows Service Hardening.
2. Connection security rules.
3. Authenticated bypass rules.
4. Block rules.
5. Allow rules.
6. Default rules.

