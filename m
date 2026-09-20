Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F838471429;
	Sun, 20 Sep 2026 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933330; cv=pass; b=aRfrjOREwLsiSOwQjiymD0pVB9opBNIv62tCxps3Y/0xLIB5kPsQRdOlLiMilNpA6BnA87Q2n/u9DRVr/t5oSo7UCSbYkAHdVnGVaCcdkWI2i4IkPLhzR4JmPNfmEVTJAhMFBb9iwqLp/QL/i1PFtwA4mu8VOyf0YddSB01davo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933330; c=relaxed/simple;
	bh=7ZAsoBjFbWKnWetAs9AfEUvhkJPFN0slytnXiKl2zDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZmIvBQXn4fr+agGGxMeE2Jrto120CzV2rvvQkFFoMptTqSRBDlSgxGe6fkT++bZkH6V8dI06DHjiu8Lmno66cvBpVUCITYMjIU1OfoFQbr4sn3lEDlKYu2KWsg8hELHXQGuSXUaywLZ2v4SR3GLX0Rh0+4XWmfvAXD2HZud0idw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=cVld20WT; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="cVld20WT"
ARC-Seal: i=1; a=rsa-sha256; t=1789933234; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VhchqprH2utNAXr5wc563jmV1dyZgHehuKqWlf8IyFh0cbfBVepxH5uVVOkcKTCv5S3USWUBOba0g3jS/mX91QgwxoUHLN8F9XNhAmM09McS1sZxA+Un9u1AJXrgeZaEtKnk5dU5c34IPyPVz3GgvGxJQw4dnDZpAaSMjQSKOwU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789933234; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aOkhjiTA152ajScLyQAGXJjOlyLqpZinwlJKaTnX7k4=; 
	b=CPAE4BNCEtuPsNDUCxj8EyXy7iU2SlRuoci+Ba/i7puWT3e0Visz+nJ7NnGyPv2B5vdKfWB21h5uHCxWsPueGqZERHwmfklLT4nq/mXMSsKRiFDqj3is6L4HAKNPCoAZLzO4fQ2Jhn7BbDOlcU8IYL2S0bh368AO7Lm1O2qRjTc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789933234;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=aOkhjiTA152ajScLyQAGXJjOlyLqpZinwlJKaTnX7k4=;
	b=cVld20WTMUZrCd1o4tjEzrLb7tyfD0fPhizfaZVlqNQF0WJq4JalExFe54kHodRv
	SSeLN0knKGRE2vbDLbPmmzelwlQ23S8moeLxzUal2pUCakb/quJUTgpxX2kIfLa1a7m
	9SsYcXHwHWz7B9QK7hmYBgSDITzquwtKhZQ6KCTXaSv0IwehW9O/TNQvvrtZGV+ooMl
	cCann9ROlznMS8JZTp6zm+YeIPlJwL/G1sx9QcDAs0kGQx4U5nOAJoLu4kuCs1J1SyL
	IwaPMDdN+3AhzuGT5CRh5eVKkCk11Qz/3cwrvKlyx9ZtPkO2yNhwa/zMBj99tT2NMaK
	60HCi8hFXg==
Received: by smtp.zohomail.com with SMTPS id 1789933233687728.8641843943246;
	Sun, 20 Sep 2026 12:40:33 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 21 Sep 2026 03:40:16 +0800
Subject: [PATCH v7 02/13] leds: trigger: Move
 led_trigger_is_hw_controlled() to the right place
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-leds-trigger-hw-changed-v7-2-fe3cdb6dec51@rong.moe>
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
index 4259533dafa1..7110bfbe3b83 100644
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
index a515f075c29a..46ad2e03e1c6 100644
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

