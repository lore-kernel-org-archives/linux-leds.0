Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF2447ACF3;
	Sun, 20 Sep 2026 19:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933370; cv=pass; b=MLx53eLeV3qkejeHbKa10gz+qxMCkvuk7T0cBXPbeLB0FLOiiypaqX4fcDB3iIjA4zGl9tjT4MtsGsu+m4tJB/HLLSlAATR2blCz7xpPOr3qfNjbJaIckTfPA1ot9416kmFzx9us4Emn4JeTfjdj5eiozT6Yg9b3Ypety/J3C4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933370; c=relaxed/simple;
	bh=6PM1FrhmNIGZlw6oZpV2rF34bsqDRbem3JOmrVKjo5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kXiv7yW8FloSAU4+zsCkFRnUxXEgVM1HxLiZvxPGsVUNrAd390aYhjwwSPzaePSYB/khv8y4Pw6HVH7ag9qMNNqZdMhRdI2jz/B13HhObEbTuy5iLEUm1uIWLkIfjB45ZoDQjVuGyt2A8FvLHQqYxUNTTa7ADaYinE5gQLTb5D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=prNxBefM; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="prNxBefM"
ARC-Seal: i=1; a=rsa-sha256; t=1789933244; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Oh/MIGlf/mcc3cYeR8DeGA1RU8WfpyvYbNfR5DpCaNprei7pOuVpL3AL/mRE+yP4wpzR7ldhMNkj9mHE/pquMAzyaxXjZguUvq/as31H+V6y+XyKWNfqKOie/98qEe11wwygzaV0LamQhAkyh1Zt10OT+O5ybaFs2V5vI5xQhMw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789933244; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MH/GLTkY4E1a90PAm9Tg7XoGhfvi0m4G9L3vItnyqn4=; 
	b=PiU3yHIvxoCM2ODvVmjfqYm3JkdGqetvRmCmXUBWw8BSwKkdgJ0zWNNOpY58erHfHQmo6g5IbOUMMKQNIVF7Z3CMMwHpuk90NChvGsa38TpHr9w94G9e7c0Ek9W80EJZDVMxd+Ji4KjMacUOyllEZZ/U2Dsi9MaXXJinvfzBkeU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789933244;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=MH/GLTkY4E1a90PAm9Tg7XoGhfvi0m4G9L3vItnyqn4=;
	b=prNxBefMZMRW66knmcwc2e+cHhIspMykwQ/49yLbbkis/AY3b6LNIyBw4P+iEVW4
	8kz3VO5WuuZP/+N8CoA5sgpRNaTqZPt3BJgAJYq9jdfLHnr4Vp4Z1b5T40VjAXKu9NU
	gs0ZRNAKQgYy1muQFeNETPPvdbU6dU5vKNWgVyz7ZYJoUgJ/pp6q1M8+9nlWl/3OMOA
	c8phbaFsejB2ZtM90NI51UcEDNFUzjzNNgcYxtp7zlxMOMxMqkjsmMGOedCIWijuiKg
	uQIShLcYHxyFnvTZidzKAuQGZq+SMWvRxHzam9yA5Fg+tLJsdLxM2o3OFi6DWgrbXea
	ccDcmZZaSA==
Received: by smtp.zohomail.com with SMTPS id 1789933243566611.1316157652694;
	Sun, 20 Sep 2026 12:40:43 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 21 Sep 2026 03:40:18 +0800
Subject: [PATCH v7 04/13] leds: trigger: Move led_trigger_group to the
 right place
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-leds-trigger-hw-changed-v7-4-fe3cdb6dec51@rong.moe>
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

Currently led_trigger_group and its members are placed at led-class.c,
but they falls into the triggers namespace and does triggers stuff.
Placing them at led-class.c also requires the read and write callback to
be exported and results in an extra #ifdef block.

Move it into led-triggers.c, so that it becomes the only symbol to be
exported for sysfs attributes.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v7:
- Add a new patch to the series to collect trigger attribute stuff
  together into led-triggers.c (thanks Lee Jones)
---
 drivers/leds/led-class.c    | 11 -----------
 drivers/leds/led-triggers.c | 25 +++++++++++++++++--------
 drivers/leds/leds.h         |  7 +------
 3 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 39cc2f3ea63f..7f51715fac69 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -90,17 +90,6 @@ static ssize_t max_brightness_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(max_brightness);
 
-#ifdef CONFIG_LEDS_TRIGGERS
-static const BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
-static const struct bin_attribute *const led_trigger_bin_attrs[] = {
-	&bin_attr_trigger,
-	NULL,
-};
-static const struct attribute_group led_trigger_group = {
-	.bin_attrs = led_trigger_bin_attrs,
-};
-#endif
-
 static struct attribute *led_class_attrs[] = {
 	&dev_attr_brightness.attr,
 	&dev_attr_max_brightness.attr,
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 804a04b326c4..de6056bc80e6 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -52,9 +52,9 @@ bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_is_hw_controlled);
 
-ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
-			  const struct bin_attribute *bin_attr, char *buf,
-			  loff_t pos, size_t count)
+static ssize_t trigger_write(struct file *filp, struct kobject *kobj,
+			     const struct bin_attribute *bin_attr, char *buf,
+			     loff_t pos, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
@@ -97,7 +97,6 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 	mutex_unlock(&led_cdev->led_access);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(led_trigger_write);
 
 __printf(3, 4)
 static int led_trigger_snprintf(char *buf, ssize_t size, const char *fmt, ...)
@@ -149,9 +148,9 @@ static int led_trigger_format(char *buf, size_t size,
  * attribute, which is not limited by length. This is _not_ good design, do not
  * copy it.
  */
-ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
-			const struct bin_attribute *attr, char *buf,
-			loff_t pos, size_t count)
+static ssize_t trigger_read(struct file *filp, struct kobject *kobj,
+			    const struct bin_attribute *attr, char *buf,
+			    loff_t pos, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
@@ -179,7 +178,17 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 
 	return len;
 }
-EXPORT_SYMBOL_GPL(led_trigger_read);
+static const BIN_ATTR_RW(trigger, 0);
+
+static const struct bin_attribute *const led_trigger_bin_attrs[] = {
+	&bin_attr_trigger,
+	NULL
+};
+
+const struct attribute_group led_trigger_group = {
+	.bin_attrs = led_trigger_bin_attrs,
+};
+EXPORT_SYMBOL_GPL(led_trigger_group);
 
 /* Caller must ensure led_cdev->trigger_lock held */
 int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index bee46651e068..c1db21e943b0 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -21,14 +21,9 @@ void led_init_core(struct led_classdev *led_cdev);
 void led_stop_software_blink(struct led_classdev *led_cdev);
 void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value);
-ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
-			const struct bin_attribute *attr, char *buf,
-			loff_t pos, size_t count);
-ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
-			const struct bin_attribute *bin_attr, char *buf,
-			loff_t pos, size_t count);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
+extern const struct attribute_group led_trigger_group;
 
 #endif	/* __LEDS_H_INCLUDED */

-- 
2.55.0

