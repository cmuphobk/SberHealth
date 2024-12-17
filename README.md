# SberHealth
### Тестовый пример для демонстрации подхода API/IMPL (в частности uFeature от Tuist)
### Для доклада на Podlodka iOS Crew #10
1. Ссылка на доклад: https://youtu.be/FAv4k3vFAAw
2. Ссылка на презентацию: https://miro.com/app/board/uXjVOtRHPdY=/?share_link_id=23013579594
3. Ссылка на первый доклад по циклу статей на хабре (если больше нравится читать): https://habr.com/ru/companies/docdoc/articles/723190/

### Навигация по веткам: 
1. initial-project - Стандартный подход с .xcodeproj файлами
2. initial-project-tuist - Стандартный подход с кодогенерацией на Tuist
3. api-impl-way/develop - uFeature by Tuist (API/IMPL way)

### Используемые инструменты (окружение):
1. Homebrew
2. Rbenv
3. Bundler
4. Tuist
5. fastlane
6. Cloc
7. xclogparser
8. xcode-build-times 
9. xcode-install

### Полезные ссылки

#### Доклад #1. Многомодульное iOS приложение. Оно вам надо?
1. Книга. Эрик Эванс «Domain driven design»
2. Книга. Сэм Ньюмен «Building microservices»
3. Книга. Саймон Синек «Start with Why»
4. Непрерывность мобильной разработки — как это реализовано у нас - https://habr.com/ru/company/docdoc/blog/679896/
5. Фича-команды — профит или балласт? - https://habr.com/ru/company/docdoc/blog/687740/
6. Повышение личной и командой эффективности. Эффект Рингельмана - https://habr.com/ru/post/292938/
7. 2pizza - https://habr.com/ru/company/omnidesk/blog/296620/
8. build time critical path - https://engineering.grab.com/how-grab-is-blazing-through-the-super-app-bazel-migration
9. Api/Impl - https://www.runway.team/blog/how-to-improve-ios-build-times-with-modularization
10. uFeature https://docs.tuist.io/building-at-scale/microfeatures
11. Periphery - https://github.com/peripheryapp/periphery
12. Two static less than one dynamic - https://github.com/MobileNativeFoundation/discussions/discussions/133#discussioncomment-1415587
13. lazy loading - https://theswiftdev.com/building-and-loading-dynamic-libraries-at-runtime-in-swift/
14. Статья от Yandex - https://habr.com/ru/company/yandex/blog/585376/
15. DYLD_PRINT_STATISTICS - https://medium.com/ios-os-x-development/two-useful-environment-vars-6023b275c90c
16. Статья сравнения статической и динамической линковки 1 - https://belkadan.com/blog/2022/02/Dynamic-Linking-and-Static-Linking/
17. Статья сравнения статической и динамической линковки 2 - https://bpoplauschi.github.io/2021/10/25/Advanced-static-vs-dynamic-libraries-and-frameworks.html
18. Доклад от Avito - https://youtu.be/_EC38ZzIWPo
19. iOS Application product type - https://skyaaron.com/posts/swiftpm-app-projects/

### Доклад #2. Компиляция массивного проекта. Как её готовить?
**Наши статьи:**
1. Как компании подготовиться к модуляризации iOS приложений - https://habr.com/ru/companies/docdoc/articles/723190/
2. Многомодульное iOS-приложение: подходы к организации межмодульного взаимодействия - https://habr.com/ru/companies/docdoc/articles/735946/
**Статьи от community:**
1. Как устроена компиляция в xcode? - https://wwdcnotes.com/documentation/wwdcnotes/wwdc18-415-behind-the-scenes-of-the-xcode-build-process/
2. WWDC 23. Meet mergeable libraries - https://developer.apple.com/wwdc23/10268
3. Configuring your project to use mergeable libraries - https://developer.apple.com/documentation/xcode/configuring-your-project-to-use-mergeable-libraries
4. Исчерпывающая статья о mergeable libs - https://www.humancode.us/2024/01/02/all-about-mergeable-libraries.html
5. Еще одна статья по mergeable libs - https://www.polpiella.dev/understanding-mergeable-libraries#manual-merging
6. Мысли от команды Tuist-а - https://docs.tuist.dev/ru/guides/develop/projects/dependencies#static-or-dynamic
7. Еще одна статья по mergeable libs (и ее минусах) - https://blog.jacobstechtavern.com/p/static-dynamic-mergeable-oh-my
8. Разобр реализации XCRemoteCache - https://engineering.atspotify.com/2021/11/introducing-xcremotecache-the-ios-remote-caching-tool-that-cut-our-clean-build-times-by-70/
9. Explicit modules - https://xta0.me/2023/06/28/Swift-modules-1.html
10. Explicit modules (проще) - https://bitrise.io/blog/post/demystifying-explicitly-built-modules-for-xcode
