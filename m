Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2399471429;
	Sun, 20 Sep 2026 19:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933349; cv=pass; b=Vsdq8Ot5KL8BojDhmeobW7oV6Inf0UkciG2bDKfQNZZDdYOmhPLz3q7CzB4CfCqpv+Ac7lOWkAvCsyebEYmaZ3IXZuMqe96/nI1znYL40aDiShUuQpTH0rpsqiG06GPNQNrX3+XihAjmk1QDYNIZXy9F4TkEH++PtyrbPMWDXY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933349; c=relaxed/simple;
	bh=tNPNvfDycyTQ1SDYUT1/BaFQrL99uV0tYcq7dx/xbIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rh9IFUV033iyh4BB6ecOunORYz+Yvm+2CGqJOl4BdOOMTVTYeSTgf7QoCpBs68JLya5VOorc/LtjwWnQTB8eXyJ5KvRog+dmc5TAGI4Iqfx3QyfVT2ic/eYLHJBv+A8p2piw+eRtCNs4Q0khWktA6T3LoosFAEMX6MGX1DZKaD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=BileC0Wm; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="BileC0Wm"
ARC-Seal: i=1; a=rsa-sha256; t=1789933240; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V7dDl/6LIO8HWZmS5PBQ53e+O6uO7sdbAImc1Eio94bRXD9EyiP8YWfERqHESNa8n15RKksMjqFAkg99e8ErJyIM+gvyotpxxZPAEr4bVQ6r5lmjoyS349wDAi9o6/DpAezSDfEteE9eMaQLMwcQIeYZOjyZMuFAB+Da/bqlZnA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789933240; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FF0/cPdYXHNseaMCYnny9SPWkfmLb/uQebHuGGL5mm8=; 
	b=YDPNrtQMSTihQSsjFm8za/o7Zt4aGwyCGvX8imctVhHn4jVwqld1Hv5xxIcyx5ErINhqbNDW4zzUg3YBgZ46c4boD7UOLAXwb5EgKM79b3b3Gwo8GVTbbiGCQO6kOzP6JZ+CK85YuWA/4V3HkrasYTLA6WP+USBYyxUMThqEbqI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789933240;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=FF0/cPdYXHNseaMCYnny9SPWkfmLb/uQebHuGGL5mm8=;
	b=BileC0WmO3GUdoc2NzAkEgEHl2FcPYgur2g963zSzjI/gTVwWqdBb5EjOlcxenvi
	dqEPaIVCpOv5L998kUXyhOHJs/RE0wyd3wxCnRd0V9Xv0wOw/biejxDoEnMuaAT2iDq
	Hav681kHBAVVhID0fzQppXKkXvVbrVXQZiGqsRgfEq0Hw0A8AOWyl654rhZEEbqvAu1
	A2382JhEBewzwqBrJJqtp6DCg8xMMOzPl0IAoomvH3KJBdwTtOs8nCAcHqDeEt0VrpJ
	HV6ZnSKwVtuSs3VfM7b9CuxcqxoPwaBGMlZj/EoOjn4KqAtKBU/RJ4B0BLczJXwYLn2
	IYlVMYGnOA==
Received: by smtp.zohomail.com with SMTPS id 1789933238614443.83326529004876;
	Sun, 20 Sep 2026 12:40:38 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 21 Sep 2026 03:40:17 +0800
Subject: [PATCH v7 03/13] leds: class: Remove hardware control trigger when
 writing brightness
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-leds-trigger-hw-changed-v7-3-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Ike Panhc <ikepanhc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

Since commit b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of
hardware controlled LED"), the brightness attribute becomes write-only
when the LED is controlled fully by the hardware. A write-only attribute
is very confusing.

Moreover, most LED drivers set hardware brightness innocently with the
side effect of disabling hardware control, but the hardware control
trigger remains active, resulting in the software and hardware being out
of sync.

Fix it by removing the hardware control trigger when writing the
brightness attribute.

This should also match the semantics of hardware control:

    When the LED is in hw control, no software blink is possible and
    doing so will effectively disable hw control.

Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardware controlled LED")
Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- New patch in the series, integrated from https://lore.kernel.org/all/20260712-leds-hw-control-brightness-set-v1-1-1de593b09d26@rong.moe/
  - The following patches will improve __led_trigger_is_hw_controlled()
    to include offloaded generic triggers and take the advantage of it
---
 Documentation/ABI/testing/sysfs-class-led | 4 +++-
 drivers/leds/led-class.c                  | 3 +++
 drivers/leds/led-triggers.c               | 9 +++++++++
 include/linux/leds.h                      | 2 ++
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index d4c918cc11a1..f6d4e17e1a3b 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -28,7 +28,9 @@ Description:
 		Writing 0 to this file clears active trigger.
 
 		Writing non-zero to this file while trigger is active changes the
-		top brightness trigger is going to use.
+		top brightness trigger is going to use, unless the current
+		trigger is offloaded to hardware (in which case writing any
+		value will deactivate the trigger).
 
 
 
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 7110bfbe3b83..39cc2f3ea63f 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -64,6 +64,9 @@ static ssize_t brightness_store(struct device *dev,
 
 	if (state == LED_OFF)
 		led_trigger_remove(led_cdev);
+	else
+		led_trigger_remove_hw_control(led_cdev);
+
 	led_set_brightness(led_cdev, state);
 
 	ret = size;
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index bf2543538ed0..804a04b326c4 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -287,6 +287,15 @@ void led_trigger_remove(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_remove);
 
+void led_trigger_remove_hw_control(struct led_classdev *led_cdev)
+{
+	guard(rwsem_write)(&led_cdev->trigger_lock);
+
+	if (__led_trigger_is_hw_controlled(led_cdev))
+		led_trigger_set(led_cdev, NULL);
+}
+EXPORT_SYMBOL_GPL(led_trigger_remove_hw_control);
+
 static bool led_match_default_trigger(struct led_classdev *led_cdev,
 				      struct led_trigger *trig)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 46ad2e03e1c6..d778709f5b1b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -533,6 +533,7 @@ void led_trigger_blink_oneshot(struct led_trigger *trigger,
 void led_trigger_set_default(struct led_classdev *led_cdev);
 int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trigger);
 void led_trigger_remove(struct led_classdev *led_cdev);
+void led_trigger_remove_hw_control(struct led_classdev *led_cdev);
 
 bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev);
 
@@ -586,6 +587,7 @@ static inline int led_trigger_set(struct led_classdev *led_cdev,
 }
 
 static inline void led_trigger_remove(struct led_classdev *led_cdev) {}
+static inline void led_trigger_remove_hw_control(struct led_classdev *led_cdev) {}
 
 static inline bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
 {

-- 
2.55.0

