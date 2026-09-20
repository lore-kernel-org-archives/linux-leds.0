Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1599347532E;
	Sun, 20 Sep 2026 19:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933311; cv=pass; b=Du7jCajVUVqiaS+zXZ7axfohXhYC0WoJ0G+sfPge/ReGY54376fcuSXms7bqUEeIiz4Lp9chzsV3MICIRGTMdsoTM95GiTxwlDIQdm2jXJK0uYFl9UCSWVks2uH1CYeCXSvni4sTdCr64QSYvM1hvXX/NuT3Y9fhUNDQokd6Bdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933311; c=relaxed/simple;
	bh=0AXEy5KeefClAqrLkM2xK+utd+ujlnIlxIBgrEFv0Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZISXeRDzmAwO2Ynmor1mMJTyGADtDNfwOEYl8oWOz1mDkFoevqJ0EXYozqwpHwW6bGOzlYxTWTTumR/LzjRbNjedFNd+qBFUN2LIxD5t/d47p9c5cCR0plNT+rGvoI/ovZsTI5UPgVDJ+UEejUiSFfZxNJTxWLTBsa8mU9oV23M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ogPO+H+i; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ogPO+H+i"
ARC-Seal: i=1; a=rsa-sha256; t=1789933230; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fKDzj1lXm6K3wxf0CdOCnulRT6o4FgP3Zx4i+M16NwZr4Bxj/jx1zsVhhV+9PPW/vhXk4pImBh5Le1gOHuXwM2wTbqJkOhT2wrrBueqs1ErOJHf0dEOmYYOaFMmcIQfDYYtIHXkEgS0Vl15JA6vBfFE+0HxH+e/fuF+VnHDerOM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789933230; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4Mtz/AFM80jv4Dc2UsakzXZvBkH2sDnyNjioBHCW4Ms=; 
	b=We96kL0BwlalPJpG69WonsxRioTU4PDliieyO0SzJoR82KvbwgbYQH/ymUOoILYQ1W5w6PHY60yjEBcC7grUQNFELBcY1E0eEBAZxUM12g603pa7ZxNb6aGP319/KSdcG4DZu4bxxTokzCeaWcRTIohuMoliAxUFZQoxCLHeHow=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789933230;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=4Mtz/AFM80jv4Dc2UsakzXZvBkH2sDnyNjioBHCW4Ms=;
	b=ogPO+H+imsDs7oJC/nnstQFbY8EE7fYU2ph7vMs2SjiU28B4v2xJE6KoPBpTP3IQ
	gts//yOR2w8QSq/k+XC4ee0MM5V4UZCbMUB91gafQ1U6RrTqMAC8NRugC7Chk9KZoh0
	iu3GVdAPONDlxSfaHb1EEn/uVzw//23GWVtAsWhNTTd4d8Ex1cPHjUMDjy6I1G9zwVa
	ENwjzEnwwzs4agKfUkXNmRNdCbg2HpUlUbQUlFzxivMVP3IiZmQSBJV4N+eppQ6I6bD
	nMkW4+2Yu09LUdZpc6czGAiSn9iFVLhy8/koYBEicnM+BvHXGggT20DTacfLY/7e7L8
	dmKIe4H1nQ==
Received: by smtp.zohomail.com with SMTPS id 1789933228804856.8834715894247;
	Sun, 20 Sep 2026 12:40:28 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 21 Sep 2026 03:40:15 +0800
Subject: [PATCH v7 01/13] leds: class: Always protect brightness_show()
 with led_access
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-leds-trigger-hw-changed-v7-1-fe3cdb6dec51@rong.moe>
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

The led_classdev_register_ext() protects transient states when
registering with the led_access mutex and relies on all sensitive sysfs
attribute callbacks holding the mutex to prevent exposing transient
states.

The Fixes: commit broke this as it accessed trigger_lock without holding
led_access. Fix it by protecting brightness_show() with led_access in
all code paths.

Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardware controlled LED")
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v6:
- New patch in the series to address a concern from Sashiko
  - https://sashiko.dev/#/patchset/20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=7
---
 drivers/leds/led-class.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index a51b0ed53886..4259533dafa1 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -43,13 +43,13 @@ static ssize_t brightness_show(struct device *dev,
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	unsigned int brightness;
 
-	if (led_trigger_is_hw_controlled(led_cdev))
-		return -ENODATA;
+	scoped_guard(mutex, &led_cdev->led_access) {
+		if (led_trigger_is_hw_controlled(led_cdev))
+			return -ENODATA;
 
-	mutex_lock(&led_cdev->led_access);
-	led_update_brightness(led_cdev);
-	brightness = led_cdev->brightness;
-	mutex_unlock(&led_cdev->led_access);
+		led_update_brightness(led_cdev);
+		brightness = led_cdev->brightness;
+	}
 
 	return sysfs_emit(buf, "%u\n", brightness);
 }

-- 
2.55.0

