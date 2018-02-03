From: Sasha Levin <Alexander.Levin@microsoft.com>
Subject: [PATCH AUTOSEL for 4.4 15/32] led: core: Fix brightness setting when
 setting delay_off=0
Date: Sat, 3 Feb 2018 18:04:32 +0000
Message-ID: <20180203180413.7438-15-alexander.levin@microsoft.com>
References: <20180203180413.7438-1-alexander.levin@microsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-co1nam03on0108.outbound.protection.outlook.com ([104.47.40.108]:59967
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753260AbeBCSGA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 3 Feb 2018 13:06:00 -0500
In-Reply-To: <20180203180413.7438-1-alexander.levin@microsoft.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Sasha Levin <Alexander.Levin@microsoft.com>

From: Matthieu CASTET <matthieu.castet@parrot.com>

[ Upstream commit 2b83ff96f51d0b039c4561b9f95c824d7bddb85c ]

With the current code, the following sequence won't work :
echo timer > trigger

echo 0 >  delay_off
* at this point we call
** led_delay_off_store
** led_blink_set
*** stop timer
** led_blink_setup
** led_set_software_blink
*** if !delay_on, led off
*** if !delay_off, set led_set_brightness_nosleep <--- LED_BLINK_SW is set =
but timer is stop
*** otherwise start timer/set LED_BLINK_SW flag

echo xxx > brightness
* led_set_brightness
** if LED_BLINK_SW
*** if brightness=3D0, led off
*** else apply brightness if next timer <--- timer is stop, and will never =
apply new setting
** otherwise set led_set_brightness_nosleep

To fix that, when we delete the timer, we should clear LED_BLINK_SW.

Cc: linux-leds@vger.kernel.org
Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
---
 drivers/leds/led-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index c1c3af089634..92b6798ef5b3 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -149,7 +149,7 @@ void led_blink_set(struct led_classdev *led_cdev,
 		   unsigned long *delay_on,
 		   unsigned long *delay_off)
 {
-	del_timer_sync(&led_cdev->blink_timer);
+	led_stop_software_blink(led_cdev);
=20
 	led_cdev->flags &=3D ~LED_BLINK_ONESHOT;
 	led_cdev->flags &=3D ~LED_BLINK_ONESHOT_STOP;
--=20
2.11.0
