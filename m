Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB1E476047;
	Sun, 20 Sep 2026 19:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933389; cv=pass; b=QI6NBmXA3t3a+lmZuHJ4jOp1zULUsWQYMMmNgjd04C3L9BxIq8idv2fhxCoCxCEeFUPCcGeICVZtXXzNIpOmxlHqatDbGkQ0vBloHLNGtjRAZtcZxms0wrpiLB83VumbY6dgdBiJL/YiGHL3ZDGaZGYYx/tQiI211oU9tRSqj14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933389; c=relaxed/simple;
	bh=+dRiW1c+u+UBr2MFC6p/vQS3YD2zD9vCjyjBoX1E984=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UY0dgjARnKH57+c/wdmMc7kQg+znqo0omjjPn0ntuPpDFbhW5QF32DLBJED1isNcBnMN9hFhcS54CnSiXK5SJ9Th5HAyFTSHHW5wkGh0ZSPbgXbKE2yqu9tPxcTdoAeOR+VPL2m879F0q1qrMLAcPeZom11lEoI28y34RCgbW+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=FEViFf+2; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="FEViFf+2"
ARC-Seal: i=1; a=rsa-sha256; t=1789933248; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ze8wFl0N8nvhmXdAcLN250FVsi6nOM4Q8mUtMY78nl5/pn0KZHLBnO+PfTNGgixUXVLD+PBJQTAI1j7SReWBif302Sd89PQAgAYh28K1o4ekqJhoqFDcgGd2O+zo4x8mQbz2U7WtoUGhzMZtMsThzUayMVYxiWUC7muqxMkCQeQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789933248; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/OJWNPRt7C6E6XKPHIegE5RkOkall67Zr88plpfiiMs=; 
	b=DZudoQppmO9mLYgKEiZX7WPfS/F5djljqIQ4rk463OFtvO69gPzK+bgyJuDi5DbQdMFN3F7FOp+EZlGluj4+BYxYohoqKqtBhLd5g240fDW70hph58IAvUcEGKTftxZCP90NIjfcc1oeRGt7fJxxiQm+hopQoTWhDSpj3bHt9cc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789933248;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/OJWNPRt7C6E6XKPHIegE5RkOkall67Zr88plpfiiMs=;
	b=FEViFf+2Q6IBefoZ5yw9YP7GCSe5lDryoChPhWqJxkg0Dkyo98MIFRoV47IUPzuH
	RpY1TTC6lXE2/DPisAeuUgCbMPMkIDqWEvbRgbswaf1RKbEppk4N66x2RXP46PpjlO1
	fG1HS+QF/wmKLAPcaak1btilNxGrZTaSuZXV7zgr4e5w8RJ2bIB48QB9DHVtRkeqAMZ
	Kb8LASShn4Uk4Ba/fQCDugPiX+C60jwdonIw15Xe0AJrr9R6+/rL9P2792l6hBGeGtN
	+g7W7+gsilBbZk9NVuc+rgXqfhveUFNeLjiU1GPyqQPEGRiPs2k9kGAzL8W9HfaFfoR
	FNgb7SOHpw==
Received: by smtp.zohomail.com with SMTPS id 1789933248499390.50035480257634;
	Sun, 20 Sep 2026 12:40:48 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 21 Sep 2026 03:40:19 +0800
Subject: [PATCH v7 05/13] leds: trigger: Add hw_offloaded() callback and
 provide trigger_may_offload_to_hw attribute
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-leds-trigger-hw-changed-v7-5-fe3cdb6dec51@rong.moe>
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

There are multiple triggers implementing hardware control. However, the
LED trigger core doesn't really know the hardware control (offloaded)
state since the coordination is done directly between the trigger and
the LED driver. It can only assume private triggers as offloaded and
generic ones as not offloaded.

Add an hw_offloaded() callback so that triggers can report their
offloaded states to the LED trigger core. When unimplemented, it
defaults to true for private triggers and false for generic ones to keep
the current behavior unchanged.

With that, provide a new attribute "trigger_may_offload_to_hw", so that
userspace can determine:

- if the LED device supports hardware control (supported => visible)
- which trigger is the hardware control trigger selected by the LED
  device and offloaded to hardware ("[foo_trigger]")

Note: the documentation describes the attribute as "returning a list"
despite the LED core currently only supports one hardware control
trigger per LED device. This is intentional to make the attribute
extensible in the future without breaking userspace. IOW, userspace
should parse the new attribute in the same way as
/sys/class/leds/<led>/trigger.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v7:
- Leave all attribute stuff at led-triggers.c (thanks Lee Jones)
- Rename the offloaded() callback to hw_offloaded() (ditto)
- Rename the trigger_may_offload attribute to
  trigger_may_offload_to_hw (ditto)
- Use "[foo_trigger]" to represent a selected and offloaded trigger, and
  no longer use a dedicated container to represent selected but not
  offloaded ones (ditto)
  - In this commit, the trigger_may_offload_to_hw_show() callback does
    not match the current trigger's name against hw_control_trigger yet.
    The check will be added in a later commit once all relevant LED
    drivers have properly declared hw_control_trigger and LED triggers
    have implemented hw_offloaded()
  - For now, only "netdev" and "chromeos-auto" have associated LED
    drivers, which expose the new attribute. The former is always
    reproted as not offloaded in this commit, while a later commit will
    implement hw_offloaded() to properly provide the offloaded state.
    The latter's associated driver's only private trigger is exactly
    "chromeos-auto", which is always correctly reported as offloaded in
    this commit
  - All private triggers will gain hw_offloaded() and their associated
    LED drivers will gain hw_control_trigger in later commits, so that
    they can provide the attribute properly
- Constify device attribute trigger_may_offload_to_hw

Changes in v6:
- Update Date: and KernelVersion: for the document of
  /sys/class/leds/<led>/trigger_may_offload

Changes in v3:
- Rearrange the series so that the code using the offloaded() callback is
  introduced before the driver implementation (thanks Thomas Weißschuh)
- Reword documentation (ditto)
- Adopt guard() and lockdep (ditto)
- Adopt __led_trigger_is_hw_controlled() from newly-integrated PATCH 1
---
 Documentation/ABI/testing/sysfs-class-led | 21 ++++++++++++++++++
 Documentation/leds/leds-class.rst         | 20 +++++++++++++++++
 drivers/leds/led-triggers.c               | 36 +++++++++++++++++++++++++++++++
 include/linux/leds.h                      |  1 +
 4 files changed, 78 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index f6d4e17e1a3b..123e3a15b7d6 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -80,6 +80,27 @@ Description:
 		(which would often be configured in the device tree for the
 		hardware).
 
+What:		/sys/class/leds/<led>/trigger_may_offload_to_hw
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Names and states of triggers that may be offloaded to hardware.
+		Such triggers are also called "hardware control trigger" in some
+		context.
+
+		Only exists when the LED supports trigger offload.
+
+		Reading this file returns a list of triggers that are capable to
+		be offloaded. The optional brackets around the trigger name
+		indicate the state of the current trigger:
+
+		- `foo_trigger`: the trigger is not selected, or selected but
+		  falls back to software blink for some reasons, e.g.,
+		  incompatible trigger parameters.
+		- `[foo_trigger]`: the trigger is selected and offloaded to
+		  hardware.
+
 What:		/sys/class/leds/<led>/inverted
 Date:		January 2011
 KernelVersion:	2.6.38
diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
index 3913966cfdac..ea478989aae2 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -242,6 +242,9 @@ ops and needs to declare specific support for the supported triggers.
 
 With hw control we refer to the LED driven by hardware.
 
+A sysfs attribute `trigger_may_offload_to_hw` is provided for userspace
+to query supported triggers and their states.
+
 LED driver must define the following value to support hw control:
 
     - hw_control_trigger:
@@ -298,6 +301,15 @@ LED driver must implement the following API to support hw control:
                 Returns a pointer to a struct device or NULL if nothing
                 is currently attached.
 
+LED trigger should implement the following API to indicate hw control:
+    - hw_offloaded:
+                return a boolean indicating if the trigger is currently
+                offloaded to hardware.
+
+                If a trigger doesn't implement this callback, the default
+                value will be true for private triggers and false for generic
+                ones.
+
 LED driver can activate additional modes by default to workaround the
 impossibility of supporting each different mode on the supported trigger.
 Examples are hardcoding the blink speed to a set interval, enable special
@@ -311,6 +323,14 @@ the end use hw_control_set to activate hw control.
 A trigger can use hw_control_get to check if a LED is already in hw control
 and init their flags.
 
+Alternatively, a private trigger can be implemented along with the LED driver if
+the LED's hardware control doesn't fit any generic trigger. To associate the
+private trigger with the LED classdev, their `trigger_type` must be the same. To
+declare that the private trigger provides hardware control for the associated
+LED classdev, set the `hw_control_trigger` string to the trigger's name. Since
+both the LED classdev and the private trigger are in the same LED driver, it's
+not necessary for them to coordinate via `hw_control_*` callbacks.
+
 When the LED is in hw control, no software blink is possible and doing so
 will effectively disable hw control.
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index de6056bc80e6..38ce3350c870 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -42,6 +42,10 @@ static bool __led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
 	if (!led_cdev->trigger)
 		return false;
 
+	if (led_cdev->trigger->hw_offloaded)
+		return led_cdev->trigger->hw_offloaded(led_cdev);
+
+	/* Otherwise assume private triggers are always offloaded. */
 	return led_cdev->trigger->trigger_type;
 }
 
@@ -185,8 +189,40 @@ static const struct bin_attribute *const led_trigger_bin_attrs[] = {
 	NULL
 };
 
+static ssize_t trigger_may_offload_to_hw_show(struct device *dev,
+					      const struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	bool offloaded = led_trigger_is_hw_controlled(led_cdev);
+
+	return sysfs_emit(buf, "%s%s%s\n",
+			  offloaded ? "[" : "",
+			  led_cdev->hw_control_trigger,
+			  offloaded ? "]" : "");
+}
+static const DEVICE_ATTR_RO(trigger_may_offload_to_hw);
+
+static const struct attribute *const led_trigger_attrs[] = {
+	&dev_attr_trigger_may_offload_to_hw.attr,
+	NULL
+};
+
+static umode_t led_trigger_is_visible(struct kobject *kobj,
+				      const struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+
+	if (attr == &dev_attr_trigger_may_offload_to_hw.attr)
+		return led_cdev->hw_control_trigger ? attr->mode : 0;
+
+	return attr->mode;
+}
+
 const struct attribute_group led_trigger_group = {
 	.bin_attrs = led_trigger_bin_attrs,
+	.attrs_const = led_trigger_attrs,
+	.is_visible_const = led_trigger_is_visible,
 };
 EXPORT_SYMBOL_GPL(led_trigger_group);
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index d778709f5b1b..9a0bfd985b46 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -485,6 +485,7 @@ struct led_trigger {
 	const char	 *name;
 	int		(*activate)(struct led_classdev *led_cdev);
 	void		(*deactivate)(struct led_classdev *led_cdev);
+	bool		(*hw_offloaded)(struct led_classdev *led_cdev);
 
 	/* Brightness set by led_trigger_event */
 	enum led_brightness brightness;

-- 
2.55.0

