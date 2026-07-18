Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6660514A60F;
	Sat, 18 Jul 2026 17:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394761; cv=pass; b=NiDeW4dYQwSm14/3psb8GFc6XqKE328VkHWx8yZhl46ijeGG1rdr0ZKxAGLo+CCIt7g0xfTJYqTg5z5nuUzGpjSJUOOKOD8msdORF80w/2O0aBpIqNwTVvuPy07eQNF24CCk+LZBL8PxIfXXYjpPW/UzlISCoLRE3nPWklD5vME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394761; c=relaxed/simple;
	bh=NMopLgYmeCiGKilNAjzcDm9iFIh3oX2+PU4htZxSk3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svPghsabRB8Az9v/FR5vQNmj9aY+EPLbdiUeDsHVmYL29flnjFXUfWljUJnZ1rDaC/H8KxwYLxhSbJJCX7ieYmRYHc0ir+E0GM/QwEWrORllH+1JbGNAvFFJw9VtHqJsFY6Aqkx8qKOOtkLsCjFwZ2BQ0Slo34qGVTDxO/kIU1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=hUi/UMh7; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="hUi/UMh7"
ARC-Seal: i=1; a=rsa-sha256; t=1784394585; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JPmb+rydMrHXk2F0MUTFz82FR4f3VbulMgBhxRpGGLixzIsTWfXf6D9iWQebvjKYhXlV6hCzH4z/gDKewvBo9f76jGDs6BLQ1hWXz0KX+u0VF9k1z2akVreTr2nn1GadI7b3jRxgysF5qSAko+HWYTU1pd9//TqwV2ZLkjFtqEQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784394585; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rqv6Wi8gxxkrU5PPJYihAPAEPRWqEV+y5UZDjaSo8+o=; 
	b=Nw761KG9zeOzeVUzowk8TDv3lm8/qL/BM2H6hJg1oacveSsOtrCdMCXeYsMPzbhs7KLxHGB8QG7f/aFIMRSKxHN3hi4m8PyPuQ67fXubEJ22cqCRJWa70uctOW4zSvn5WxIswq5auFa2QEfNfLxX/WLdC+g+86oT0nutGMaz2Gs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784394585;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rqv6Wi8gxxkrU5PPJYihAPAEPRWqEV+y5UZDjaSo8+o=;
	b=hUi/UMh7UrSkk5NBLES0x+hIw471qS3LjLCq+03cuNGOgPRJZ5FXMJtd3H983mzl
	8kD4/203JcwJDpnIL8t/MeQjig/NWn7lUhsGErN9FpmBNfztP8Rk1YDfqmA0CKGSxaE
	iYbqSFur0GXXv0kZOdqob49rOzCcAyhJQWCQJKJLf6G6lLMVqFHtdHLFiqRswIce0Wi
	5XANoTOJK9gMTDLsW6X7sA0rHuwLlAooD1dd1+OFkZTjpMWXTT08PEW2ZsXlFVQQlfD
	WHYZDIMKzR6RNQg+P2efpQyvfEGkxagJAc70LkbKf4tzjkFZuIrZopzedkgNQ84Sbdz
	A8r8yLNegA==
Received: by mx.zohomail.com with SMTPS id 1784394582729398.6970573466119;
	Sat, 18 Jul 2026 10:09:42 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 19 Jul 2026 01:05:27 +0800
Subject: [PATCH RFC v3 10/11] platform/x86: ideapad-laptop: Serialize
 keyboard backlight notifications
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-leds-trigger-hw-changed-v3-10-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
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
X-Mailer: b4 0.16-dev-4217c
X-ZohoMailClient: External

ACPI notifications are delivered in dedicated work contexts and may
arrive simultaneously. In the following change, much work will be done
while handling the notification, which could lead to potential race
conditions.

Introduce a new mutex to serialize keyboard backlight notifications to
prevent potential race conditions.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 5aa2fedb8472..66e16abda5e3 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -26,7 +26,9 @@
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
@@ -228,6 +230,8 @@ struct ideapad_private {
 		int type;
 		struct led_classdev led;
 		atomic_t last_hw_brightness;
+
+		struct mutex notif_mutex; /* protects notifications */
 	} kbd_bl;
 	struct {
 		bool initialized;
@@ -1720,6 +1724,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 	if (!priv->kbd_bl.initialized)
 		return;
 
+	guard(mutex)(&priv->kbd_bl.notif_mutex);
+
 	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
 	if (hw_brightness < 0)
 		return;
@@ -1745,6 +1751,10 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
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

