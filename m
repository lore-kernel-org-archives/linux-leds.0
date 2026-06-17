Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B5C4BC029;
	Wed, 17 Jun 2026 16:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781714992; cv=pass; b=gPE60piFzJOtWNo0QCuxo+JLbnJ04X26vrtZR2v0iuX++C7Mu+RQZiX1nDq0Nv8Z9TDxvvPr7LFTLA+ViXlBwQP8CHJahOM/QhbaqV+03e6KscxD4WKrUxIZQsFXyCGDRyVnz3uIXVFFYw60Gc6f079Dx/Pzh6H0xQ1TxvsQPp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781714992; c=relaxed/simple;
	bh=5Tt1avTvetKbimJ8doPSMz7cZ2c520kmdvjnH/OU8ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fssr5JcXqD38CWRWL/2qRQD7/0FJ6XTkFA9Ij9lrPwAG71l3gXx4UO2RJXWdrH6HqTkWh6XUMx733zK6YkWVJYi8mCqVOSzId6t95KQ99EbF7lcBUSOSdHNM//dIp6w+wZgTDOkfX3/MUHd4HeaJLl4tTpjMELSehaqccJzdqfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=D67mXQ02; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="D67mXQ02"
ARC-Seal: i=1; a=rsa-sha256; t=1781714967; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TL9u8AJXPfcRsk28KFsRHlFke0J3p+U/NShsHaeOCrI6bI2K112I/sv72h1O0QZ3W7wyf+xN/MMD+92Exslb28ZARAjClnXDZHs6bWDqTI/xAjgJxNbGJaQbswNyaGlwTTZDSR8Wivprv1Zu5wH8rFax/LZ78ceXVUrzws4WRcU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781714967; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IiSpZGlgQmvWC/OMVHpgWka2FRzjW2m2+L5T4ZGPX2I=; 
	b=mMnXN1QkTyoxOeVxaL73xjczGKolev8FK4APv7UTuPYGHfdYFYTpnMqVi2GiyRqcqDA8iiBa4B6SAPy4Ve8wptqIhxyuU2CsoC1ZcOtafNI5KTZPrMRTff1BmwB3OeI6EFebAgHFfdmga13PpmrfB0Dy++C7LuJ+f7KLh4nNkCI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781714967;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=IiSpZGlgQmvWC/OMVHpgWka2FRzjW2m2+L5T4ZGPX2I=;
	b=D67mXQ02elmD1mLSIo+ndvcncDAeZSGkJfRdUYIIhsOnpmz5JFPDCAYsz2kpgjoM
	0bJbLnMRdgYhYbl/A9dckycaKxOKOhtqN9PZ0108RW7KOY6y2Jp8P1letnvaQdsGwDm
	SKPHfOBnRzPpLp/wHRkLx/Von8NzGY1gFZkBP4AkysKZ6PUtq2nA9+JJVA3K6KvWk7c
	Obus7UqGX9UuCLO+P9AvBbOKBzhywJuN7bHdaEE7c4icXzoyT1xHOMN1lyEvB+bbrWL
	HRhuVX17UNkoJRaUlPC4jW9OTZYUJfwMOVPEEw0X26P6iQT1+ysTi4phmaPuknKRjMY
	gYhqij9HAg==
Received: by mx.zohomail.com with SMTPS id 1781714965764635.0802752412651;
	Wed, 17 Jun 2026 09:49:25 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 18 Jun 2026 00:47:58 +0800
Subject: [PATCH RFC v2 4/9] leds: trigger: netdev: Implement offloaded()
 callback
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-leds-trigger-hw-changed-v2-4-c28c44053cf3@rong.moe>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
In-Reply-To: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
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
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

"netdev" can run in hardware control according to hardware capabilities
and trigger options. Implement offloaded() callback to provide its
hardware control state to the LED core.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/leds/trigger/ledtrig-netdev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 64c078e997f2..a26109ca4b1c 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -754,10 +754,18 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
 	kfree(trigger_data);
 }
 
+static bool netdev_trig_offloaded(struct led_classdev *led_cdev)
+{
+	struct led_netdev_data *trigger_data = led_get_trigger_data(led_cdev);
+
+	return trigger_data->hw_control;
+}
+
 static struct led_trigger netdev_led_trigger = {
 	.name = "netdev",
 	.activate = netdev_trig_activate,
 	.deactivate = netdev_trig_deactivate,
+	.offloaded = netdev_trig_offloaded,
 	.groups = netdev_trig_groups,
 };
 

-- 
2.53.0

