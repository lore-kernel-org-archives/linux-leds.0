Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DA63B3898;
	Sat,  1 Aug 2026 17:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605306; cv=pass; b=flOmBhbCIK9aGKWhxditMPEts2lV012nBD5T6lmCXnnb32yKBtwa/9uDtl1HCXyDVe0Wojffp3VK8Sl7extspbzD68OPrfCHCUdcWD+rJrKxC18Uo95gJoc+1Hzk6kJkaX6B938LNXNNSyjrnCReOBudidIbTPC7wHM0hYzt/10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605306; c=relaxed/simple;
	bh=mTd1U3w5kJP9KL/eJmZjW33Th2AsNX/WrKXs3Ams+Jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gN1t3T+eRZQnv16EKZNEnVQXJJaP6N+jn4nvOiMiGbZK2xwM0AGLAQS7a4+Fs14nA6hgjmow7uUOU6gcyj/NWwJqSQ2pkrAUrGRpuyU/ceK9h6t/VQxLEDCR6gk+tsAoOgUlbVfqUvMUCN0/ydMpvqvXksPuahWyytPs1Y4A9y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=CJLpU2P7; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="CJLpU2P7"
ARC-Seal: i=1; a=rsa-sha256; t=1785605273; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P619+K2gTEK4CkDrek56G1uiaTxVWmUEJ4X8PYBs4rmaGbE/UeF45ez2yrTLETVLjdBB/jcp58lKlFxFwxgEhZwp82qY7n6U1IdoFma3Xc19cmzPx+KcI/uomOJdaUQWnap2PpiJeihY0r/NHhVw/7lAOkKBZOu4gdcluQF7Uso=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785605273; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xz8KnFymT5hESdr7xdAcMXoJSRczBvNSNj4kIhe0Ha0=; 
	b=JEBc3dXk6zoP/8oRkaCNST8MLyljBFkw/ncr1pyAOC9KFJtGk/Mu1mkNZd3UpJkApgOU3VSfM92oJyfJSxT/9t5vF370WcdIzocaG2EF86dBjuNl/AiLJh8qOl2Q5KXF7MYzs4Q3LlZZNjPddP8iwlpxv7S5WpIREZNAuABokdo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785605273;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=xz8KnFymT5hESdr7xdAcMXoJSRczBvNSNj4kIhe0Ha0=;
	b=CJLpU2P7ldROkvFhPcdUHMdahvtlPvYT7SOmh+Nsqdq6cH+haqeJZjMHW8APFAoH
	U2e80ZnkGXn5At361LE4h0T0owD3FcoI7fxjDkUgZB3YhYumGZhjspwS2nOymyiZ0XF
	nsXIq66B5nDR+HEnm99riVcXkuzlqC9L8gCJnc1VmGS6zQwqlV0hJ05RJbOWXsEgfYQ
	1ny9RmNJCzU1IzrdEtXWP0LLvU2ey32qd/S2zQGr4zhzwpcGoRAL+mX5lJ47QTfG9Uo
	6T1Lo8/3z398Z3wxelZb80p4MTVTldBjiK7B17LT3BvMnWMgrbvAErspa0UZqyeNj/I
	OIXF7uqDcg==
Received: by mx.zohomail.com with SMTPS id 1785605272438896.8356639366287;
	Sat, 1 Aug 2026 10:27:52 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 02 Aug 2026 01:26:46 +0800
Subject: [PATCH v4 02/12] leds: class: Remove hardware control trigger when
 writing brightness
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-leds-trigger-hw-changed-v4-2-f97e2ca976fe@rong.moe>
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
index 1b8b688aaaaf..ab61e41a00a3 100644
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
index a630f5a79f6b..d7d3dd905432 100644
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
2.53.0

