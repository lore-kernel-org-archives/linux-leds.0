Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3437E5E5;
	Thu, 20 Aug 2026 17:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246714; cv=pass; b=TOq0nnyxbKKmnKgvMoinBdNSr4vZmEurYZI95BISFghBkSqvqI1cK3p0Taj+TIa+HJ5wjHk9mKKqIJ7Tj1QNzsW/28BhM8DSBcFEKrZkNIWwU4aJVAzRzlSslzTPPApapReR6ZbE0yZyvqBycoHoSTEthy4jO5n+VS7Mifw7RbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246714; c=relaxed/simple;
	bh=MOBbx0QiVkZdAvkTF9XF4s4TjMxZz8H3vKkbvMRTa8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sIaqdeZ6tihqLjMxfYpQXImXg/KXN9rBCv/2vBho2JDjX3rAHj4LKstlLj7C0B26tnoo4FZkLg1Yt0lVpaRWCNbAuQ5tW4MoRaDmAmZ158dAMSLJu58/mB8JWUjU+giBfYfTlZuMV2UzKY2B69BdwcKWUZM+RLlAQ/ENokDdjuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=kyuL0jj/; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="kyuL0jj/"
ARC-Seal: i=1; a=rsa-sha256; t=1787246627; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZzJxIakGojCv03s2bPLV60KF6KPYGR/R1ITcWew3tvZjSv2/HuwY7Hg7vdHDnlkkQ/VUiyUH1iWYCiFGvapOYbVh7jar149HpheCeoMEDhnQT7/AVPlWSOs9ZE4EQYWE6kKCFHhI/ZQzh99VHH1EenZ50bHM6wmS8rPrtTnyi8U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787246627; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iEbNVyFeMEJBMzrjWZRDpC7u3EmfHE2+/wAuXPJgNyU=; 
	b=b9vqKDTODI7p146OUrOH24dRIL/IWCH4SSEu06M8SNhiX/QDeYjyE8XRbC+aHED407G3A0TPqdHGQW6LE4JyWCFU+DyrnJbF22yoK4NOKjlZJB9zCQLpDjpXodTbwbVw120wPQYseKQKRn04y4ooHL/BrkTcRn9CjTWClijzpVM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787246627;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=iEbNVyFeMEJBMzrjWZRDpC7u3EmfHE2+/wAuXPJgNyU=;
	b=kyuL0jj/hT8XAK8wQwBSMtGKn93SrnZniq26vP7ZyBaw8cViS/KqfBnHMushKDb9
	szHpUgs3k/bXMwUsVoPYyvcFdetdKDQWV8lPeyjINVHhrUZi1w6P9P17RfPBEV/CMi5
	MTwOeonfLr52uz/IjjU6jWlhy05MyQLtcWi0Z8h6gJS8tbbKGugOl9lodIR+8pEg/hQ
	hYJ9D+ctMCWurfX8nUBL9L1lVSa78NILItlSFGYaTHN8iJSilJGelAtOuv/X33zEekR
	z3CO7mSBr/8ohu9vK1AA0m+kveNhNNPz5CXLi2GZ5LNLRUNs6ZziMRMht5CRm6t2//G
	lReEKljKQQ==
Received: by mx.zohomail.com with SMTPS id 1787246624361647.0299940264075;
	Thu, 20 Aug 2026 10:23:44 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 21 Aug 2026 01:22:01 +0800
Subject: [PATCH v5 06/12] leds: trigger: netdev: Implement offloaded()
 callback
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-leds-trigger-hw-changed-v5-6-3e00d6c4a936@rong.moe>
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

"netdev" can run in hardware control according to hardware capabilities
and trigger options.

Implement offloaded() callback to provide its hardware control state to
the LED core, and document the relation between the custom "offloaded"
attribute and the generic "trigger_may_offload" attribute.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
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
2.55.0

