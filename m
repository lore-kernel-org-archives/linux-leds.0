Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4DE495033;
	Tue,  1 Sep 2026 18:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286438; cv=pass; b=qiDIdR9Y71ODcYT2ydpbnFgPv+VLdTNBpnjIRemrxDxd+ZXjzOmF46aII0z9u1I47i2yLEQbdnabEujgO4atb80hu94w4s/BAHcEYRQiwZmV0OIAQIPLhORLu4Ib6g9aFiUKYg6q8hAGV13XMFb4xeXCR1iSMuk9mkSsoG4jwVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286438; c=relaxed/simple;
	bh=qYu8qu5/t/EIagET1LTn1tOXHGBdWGjy+kHn0HcWLd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s8hNQjxQwRAxyvSOr7/qD5Eb/9vrpoUIQZ+Q7ERrIGjqSYLOtXois39Izdndjj6nCS2A+cf5KKh3clLQA8fx6UuKPKIu1zoskR/GUeVnjcYmqtwii+RVguncjR0o+SeZ+6AjlhPS/dWKaerSSO3T8pdu5XjHHX5vKEFMXeZTClU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ZGi2r8fw; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ZGi2r8fw"
ARC-Seal: i=1; a=rsa-sha256; t=1788286287; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bDCj9eazrsTC/FVHeK6Tz0DKRx5zFcxGm31epPcnOb1s9xHTdNA1x+vsWBTaHJcLZJGf58V/rzx3tPsMOIZKi+WXC6j4fpec9cNyPryxWqKBD16mRWPvbacC3G19jargm7Io94OQiFAt+XhsypOb0G6bvbapplL8n4fMZiLPoZ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788286287; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2nDIV65eMkICOawrxEA250AL4gFumckCh1QxsSQVGP4=; 
	b=H2JLoCsB5B+0mVddvBRgSXERWrhHiVk/Xm2i7BMi/x4TCkIommTjrBur21PjWV1pDA9eO43jHcobE+UmGu1og7K4cTOxVQgbJIE2wFq7AquM9DX//ApKfKoVxMXREBNO6X+gIRsS4x9FMGfdmokF1IjP20s8E2g7/2xtFVXUylc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788286287;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2nDIV65eMkICOawrxEA250AL4gFumckCh1QxsSQVGP4=;
	b=ZGi2r8fw4FixBkcnzWZkNGpPmeVomG0Jo9ZMiqM/W5YQsNq3hoh3oPNNNUxujliP
	OVWFEsoqbsXlIUJ2VDuDdlyU/cJUI1nj3XdeH5ghUfy/AXWhkFq5Xul1wXR8yFgjomh
	lQUHgurpaQltNJJHJDRpYNwNAD+Wy5PrO8A14lFzAmTZk32tS8QWqn3B5hrlQK8oZ21
	6tlxaBvB2iQHvV6E33LegasCB6foJdQNk+FYj83OXw6gVooAswxRkHJEyIIgvrggR1H
	iqVokV6liKOIU6oyOd3oHrjidh4lOqPK9MyyH/n9Xrztb6o3rTzFYXo00u4Pt/B7BEd
	TsDlVb9ijg==
Received: by mx.zohomail.com with SMTPS id 1788286286947545.2271835817772;
	Tue, 1 Sep 2026 11:11:26 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 02 Sep 2026 02:09:26 +0800
Subject: [PATCH v6 07/12] leds: trigger: netdev: Implement offloaded()
 callback
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260902-leds-trigger-hw-changed-v6-7-55693cd78877@rong.moe>
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

"netdev" can run in hardware control according to hardware capabilities
and trigger options.

Implement offloaded() callback to provide its hardware control state to
the LED core, and document the relation between the custom "offloaded"
attribute and the generic "trigger_may_offload" attribute.

The callback mimics how the existing "offloaded" attribute does, i.e.,
locklessly reads hw_control, as it's just a hint and don't need to be
accurate.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- Do not deprecate netdev's "offloaded" attribute (thanks Thomas
  Weißschuh)
- Document the relation between the custom "offloaded" attribute and the
  generic "trigger_may_offload" attribute (ditto)
---
Sashiko has reported this pre-existing issue in previous revisions:

- [High] Resource leak of `net_device` in `netdev_trig_activate()` error
  path

The author is aware of it. Since the series focuses on hardware control
stuff, fixing it is far beyond the scope of the series.
---
 Documentation/ABI/testing/sysfs-class-led                | 3 +++
 Documentation/ABI/testing/sysfs-class-led-trigger-netdev | 3 +++
 drivers/leds/trigger/ledtrig-netdev.c                    | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index e3605fc55fa8..94c331d9c410 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -100,6 +100,9 @@ Description:
 		- `[foo_trigger]`: the trigger is selected and offloaded to
 		  hardware.
 
+		The "netdev" trigger also provides a custom attribute to
+		indicate its state, see `/sys/class/leds/<led>/offloaded`.
+
 What:		/sys/class/leds/<led>/inverted
 Date:		January 2011
 KernelVersion:	2.6.38
diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
index ed46b37ab8a2..a5146ea1e3e6 100644
--- a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
@@ -75,6 +75,9 @@ Description:
 		If 1, the LED blinking in requested mode is offloaded to
 		hardware.
 
+		LED trigger core also provides a generic attribute for this
+		purpose, see `/sys/class/leds/<led>/trigger_may_offload`.
+
 What:		/sys/class/leds/<led>/link_10
 Date:		Jun 2023
 KernelVersion:	6.5
diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 5b4e92c14dbb..2e9af48a74db 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -798,10 +798,18 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
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
2.55.0

