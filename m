Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E562F8E82;
	Sat, 18 Jul 2026 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394638; cv=pass; b=kkSmwqFzgIQAZoUBX5Podf6x1ltquJJgyP6sjO5TOJ5PEqMwpsHWrt4dwbtRYyY5DQp2/IXJwmRc3rU5syPR2L3S6gCTE+HMCN6TgBmITuGr9We3fq6K0B+7n/LrQF/IQfWf92aNq0U5+H4DWJhFvqj506asBfPuSQjxxyKEGUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394638; c=relaxed/simple;
	bh=mMn5/gAcfXIS2dHn1eXIBVFDG7SYtH4xeqLKKDH+b/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXyQRbmjF9+nGKnM7BqoYULgKlPENZxbiJrf6MsefCcX3NwBVsQ/zZ/3nqien5mf0nslMpTDevvv9S5f6MAX4giTtiHBh1qX8tdehYX1qYYfw8JRRAFh9xlCJp5Ooh4R3PqqMFhzRphtwOAcrIj86JxhblstT/+lYBkaO9s0tKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Y5M8bSnq; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Y5M8bSnq"
ARC-Seal: i=1; a=rsa-sha256; t=1784394545; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bBdrYEbmtwqeFXoYwnqK51S6CD3jrmnZH4ddjxzUB0cM1wCLZhIvpeh3vYa8a07yQI8c96+2/yUVKdOMjU5WIvo3Pp31YGUX6jSfFHL7KCThY3OZ35Aw3M4s50SNDyM5jW8KyGRaX3gf0aYIu9j2qSTuVCvPA42on1H5xJ8jEvI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784394545; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a+eZigGV0AFd+mJMUPLC0jjiv54AsqNFdGiskTsot5I=; 
	b=lW087ToINOExwvRoBmQnvukl86Cfor315tMWMJ0ZcKRUp5b+8aTUsR2ze8NhREdFfAFDMbISiPQDIXrLJdYd+8cN5O+khLF6H/47kDRu9YwgXt5gH0Y1A1U3LH2flFTUxRFoW+vb4niuJlfmWGcx6LT9ddC79KVdYn/uv1xdqYc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784394544;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=a+eZigGV0AFd+mJMUPLC0jjiv54AsqNFdGiskTsot5I=;
	b=Y5M8bSnqQpqv1vHUxZg22jh9yej8InBAvlixPkocBZvq3lFCRqR59qNx5ITqvJ7w
	4TTOGH4a3IuQEyiVQmN9h95JSR5G2I/zMeabQ4lAfwiI8BYzypZTtWXTi3WkxV6veMn
	InZ9D5Qaao/2q1IIxf6/CO2sBfZ6Cs3VZlmyPlgY1z7uB2WwJBJRgJQSsfhuNvc2EQ/
	+jR3CBkYuShXu0729ndnPrfGAXJGKgnMzAXZvi5Oa3s78XS22+8OjAjdoOKNMLXLIBy
	YHqZUu3t24hujh87E7reZBzBHwAHLv1uWQfnVA/qUTNQfuiBIyoF1VnmRR8Ml667nVQ
	0xUewVkXrg==
Received: by mx.zohomail.com with SMTPS id 1784394542020638.1174262743658;
	Sat, 18 Jul 2026 10:09:02 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 19 Jul 2026 01:05:21 +0800
Subject: [PATCH RFC v3 04/11] leds: cros_ec: trigger: Implement offloaded()
 callback
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260719-leds-trigger-hw-changed-v3-4-5fb55722e36e@rong.moe>
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

