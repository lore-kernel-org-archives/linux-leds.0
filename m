From: kbuild test robot <fengguang.wu@intel.com>
Subject: [PATCH next] Merge remote-tracking branch 'leds/for-next'::
 aat1290_intensity_to_brightness() can be static
Date: Wed, 17 Jun 2015 14:56:39 +0800
Message-ID: <20150617065639.GA70664@athens>
References: <201506171403.akc8Fj4R%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:20985 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752605AbbFQG5i (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 17 Jun 2015 02:57:38 -0400
Content-Disposition: inline
In-Reply-To: <201506171403.akc8Fj4R%fengguang.wu@intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: kbuild-all@01.org, Michael Ellerman <mpe@ellerman.id.au>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org


Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 leds-aat1290.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index 1ac525b4..fd7c25f 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -394,7 +394,7 @@ static void aat1290_init_flash_timeout(struct aat1290_led *led,
 }
 
 #if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
-enum led_brightness aat1290_intensity_to_brightness(
+static enum led_brightness aat1290_intensity_to_brightness(
 					struct v4l2_flash *v4l2_flash,
 					s32 intensity)
 {
@@ -409,7 +409,7 @@ enum led_brightness aat1290_intensity_to_brightness(
 	return 1;
 }
 
-s32 aat1290_brightness_to_intensity(struct v4l2_flash *v4l2_flash,
+static s32 aat1290_brightness_to_intensity(struct v4l2_flash *v4l2_flash,
 					enum led_brightness brightness)
 {
 	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
