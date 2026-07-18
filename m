Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE2C2F5491;
	Sat, 18 Jul 2026 17:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394567; cv=pass; b=FwBWMV7WTKOMMKT6w4QmMR/aIs4DKe8G1OWTxlHLYnq7ZLNFgbANNW2cx5HpmE31anwrxcJIaEnh9HzlL69L9Q66vhGm0fCLeguhABPAcwClkivlN4gY0X5veDXNvIIZNqWYDMGYxMjbjNJI4bZYICSBb1y0nBukzJ6/8jZXQZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394567; c=relaxed/simple;
	bh=bJnTXATyAYlzXpZPk8Dfcz0jlDB1H48T+urva4t1gyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uq7LDsLUz95dje6GwDx45LzUftyI+cD/+KDzOs+p87AXRRWSNlaihy7DgpsEWztOzFXcbgKUi1/3eFtrVjIYqZQC+8uid0VPTDUFKxO4zTpx/7BzkWcor1/XlYJhc2x5KtVV2poEzpb8TOHPOxmSo+eDIWIvvQbbmJ6ohzQU+oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=SQUks7KN; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="SQUks7KN"
ARC-Seal: i=1; a=rsa-sha256; t=1784394524; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CkutoRfB/YBnmFvipxcTO49sV2347B1UcGV1qAnfXIkbxvWO1E2EQ0A85LQ7h4MmHpnNOK4bP2A1RqJjZeyQl8gCHIpdzdlgEY5BAP9rEXjodUiBwkUtxAI4DASAPhQ608tQWio4lira4bZV251jGRKCxKet1SsEYjBJwxcxTPo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784394524; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y+6hZ2OlWJ9isoyhTLOLbV0taQiuXabgo/K8f33HwOc=; 
	b=Q0YJQFj6eYuSXU6wJXb1FSQzJEAi46ymQjzHp4b2BWvcoDsm5w65TLwrbDIIj/AQVgQqG6loM690w7IfHwb0sRBkXvNMD8jPQRczcY8CrAdMw9gGMXfWTkOL2Huc6faVY20ESpAWEQDrXuug+JGh/BnbnBViTFHeeGwfmZk5ey0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784394524;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=y+6hZ2OlWJ9isoyhTLOLbV0taQiuXabgo/K8f33HwOc=;
	b=SQUks7KNK2sNS8Vbtw6qxSYboOBMID4r/Zajai2KylXHVq71nPKAarlissSY89v4
	lXOZFtnwxSSigMl2c/dLu6thlyNqioWAoG7cofDe9RRZM+3JD1SljS7wi7b9ZU0xHUZ
	644pgQERDSahZKS5dlCDFq8AnnrTCjYBbReKz9cVdANFJ4OrB4hDxqgk/+6Ch8fNWvB
	BBWgXisEVIUkhjYpHjP9anblGpKtKXLm0qKF+ugGPuVdyyG1pjsZgfKA+cU5FtVccQ4
	Hd5/fLXNwBZICv7xWy5NdvaQ/vKYZyyGcCBIu9dAKZ9O617drMjt2w0O4Q1dZiJsYdU
	lmgPqqbZNg==
Received: by mx.zohomail.com with SMTPS id 1784394521636564.3850641962187;
	Sat, 18 Jul 2026 10:08:41 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 19 Jul 2026 01:05:18 +0800
Subject: [PATCH RFC v3 01/11] leds: Move led_trigger_is_hw_controlled() to
 the right place
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-leds-trigger-hw-changed-v3-1-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
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
X-Mailer: b4 0.16-dev-4217c
X-ZohoMailClient: External

Currently led_trigger_is_hw_controlled() is placed at led-class.c, which
is not an right place as it falls into the triggers namespace and does
triggers stuff.

Move it into led-triggers.c, and split it into locked and unlocked
variant for convenience.

Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardware controlled LED")
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
2.53.0

