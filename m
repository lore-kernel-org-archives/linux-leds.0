Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4522F368D41;
	Sat,  1 Aug 2026 17:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605421; cv=pass; b=k59czA07pMcs77UuaPzXhTAa2raaw2xMiHBChiJ5p/x0yqNJcNXrr3yotA2lFi8uED9vbSBEBQ/960+DGRMEoUPQZlgjcebzan1Cb53gUBkWdLL18zaJCRNEoQjqbIcEGXVV6lrm0aqux3ZYlFoETRspcryJht56bheufhbnQJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605421; c=relaxed/simple;
	bh=Ol+4udk0V14GMhXSZx9TLfKC7qpee1pA34pTXfS+RMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1IEskT+VyHx+0UKJV4hz6eCs1qIl48956dmK3Xs+B4pBimY4iAVO/gR2nLEKTV4d2AdbgleTOkvsvFylfp7maYOm55ByQ2K1TWIhcHjzO90R/X9HfexgPHJZu04E/9zIbO+MBzCy7dZhFuKb8G70w4H8a57R6/I1oDqmioK0IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=UWoGwnCC; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="UWoGwnCC"
ARC-Seal: i=1; a=rsa-sha256; t=1785605362; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M+hMr1PCjGe58pJcYVpTkyWxc6mK47iebXKGMm/uIZaR40l/fCEnpkaPDBkIIehEx9p/94FGrIolI1ri5USALY3tzzRhld5e3kg62x7EMVMrqW8FYq7b45+iz6LDQvGdWWpGw63kOtV517LaGWmGz9z17EJfOlhc5lZPjI9cWLk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785605362; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=So+wkedaCWLS2SHjUDg4axp9hHlkQKab2UQeeFgLSvo=; 
	b=Ol7JQoFcsPkuTAbphFVtEJSGvOnyw6yxzVnI6dOgVo3ykYmf9BXU7Ye66Bxedrr+GQ+pgDKSUfULTgbzuetjcyyGtT/solBexQE8iRlUCRgWufHtAwHMDr8sjZOPH0ZovVagEM21Wkr+BoCT2GfqK9N5Q7gsd/687I1qdp6uK/M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785605362;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=So+wkedaCWLS2SHjUDg4axp9hHlkQKab2UQeeFgLSvo=;
	b=UWoGwnCCqJsIal3Gnfz8Zo9CWYrnbG6ZSnAIuUn3XWUvdZASQ2JmfEXSK5tFHwcU
	fXmqvXG/igrtE4wzUZwLu4T6rbduFmfJDB33R8ZAA5mYTgVrDMZAy+pcDIJlIwb8Zc/
	aPhu1HnOHauHGPV6tXhZaAavU1H6FZdV0+xM9XjuR/D3NJJDC4ueXsQvM0mJGOtr1pI
	LrycrhC1QsyAtZcp5yAPK8gQHyR8OnGLvYc1Gwnl/NDWvgcYwV6PcJyGcXDF01a2set
	qC2PIaQd9wbQn3/D/Bk46OmMHJcuAJwSjGQqLbfTEcCQhCaE/8YycX8lWtWaSPL3Ph2
	Hv2dZXyM5g==
Received: by mx.zohomail.com with SMTPS id 1785605360887907.2287355672634;
	Sat, 1 Aug 2026 10:29:20 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 02 Aug 2026 01:26:52 +0800
Subject: [PATCH v4 08/12] leds: trigger: Do not attach trigger to a
 removing LED
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-leds-trigger-hw-changed-v4-8-f97e2ca976fe@rong.moe>
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

Currently the LED trigger core knows little about an LED's removal as
the LED_UNREGISTERING flag is set too late. This could lead to a race
condition where a trigger may be attached to a removing LED right after
its previous trigger is removed.

Set the flag at the very beginning of led_classdev_unregister(), and
check the flag before attaching a trigger.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v4:
- New patch in the series to address concerns from Sashiko
  - Without it, following patches will expose a race condition
  - https://sashiko.dev/#/patchset/20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe?part=8
---
 drivers/leds/led-class.c    | 4 ++--
 drivers/leds/led-triggers.c | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 2460fcf0c469..4158337896bc 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -631,6 +631,8 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	if (IS_ERR_OR_NULL(led_cdev->dev))
 		return;
 
+	led_cdev->flags |= LED_UNREGISTERING;
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	down_write(&led_cdev->trigger_lock);
 	if (led_cdev->trigger)
@@ -638,8 +640,6 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	up_write(&led_cdev->trigger_lock);
 #endif
 
-	led_cdev->flags |= LED_UNREGISTERING;
-
 	/* Stop blinking */
 	led_stop_software_blink(led_cdev);
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index cb49a02a8b3c..64bc95d0bfeb 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -200,6 +200,9 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 	const char *name;
 	int ret;
 
+	if ((led_cdev->flags & LED_UNREGISTERING) && trig)
+		return -ENODEV;
+
 	if (!led_cdev->trigger && !trig)
 		return 0;
 

-- 
2.53.0

