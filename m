From: Manfred Schlaegl <manfred.schlaegl@gmx.at>
Subject: [PATCH] leds: trigger: ledtrig-backlight: Fix invalid memory access
 in fb_event notification callback
Date: Tue, 13 Aug 2013 13:17:05 +0200
Message-ID: <520A15B1.2030401@gmx.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jingoo Han <jg1.han@samsung.com>, "Milo(Woogyom) Kim" <milo.kim@ti.com>, Sachin Kamat <sachin.kamat@linaro.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

fb_notifier_callback is called on any event fired by fb_notifier_call_chain. Events may, or may not contain some data (fb_event.data).
In case of FB_EVENT_BLANK fb_event.data contains a pointer to an integer holding the blank state. The Problem is, that in ledtrig-backlight.c - fb_notifier_callback the pointer to blank state is
dereferenced BEFORE the event-type is checked.
Obviously this leads to problems with other events than FB_EVENT_BLANK, where fb_event.data is undefined or NULL.
It seems, that this problem existed ever since the driver was added.

Like in drivers/video/backlight/backlight.c line 43 I would suggest to return immediately on events other than FB_EVENT_BLANK.

Signed-off-by: Manfred Schlaegl <manfred.schlaegl@gmx.at>
---

Background information:
I'm currently working on a IMX53(ARM) based hardware and Linux 3.11-rc5 and detected a problem in drivers/leds/trigger/ledtrig-backlight.c
ledtrig is used on our hardware (besides pwm-backlight) to switch off a gpio-line connected to display-supply enable-line, when the display is blanked.
On first boot after configuring ledtrig I detected an invalid memory access in ledtrig-backlight.c - fb_notifier_callback. In my special case the segfault was caused by an FB_EVENT_FB_REGISTERED,
fired with undefined fb_event.data in drivers/video/fbmem.c line 1653.


diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
index 3c9c88a..2538dbe 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -36,26 +36,28 @@ static int fb_notifier_callback(struct notifier_block *p,
 					struct bl_trig_notifier, notifier);
 	struct led_classdev *led = n->led;
 	struct fb_event *fb_event = data;
-	int *blank = fb_event->data;
-	int new_status = *blank ? BLANK : UNBLANK;
+	int *blank;
+	int new_status;
+
+	/* If we aren't interested in this event, skip it immediately ... */
+	if (event != FB_EVENT_BLANK)
+		return 0;

-	switch (event) {
-	case FB_EVENT_BLANK:
-		if (new_status == n->old_status)
-			break;
+	blank = fb_event->data;
+	new_status = *blank ? BLANK : UNBLANK;

-		if ((n->old_status == UNBLANK) ^ n->invert) {
-			n->brightness = led->brightness;
-			__led_set_brightness(led, LED_OFF);
-		} else {
-			__led_set_brightness(led, n->brightness);
-		}
+	if (new_status == n->old_status)
+		return 0;

-		n->old_status = new_status;
-
-		break;
+	if ((n->old_status == UNBLANK) ^ n->invert) {
+		n->brightness = led->brightness;
+		__led_set_brightness(led, LED_OFF);
+	} else {
+		__led_set_brightness(led, n->brightness);
 	}

+	n->old_status = new_status;
+
 	return 0;
 }
