راهنمای ساخت APK برای «arch-diagram-37»

روش آسان: ساخت ابری با GitHub (بدون نصب هیچ برنامه‌ای)
۱. در github.com حساب رایگان بسازید و یک مخزن (Repository) جدید بسازید.
۲. محتوای این پوشه را در مخزن بارگذاری کنید (با GitHub Desktop یا git؛ پوشهٔ مخفی .github هم باید بارگذاری شود).
   اگر با دکمهٔ Upload در سایت بارگذاری می‌کنید و پوشهٔ .github منتقل نشد: Add file ← Create new file، نام فایل را
   .github/workflows/build-apk.yml بنویسید و محتوای فایل build-apk.yml را در آن بچسبانید.
۳. به تب Actions بروید. ساخت خودکار شروع می‌شود (حدود ۵ تا ۱۰ دقیقه).
۴. بعد از سبز شدن، وارد اجرا شوید و در بخش Artifacts فایل app-apk را دانلود کنید؛ داخل ZIP آن، app-debug.apk است.

روش دوم: ساخت روی کامپیوتر خودتان

پیش‌نیازها (فقط یک‌بار):
۱. Node.js از nodejs.org
۲. Android Studio از developer.android.com/studio  (JDK و Android SDK همراه آن نصب می‌شود؛ بعد از نصب، یک‌بار برنامه را باز کنید تا SDK دانلود شود.)

ساخت APK:
- ویندوز: دوبار کلیک روی make-apk-windows.bat
- مک / لینوکس: در ترمینال  sh make-apk-mac-linux.sh
فایل خروجی: android/app/build/outputs/apk/debug/app-debug.apk
آن را روی گوشی کپی و نصب کنید (باید «نصب از منابع ناشناس» فعال باشد).

اگر اسکریپت به خطای JAVA_HOME یا SDK برخورد کرد: دستور  npx cap open android  را بزنید تا پروژه در Android Studio باز شود و از همان‌جا Run بزنید.

انتشار در گوگل‌پلی: در Android Studio از Build ← Generate Signed Bundle / APK خروجی AAB بسازید.
تغییر در فایل‌های پروژه: داخل پوشهٔ www ویرایش کنید و دوباره اسکریپت را اجرا کنید.
