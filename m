Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A025B40B6F4;
	Wed, 30 Sep 2026 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751254; cv=none; b=CQTDOeRozMrlVZVT2VU3ea//3orBEGrobjOzdhWHQsPCVkMLJit94sGRMd2O2+lTq18Kg3/btWlUOizEBmqp7ALU6lHDnGBFUjX6HG7g/E8gRms39ar1QILULxCm2IsoDTKRqAUEEdIBFvljJqO45eTAEbdOdpvIyFVse2luFzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751254; c=relaxed/simple;
	bh=GJuY2GwDbOaQ0wzB+emLjw8XWzws7ACjW1EmYPYj1PQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RPaAjDl3UsNyFyTuJNx9y72vUktV1qbiUreW6vZZ2RHRii5EbtdCgZh3Rcorxwxnw9lh7CvLVQ18Kqd6u4zNL2z+qzWUhaHQ5YJ6Qpy4wCG1Mj+u7yGKtEC8iBZhEoCe0AKLIhsz3xPsPK9rrX0Kggu6yTHI+KV/ibpYa60yDg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4Td4csf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4Td4csf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07F4BC4AF12;
	Wed, 30 Sep 2026 06:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790751254;
	bh=GJuY2GwDbOaQ0wzB+emLjw8XWzws7ACjW1EmYPYj1PQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u4Td4csfWmxXaFO5sXo7Hy7e2pZQ0IUAiToNH4Xwzu5AMqHSuOK9yTio5e8rqQvqE
	 6km7ht6rLox3mF/nOI90PBl5e5cnEdLKZrCFMsLIfwTf0XF1S2e0hUwDfBwkQph03D
	 TZm6GcyaFgGqp5wwrcV9OWnq5xRfCkAgWPbAuy4w/hShkJnBfkIG52nm+lvZF2xwOY
	 Yj6pkt4qOoTWjFvvDo+Yzee6kWKvW/61/NtqWnvcawOJRWubc8wuDW+y1TcLNFCv6a
	 r15CCfnV53JX/RFAB+08M6eqfAK8ut7w1D+ame2QOLX561QFURhYCi3KxhYM43ZW17
	 5owLza9ALzy6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC154C9830E;
	Wed, 30 Sep 2026 06:54:13 +0000 (UTC)
From: Nikolay Plastinin via B4 Relay <devnull+plaztininikolai.gmail.com@kernel.org>
Date: Wed, 30 Sep 2026 14:54:11 +0800
Subject: [PATCH v2 2/2] leds: trigger: input-events: Restore previous
 brightness on input
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-leds-input-events-brightness-v2-2-3948d3cddd83@gmail.com>
References: <20260930-leds-input-events-brightness-v2-0-3948d3cddd83@gmail.com>
In-Reply-To: <20260930-leds-input-events-brightness-v2-0-3948d3cddd83@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikolay Plastinin <plaztininikolai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790751252; l=5127;
 i=plaztininikolai@gmail.com; s=20260924; h=from:subject:message-id;
 bh=RbEc1eykxaPKru4rDNPhpEDfg4rgI5yqVZMbBLxRd/A=;
 b=yOfvNNWyk+IyDLaSa8dhkLhtUga/TXDjXpPx8ksJu+c0hIEo0l0o2kmdDFX5/a0luiVfOWkLE
 Qu2RUEUcIuYAaraEapejvIDBt7YX5BW5cU3gQKMPtR6TImFGum6F/V9
X-Developer-Key: i=plaztininikolai@gmail.com; a=ed25519;
 pk=bmHrETa14IbiLNkJSoiLqUMni+IeSFwhOSDM4vVFN4s=
X-Endpoint-Received: by B4 Relay for plaztininikolai@gmail.com/20260924
 with auth_id=1052
X-Original-From: Nikolay Plastinin <plaztininikolai@gmail.com>
Reply-To: plaztininikolai@gmail.com

From: Nikolay Plastinin <plaztininikolai@gmail.com>

The trigger turns the LEDs back on with LED_FULL, which the LED core
clamps to max_brightness. For keyboard backlights with several levels,
such as asus::kbd_backlight, this means the backlight always comes back
at maximum after being idle instead of at the level the user picked.

Remember the brightness per LED before turning it off and restore it on
the next input event. The level is kept in a small per-LED state struct
allocated in activate() and freed in deactivate(), so the trigger is
converted from the simple trigger API to a regular trigger. Brightness
changes made while the trigger is active, for example with the keyboard
brightness hotkeys, are picked up too. The LEDs are walked with the new
led_trigger_walk_leds() helper instead of the trigger touching
trig->led_cdevs itself.

Tested on an ASUS ROG Flow X13 GV302XV: with the keyboard backlight at
level 1, it now comes back at level 1 after going idle instead of at 3.
A level changed with the brightness hotkeys while the trigger is active
is restored after the next idle period as well.

Assisted-by: LLM
Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>
---
 drivers/leds/trigger/ledtrig-input-events.c | 74 ++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
index d057b2a23..4729c8507 100644
--- a/drivers/leds/trigger/ledtrig-input-events.c
+++ b/drivers/leds/trigger/ledtrig-input-events.c
@@ -28,7 +28,67 @@ static struct input_events_data {
 	unsigned long led_off_time;
 } input_events_data;
 
-static struct led_trigger *input_events_led_trigger;
+struct input_events_led {
+	/* Brightness to restore on the next input event */
+	int brightness;
+};
+
+static int input_events_activate(struct led_classdev *led_cdev)
+{
+	struct input_events_data *data = &input_events_data;
+	struct input_events_led *led;
+	unsigned long flags;
+
+	led = kzalloc_obj(*led);
+	if (!led)
+		return -ENOMEM;
+
+	/* Start with the current brightness, or full if the LED is off */
+	led->brightness = led_cdev->brightness ?: led_cdev->max_brightness;
+
+	spin_lock_irqsave(&data->lock, flags);
+	led_set_trigger_data(led_cdev, led);
+	led_set_brightness(led_cdev, data->led_on ? led->brightness : LED_OFF);
+	spin_unlock_irqrestore(&data->lock, flags);
+
+	return 0;
+}
+
+static void input_events_deactivate(struct led_classdev *led_cdev)
+{
+	kfree(led_get_trigger_data(led_cdev));
+}
+
+static struct led_trigger input_events_led_trigger = {
+	.name = "input-events",
+	.activate = input_events_activate,
+	.deactivate = input_events_deactivate,
+};
+
+static void input_events_set_led(struct led_classdev *led_cdev, void *arg)
+{
+	struct input_events_led *led = led_get_trigger_data(led_cdev);
+	bool on = *(bool *)arg;
+
+	/* Added to the trigger, but activate() has not run yet */
+	if (!led)
+		return;
+
+	/*
+	 * Remember the brightness the LED was last set to, e.g. by a hotkey
+	 * while it was on, so that it is restored instead of max brightness.
+	 */
+	if (led_cdev->brightness)
+		led->brightness = led_cdev->brightness;
+
+	led_set_brightness(led_cdev, on ? led->brightness : LED_OFF);
+}
+
+/* Must be called with input_events_data.lock held */
+static void input_events_set_leds(bool on)
+{
+	led_trigger_walk_leds(&input_events_led_trigger, input_events_set_led, &on);
+}
 
 static void led_input_events_work(struct work_struct *work)
 {
@@ -42,7 +102,7 @@ static void led_input_events_work(struct work_struct *work)
 	 * running before a new event pushed led_off_time back.
 	 */
 	if (time_after_eq(jiffies, data->led_off_time)) {
-		led_trigger_event(input_events_led_trigger, LED_OFF);
+		input_events_set_leds(false);
 		data->led_on = false;
 	}
 
@@ -59,7 +119,7 @@ static void input_events_event(struct input_handle *handle, unsigned int type,
 	spin_lock_irqsave(&data->lock, flags);
 
 	if (!data->led_on) {
-		led_trigger_event(input_events_led_trigger, LED_FULL);
+		input_events_set_leds(true);
 		data->led_on = true;
 	}
 	data->led_off_time = jiffies + led_off_delay;
@@ -138,11 +198,13 @@ static int __init input_events_init(void)
 	INIT_DELAYED_WORK(&input_events_data.work, led_input_events_work);
 	spin_lock_init(&input_events_data.lock);
 
-	led_trigger_register_simple("input-events", &input_events_led_trigger);
+	ret = led_trigger_register(&input_events_led_trigger);
+	if (ret)
+		return ret;
 
 	ret = input_register_handler(&input_events_handler);
 	if (ret) {
-		led_trigger_unregister_simple(input_events_led_trigger);
+		led_trigger_unregister(&input_events_led_trigger);
 		return ret;
 	}
 
@@ -153,7 +215,7 @@ static void __exit input_events_exit(void)
 {
 	input_unregister_handler(&input_events_handler);
 	cancel_delayed_work_sync(&input_events_data.work);
-	led_trigger_unregister_simple(input_events_led_trigger);
+	led_trigger_unregister(&input_events_led_trigger);
 }
 
 module_init(input_events_init);

-- 
2.55.0


