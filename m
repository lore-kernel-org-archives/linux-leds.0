From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v8 1/7] platform/x86/thinkpad_acpi: Stop setting led_classdev brightness directly
Date: Thu,  9 Feb 2017 16:44:11 +0100
Message-ID: <20170209154417.19040-2-hdegoede@redhat.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170209154417.19040-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

There is no need to set the led_classdev's brightness value from
its set_brightness callback, this is taken care of by the led-core and
thinkpad_acpi really should not be mucking with it.

Note that kbdlight_set_level_and_update() is still used by the old
thinpad_acpi specific sysfs interface for the led, so we cannot
remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v8:
-New patch in v8 of this patch-set
---
 drivers/platform/x86/thinkpad_acpi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index cacb43f..0680bb3 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5095,8 +5095,6 @@ static int kbdlight_set_level(int level)
 	return 0;
 }
 
-static int kbdlight_set_level_and_update(int level);
-
 static int kbdlight_get_level(void)
 {
 	int status = 0;
@@ -5164,7 +5162,7 @@ static void kbdlight_set_worker(struct work_struct *work)
 			container_of(work, struct tpacpi_led_classdev, work);
 
 	if (likely(tpacpi_lifecycle == TPACPI_LIFE_RUNNING))
-		kbdlight_set_level_and_update(data->new_state);
+		kbdlight_set_level(data->new_state);
 }
 
 static void kbdlight_sysfs_set(struct led_classdev *led_cdev,
-- 
2.9.3
