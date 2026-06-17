Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0B64ADDBC;
	Wed, 17 Jun 2026 16:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781714968; cv=pass; b=I+zWZtNVRcb8G5b+hii5Ls+voteTNCFE4lYFG+dKb7AqwtBRwZUXSy+LNUKVEMwOOGI346Rbmwr27LdYJAZyLDYpP1kyBwGEijXxJwAeNTZeXcAOOxJtNFHCtqTwtbY5E3lTX5X1ZXMi4w6r6kjFY/jJDoYI/7SxxeV3GXaxj+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781714968; c=relaxed/simple;
	bh=AZ2SXdaMwlRCWSyIw9Ul8XaJWjmOk9nawcSM/8r2skM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mu1pD3ZcrALGKS47g5RiyF1qNQnSj3JBP+TDTtF5KymPuYc0Zvxc46nNRrq3I04ODqmcO+0vWslSj/hx3Y2i4GtJy2CFkYj0m+gzpTh+oxWMqvqcVz/EHmqwBAe3iWfoWmRsjy/Cf0oFz5fEx1QqYTdDWOE08vyDulLG08rSl5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Os7rcHiq; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Os7rcHiq"
ARC-Seal: i=1; a=rsa-sha256; t=1781714945; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZDnLFiWcOE3synxwlk5MHRewZCklIxVg1J25FHdC/YoR1OwVTr16I0U//TXfr7Btr2jMA8Oxg6pkuOfSC3Z6v1mqaihWHhssaWtYQ7zQ/rQOkSicReiDeuS5pUXQfkRWldZ9QK6IravYFH0hn3dNfIFlJduhKNesNdR1gWP39xo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781714945; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1urKI1XlBDMQbdnzJHGlOn7r85vcxGWkLy92ZcHwPvU=; 
	b=DFYVOKjJNJzeu2einP9po5KTheb3EA+MUwqWl4gKEAAZJwQmDlCuy1mz6kStMUci1JK//iXtMOu9aImrqnVUgy9y7z050pZ29TyDA0ZccghUyKKoTIgnhkNFJu5eUUAQF1nIdQ6x+ASZo/Vt7+sk7BI0WAFK/vVh+/NhzdFUHQc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781714945;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=1urKI1XlBDMQbdnzJHGlOn7r85vcxGWkLy92ZcHwPvU=;
	b=Os7rcHiq5IY/W660ALPixsnIoZocGJYJG3fcWAcAhM1kTef40y+Ub6c3LBmBqIQw
	AfxKSrfOh/2pXx8F8krB1kP1wruil14c6DbAM768WTE4eP6g4nwGRajADdSicAIyvAR
	SQ0R2PQz1UNf7NdxHt1NnZmy4SJUGvdZDG0G5uIYcCckMIa9pKdO0kpMmXnJU5wZ+7I
	uaUZg3o+sPYVD/1OuKaLSftIjm45ePQ26abHy4omLgtbNR+7y5mIKms9Ez4/gJ5b26i
	C5tIQ+0o3UzNtEhKoUcAgdXjLUbSrfVu5UTe5QxrjBmJBszn3JowljcTtQp6LdvegJ3
	JxXvobYxjw==
Received: by mx.zohomail.com with SMTPS id 17817149433206.93374078460954;
	Wed, 17 Jun 2026 09:49:03 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 18 Jun 2026 00:47:55 +0800
Subject: [PATCH RFC v2 1/9] leds: Add callback offloaded() to query the
 state of hardware control trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-leds-trigger-hw-changed-v2-1-c28c44053cf3@rong.moe>
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

There are multiple triggers implementing hardware control. However, the
LED core doesn't really know the hardware control state since the
coordination is done directly between the trigger and the LED device.

Add an offloaded() callback so that the LED core can query the hardware
control state.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/leds/leds-class.rst | 5 +++++
 include/linux/leds.h              | 1 +
 2 files changed, 6 insertions(+)

diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
index 5db620ed27aa..84665200a88d 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -235,6 +235,11 @@ LED driver must implement the following API to support hw control:
                 Returns a pointer to a struct device or NULL if nothing
                 is currently attached.
 
+LED trigger must implement the following API to support hw control:
+    - offloaded:
+                return a boolean indicating if the trigger is offloaded to
+                hardware.
+
 LED driver can activate additional modes by default to workaround the
 impossibility of supporting each different mode on the supported trigger.
 Examples are hardcoding the blink speed to a set interval, enable special
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b16b803cc1ac..7332034a43c8 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -485,6 +485,7 @@ struct led_trigger {
 	const char	 *name;
 	int		(*activate)(struct led_classdev *led_cdev);
 	void		(*deactivate)(struct led_classdev *led_cdev);
+	bool		(*offloaded)(struct led_classdev *led_cdev);
 
 	/* Brightness set by led_trigger_event */
 	enum led_brightness brightness;

-- 
2.53.0

