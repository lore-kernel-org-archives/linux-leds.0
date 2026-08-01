Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBCA3B27F7;
	Sat,  1 Aug 2026 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605345; cv=pass; b=C6qfVUoImc4AdHSMFv0Req1am0tHnqcSGc1z8tiFJd+zr7yvsVAa0vbJIQGKrDOhiCYT0q4w0JyZq2pW/TgSfTii8/vQGYbPo4LkC5BHOBI3YcgOdAGQinngat4blyOOKIrL4NLA4mGRDQDK7SZO6wqVYxdrt3zf1VoFoXSE/ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605345; c=relaxed/simple;
	bh=mMn5/gAcfXIS2dHn1eXIBVFDG7SYtH4xeqLKKDH+b/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukR07KLb0XXCX/8ixBj/rE6O0KJ1kYYpUkB0sFGWJzqUzVy3N7xsYUeD3b1poT7vHGi3ZBHIRqzgOffM/1640YDIP/PvLE99rzYdgkjckpx4BtTjMLTSr3YKiWwr48M/QwOQxzS59IAPpPic5/l3Et4Q5jkhCY99TEx/CiO3MGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=cAMnNjKc; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="cAMnNjKc"
ARC-Seal: i=1; a=rsa-sha256; t=1785605299; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eaL+q9WNQI8AtX6qbsaCY+N1w+cvuFPOb5n7AlyZwrOZ5akkm4XExMpV6K4EFh2SaXfJBhtuToAXN2YgHe7rxN3/7BX4nRkv6coHxUq7sGOjKZb3D3rtHl6ewTiUQE2kt7xgbrWXRf3XHTs8HhhkhaO5YFLumm0AmgLDQfwnEag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785605299; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a+eZigGV0AFd+mJMUPLC0jjiv54AsqNFdGiskTsot5I=; 
	b=cLr+4AcaQPIby9RXG4FiObjSB6ZBudA9vsG9Pjpk800QV6LyuAoDqvFV/vWGJO7iDj9SdG3hWt4ta4cU1r1FVFdhO71ru5EFYjv+5FXYyk5KfE3SCbXMasXm4D47dpA7X8t2U65DwoPr8SQdC4iD4udieaQNKHZbq2qKqUD1taU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785605299;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=a+eZigGV0AFd+mJMUPLC0jjiv54AsqNFdGiskTsot5I=;
	b=cAMnNjKcNDXF+kWzigba568S+rFSG5pP0MnlhExD2nIgr9sOOUmLwwuVwy/fbMdL
	fvJkWU6Ova5Ou2u+Y64oq2yuGYGmTU0H4YQFcsBDBt9B48YoGk/eR+O9LHSTeUU+JZh
	1sou2WMTiqmoOJa8GXzxFuLIDqybw78/bckwrkOGSTruvfm5lfkGDJxBfahlUUSW45D
	EX91UNTeGb0aKycDQ9B1oMHC6U9VC5XOPtmjyRn45qyEIjvjtap+y2weBQaORipuHeJ
	0Im6sT6gT+y7fGvCJX6bJAxRPadMyUcNWnsDjdSUX8ZslEqR72bSNhOAtTFAxteojJM
	Mr3/HpLVwQ==
Received: by mx.zohomail.com with SMTPS id 1785605298239773.5699640455033;
	Sat, 1 Aug 2026 10:28:18 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 02 Aug 2026 01:26:48 +0800
Subject: [PATCH v4 04/12] leds: cros_ec: Implement offloaded() trigger
 callback
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-leds-trigger-hw-changed-v4-4-f97e2ca976fe@rong.moe>
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

"chromeos-auto" is a private hardware control trigger which always stays
in hardware control. Implement offloaded() callback with its return
value to be always true to reflect this.

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Rong Zhang <i@rong.moe>
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
2.53.0

