Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B8F56E064;
	Thu, 15 Oct 2026 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090612; cv=none; b=sPJq1rASoSd1EJgx5n5W7l8cPvgZW5TGerNJdqIpipuhHyxYr5D31rpTv473CYFT3Zt6uZebnk42htxtbBbWdzlOlI7DThu5Mv5wglQvXpY1mvNYZV0xxJfm5leV0KPlmU9D6HWnoIW7DdYXJB29op8rWr9r18/yINhf0uipSSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090612; c=relaxed/simple;
	bh=ElyfLtqtzLmZSmLb1jWr2tp4QFPdAgJsV149JvP+Res=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QWvei3xU5LO7QOVKvvKTzyM9jSX/CkttpgdaccR4fZBggPmRMxAAuVEQNn3xkTicGjbcIm1kCMy5LhaQmd2EBLme9Fu5MMbwO4OjtLYeC6avUm/uiIqJ3xbM3S7RoctubsVEDSTFqSU1FChROkThtZcKb83byjVntWqIjwVkcY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkfsnif5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkfsnif5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 656C0C2BD01;
	Thu, 15 Oct 2026 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792090612;
	bh=ElyfLtqtzLmZSmLb1jWr2tp4QFPdAgJsV149JvP+Res=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kkfsnif5my2Ig6CQ9D7IFw0niD7nw39CJwTehowuaQ27F0USE7QQZ0fYkYpbaTb7t
	 YVKAgnOxvXa1kHQ7HXo5ypW0vqHTEAGf6AZElnzvIWQ9ATzdaFmDfkpSwDnWGka7+N
	 7VLr55vYmwy7OpNqK4x4Cxrp/qNubl2O5yL6IJ51qA93YNt9tPeRhdFc4XT0bQWu3Q
	 tKyE3IhLqn8aYQ8cvHpxhpC0iAJypUJAhsnJ0ua6RbJSzu6WDzu2MiCMBNcIm2xUXx
	 dBvJN8IgPx28Q+sfcqYxNSG4L64MZFzOPLmEatr2jHLryGp5m/EepNlQ8qzzSjNj2l
	 ak4Gg5ErL4Sfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB5ACCA46B;
	Thu, 15 Oct 2026 18:56:52 +0000 (UTC)
From: Nikolay Plastinin via B4 Relay <devnull+plaztininikolai.gmail.com@kernel.org>
Date: Fri, 16 Oct 2026 02:56:50 +0800
Subject: [PATCH v3 2/2] leds: trigger: input-events: Restore previous
 brightness on input
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-leds-input-events-brightness-v3-2-2c462cafe020@gmail.com>
References: <20261016-leds-input-events-brightness-v3-0-2c462cafe020@gmail.com>
In-Reply-To: <20261016-leds-input-events-brightness-v3-0-2c462cafe020@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikolay Plastinin <plaztininikolai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792090610; l=4858;
 i=plaztininikolai@gmail.com; s=20260924; h=from:subject:message-id;
 bh=IZCau1PWkFhliwGVMTsFmldSEL+FnVeNEdrazXTQ30Q=;
 b=jRaIVq02vtSvU9FnWP5Wf5Pt7YaK5RJpO0cisi6cRW7vbY2TwBA38k/yKEuuCpoh6U9VeYyko
 A4wUIXttfkRDp0hCMqXpmajXmyplUSWe2sweSDsPWcCB5JeGIcdLh2b
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
the next input event. Keep the level in a per-LED state struct allocated
in activate() and freed in deactivate(), converting the simple trigger
to a regular trigger. Pick up brightness changes made while the LED is
on before saving the level again.

Use led_trigger_for_each_led() under guard(rcu)() for both the on and off
paths. Skip LEDs whose activate() callback has not set up their state yet.

Tested on an ASUS ROG Flow X13 GV302XV: keyboard backlight levels 1 and 2
were restored after idle timeout and keyboard input, and 20 trigger
activate/deactivate cycles completed successfully.

Assisted-by: LLM
Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>
---
 drivers/leds/trigger/ledtrig-input-events.c | 70 ++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
index d057b2a23..b339f1e89 100644
--- a/drivers/leds/trigger/ledtrig-input-events.c
+++ b/drivers/leds/trigger/ledtrig-input-events.c
@@ -28,7 +28,63 @@ static struct input_events_data {
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
+/* Must be called with input_events_data.lock held */
+static void input_events_set_leds(bool on)
+{
+	struct led_classdev *led_cdev;
+
+	guard(rcu)();
+	led_trigger_for_each_led(led_cdev, &input_events_led_trigger) {
+		struct input_events_led *led = led_get_trigger_data(led_cdev);
+
+		/* Added to the trigger, but activate() has not run yet */
+		if (!led)
+			continue;
+
+		/* Preserve brightness changes made while the LED was on. */
+		if (led_cdev->brightness)
+			led->brightness = led_cdev->brightness;
+
+		led_set_brightness(led_cdev, on ? led->brightness : LED_OFF);
+	}
+}
 
 static void led_input_events_work(struct work_struct *work)
 {
@@ -42,7 +98,7 @@ static void led_input_events_work(struct work_struct *work)
 	 * running before a new event pushed led_off_time back.
 	 */
 	if (time_after_eq(jiffies, data->led_off_time)) {
-		led_trigger_event(input_events_led_trigger, LED_OFF);
+		input_events_set_leds(false);
 		data->led_on = false;
 	}
 
@@ -59,7 +115,7 @@ static void input_events_event(struct input_handle *handle, unsigned int type,
 	spin_lock_irqsave(&data->lock, flags);
 
 	if (!data->led_on) {
-		led_trigger_event(input_events_led_trigger, LED_FULL);
+		input_events_set_leds(true);
 		data->led_on = true;
 	}
 	data->led_off_time = jiffies + led_off_delay;
@@ -138,11 +194,13 @@ static int __init input_events_init(void)
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
 
@@ -153,7 +211,7 @@ static void __exit input_events_exit(void)
 {
 	input_unregister_handler(&input_events_handler);
 	cancel_delayed_work_sync(&input_events_data.work);
-	led_trigger_unregister_simple(input_events_led_trigger);
+	led_trigger_unregister(&input_events_led_trigger);
 }
 
 module_init(input_events_init);

-- 
2.56.0


