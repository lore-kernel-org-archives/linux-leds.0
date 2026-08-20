Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8534772B1;
	Thu, 20 Aug 2026 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246600; cv=pass; b=q5h2G43SwtRSIY/RDieyxD7yZZqpauizB03vnvuKugf5bOYfwUBXF3dIleDAHfjkFUW2IBd6Of2rJyxse8dkxZeQb/juVKdK0LA6s6SmObKRDAVlA+3CFXcr2O2/fpoplaRj79HtW21O6O4U4ugMdHMJjh1bbbr81IaFfgCCdEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246600; c=relaxed/simple;
	bh=SaWWnlEcjMSmVNE89w77tRufh8KH7nt9jB/+YdyQJb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ID8vevpSDNx26BPkA2IGMIJsAuTlc1fvNM5EDP7a2ug7EnRVc8INsJc+Z9+uMX4FLe8zF6KSXqPu7WO6qvr2iOvGuvow2B0TlHrSZ6vgY9R0PChT4z4X+kcp6lZ72wBhQqUHp0ybASkPKmBBDNwGQSCe/yS3jIMAfPzCxhgG/f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=nJN6D5Wz; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="nJN6D5Wz"
ARC-Seal: i=1; a=rsa-sha256; t=1787246559; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a5zKAzsb7ZWs7ee0grh5s+XzjxjK00/MhtJ1+RBvbvlqWCJpFVJc1wHHIiQrG5Pq4brCPhuRex6UGwhisKZMhsnzI8eoWCdIet7IQj8NYmzgGvvS85Cxtja6f7H+TTvYHz0CMwgUKzQHiByou0/UFvF+sdfxjnZZ9/U2jM0zBDE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787246559; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x20s9sYKP1QXIHnLIrRbRzQHZ2FpigJkXqMRZW3bVsU=; 
	b=ePWtPVeRbjRWchHDb64MIWw6UxwTJIAHSjbe2tp45dsnLtHgzYNShxLt0ZNb/OWxuKOmVKIEg3UrgFVnrYMhxUOPpfu7SXYTUqyyQuPjcwaiTTEF/+gA965QFjqKYoAbsyd9cIAbaAqssIbEdiXIGgwGS168B4lpYlpO20MATiI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787246558;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=x20s9sYKP1QXIHnLIrRbRzQHZ2FpigJkXqMRZW3bVsU=;
	b=nJN6D5WzmJ3w79iEIIVXL98gIcuwj7IDHBsNRlu3xqQKlMuv6jfe1PwsBO+zVCPB
	E9Xl61Tnng0wQeHS1UNraSGvVhe5Kqb02bn4PMMTQvfRvYiWGDyd/MO0130zFlXsvVw
	LAnkDFbbBuCUpG0j5c0b1/qoHxdOpUCBPjHLiTwec6ImomflPU59Sd2Zvt/eFPpvW/j
	XI7ZTWHEb10V2/tatBcx378blZCadwq6G6IuRACZu9bLnOIvtcj3b2bDqV+gwaLqCoz
	oL7cg2sWTp6EtcgqnkqAMT72oEo1WypmMbgMKhBBQvGPRNEDZGKZBX7/XiH5v/6lpC+
	DF8ILVR+Uw==
Received: by mx.zohomail.com with SMTPS id 1787246557480868.0501060387792;
	Thu, 20 Aug 2026 10:22:37 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 21 Aug 2026 01:21:56 +0800
Subject: [PATCH v5 01/12] leds: Move led_trigger_is_hw_controlled() to the
 right place
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-leds-trigger-hw-changed-v5-1-3e00d6c4a936@rong.moe>
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

Currently led_trigger_is_hw_controlled() is placed at led-class.c, which
is not an right place as it falls into the triggers namespace and does
triggers stuff.

Move it into led-triggers.c, and split it into locked and unlocked
variant for convenience.

Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardware controlled LED")
Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- New patch in the series, the dependency of the following patches
---
 drivers/leds/led-class.c    | 10 ----------
 drivers/leds/led-triggers.c | 19 +++++++++++++++++++
 include/linux/leds.h        |  8 ++++++++
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index a51b0ed53886..1b8b688aaaaf 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -27,16 +27,6 @@ static LIST_HEAD(leds_lookup_list);
 
 static struct workqueue_struct *leds_wq;
 
-static bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
-{
-#ifdef CONFIG_LEDS_TRIGGERS
-	guard(rwsem_read)(&led_cdev->trigger_lock);
-	return led_cdev->trigger && led_cdev->trigger->trigger_type;
-#else
-	return false;
-#endif
-}
-
 static ssize_t brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index b1223218bda1..bf2543538ed0 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -7,9 +7,11 @@
  * Author: Richard Purdie <rpurdie@openedhand.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/lockdep.h>
 #include <linux/spinlock.h>
 #include <linux/device.h>
 #include <linux/timer.h>
@@ -33,6 +35,23 @@ trigger_relevant(struct led_classdev *led_cdev, struct led_trigger *trig)
 	return !trig->trigger_type || trig->trigger_type == led_cdev->trigger_type;
 }
 
+static bool __led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
+{
+	lockdep_assert_held(&led_cdev->trigger_lock);
+
+	if (!led_cdev->trigger)
+		return false;
+
+	return led_cdev->trigger->trigger_type;
+}
+
+bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
+{
+	guard(rwsem_read)(&led_cdev->trigger_lock);
+	return __led_trigger_is_hw_controlled(led_cdev);
+}
+EXPORT_SYMBOL_GPL(led_trigger_is_hw_controlled);
+
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 			  const struct bin_attribute *bin_attr, char *buf,
 			  loff_t pos, size_t count)
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b16b803cc1ac..a630f5a79f6b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -534,6 +534,8 @@ void led_trigger_set_default(struct led_classdev *led_cdev);
 int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trigger);
 void led_trigger_remove(struct led_classdev *led_cdev);
 
+bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev);
+
 static inline void led_set_trigger_data(struct led_classdev *led_cdev,
 					void *trigger_data)
 {
@@ -584,6 +586,12 @@ static inline int led_trigger_set(struct led_classdev *led_cdev,
 }
 
 static inline void led_trigger_remove(struct led_classdev *led_cdev) {}
+
+static inline bool led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
+{
+	return false;
+}
+
 static inline void led_set_trigger_data(struct led_classdev *led_cdev) {}
 static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
 {

-- 
2.55.0

