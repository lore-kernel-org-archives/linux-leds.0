From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH 1/3] pwm/doc: Clearify that the pin state after pwm_disable is undefined
Date: Mon, 25 Nov 2013 21:43:43 +0100
Message-ID: <1385412225-29740-2-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:38897 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751796Ab3KYUoP (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 25 Nov 2013 15:44:15 -0500
In-Reply-To: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, Matt Sealey <matt@genesi-usa.com>

This makes assumptions on the behaviour of the pwm API explicit.

Note that on i.MX28 the behaviour is very surprising at the first
glance. The pwm counter isn't reset (in hardware) when the registers ar=
e
reprogrammed with a new config to prevent unwanted spikes. So when doin=
g:

	pwm_config(led_dat->pwm, 0, 100);
	pwm_disable(led_dat->pwm);

the output might still stop at 1 when the period programmed before the
duty was set to 0 didn't elapse until pwm_disable is called which just
stops the counter and so the current period doesn't elapse ever. This
affects (at least) the leds-pwm driver which is fixed in a follow-up
patch.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 Documentation/pwm.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/pwm.txt b/Documentation/pwm.txt
index 93cb979..09f83c1 100644
--- a/Documentation/pwm.txt
+++ b/Documentation/pwm.txt
@@ -45,6 +45,11 @@ int pwm_config(struct pwm_device *pwm, int duty_ns, =
int period_ns);
=20
 To start/stop toggling the PWM output use pwm_enable()/pwm_disable().
=20
+Note that after calling pwm_disable() it's undefined if the output sto=
ps in a
+high or low state. So set the duty cycle to 0% or 100% and don't call
+pwm_disable() if there is a need for a specific level. The same applie=
s when
+pwm_enable() was called, but pwm_config() was not.
+
 Using PWMs with the sysfs interface
 -----------------------------------
=20
--=20
1.8.4.2
