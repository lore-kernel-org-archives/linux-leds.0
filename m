Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A039041A776;
	Wed, 30 Sep 2026 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751254; cv=none; b=fH7eMn7qRUMajMx/OvOy8ibjtfhvUCWBkkjqL0lJfe9M2FM4GPoIrml88p+7PXMOi6IL2euaaCVserqhs4phBvPd1A39udEf2rpLsLdfNmJRffIHPk6Whs+w31YYM7W4p6XG5Fq6Zj+kipBQR4hrk+Rzu8cd41QIoQGQLdUg8W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751254; c=relaxed/simple;
	bh=WblCwHjXnmhmuIU9BPKP6E/7ajEERf2UqvqzvdyOkdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYgeDPu7lHG7olBzqK4kQ/voHOOrmp99dVyiBNKBIU0ABENG4EzjtPimfAroOxGtgMK0XRuijcBHj5RPpQBx06H3CPlyLe6ubqJ2fI9SbaeFAGoRF1JJZvraKt31Igoc0NCGTUga9rLfMN7Qk6+nQLTdtvlsGewSrDkDwvkpuu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCIw5Mg/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCIw5Mg/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED627C4AF14;
	Wed, 30 Sep 2026 06:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790751254;
	bh=WblCwHjXnmhmuIU9BPKP6E/7ajEERf2UqvqzvdyOkdg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lCIw5Mg/kvl28kFk/YcUFdtd0va4vEvtZKDhbOiD1uHCA38CONXQknFYaQ38Cpq4a
	 jbH2MnxkW570IoeuN19fccTkCOFiY7zJ2gQ+D3ZRhU0ayTfkAUsSCffPq4pXyUGNhN
	 53B8hni1s5SoDZyMxNWRd0HzQaw9qoLNVvvJrX7XW7qA4MfC9YYya83JLdcJbv7h/h
	 vnQaWc9t7r0PBly4OCKihkEbCIubV8Wii7ZJ17ZssyoBi2XT2iQBP916RFs9myq3kQ
	 ABibBdSwY5tszFAeh2gTk0MyYimXikACLYYUe1ms9UCpV9nvYX0Ry3HAugBB7p9xZv
	 9oJnEtgNYbXNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD565CA5FB1;
	Wed, 30 Sep 2026 06:54:13 +0000 (UTC)
From: Nikolay Plastinin via B4 Relay <devnull+plaztininikolai.gmail.com@kernel.org>
Date: Wed, 30 Sep 2026 14:54:10 +0800
Subject: [PATCH v2 1/2] leds: triggers: Add led_trigger_walk_leds()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-leds-input-events-brightness-v2-1-3948d3cddd83@gmail.com>
References: <20260930-leds-input-events-brightness-v2-0-3948d3cddd83@gmail.com>
In-Reply-To: <20260930-leds-input-events-brightness-v2-0-3948d3cddd83@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikolay Plastinin <plaztininikolai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790751252; l=3691;
 i=plaztininikolai@gmail.com; s=20260924; h=from:subject:message-id;
 bh=wpfYaG4LLyWihDY9Qc8kYyK/YTd9sxL3R9ZOPJtj3VI=;
 b=ZjunWCKmaDpU52J1wvH2w+PsqLBFgnYMOfXLAfV87X+zH9bR+g/DE5TnCreLcos8r08060+FG
 PEAaEq84DlhBlJw0EMvCcZoucsCVJL1xTGL4WSEAumzArZyr7Jc/M/9
X-Developer-Key: i=plaztininikolai@gmail.com; a=ed25519;
 pk=bmHrETa14IbiLNkJSoiLqUMni+IeSFwhOSDM4vVFN4s=
X-Endpoint-Received: by B4 Relay for plaztininikolai@gmail.com/20260924
 with auth_id=1052
X-Original-From: Nikolay Plastinin <plaztininikolai@gmail.com>
Reply-To: plaztininikolai@gmail.com

From: Nikolay Plastinin <plaztininikolai@gmail.com>

led_trigger_event() sets one brightness for all LEDs using a trigger.
A trigger which restores a different brightness per LED, such as the
input-events trigger turning keyboard backlights back on at the level
the user picked, needs to walk the trigger's LEDs itself. That means
using trig->led_cdevs and led_cdev->trig_list outside the LED core.

Add led_trigger_walk_leds(), which calls a function for each LED
using the trigger under rcu_read_lock(), the same way led_trigger_event()
does, so that such triggers do not have to walk the list themselves.

Assisted-by: LLM
Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>
---
 drivers/leds/led-triggers.c | 25 +++++++++++++++++++++++++
 include/linux/leds.h        |  7 +++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index b1223218b..b5fc14e47 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -422,6 +422,31 @@ void led_trigger_event(struct led_trigger *trig,
 }
 EXPORT_SYMBOL_GPL(led_trigger_event);
 
+/**
+ * led_trigger_walk_leds - call a function for each LED using a trigger
+ * @trig: the trigger, may be NULL
+ * @fn: the function to call for each LED
+ * @data: pointer passed to @fn
+ *
+ * Walks the LEDs currently using @trig under rcu_read_lock() and calls @fn
+ * for each of them. This is for triggers which set a different brightness
+ * per LED, where led_trigger_event() is not enough. @fn must not sleep.
+ */
+void led_trigger_walk_leds(struct led_trigger *trig, led_trigger_walk_fn_t fn,
+			   void *data)
+{
+	struct led_classdev *led_cdev;
+
+	if (!trig)
+		return;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list)
+		fn(led_cdev, data);
+	rcu_read_unlock();
+}
+EXPORT_SYMBOL_GPL(led_trigger_walk_leds);
+
 void led_mc_trigger_event(struct led_trigger *trig,
 			  unsigned int *intensity_value, unsigned int num_colors,
 			  enum led_brightness brightness)
diff --git a/include/linux/leds.h b/include/linux/leds.h
index a515f075c..c971a6aa5 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -476,6 +476,9 @@ static inline bool led_sysfs_is_disabled(struct led_classdev *led_cdev)
 #define DEFINE_LED_TRIGGER(x)		static struct led_trigger *x;
 #define DEFINE_LED_TRIGGER_GLOBAL(x)	struct led_trigger *x;
 
+/* Callback for led_trigger_walk_leds() */
+typedef void (*led_trigger_walk_fn_t)(struct led_classdev *led_cdev, void *data);
+
 #ifdef CONFIG_LEDS_TRIGGERS
 
 #define TRIG_NAME_MAX 50
@@ -521,6 +524,8 @@ void led_trigger_register_simple(const char *name,
 				struct led_trigger **trigger);
 void led_trigger_unregister_simple(struct led_trigger *trigger);
 void led_trigger_event(struct led_trigger *trigger,  enum led_brightness event);
+void led_trigger_walk_leds(struct led_trigger *trig, led_trigger_walk_fn_t fn,
+			   void *data);
 void led_mc_trigger_event(struct led_trigger *trig,
 			  unsigned int *intensity_value, unsigned int num_colors,
 			  enum led_brightness brightness);
@@ -566,6 +571,8 @@ static inline void led_trigger_register_simple(const char *name,
 static inline void led_trigger_unregister_simple(struct led_trigger *trigger) {}
 static inline void led_trigger_event(struct led_trigger *trigger,
 				enum led_brightness event) {}
+static inline void led_trigger_walk_leds(struct led_trigger *trig,
+					 led_trigger_walk_fn_t fn, void *data) {}
 static inline void led_mc_trigger_event(struct led_trigger *trig,
 				unsigned int *intensity_value, unsigned int num_colors,
 				enum led_brightness brightness) {}

-- 
2.55.0


