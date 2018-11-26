From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/6] platform/x86: dell-laptop: Add micmute LED
	trigger support
Date: Mon, 26 Nov 2018 18:11:22 +0100
Message-ID: <20181126171126.20280-3-tiwai@suse.de>
References: <20181126171126.20280-1-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181126171126.20280-1-tiwai@suse.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: alsa-devel@alsa-project.org
Cc: Ayman Bagabas <ayman.bagabas@gmail.com>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

This patch adds the LED trigger support for audio mic-mute control.
As of this patch, the LED device isn't tied with the audio driver, and
can be changed via user-space at "dell::micmute" sysfs entry.  The
binding with HD-audio is still done via the existing exported
dell_micmute_led_set().  It will be replaced with the LED trigger
binding in later patches.

Also this selects CONFIG_LEDS_TRIGGERS and CONFIG_LEDS_TRIGGERS_AUDIO
unconditionally.  Strictly speaking, these aren't 100% mandatory, but
leaving these manual selections would lead to a functional regression
easily once after converting from the dynamic symbol binding to the
LEDs trigger in a later patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/platform/x86/Kconfig       |  2 ++
 drivers/platform/x86/dell-laptop.c | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 54f6a40c75c6..9b9cc3cc33e9 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -177,6 +177,8 @@ config DELL_LAPTOP
 	select POWER_SUPPLY
 	select LEDS_CLASS
 	select NEW_LEDS
+	select LEDS_TRIGGERS
+	select LEDS_TRIGGER_AUDIO
 	---help---
 	This driver adds support for rfkill and backlight control to Dell
 	laptops (except for some models covered by the Compal driver).
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 06978c14c83b..6a647e2d09ee 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -2131,6 +2131,23 @@ int dell_micmute_led_set(int state)
 }
 EXPORT_SYMBOL_GPL(dell_micmute_led_set);
 
+static int micmute_led_set(struct led_classdev *led_cdev,
+			   enum led_brightness brightness)
+{
+	int state = brightness != LED_OFF;
+	int err;
+
+	err = dell_micmute_led_set(state);
+	return err < 0 ? err : 0;
+}
+
+static struct led_classdev micmute_led_cdev = {
+	.name = "dell::micmute",
+	.max_brightness = 1,
+	.brightness_set_blocking = micmute_led_set,
+	.default_trigger = "audio-micmute",
+};
+
 static int __init dell_init(void)
 {
 	struct calling_interface_token *token;
@@ -2175,6 +2192,11 @@ static int __init dell_init(void)
 
 	dell_laptop_register_notifier(&dell_laptop_notifier);
 
+	micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
+	ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
+	if (ret < 0)
+		goto fail_led;
+
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		return 0;
 
@@ -2220,6 +2242,8 @@ static int __init dell_init(void)
 fail_get_brightness:
 	backlight_device_unregister(dell_backlight_device);
 fail_backlight:
+	led_classdev_unregister(&micmute_led_cdev);
+fail_led:
 	dell_cleanup_rfkill();
 fail_rfkill:
 	platform_device_del(platform_device);
@@ -2239,6 +2263,7 @@ static void __exit dell_exit(void)
 		touchpad_led_exit();
 	kbd_led_exit();
 	backlight_device_unregister(dell_backlight_device);
+	led_classdev_unregister(&micmute_led_cdev);
 	dell_cleanup_rfkill();
 	if (platform_device) {
 		platform_device_unregister(platform_device);
-- 
2.19.1
