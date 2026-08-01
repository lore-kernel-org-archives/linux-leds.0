Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0FE3358AF;
	Sat,  1 Aug 2026 17:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605326; cv=pass; b=BwVYnX+Rz/NwBEOVhXcNmdOQ4cA5u2dVmwBrmWrGbstahCxV20LXUwar0TLy9x4ifzGeoqQ4OVFssNs4LT2WbwgKhu66nr/HXqnEl920czurZ7DETRPZR+X9sHWEhSLwv0/uMbLGZpR/H4vYQ7L3vyLnA7Wo1U4kGLTsaC5lvPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605326; c=relaxed/simple;
	bh=mPHQVCBIaD7N8bBp68/kQGxl3bTgW8KEwiXEzK8nuuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFFpDZlPtSttbJirRw0P+AA6N8H2xDpTLEKcnwgwx17e2xauUlOl+4NYsjv99zBIOdMKQ5QZcxObbZGJ2Li42OYQ8XaeKYIx8UHQK14QbvGG939K/2Kh3DogcQoEtuAorS8+uzaz3xm4oyDsAhtgfXKVBfUaU4CA6yHy6L/xfXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=IZkR51xj; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="IZkR51xj"
ARC-Seal: i=1; a=rsa-sha256; t=1785605287; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mCBbWUcVmqT5gM26ox5n0D6EQPnL/76WrszhOY8R+Fe+RBS5R6maAldoQGdgI2qmox26oRT5gW4/Ehaq8XJ9c8bW8OrmtsxV9pqgiZOffwEK7jaREgzvTXeqN7rfHG//U6YZLmk/DE08eUDiqPHbVCkDM6ZWu3zCTqqIwX8xrAI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785605287; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BuqU5lzugYRL6r/58dbB4nFG9493Q3Ylf8ft4wp9QVI=; 
	b=RZxavxnvH8Ttv+z2t7wH9ozm4kgfKJLw/mae8Ns+VzD4YFJWELvv9ZwTb3Y+JzZ2y8cCG96Az5Oo6V+Hx6AtQ4Rd/caBt/G1Gzvr/TlkgTEQAe8kyM5T2cAv0tQLMzt1plTPZ1Unxgr48/Zz6Dac1AbKcNUaH3dZxhrM6eQXs0w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785605287;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=BuqU5lzugYRL6r/58dbB4nFG9493Q3Ylf8ft4wp9QVI=;
	b=IZkR51xjkxoewVFaRq8a0iIWrxjJEny2N/H399NRMsg0Sk8FuYR70yhIIlnhk2qh
	L9RO9GlbGNjyPYCkj74cpaPisu6JmswosfLcMwIySsPW+T7cD9FUg0VCs7sHVOFLxBU
	sYnkVZ0vqHuKvWBRUngAHOcXP38BVxx6eN0L+SAjDfAlIz4nf2eUXbz5p/+yn9yDrUl
	ZwG/HrbKSg9YPN8ZxcOH9aBZ7rOMK3omKnTNk32xV3I5XeHnvFybCGr8atPbOxeDlUt
	oAeQmeL/1Cecx37w8dONRxnZctzxoec4+sQ1TsPXMStT1BH6M7QlJp9UpPKRasyoKD+
	hJyM58vrcQ==
Received: by mx.zohomail.com with SMTPS id 1785605285634567.5544510496311;
	Sat, 1 Aug 2026 10:28:05 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 02 Aug 2026 01:26:47 +0800
Subject: [PATCH v4 03/12] leds: trigger: Add offloaded() callback and
 provide trigger_may_offload attribute
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-leds-trigger-hw-changed-v4-3-f97e2ca976fe@rong.moe>
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

There are multiple triggers implementing hardware control. However, the
LED trigger core doesn't really know the hardware control (offloaded)
state since the coordination is done directly between the trigger and
the LED driver. It can only assume private triggers as offloaded and
generic ones as not offloaded.

Add an offloaded() callback so that triggers can report their offloaded
states to the LED trigger core. When unimplemented, it defaults to true
for private triggers and false for generic ones to keep the current
behavior unchanged.

With that, provide a new attribute "trigger_may_offload", so that
userspace can determine:

- if the LED device supports hardware control (supported => visible)
- which trigger is the hardware control trigger selected by the LED
  device
- if the trigger is selected ("<foo_trigger>")
- if the trigger is offloaded ("[foo_trigger]")

Note: the documentation describes the attribute as "returning a list"
despite the LED core currently only supports one hardware control
trigger per LED device. This is intentional to make the attribute
extensible in the future without breaking userspace.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- Rearrange the series so that the code using the offloaded() callback is
  introduced before the driver implementation (thanks Thomas Weißschuh)
- Reword documentation (ditto)
- Adopt guard() and lockdep (ditto)
- Adopt __led_trigger_is_hw_controlled() from newly-integrated PATCH 1
---
 Documentation/ABI/testing/sysfs-class-led | 22 ++++++++++++++++++++++
 Documentation/leds/leds-class.rst         | 20 ++++++++++++++++++++
 drivers/leds/led-class.c                  | 22 ++++++++++++++++++++++
 drivers/leds/led-triggers.c               | 30 ++++++++++++++++++++++++++++++
 drivers/leds/leds.h                       |  2 ++
 include/linux/leds.h                      |  1 +
 6 files changed, 97 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index d4c918cc11a1..5afb307c935a 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -78,6 +78,28 @@ Description:
 		(which would often be configured in the device tree for the
 		hardware).
 
+What:		/sys/class/leds/<led>/trigger_may_offload
+Date:		August 2026
+KernelVersion:	7.3
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
+		- `foo_trigger`: the trigger is not selected.
+		- `<foo_trigger>`: the trigger is selected, but falls back to
+		  software blink for some reason (e.g., incompatible trigger
+		  parameters)
+		- `[foo_trigger]`: the trigger is selected and offloaded to
+		  hardware.
+
 What:		/sys/class/leds/<led>/inverted
 Date:		January 2011
 KernelVersion:	2.6.38
diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
index 3913966cfdac..2d41a6db602c 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -242,6 +242,9 @@ ops and needs to declare specific support for the supported triggers.
 
 With hw control we refer to the LED driven by hardware.
 
+A sysfs attribute `trigger_may_offload` is provided for userspace to
+query supported triggers and their states.
+
 LED driver must define the following value to support hw control:
 
     - hw_control_trigger:
@@ -298,6 +301,15 @@ LED driver must implement the following API to support hw control:
                 Returns a pointer to a struct device or NULL if nothing
                 is currently attached.
 
+LED trigger should implement the following API to indicate hw control:
+    - offloaded:
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
 
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index ab61e41a00a3..2460fcf0c469 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -96,8 +96,30 @@ static const struct bin_attribute *const led_trigger_bin_attrs[] = {
 	&bin_attr_trigger,
 	NULL,
 };
+
+static DEVICE_ATTR_RO(trigger_may_offload);
+static struct attribute *led_trigger_attrs[] = {
+	&dev_attr_trigger_may_offload.attr,
+	NULL
+};
+
+static umode_t led_trigger_is_visible(struct kobject *kobj,
+				      struct attribute *attr,
+				      int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+
+	if (attr == &dev_attr_trigger_may_offload.attr)
+		return led_cdev->hw_control_trigger ? attr->mode : 0;
+
+	return attr->mode;
+}
+
 static const struct attribute_group led_trigger_group = {
 	.bin_attrs = led_trigger_bin_attrs,
+	.attrs = led_trigger_attrs,
+	.is_visible = led_trigger_is_visible,
 };
 #endif
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 804a04b326c4..de17a8bbb4d4 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -42,6 +42,10 @@ static bool __led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
 	if (!led_cdev->trigger)
 		return false;
 
+	if (led_cdev->trigger->offloaded)
+		return led_cdev->trigger->offloaded(led_cdev);
+
+	/* Otherwise assume private triggers as always offloaded. */
 	return led_cdev->trigger->trigger_type;
 }
 
@@ -341,6 +345,32 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_set_default);
 
+ssize_t trigger_may_offload_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct led_trigger *trig;
+	bool hit, offloaded;
+	int len;
+
+	guard(mutex)(&led_cdev->led_access);
+	guard(rwsem_read)(&led_cdev->trigger_lock);
+
+	trig = led_cdev->trigger;
+
+	offloaded = __led_trigger_is_hw_controlled(led_cdev);
+	hit = offloaded || (trig && !strcmp(led_cdev->hw_control_trigger, trig->name));
+
+	/* [offloaded] <active_but_not_offloaded> inactive */
+	len = sysfs_emit(buf, "%s%s%s\n",
+			 offloaded ? "[" : (hit ? "<" : ""),
+			 led_cdev->hw_control_trigger,
+			 offloaded ? "]" : (hit ? ">" : ""));
+
+	return len;
+}
+EXPORT_SYMBOL_GPL(trigger_may_offload_show);
+
 /* LED Trigger Interface */
 
 int led_trigger_register(struct led_trigger *trig)
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index bee46651e068..b08a289397e4 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -27,6 +27,8 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 			const struct bin_attribute *bin_attr, char *buf,
 			loff_t pos, size_t count);
+ssize_t trigger_may_offload_show(struct device *dev,
+				 struct device_attribute *attr, char *buf);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index d7d3dd905432..cc664da33e94 100644
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

