Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B20345CBC;
	Sat,  1 Aug 2026 17:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605476; cv=pass; b=JUKTuvcF8y0Y3ep9BYhVSgWKlJgycB8O0MeqBJzTt+1Vk9tDN3uAfthkY8iwRA+BgnGjb7YKwMssiEak0w7rHUv0Qy6AOkhzHzSkmopTJr5nRZ7vZm29Med8eUNLAazGzDWsfx9mKxlBE7k/A84aZCY7R8bWjRkXbtUGa/FQIZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605476; c=relaxed/simple;
	bh=sGqhc9c3LjJMGAuJmM5m8GI5olQOUex8o9CbDde+EE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DnhYsr+/UQKL9HuCsxRT/QBswDjHX6A0MDHEUX8xEpUVAbnb7iz+qEvwfPVR6XqTw9T2Ujy+zrTGJ+AkbKccHnKm5cROzEOsyignplEdoxMaabJL2vn8vunws5bZy/3TNue9Vswwt35hOEyKA2rCWFI9AKoz2xdHWikda9W79xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=jsHTZgQG; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="jsHTZgQG"
ARC-Seal: i=1; a=rsa-sha256; t=1785605418; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kS+sm4SEQ/O3OgvQ2ju1FR7EalA8GRxbcn10BKWZZFBE8os2iivS8gVl2A1wZCJc8cyatj1aotiplw0pSQUVblW4Lb0R1COXSVlBYgDS71gfNKDKf1YKC5dd+wyJIaKejluEQxqMVtdMDl9SPNS3ksGW6188Ffc1L23uKH4hQ2M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785605418; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5VIkISEQ1oqaGZkxeR21XL6CbLqa3/BIUXkKFJsbJj8=; 
	b=XA/qfpcAjDXJViXohh5Mat+pkIBU8OyLTJKDs1C2W5ONMWUFbyL2UfJjqZ6IspQ2knLMQ3a5ccFT9TQsj3UA3M/qD5tjoiLEIvRcQB0VDUKrs8Id8k/dfoFRyNdWjENXGKhTgz28OshvYvpTJ/j//0xReREuQWArxk6IztiMG7k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785605418;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5VIkISEQ1oqaGZkxeR21XL6CbLqa3/BIUXkKFJsbJj8=;
	b=jsHTZgQGWHC1BwrbYLLhrJahNmq0M4gk3gfcCDkfpZdHdsj8P3wReI9ssGDHnhkH
	7SmGJpTd1RveMCiNyKA2zn6vUmOs181FGtKW2drhmEW7US1fuGBVzaAUJRnMARUOduR
	BtGTys85364hGb8heXHtqzWt3DsDuwZtpwv0ViC17FfCFM05RKruyjmhfopodhO4+lF
	knNjQD/D66F7PYGqWwEFpHyeLjHHBkK5MlkbG6JykdDPCCNlI9tD4TNCkuX1Wz7A+8U
	D+udZQKTXSHSkhGu6XPcHfhHwPQt6r6BvtM9IFjHVwGutbm9T9S74xMgRG0ylnMJ8tL
	+WC26mteMw==
Received: by mx.zohomail.com with SMTPS id 1785605416066911.8663948050444;
	Sat, 1 Aug 2026 10:30:16 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 02 Aug 2026 01:26:55 +0800
Subject: [PATCH v4 11/12] platform/x86: ideapad-laptop: Serialize keyboard
 backlight notifications
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-leds-trigger-hw-changed-v4-11-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
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
X-Mailer: b4 0.16-dev-2f6f2
X-ZohoMailClient: External

ACPI notifications are delivered in dedicated work contexts and may
arrive simultaneously. In the following change, much work will be done
while handling the notification, which could lead to potential race
conditions.

Introduce a new mutex to serialize keyboard backlight notifications to
prevent potential race conditions.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v4:
- Remove needless #include (Thanks Ilpo Järvinen)
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 2fa2665f35d6..7f7b1e30c326 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -29,6 +29,7 @@
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
@@ -230,6 +231,8 @@ struct ideapad_private {
 		int type;
 		struct led_classdev led;
 		atomic_t last_hw_brightness;
+
+		struct mutex notif_mutex; /* protects notifications */
 	} kbd_bl;
 	struct {
 		bool initialized;
@@ -1722,6 +1725,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 	if (!priv->kbd_bl.initialized)
 		return;
 
+	guard(mutex)(&priv->kbd_bl.notif_mutex);
+
 	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
 	if (hw_brightness < 0)
 		return;
@@ -1747,6 +1752,10 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (WARN_ON(priv->kbd_bl.initialized))
 		return -EEXIST;
 
+	err = devm_mutex_init(&priv->platform_device->dev, &priv->kbd_bl.notif_mutex);
+	if (err)
+		return err;
+
 	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
 	if (hw_brightness < 0)
 		return hw_brightness;

-- 
2.53.0

