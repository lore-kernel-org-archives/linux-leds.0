Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC6C29B228;
	Sun, 20 Sep 2026 19:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933447; cv=pass; b=mR/HYdwX5pl4+L1RistUWhBLvAormuT4yOLVPz6fduZgYnmHW6/iIUWtwDBRAnoIBHrIXYnBB1KeKcmwcuT5rGxOmkVFpgYgGRXwLlxBEs9oOJ0HbWwruO+/qYCXXahpzHpYC1sIDlFo8qCW6RMI7n4JRR3opuTik7NerJ09zSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933447; c=relaxed/simple;
	bh=TZibX3aCUK0ohSyPFEFa1zR7eA71hHYC6eJpYxJZ5RU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a15ffdNl2p+mY1nbThqnaRIHVl6d05dPrpy1FtqkgmA9LfC7xAIf6toZep9Uek4Lh6bY8bH548yxsmoBCQ+yyqdvy4k7JBIGW/hXu5fwPOCidGEo8tw2843vlByD/KDbgmi6arpSK2bG979k3Nl5BLNvVPEJlmV8Gg/C1QjxrMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=IPrDTL06; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="IPrDTL06"
ARC-Seal: i=1; a=rsa-sha256; t=1789933264; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=myOuS++VeUXr4fHagZI0w+BcuVrPl1GG/clB7EZAjf7OtPaN6S9n3oCfFDSmifoFbZxe9ZlF0/JhWjfVkS/DyisyJPZ5fR9JvYW37aYhUv/uzIHNjpGzz2WICAAFqfc62TgbXVMjqbp8VKChj5uX79xrULsPyCfRfTnZmfEL9oo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789933264; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RXm78mSTGjQvWV8MVp20FX0JztZDQljla/8XmUE7cbs=; 
	b=J7QiZ7+JvP+9oSrehpv2/6VfWM8Rf4wHlPk2wPvEMSmmznyHa3MYG3GHBYMChr/QHGUw6H3E4IERA3P0OiZNoOe2AkYJuWuEAgcwffcoyWX2Q5Lw4T/oLiePUnXi6U7J+WAFT0X62CpMrbJggzPj0HQ/XHJ92KhFGXUJWKX7zMs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789933264;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=RXm78mSTGjQvWV8MVp20FX0JztZDQljla/8XmUE7cbs=;
	b=IPrDTL06cQYp0l/x2WVn7sKZJnNapG2iut4UXj+WKnxh18nH7L+RVE5RzMxV7lJC
	8gyrAXfkF4IrXSKbXrS4O2dS6UvOv+6pKBw1ONZ2kq6dzN1IM9iLFWsv1hW6PGgKAs4
	ikPPCA8OYy4hJVVs1iSUf/dAfBrEXCOmCFABhn/CriVEzJtm/qxYhLjZByR0Y8W/8O5
	d2SkJXwKiLTYE72wB5VHJCHzw9T9cgoyiMkguKkAmDSZHF8K8Yv5kwHfNsy7FPzWqbe
	/G2KLEqHafNpAQ3eOVFFqtTM0bxCnn44jEcJOOPRnTmaYPzM9/dE/ymRbHoVMvm9RAm
	yZ0cVRgdmA==
Received: by smtp.zohomail.com with SMTPS id 1789933263241514.6431318792389;
	Sun, 20 Sep 2026 12:41:03 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 21 Sep 2026 03:40:22 +0800
Subject: [PATCH v7 08/13] leds: trigger: netdev: Implement hw_offloaded()
 callback
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-leds-trigger-hw-changed-v7-8-fe3cdb6dec51@rong.moe>
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

"netdev" can run in hardware control according to hardware capabilities
and trigger options.

Implement hw_offloaded() callback to provide its hardware control state
to the LED core, and document the relation between the custom
"offloaded" attribute and the generic "trigger_may_offload_to_hw"
attribute.

The callback mimics how the existing "offloaded" attribute does, i.e.,
locklessly reads hw_control, as it's just a hint and don't need to be
accurate.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v7:
- Rename the offloaded() callback to hw_offloaded() (thanks Lee Jones)
- Rename the trigger_may_offload attribute to
  trigger_may_offload_to_hw (ditto)

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
index 123e3a15b7d6..ea113fed10ef 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -101,6 +101,9 @@ Description:
 		- `[foo_trigger]`: the trigger is selected and offloaded to
 		  hardware.
 
+		The "netdev" trigger also provides a custom attribute to
+		indicate its state, see `/sys/class/leds/<led>/offloaded`.
+
 What:		/sys/class/leds/<led>/inverted
 Date:		January 2011
 KernelVersion:	2.6.38
diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
index ed46b37ab8a2..203ea58396ed 100644
--- a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
@@ -75,6 +75,9 @@ Description:
 		If 1, the LED blinking in requested mode is offloaded to
 		hardware.
 
+		LED trigger core also provides a generic attribute for this
+		purpose, see `/sys/class/leds/<led>/trigger_may_offload_to_hw`.
+
 What:		/sys/class/leds/<led>/link_10
 Date:		Jun 2023
 KernelVersion:	6.5
diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 5b4e92c14dbb..60409f054e22 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -798,10 +798,18 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
 	kfree(trigger_data);
 }
 
+static bool netdev_trig_hw_offloaded(struct led_classdev *led_cdev)
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
+	.hw_offloaded = netdev_trig_hw_offloaded,
 	.groups = netdev_trig_groups,
 };
 

-- 
2.55.0

