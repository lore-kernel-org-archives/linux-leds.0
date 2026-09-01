Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEF848F848;
	Tue,  1 Sep 2026 18:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286501; cv=pass; b=i7I+dGL/OIQHeN5iUcAYCdS46dNrLO6STNSptRK7e84jnU6y4t2zkvdCHk8ZH134q3JmjtdNFKGl43tXfuLmouwgNaeQ8R50hubOLCmWU0PAoc2dtabvMJFVhq+fo6cV1kSLUGE5yjaf4IgSNiXDZxhtqpoDdDd6bXfTObWREm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286501; c=relaxed/simple;
	bh=kbWO3d4W1V5pmzBTou6J2PpxmnVkxPo0U0r7mMtvvyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A55IcZp6PXhX8IdG59cvkCyptOQN1VMKxkFy12TAZEGDIBT4vCGG+11L3oSX2vYl8KEOuHULLsdjoucLMGHM4hxkPTIAnZm/kDDBYtC/25NTrcANe9xSd7pFrSgSS2eljsPXVCuyPsZzY2fe8v7WUmV/nM9gKXSfeA6pvO9cU8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=j7VktOIt; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="j7VktOIt"
ARC-Seal: i=1; a=rsa-sha256; t=1788286306; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wks847Md3Fl7Y5yGmyWcr+Wb6AI+nMdN7A760QLrTto/680wnIM+jEEYVyjwWe/sZ8v3On5RsGaaJUuzk3aOwihxOhm4951Vy1ysbBAf4vIpaL/V/Wt7M+wyzzGofRV1xlIOfrVfMRg2MGsSAUYZ9maQEqgQIK7rrSzk/yQgwU4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788286306; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ToI18bR9XJY1UTByBrP+FM1o48uVmfnxpVfIbtodrQo=; 
	b=hFf9rpTuwHEvVjMWVLeVCVPG970OVsZ+z5efl7yx9QZ7Z9m1CkKgf/1d+bLtHzisEq4zF9ITPV/jwZZqDMpIBf3TwOkNQhQd50kmVrM2U5fUxePkc1H0oYiFPkVmb7Zd92MMb4q+QmNEmYaZhBkahKS0EcMe3FrguMhjC6j2A3Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788286306;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ToI18bR9XJY1UTByBrP+FM1o48uVmfnxpVfIbtodrQo=;
	b=j7VktOItX7x9Z7RS/Fn+eEeodM16J6jXm/S5RSr3UuaidLhusDJhMrCPR8W3RkKo
	bddw4R28rOqOIdx85ncRhdyAUyR2nMKDPSzxYy8c7vf46Ukj/+uWQmrZ02JraC3M65B
	60WVKFd6c6rFKY+0Yn5Tzg3mZHllCEAH+yk6Uc5N4RD9R+VsWpSZlgT6xTFy7ehQ/Ah
	LZUUHvk9Wopy3wMvRENc2v0F2IUUanoZ/ymL7aDbjryDMzzh85vvLPmZ7+lKeAmpFqM
	jLgh+p4lVdOWFKPU/jTbuAIxV3ADyAV3qRVdKQ1idhDK9a17C1igA9dRfyBgIcUbfm9
	0xjy2XWuaQ==
Received: by mx.zohomail.com with SMTPS id 1788286303729832.671594036358;
	Tue, 1 Sep 2026 11:11:43 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 02 Sep 2026 02:09:29 +0800
Subject: [PATCH v6 10/12] platform/x86: ideapad-laptop: Serialize keyboard
 backlight tracking
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260902-leds-trigger-hw-changed-v6-10-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
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

