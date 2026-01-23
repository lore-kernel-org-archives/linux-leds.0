Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2348B37107B
	for <linux-leds@vger.kernel.org>; Fri, 23 Jan 2026 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769163217; cv=none; b=So7qunsxkmfije4SrDmckB1sc7tpYDmAurNpLO3a2HXbULkDcG0Z8Dl2IirmaVHJZPoabdEjOl7KqFX6ct8BxNEuwII2of8Zka4Zt9LSuwYevARr829UaY5yG5uJacnaSlqeuNFBW4yJsXoc8wieqjZri/JJ2YNS3pD1FTjnleY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769163217; c=relaxed/simple;
	bh=rT5R+0BB3saj1cQbz/eMD1qCSrcXh8qdm23wSr8Bkf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RidjZtWaR//r3Oym9xYQNAt6O23FyI4+FEWCfYL9BXek6OpWnR7wz8925c1h+J5snde2CuXmNlJeNVo+L3mOGlhjtGLYmptEYPW27M3VPiQWm2OFiI/g9OZ6RBayhLHdRy9uBtzcPLJQVZOs+JaYl/kZmXBR6mIPTxHPl9nxVvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vjEAR-0005Yv-FG; Fri, 23 Jan 2026 11:13:27 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 23 Jan 2026 11:13:24 +0100
Subject: [PATCH] leds: multicolor: limit intensity to max_brightness of LED
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAMNJc2kC/x3NQQqDMBBG4avIrDtgonXRqxQXmkzbH2JSMlEU8
 e4NXX6b905SyRClR3NSlg2KFCvMrSH3meJbGL6abGuH1tiOg3jlZQ0FLoWUOWBBYcQiUVEOvhv
 p57n3gxhHtfLN8sL+PzzH6/oBO/hB1XEAAAA=
X-Change-ID: 20260123-leds-multicolor-limit-intensity-51e4bb4d6e1c
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 kernel@pengutronix.de, Khalid Talash <ktalash@topcon.com>, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

According to Documentation/ABI/testing/sysfs-class-led-multicolor, the
intensity should not exceed /sys/class/leds/<led>/max_brightness.

The interface doesn't check the values and higher values may lead to
unexpected color changes if the brightness is changed.

Clamp the intensity value to max_brightness.

Fixes: 55d5d3b46b08 ("leds: multicolor: Introduce a multicolor class definition")
Reported-by: Khalid Talash <ktalash@topcon.com>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/leds/led-class-multicolor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index fd66d2bdeace..5e0ac6465dc3 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -48,6 +48,8 @@ static ssize_t multi_intensity_store(struct device *dev,
 			goto err_out;
 		}
 		offset += nrchars;
+		intensity_value[i] = min(intensity_value[i],
+					 led_cdev->max_brightness);
 	}
 
 	offset++;

---
base-commit: c072629f05d7bca1148ab17690d7922a31423984
change-id: 20260123-leds-multicolor-limit-intensity-51e4bb4d6e1c

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>

