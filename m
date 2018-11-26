From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 3/6] platform/x86: thinkpad_acpi: Add audio
	mute LED classdev support
Date: Mon, 26 Nov 2018 18:11:23 +0100
Message-ID: <20181126171126.20280-4-tiwai@suse.de>
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

In the upcoming change, the binding of audio mute / mic-mute LED
controls will be switched with LED trigger.  This patch is the last
piece of preparation: adding the audio mute / mic-mute LED class
devices to thinkpad_acpi driver.

Two devices, tpacpi::mute and tpacpi::micmute, will be added for
controlling the mute LED and mic-mute LED, respectively.

Also this selects CONFIG_LEDS_TRIGGERS and CONFIG_LEDS_TRIGGERS_AUDIO
unconditionally.  Strictly speaking, these aren't 100% mandatory, but
leaving these manual selections would lead to a functional regression
easily once after converting from the dynamic symbol binding to the
LEDs trigger in a later patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/platform/x86/Kconfig         |  2 +
 drivers/platform/x86/thinkpad_acpi.c | 56 +++++++++++++++++++++++++---
 2 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9b9cc3cc33e9..87f70e8f4dd0 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -495,6 +495,8 @@ config THINKPAD_ACPI
 	select NVRAM
 	select NEW_LEDS
 	select LEDS_CLASS
+	select LEDS_TRIGGERS
+	select LEDS_TRIGGER_AUDIO
 	---help---
 	  This is a driver for the IBM and Lenovo ThinkPad laptops. It adds
 	  support for Fn-Fx key combinations, Bluetooth control, video
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index fde08a997557..3c09afae1248 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9203,17 +9203,57 @@ int tpacpi_led_set(int whichled, bool on)
 }
 EXPORT_SYMBOL_GPL(tpacpi_led_set);
 
+static int tpacpi_led_mute_set(struct led_classdev *led_cdev,
+			       enum led_brightness brightness)
+{
+	return tpacpi_led_set(TPACPI_LED_MUTE, brightness != LED_OFF);
+}
+
+static int tpacpi_led_micmute_set(struct led_classdev *led_cdev,
+				  enum led_brightness brightness)
+{
+	return tpacpi_led_set(TPACPI_LED_MICMUTE, brightness != LED_OFF);
+}
+
+static struct led_classdev mute_led_cdev[] = {
+	[TPACPI_LED_MUTE] = {
+		.name		= "tpacpi::mute",
+		.max_brightness = 1,
+		.brightness_set_blocking = tpacpi_led_mute_set,
+		.default_trigger = "audio-mute",
+	},
+	[TPACPI_LED_MICMUTE] = {
+		.name		= "tpacpi::micmute",
+		.max_brightness = 1,
+		.brightness_set_blocking = tpacpi_led_micmute_set,
+		.default_trigger = "audio-micmute",
+	},
+};
+
 static int mute_led_init(struct ibm_init_struct *iibm)
 {
+	static enum led_audio types[] = {
+		[TPACPI_LED_MUTE] = LED_AUDIO_MUTE,
+		[TPACPI_LED_MICMUTE] = LED_AUDIO_MICMUTE,
+	};
 	acpi_handle temp;
-	int i;
+	int i, err;
 
 	for (i = 0; i < TPACPI_LED_MAX; i++) {
 		struct tp_led_table *t = &led_tables[i];
-		if (ACPI_SUCCESS(acpi_get_handle(hkey_handle, t->name, &temp)))
-			mute_led_on_off(t, false);
-		else
+		if (!ACPI_SUCCESS(acpi_get_handle(hkey_handle, t->name, &temp))) {
 			t->state = -ENODEV;
+			continue;
+		}
+
+		mute_led_cdev[i].brightness = ledtrig_audio_get(types[i]);
+		err = led_classdev_register(&tpacpi_pdev->dev, &mute_led_cdev[i]);
+		if (err < 0) {
+			while (--i >= 0)
+				if (led_tables[i].state >= 0)
+					led_classdev_unregister(&mute_led_cdev[i]);
+			return err;
+		}
 	}
 	return 0;
 }
@@ -9222,8 +9262,12 @@ static void mute_led_exit(void)
 {
 	int i;
 
-	for (i = 0; i < TPACPI_LED_MAX; i++)
-		tpacpi_led_set(i, false);
+	for (i = 0; i < TPACPI_LED_MAX; i++) {
+		if (led_tables[i].state >= 0) {
+			led_classdev_unregister(&mute_led_cdev[i]);
+			tpacpi_led_set(i, false);
+		}
+	}
 }
 
 static void mute_led_resume(void)
-- 
2.19.1
