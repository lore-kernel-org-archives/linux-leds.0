From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v3 7/7] platform/x86: dell-wmi-led: fix coding style issues
Date: Fri, 17 Feb 2017 08:57:53 +0100
Message-ID: <20170217075753.12702-8-kernel@kempniu.pl>
References: <20170217075753.12702-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170217075753.12702-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Alex Hung <alex.hung@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Fix coding style issues in dell-wmi-led to make sure the module gets a
clean start in the x86 platform driver subsystem.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-wmi-led.c | 66 +++++++++++++++----------------------
 1 file changed, 26 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi-led.c b/drivers/platform/x86/dell-wmi-led.c
index d0232c7f1909..a0c7e99530ef 100644
--- a/drivers/platform/x86/dell-wmi-led.c
+++ b/drivers/platform/x86/dell-wmi-led.c
@@ -46,37 +46,29 @@ struct bios_args {
 	unsigned char off_time;
 };
 
-static int dell_led_perform_fn(u8 length,
-		u8 result_code,
-		u8 device_id,
-		u8 command,
-		u8 on_time,
-		u8 off_time)
+static int dell_led_perform_fn(u8 length, u8 result_code, u8 device_id,
+			       u8 command, u8 on_time, u8 off_time)
 {
-	struct bios_args *bios_return;
-	u8 return_code;
-	union acpi_object *obj;
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct bios_args *bios_return;
 	struct acpi_buffer input;
+	union acpi_object *obj;
 	acpi_status status;
+	u8 return_code;
 
-	struct bios_args args;
-	args.length = length;
-	args.result_code = result_code;
-	args.device_id = device_id;
-	args.command = command;
-	args.on_time = on_time;
-	args.off_time = off_time;
+	struct bios_args args = {
+		.length = length,
+		.result_code = result_code,
+		.device_id = device_id,
+		.command = command,
+		.on_time = on_time,
+		.off_time = off_time
+	};
 
 	input.length = sizeof(struct bios_args);
 	input.pointer = &args;
 
-	status = wmi_evaluate_method(DELL_LED_BIOS_GUID,
-		1,
-		1,
-		&input,
-		&output);
-
+	status = wmi_evaluate_method(DELL_LED_BIOS_GUID, 1, 1, &input, &output);
 	if (ACPI_FAILURE(status))
 		return status;
 
@@ -84,7 +76,7 @@ static int dell_led_perform_fn(u8 length,
 
 	if (!obj)
 		return -EINVAL;
-	else if (obj->type != ACPI_TYPE_BUFFER) {
+	if (obj->type != ACPI_TYPE_BUFFER) {
 		kfree(obj);
 		return -EINVAL;
 	}
@@ -117,8 +109,7 @@ static int led_off(void)
 		0);			/* not used */
 }
 
-static int led_blink(unsigned char on_eighths,
-		unsigned char off_eighths)
+static int led_blink(unsigned char on_eighths, unsigned char off_eighths)
 {
 	return dell_led_perform_fn(5,	/* Length of command */
 		INTERFACE_ERROR,	/* Init to  INTERFACE_ERROR */
@@ -129,7 +120,7 @@ static int led_blink(unsigned char on_eighths,
 }
 
 static void dell_led_set(struct led_classdev *led_cdev,
-		enum led_brightness value)
+			 enum led_brightness value)
 {
 	if (value == LED_OFF)
 		led_off();
@@ -138,27 +129,22 @@ static void dell_led_set(struct led_classdev *led_cdev,
 }
 
 static int dell_led_blink(struct led_classdev *led_cdev,
-		unsigned long *delay_on,
-		unsigned long *delay_off)
+			  unsigned long *delay_on, unsigned long *delay_off)
 {
 	unsigned long on_eighths;
 	unsigned long off_eighths;
 
-	/* The Dell LED delay is based on 125ms intervals.
-	   Need to round up to next interval. */
+	/*
+	 * The Dell LED delay is based on 125ms intervals.
+	 * Need to round up to next interval.
+	 */
 
-	on_eighths = (*delay_on + 124) / 125;
-	if (0 == on_eighths)
-		on_eighths = 1;
-	if (on_eighths > 255)
-		on_eighths = 255;
+	on_eighths = DIV_ROUND_UP(*delay_on, 125);
+	on_eighths = clamp_t(unsigned long, on_eighths, 1, 255);
 	*delay_on = on_eighths * 125;
 
-	off_eighths = (*delay_off + 124) / 125;
-	if (0 == off_eighths)
-		off_eighths = 1;
-	if (off_eighths > 255)
-		off_eighths = 255;
+	off_eighths = DIV_ROUND_UP(*delay_off, 125);
+	off_eighths = clamp_t(unsigned long, off_eighths, 1, 255);
 	*delay_off = off_eighths * 125;
 
 	led_blink(on_eighths, off_eighths);
-- 
2.11.1
