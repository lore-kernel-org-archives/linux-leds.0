Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D853C293B75;
	Sat,  1 Aug 2026 17:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605383; cv=pass; b=cP1jJ+6uFlQIV/Yfc03xom1LCung2zRAZxNPYXHJWFatACjZkaRILsgXK/cgIMHG4xzhLGRCdkph1rWeHb+gWjZDdZu+UJlpdVhl+U9BEZeqYWbGv4jxLcvlMoTBpXlxeaAPn87xbLnHekAxgs6c53OfqRSaWkoRmGUZlCwJ1lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605383; c=relaxed/simple;
	bh=Ll755EGFiRkhMphihCAV1WsONQgM8/aTRWLy9/s9zjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BeoXrqwTkPAHPuM1xLw17orxUbf8lEmVIIgQvtroyWRM/xWDPVQzUH3lJW0y9/MCOpwJV57wUvxbdeFz7/e7k36Mv5foiodCsqKcrkFwAaqTwIBR71qzUaDFnyrnYDgfvujhZtU6K00pdekmEvZMEI8Ob2gk7nAe5nDIFEhAE94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=eTXAAtGH; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="eTXAAtGH"
ARC-Seal: i=1; a=rsa-sha256; t=1785605334; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h9qOhEouaRrcoSbF9WvYxPCWdALQSlPLa9PXZCvN1yOF0CuPuAXMVEGBZarbfuGoKFDLUrrDAL9QTO8ko2VT7f7e/J3Pb9QqOz3xTKMkDHHl49BwRB4aIR3gYOoFLghLweys0RvQQPMmRuPS3m4bN1Yj61nucPnkSuJe5PK9t+s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785605334; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5QXwkidd6Vq8V7EqtBeDCjOZkG19O2LRvnZhr3eipIU=; 
	b=MidykQgzkOcMCSxzRzFsF4hS1CehuHZv/Pvoe8Ez4M6ecrl1QD16wKbdq2O6aWziMRRDNJPD+CXzgzKh6Nkt1HADsRaGlHBn8qpTs8rYm+arK9oW2MKFs8bxbAo7Qu+Em+UKNdjRnUX8hK2r08nfFd97l1Tr6TOH4Zc2UC9M9Hk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785605334;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5QXwkidd6Vq8V7EqtBeDCjOZkG19O2LRvnZhr3eipIU=;
	b=eTXAAtGHOEgpz+8zhXDfSzaczqhvXi7j0wsuaav80AekEEu8oEI1cmOmM8VHjp61
	HWk9i9RT6a4wqm9glV/zIEPEmV04PhV52clL+crbz2n/DbUsYolj595kAEDcfVs44Je
	b89Ok1fBtf4e2NKgzShFjZrF0k0qxgfVV2W2ZIR8aQZ+oHQRZiYSD3OF/eTr88C2AL2
	7XKrivSWW5g5xFJ9b7/S10YtenUEJRbh2DTTgGmPxz+LZQJPagYvFfoKYQlgh323IZS
	pRilx7jYHBMsbRJ0KNLb5Yw3xJ1n6AabiMnINDYZ+ipRDa7FXaIpfkFAXr+ZP1CFIjj
	zeDtCd3mKA==
Received: by mx.zohomail.com with SMTPS id 1785605333428477.0194220826246;
	Sat, 1 Aug 2026 10:28:53 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 02 Aug 2026 01:26:50 +0800
Subject: [PATCH v4 06/12] leds: trigger: netdev: Implement offloaded()
 callback
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-leds-trigger-hw-changed-v4-6-f97e2ca976fe@rong.moe>
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

"netdev" can run in hardware control according to hardware capabilities
and trigger options.

Implement offloaded() callback to provide its hardware control state to
the LED core, and document the relation between the custom "offloaded"
attribute and the generic "trigger_may_offload" attribute.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- Do not deprecate netdev's "offloaded" attribute (thanks Thomas
  Weißschuh)
- Document the relation between the custom "offloaded" attribute and the
  generic "trigger_may_offload" attribute (ditto)
---
 Documentation/ABI/testing/sysfs-class-led                | 3 +++
 Documentation/ABI/testing/sysfs-class-led-trigger-netdev | 3 +++
 drivers/leds/trigger/ledtrig-netdev.c                    | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 5afb307c935a..2a13c77aee22 100644
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
index 64c078e997f2..a26109ca4b1c 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -754,10 +754,18 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
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
2.53.0

