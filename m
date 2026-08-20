Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E18546D091;
	Thu, 20 Aug 2026 17:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246824; cv=pass; b=mIU0E2ssSMzqeCMwNX+AXwtlg3t0cwNPoXkmbkb9V52f3OwXuDt7r5dzIfrVo4tmFfH9IhilwmaJRev+ieHSfAnthPcw9Ke/IAKP0LD0urdgYmR+O3d0B9oJrS3g/WNrkBO1DMoqvlTWeCl/MSOj9ndgkgtg05B+LquLlk98ync=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246824; c=relaxed/simple;
	bh=uY3aJ3V4+uRDTupkVozUZkTeHtIIg0wpkvwjj/3sMQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q80H/uHjmDJBUyBRYZ3g3zKq9vsZw8PyvdU7D5LKSBZSRhGwuYJC38Adx0OaYvTz20g8lbTb6fg+SlKHWOKpV/TA5tCJz6smtFuYlQtSixX9W0HYD1FV+X40rmbAkwCQZoOhxtHaU6oWSv84ChZ1psa1DP+yM75Mex+038V/RQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=YYMUnnDo; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="YYMUnnDo"
ARC-Seal: i=1; a=rsa-sha256; t=1787246681; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eWu/AA63DVZBiEzPsZC49MjUOMH3CP0LPaMwPbWYEI1+85D0XuGL5iJYcqXFmdSq4eB4VXCeT4/cZgcpbGIszrJKT4kZJm1NnjUfMhDYzWKO+u15z97N2ky1MNnmjLOBJJvSo2Na0+ukvQm88FyNLHyKZPjX2Q4uYIh3EEqGo2E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787246681; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lGz2Bk0e2fbk9+jSApLZDtRQo06iFi5Z89c+Nobi7ag=; 
	b=WpNRgwxIqgeixf2FucO0wxV3vmpfDzkGE/QB59lOc85rQ1TGmrlzzxDUQ0I171pncih24+dPjINoqcl0jv9VNVhSHWV4BrR2UViROj49Mv/z1oHoihWWZFwUXLC6Jc6TjVEFO4cazBLaOZfjxuO3Dv0tjh2cyZ0ZQCT7xmhRan0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787246681;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=lGz2Bk0e2fbk9+jSApLZDtRQo06iFi5Z89c+Nobi7ag=;
	b=YYMUnnDolYM6Q9fDvflMf81M70UGjhjtOvWl69AMoW8wsqCLZymu2FPjTg1Of7q0
	4jR59k3E8cH9MjJZAtxq9bGUHQfyVlm+g8TCmigg1F14FBoZgBIlZZoqvn2U6iTWDH8
	iepdasH0nQEYhASd2k1U8UeiTvkoNHw2J4KxO5pT+7AxU870em9otClYnH1IUnrUB0K
	Dt8ApmyU5gKOqEuXv7cj1kEb4z7l9KUSJ6jv8aTsHIEEiNAJJ38EelzgAzDSeMLa7uN
	z5Kzqr5afRGmTxMxtx96lTkaQIUwYt8QfCNAQEIL0HYnDhsLFedxHdsRJGwoR21Xxy/
	tCOfCWTR5Q==
Received: by mx.zohomail.com with SMTPS id 1787246680152165.46997538353605;
	Thu, 20 Aug 2026 10:24:40 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 21 Aug 2026 01:22:06 +0800
Subject: [PATCH v5 11/12] platform/x86: ideapad-laptop: Serialize keyboard
 backlight notifications
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-leds-trigger-hw-changed-v5-11-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
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

Introduce a new mutex to serialize keyboard backlight notifications to
prevent potential race conditions.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
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
2.55.0

