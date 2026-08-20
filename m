Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C9447DFA9;
	Thu, 20 Aug 2026 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246670; cv=pass; b=q296iXu6qkzJv483iCgor6fGswqEdJDypQxfITI4vmL2JMslvfqovWWWuqhGPXIO6P6ktS+lB3Z8ikLa/3MFZlifimNGVtojfwc6cYkx/xfiR9NxcdM3x8m6Z/JkAZV4gCziRPU4xp15GezeUx/fT7OafVOjPglDaEN6FjUlPRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246670; c=relaxed/simple;
	bh=tQzq2e/OZO07GVyaZnP64MN4hroVZVa/p8NZJnL5htU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hp1GDTDmWM5vIlDMdwB9wzzU1CKrbWV3iu4hztILCyJLkpEEQmIgeyAm12w7Zu++d5qfE/YuSybAXqxmZgTK3kzwwlRozmrHiPJh5+5hCTMRTZDwszfBDo5lNd9x0WAv7K/shXidhQ3NcHBFWu5dEo83+sJPorOFbIrKH/LckF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=aLJC1use; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="aLJC1use"
ARC-Seal: i=1; a=rsa-sha256; t=1787246597; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aiyJBlq2tphcGAWBCIWNt3rkKLzwpx/x9l11f5yuB7i0zmfhD8bN+XIhE6vYhRDpbq9niOccyozgIqYeq7GE1Bo28YkP3Mpe7VSbKaMZi0ZFSrpEVYJonLkQVdn+TTKpLznms1fq4S7lw3Qi3cbkObZK+WRrhVEgiMw2on3TJ7o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787246597; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o/9KroW//cVN8v9Bs/iH3SM5mHRUq+jrbWZ3OD5IM3o=; 
	b=IPqsgbLQduBE+MG45s4FgQ+4SJMYUaEySFo3NCAjT/KTWO/FjoD7c15bHZM3/R4peifWBvxBlYqzJ5tSlFR6EaI8c6G9+Z+cE8K21Pu4EGv+Uwu8NunnHWQ3aWqvwE+x9Q5QFKjaAd1VnZZnbIbOq0mVLOnaV8VO/SL2ZnOUC1c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787246597;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=o/9KroW//cVN8v9Bs/iH3SM5mHRUq+jrbWZ3OD5IM3o=;
	b=aLJC1useWgEP4wDogdkQfQzVFMgmhUjqG0JX0vmrO/M98pFJbjmGd9/CgjNHz2m6
	HlIDhYTGFyM2w1DlQoRaH9Ex5trU9zLFXFd9JEFx9Qc7xQ309j9a3N+FXPMoWsQVtVp
	YiNpl1BNitEUBBKKmHfWNVALQFEYZkJbEAgIVxJW7kbPPztgpW60gi6JdMD4z6qaUJp
	lQQzzAgzg9Jg3jAKalbzsO//Jm75tby20jGMvHkYle+c0rDM82V2C5lv3+rM+ZQvvmb
	6xEEHP601x9lbtaSpVB+RFesY/IoypJFN8KFJ3D83DZhUKsng0bGJQQE3eIZcDLNIfM
	klfNx6gxNA==
Received: by mx.zohomail.com with SMTPS id 1787246595282104.31132602934963;
	Thu, 20 Aug 2026 10:23:15 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 21 Aug 2026 01:21:59 +0800
Subject: [PATCH v5 04/12] leds: cros_ec: Implement offloaded() trigger
 callback
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-leds-trigger-hw-changed-v5-4-3e00d6c4a936@rong.moe>
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

"chromeos-auto" is a private hardware control trigger which always stays
in hardware control. Implement offloaded() callback with its return
value to be always true to reflect this.

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
I am aware of a pre-existing bug on probe, i.e., non-idempotent trigger
registration. Since the driver is very platform-specific and the
relevant platforms never have more than one such device, the bug is
never triggered on real devices. Therefore, fixing it is far beyond the
scope of the series.
---
 drivers/leds/leds-cros_ec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index 1844d0cd5f52..6db83d015277 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -85,12 +85,18 @@ static int cros_ec_led_trigger_activate(struct led_classdev *led_cdev)
 	return cros_ec_led_send_cmd(priv->cros_ec, &arg);
 }
 
+static bool cros_ec_led_trigger_offloaded(struct led_classdev *led_cdev)
+{
+	return true;
+}
+
 static struct led_hw_trigger_type cros_ec_led_trigger_type;
 
 static struct led_trigger cros_ec_led_trigger = {
 	.name = "chromeos-auto",
 	.trigger_type = &cros_ec_led_trigger_type,
 	.activate = cros_ec_led_trigger_activate,
+	.offloaded = cros_ec_led_trigger_offloaded,
 };
 
 static int cros_ec_led_brightness_set_blocking(struct led_classdev *led_cdev,

-- 
2.55.0

