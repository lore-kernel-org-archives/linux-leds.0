Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC246495030;
	Tue,  1 Sep 2026 18:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286347; cv=pass; b=gvOYoC5Ugwd+ptXPhn0ZJX2/lBCLFhLRDyaM5FrjBoDjpEvTq+hDurajIbXU8Yl3Ja13AhyAZn6uFDTd5kEhYUVIVtIgGwU1jq15QJxJwlCKHtt4wWPrfZUNIEvzwDOqzAuJKHJOMOGKBo5RDfkfJ0U9km+HklPQKFmWaTuoU4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286347; c=relaxed/simple;
	bh=lnboi+ohp8VRcRfWzjJ5swmCtSfQdixjoOMTCsMww5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XzkX3nTUeDUkQmFH1Dp6etkwZkBpI00gfOZ5/HHgworXxOpxL5lMk/5Sfqk44kBmXI4QXvntUpoBHvAJ/Y095A3c8/pFWYLoH4igCcFZRMu6HC7UghvnnjE5ZgkvkZGpG7TBdcFl/JT7GpakRm+mFz5U2+7CO6bNskDkCUMTIwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=UWmpy31j; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="UWmpy31j"
ARC-Seal: i=1; a=rsa-sha256; t=1788286267; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nqIdoSJh5lGB0Rant59Kmh1WaBNXvgOz82qmzHEAG04g0taXNEGhcwDr2plBiSlNKLvAOskOMBVWswROyXnkqOGF3JJo9Lw62RNtsdjA7uog4RXHx696pcQl7WRBF0xoi+viypgtgbDS41O/U9TK5TLUuE06ha3GvSDeiZ52Eao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788286267; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LmmU2kTCSF/V/CfHUReHwmdyiQm15OpRydNnG7BSJaU=; 
	b=CZgx+onZyRrAG3lbRdaRxElDAhjjuvlXQQFAj9oU9yt7C7WYIfd7HfgGEGsnR9EI+ONzbNCjZJq/Vl4iiw2bc2UTq6ciryANzllYiH6LKi56IZ1DaZK7e2SZMDHpleF6XzXva12Z8UCHw+SiKcdeGepG9fbrNZQxDloWJEzoGwc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788286267;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=LmmU2kTCSF/V/CfHUReHwmdyiQm15OpRydNnG7BSJaU=;
	b=UWmpy31jrLmSCLJGe3NJNgWGL7iIFtAI2wErh7n5LV9jBmf/HNk76qGjMTnsUxD5
	jC2QSKT/CRn+pMmRdYFEGyux3sn7zyvYcX/y4QTwGD9Gc0PT2sLQnVuSXLaRXGnYsvt
	mjsbOOddAl3/734nnU1Cn1ZNNVyktsoZDfKV1BnjvFXwc1Y2VcJ1Dn8mjBpjxN6cbI1
	vAM8REOV/5DkPDyz31jfrAIth2SfjK5+luvrkE7Olgq/gnLnG3www4RPa5rJrFSz5jb
	th934j9Q/iGt9TeDmKauLFNuKouByyrkiOdvcIa75b8OInK69wltYiNHf27I1V1hT4c
	VMiPT1rY5g==
Received: by mx.zohomail.com with SMTPS id 1788286265118960.0913506634437;
	Tue, 1 Sep 2026 11:11:05 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 02 Sep 2026 02:09:22 +0800
Subject: [PATCH v6 03/12] leds: class: Remove hardware control trigger when
 writing brightness
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-leds-trigger-hw-changed-v6-3-55693cd78877@rong.moe>
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

Since commit b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of
hardware controlled LED"), the brightness attribute becomes write-only
when the LED is controlled fully by the hardware. A write-only attribute
is very confusing.

Moreover, most LED drivers set hardware brightness innocently with the
side effect of disabling hardware control, but the hardware control
trigger remains active, resulting in the software and hardware being out
of sync.

Fix it by removing the hardware control trigger when writing the
brightness attribute.

This should also match the semantics of hardware control:

    When the LED is in hw control, no software blink is possible and
    doing so will effectively disable hw control.

Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardware controlled LED")
Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- New patch in the series, integrated from https://lore.kernel.org/all/20260712-leds-hw-control-brightness-set-v1-1-1de593b09d26@rong.moe/
  - The following patches will improve __led_trigger_is_hw_controlled()
    to include offloaded generic triggers and take the advantage of it
---
 drivers/leds/led-class.c    | 3 +++
 drivers/leds/led-triggers.c | 9 +++++++++
 include/linux/leds.h        | 2 ++
 3 files changed, 14 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 7110bfbe3b83..39cc2f3ea63f 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -64,6 +64,9 @@ static ssize_t brightness_store(struct device *dev,
 
 	if (state == LED_OFF)
 		led_trigger_remove(led_cdev);
+	else
+		led_trigger_remove_hw_control(led_cdev);
+
 	led_set_brightness(led_cdev, state);
 
 	ret = size;
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index bf2543538ed0..804a04b326c4 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -287,6 +287,15 @@ void led_trigger_remove(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_remove);
 
+void led_trigger_remove_hw_control(struct led_classdev *led_cdev)
+{
+	guard(rwsem_write)(&led_cdev->trigger_lock);
+
+	if (__led_trigger_is_hw_controlled(led_cdev))
+		led_trigger_set(led_cdev, NULL);
+}
+EXPORT_SYMBOL_GPL(led_trigger_remove_hw_control);
+
 static bool led_match_default_trigger(struct led_classdev *led_cdev,
 				      struct led_trigger *trig)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 46ad2e03e1c6..d778709f5b1b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -533,6 +533,7 @@ void led_trigger_blink_oneshot(struct led_trigger *trigger,
 void led_trigger_set_default(struct led_classdev *led_cdev);
 int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trigger);
 void led_trigger_remove(struct led_classdev *led_cdev);
+void led_trigger_remove_hw_control(struct led_classdev *led_cdev);
 
 bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev);
 
@@ -586,6 +587,7 @@ static inline int led_trigger_set(struct led_classdev *led_cdev,
 }
 
 static inline void led_trigger_remove(struct led_classdev *led_cdev) {}
+static inline void led_trigger_remove_hw_control(struct led_classdev *led_cdev) {}
 
 static inline bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
 {

-- 
2.55.0

