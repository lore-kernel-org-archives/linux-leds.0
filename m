Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7F247F2FF;
	Thu, 20 Aug 2026 17:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246759; cv=pass; b=M6JxvR2WWAnbtfGETXDGQwF1J7i1ZPQuzz/bKRVv7alO3vzPNKQbeB+y60Xf9Qt0g4L8xa23zLH0rm6D3E2jMglzGaFuP+etW5D23acKqwwpDt3npVvDDrqhf9QQEEEwY3PjC9cYh6pWJwxXNosXqTjWyqbK3ZjJDioGZMZ5h1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246759; c=relaxed/simple;
	bh=rhL0Xc0UlPWF/EW+fV8C+dr6SIxsSVYzBHCEzqP+MOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5wE5K9HSLE9MEaI1crHP85yT5bENifkgPpIHJuz7DAZWjYVvMDs8Yge4usvO9dnRi/ZLaar22PqvhTMNRmYUs+g2sxkrz0ACE1oJ2xS7xGegNlAWPpiZRGWqZCk0fV8iOk7MAJYObLR/4Q6KazsyKAMF8I2bo+ceDWtzdUBvWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Pd6gIj2z; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Pd6gIj2z"
ARC-Seal: i=1; a=rsa-sha256; t=1787246649; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZLnq9rcYELO9dKukZwPiCojv1OPefPHNC9VX7nvgMk5ghHotGxeu1hT0P4WYOHU5TtvgMkT6GhireGTzITIPYyULTsN8XyFEP4LnLpkmJt7ZprMXqY2gTZw64FX7ZYRY0CKUFJH2pWLNPA7n9Hly06EzBEbQYDflmmCSCihbxQg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787246649; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7mwpPRVkUKlwD5B2Uq/1luJzXpKKluzvLSdg1lVZGTA=; 
	b=cYQKI0tK2pxnaFc2xHajecmdZre8/vS03Gv5204/+TFmXaFxe2yDjNAX11JJaSnlTsHUvP8c9pXqdurJU7xEibDQ33dbnra1QOq4WOYKxtpnyC05R2CikDgfTz3GCtHVMi/9NYH4JD4X4jJQqyTaqiwiAC2ds4qrjFZBfXAmKMs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787246649;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=7mwpPRVkUKlwD5B2Uq/1luJzXpKKluzvLSdg1lVZGTA=;
	b=Pd6gIj2z2Wo1mgRq/qZ5+86gvoj8h0pElGDLvScqVbagyjVNatlSKyfehcJyzr+i
	kcwUZirp/d9TkV5NYP06EVkf1VqxP10YdYvlk2LiqofaqAh7BwTIElTpa7w3OKw72u/
	a6IlMi2YVUEU8BTCYqSjAKA4ka9xl+f/9NRyHCN9HZSm/jXnO0jUX3gby+Jz8QQWAUW
	Qwd9YilmSq7EIZpqoDtMgpOpb6UTSR8dkk6k84v/Zf8TAsjhgAs7Eimnn2BOZhw+hEg
	nM/CGf/16aYa2Qqny/QkznOz3lyQJs637oAcNmAy4bidO8rCJvW+6PHuJ+BBfx3KSmJ
	EhcFcjt8qQ==
Received: by mx.zohomail.com with SMTPS id 1787246647058241.67174161350658;
	Thu, 20 Aug 2026 10:24:07 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 21 Aug 2026 01:22:03 +0800
Subject: [PATCH v5 08/12] leds: trigger: Do not attach trigger to a
 removing LED
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-leds-trigger-hw-changed-v5-8-3e00d6c4a936@rong.moe>
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

Currently the LED trigger core knows little about an LED's removal as
the LED_UNREGISTERING flag is set too late. This could lead to a race
condition where a trigger may be attached to a removing LED right after
led_classdev_unregister() has removed the previous trigger.

Set the flag at the very beginning of led_classdev_unregister(), and
check the flag before attaching a trigger.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v5:
- Address a concern from Sashiko:
  - Non-atomic update of led_cdev->flags causes a data race that can
    drop the LED_UNREGISTERING flag
  - Fix it by synchronize the update with trigger_lock
  - https://sashiko.dev/#/patchset/20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=8
- Update "Changes in v4" to include more details

Changes in v4:
- New patch in the series to address a concern from Sashiko
  - Without it, the following patch may expose a race condition if a
    future LED driver synchronizes led_classdev_unregister() and
    led_trigger_notify_hw_control_changed() poorly. The ideapad-laptop
    patches in the series doesn't expose the race condition though
  - In theory, the race condition can also be triggered by a userspace
    program writing to the "trigger" attribute right before
    device_unregister() is called
  - https://sashiko.dev/#/patchset/20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe?part=8
---
 drivers/leds/led-class.c    | 5 +++--
 drivers/leds/led-triggers.c | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 2460fcf0c469..771a6e6c659b 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -633,12 +633,13 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 
 #ifdef CONFIG_LEDS_TRIGGERS
 	down_write(&led_cdev->trigger_lock);
+	led_cdev->flags |= LED_UNREGISTERING;
 	if (led_cdev->trigger)
 		led_trigger_set(led_cdev, NULL);
 	up_write(&led_cdev->trigger_lock);
-#endif
-
+#else
 	led_cdev->flags |= LED_UNREGISTERING;
+#endif
 
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
2.55.0

