Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6454848D860;
	Tue,  1 Sep 2026 18:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286303; cv=pass; b=LXieOKv25fobsyMyib91/PV8nyO9fp66ilDbPDY3NTy66ksawTYXveddMYPflUOJMDGZX7fhL5E31cm6hUC/EFwQtcjJK7qhFeeNqTQGQMTW00edquXPYfuWs9bN+qXOWTGFdjwR4ZLcbEOnukC4Iia2yHSeXqA5OiKYQI/yRc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286303; c=relaxed/simple;
	bh=0AXEy5KeefClAqrLkM2xK+utd+ujlnIlxIBgrEFv0Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oi0A++Bcvlo2SVeKx+t+xQ4BO9AMyqXovHhmiltm01RHWYoB0H0ISLelJmy12m8sqIW6puI12ssTb7zNbAtcZg4STp0a0igms/hS+zLEE5iv+VOsx5EhD+Gw2DXjO86pORWum+gDlhSmSIPR/5ZoEXXLRvZhTalczUDb5gdZvnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ORtW3soV; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ORtW3soV"
ARC-Seal: i=1; a=rsa-sha256; t=1788286255; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MCk4MCHQPr1w6mcvkXeKDSZt+7FCe74OjXvB1HzdkrL27A/BlQY/iQjNgn2lUfwSofWV7WnGsYRAR/qn33K+umcCWKp6RQTnpbNFUxFyDS0kED1lu9OihMaxxpyqUtb5HElaIKlhON9bN9rWciDNC0f+Tb1STlhq1VsN7b/V5iM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788286255; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4Mtz/AFM80jv4Dc2UsakzXZvBkH2sDnyNjioBHCW4Ms=; 
	b=YMuayuKbkVdG7ouKJBSUIV46MC31W8dOloeBncxOvaTg4wO91w46gkFMsGqnwOIVk0y5mjmyJxjXGiewvkxEGUprklEBNVlQ+MRIkbDGlPLDl0BE9oooURUIBaouRiMF7naVuC5xS+RCHhVMDxcAiCfZdWgWdITQU8tSiYeZKTg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788286255;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=4Mtz/AFM80jv4Dc2UsakzXZvBkH2sDnyNjioBHCW4Ms=;
	b=ORtW3soVbFlTo1XUW14e0bnycwZtA77jIh+Tq/5ySeYGnDevIXbnrj/sN9aq6cgC
	jV8rPRpq7q88I6ZmV3KqbQvcjbNSdji4Jsab6ckgzO7uOw76NaAxJ3+CKO3+DuKcTk7
	BvmtHyLSaLLZhfRAvCteud1OwzIr3wpSHjm12VxcO6Gz6JU9ZtJvbMe/OSOkRXascfD
	TpC9ddIUzX9do7lFeWxFCEgWUISwRrran2bCUqNhvXRVnZJBmk8CFPe/pMTK1BvMdcE
	FC0N4h2g9qvl972MDpccn9YJz/5VwXK4WY+TghmeARPk5y4zpVVhumCKbkLt7Reielv
	LgmFYjc48A==
Received: by mx.zohomail.com with SMTPS id 1788286254124334.97358507758634;
	Tue, 1 Sep 2026 11:10:54 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 02 Sep 2026 02:09:20 +0800
Subject: [PATCH v6 01/12] leds: class: Always protect brightness_show()
 with led_access
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-leds-trigger-hw-changed-v6-1-55693cd78877@rong.moe>
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

