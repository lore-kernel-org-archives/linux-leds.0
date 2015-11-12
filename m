From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] leds: triggers: oneshot: fix module license specification
Date: Thu, 12 Nov 2015 10:20:39 +0100
Message-ID: <1447320039-16240-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:52798 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753700AbbKLJUu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Nov 2015 04:20:50 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Fabio Baltieri <fabio.baltieri@gmail.com>, kernel@pengutronix.de, linux-leds@vger.kernel.org

The header of this file fixes the license to GPL 2 only without the
option to use later version. So use the string "GPL v2" that is to be
used in this case.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/trigger/ledtrig-oneshot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trig=
ger/ledtrig-oneshot.c
index fbd02cdc3ad7..c1bab74b22a0 100644
--- a/drivers/leds/trigger/ledtrig-oneshot.c
+++ b/drivers/leds/trigger/ledtrig-oneshot.c
@@ -201,4 +201,4 @@ module_exit(oneshot_trig_exit);
=20
 MODULE_AUTHOR("Fabio Baltieri <fabio.baltieri@gmail.com>");
 MODULE_DESCRIPTION("One-shot LED trigger");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
--=20
2.6.1
