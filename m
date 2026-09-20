Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026014746CE;
	Sun, 20 Sep 2026 19:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933501; cv=pass; b=HrSs3oz15yxlRCMubd9y4fLitqVokom1CoabJE/F9vWHYTpkyLU7WuX19S03KNQUFFSadlJTHmHp/K6l1jNJuxoEGsvAUU3hxT2s6HAVHeWd9lQKFe6Fnu94ovW2q2Jz+yt0hRo+RanTKKNtnXrgdXBXzDAcQJPsshy2zrWeEgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933501; c=relaxed/simple;
	bh=kbWO3d4W1V5pmzBTou6J2PpxmnVkxPo0U0r7mMtvvyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQOQ3/pX2tEjSUG/5xTS/lPg/Cjpk1hNZ7/czCxCWYGDqboKyQqGnCYElmkBOIhCOPc6d26piPqkC1WXc+VpK9X7uXSf/9wBbkdm2gRy99h3ALIeSnxFPgcMt42CxxtdhN2fcGe5fn7b+8hIKDEYaUHHAF+CfIQ9fclyvQG6B2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=pinLuAV/; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="pinLuAV/"
ARC-Seal: i=1; a=rsa-sha256; t=1789933279; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hs/v4ihtEGyYrbQEcB8HklE59/9V4TVf4jj0/6w7OdlvS7eaSUb+TM+CbC01lINQMmIXUHYzp1dFwliFfiT5Y1uAF2kj6LYkIWf3BWVK7PG72c5TnjV+K+/DaF1reMXBjqpKMLpZF/xlpHa/Vr0yVo5KBP/mac1zEiPQKWNf8Qg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789933279; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ToI18bR9XJY1UTByBrP+FM1o48uVmfnxpVfIbtodrQo=; 
	b=RI4wjD0hZ8TQ93hb2egfeSzr63XoMmfYmsbCIJ1/zGQmSvFUbfPxj8cYVIUG6Rb6CYSB+SVOCQsKLGF7aPUWwMiUHjwtwsVTGVrJaZxhsgZ4aRBr+DKdgKkzgUf6XPsKE68fqqgXs21imgJHUAfcJHHOkOURGozGVB+gemKZxIw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789933278;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ToI18bR9XJY1UTByBrP+FM1o48uVmfnxpVfIbtodrQo=;
	b=pinLuAV/SH1jMBNJ5IheFyVpbGhSsPOKtnpk5TehEaVQOcSXVbf8kDUvfRpPfQ+X
	Qg4Yi5oCf2R0t40AFib7lTYwZXyUG5EbL3kAe8oY7IbrUKfhWKeH8GN35zggiTfOBBw
	RZbGdrTy4CYUKemegu4qM0EKo4hXQ5g0C81bbzLb3QQepFoFqtwyodcrUrbB5e2Ggg+
	fmEO+BOS5iMb1HIrIYTdAAMU8L7NWWYKFPzRXIhlTWs/GYVSxPJmNAngMAUYee9rX9j
	jVupZQylIyjhdV+gjnxPCViPg9/0W4mS9ZdxeCtVqZ7wtBFOa2knf2HsYkurMm3T+Yl
	QG6h8VxoOw==
Received: by smtp.zohomail.com with SMTPS id 1789933278052721.8772421082251;
	Sun, 20 Sep 2026 12:41:18 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 21 Sep 2026 03:40:25 +0800
Subject: [PATCH v7 11/13] platform/x86: ideapad-laptop: Serialize keyboard
 backlight tracking
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-leds-trigger-hw-changed-v7-11-fe3cdb6dec51@rong.moe>
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

ACPI notifications are delivered in dedicated work contexts and may
arrive simultaneously. In the following change, much work will be done
while handling the notification, which could lead to potential race
conditions.

Introduce a new mutex to serialize keyboard backlight tracking to
prevent potential race conditions.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v6:
- Protects ideapad_kbd_bl_led_cdev_brightness_set() as well

Changes in v4:
- Remove needless #include (Thanks Ilpo Järvinen)
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 8213524504ee..684421ba53cb 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -26,6 +26,7 @@
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
@@ -204,6 +205,7 @@ struct ideapad_private {
 		int type;
 		struct led_classdev led;
 		unsigned int last_brightness;
+		struct mutex mutex; /* protects brightness tracking */
 	} kbd_bl;
 	struct {
 		bool initialized;
@@ -1643,6 +1645,8 @@ static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, unsigned
 	unsigned long value;
 	int type = priv->kbd_bl.type;
 
+	guard(mutex)(&priv->kbd_bl.mutex);
+
 	if (ideapad_kbd_bl_check_tristate(type)) {
 		if (brightness > priv->kbd_bl.led.max_brightness)
 			return -EINVAL;
@@ -1678,6 +1682,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 	if (!priv->kbd_bl.initialized)
 		return;
 
+	guard(mutex)(&priv->kbd_bl.mutex);
+
 	brightness = ideapad_kbd_bl_brightness_get(priv);
 	if (brightness < 0)
 		return;
@@ -1700,6 +1706,10 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (WARN_ON(priv->kbd_bl.initialized))
 		return -EEXIST;
 
+	err = devm_mutex_init(&priv->platform_device->dev, &priv->kbd_bl.mutex);
+	if (err)
+		return err;
+
 	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
 		priv->kbd_bl.led.max_brightness = 2;
 	else

-- 
2.55.0

