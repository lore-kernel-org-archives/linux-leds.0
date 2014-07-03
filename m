From: Janne Kanniainen <janne.kanniainen@gmail.com>
Subject: [PATCH 1/2 v6] HID: gt683r: fix race condition
Date: Thu,  3 Jul 2014 20:17:08 +0300
Message-ID: <1404407829-1815-1-git-send-email-janne.kanniainen@gmail.com>
References: <20140703082830.GB16590@localhost>
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20140703082830.GB16590@localhost>
Sender: linux-input-owner@vger.kernel.org
To: johan@kernel.org
Cc: cooloney@gmail.com, jkosina@suse.cz, greg@kroah.com, bjorn@mork.no, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, Janne Kanniainen <janne.kanniainen@gmail.com>
List-Id: linux-leds@vger.kernel.org

This will fix race condition noticed by Oliver Neukum. Sysfs files are
created before mutex and work are initialized.

Signed-off-by: Janne Kanniainen <janne.kanniainen@gmail.com>
---
 drivers/hid/hid-gt683r.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-gt683r.c b/drivers/hid/hid-gt683r.c
index 077f7a1..073bd80 100644
--- a/drivers/hid/hid-gt683r.c
+++ b/drivers/hid/hid-gt683r.c
@@ -227,6 +227,9 @@ static int gt683r_led_probe(struct hid_device *hdev,
 	if (!led)
 		return -ENOMEM;
 
+	mutex_init(&led->lock);
+	INIT_WORK(&led->work, gt683r_led_work);
+
 	led->mode = GT683R_LED_NORMAL;
 	led->hdev = hdev;
 	hid_set_drvdata(hdev, led);
@@ -271,9 +274,6 @@ static int gt683r_led_probe(struct hid_device *hdev,
 		goto fail;
 	}
 
-	mutex_init(&led->lock);
-	INIT_WORK(&led->work, gt683r_led_work);
-
 	return 0;
 
 fail:
-- 
1.9.2

