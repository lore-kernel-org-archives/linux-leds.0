Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793368297;
	b=2QoZargDSJWXOVjY1HLZN8JWkILVbo5ROrEVf1d50xe4KBLh/IQzXiY7qg532395Tzgc
	 jGwGHnXNAvSlFNLrkjj8RTMd5mxuXo00HTvQp8kpaxVpGB5SUnAAiqhor3sdDkfnmUs98
	 n5t61iW7zNCsQJVYt3L0u3+Jy3UXtGoHiT7b2cCsse/6BGOPWpowhH9jbSGH2Sd6colAy
	 F8M703j3gfx2w609e9N0vKQfM5tGSDzSdNh+Pk796kAXkgB2tZ/BAjGF7HOZmSQARZqK2
	 naoJpybApw+TRwTQIOHCRDyEnqiPZZE6M1Ihzf4DYQCEctSuUPgaS2aM2MGyE6nxmkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368297;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=M64UvXS64vo0gOOtp0YAqMhGqcxzmBpD7h7yNGxoB2I=;
	b=eWvGMP0pPvI88uQw/eD2TnNRot/sWeVzR14THIAjjzRyLGwnch5OnpUk3Mn78AUNlH82
	 5JhmkMV/GV+99rWibPeSjCzVs7Zxiv6XzFZsutcgtxlCRDIlaDt2EddS6QklG3eULeqmo
	 LMCAy4W5XnQudJPl4psKOs+HvBhb98NtBw5fv9l58AWNy7AaISoDQYCmSCYwoR02D6eb8
	 k/Y2Ex5HYJE2kkLOYyPrs+vtOYI/8NRQIt0BI7dEKGc/ZVAHJvEKPuHBBDVxAzVEsdo00
	 jAgFFsEEp4d5q7QfwMstv4CXtYYpARXk2IQMa5/nm0t1d0wSxJOTT+AMdqopRu+03Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAAwo16Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D3E606A32D;
	Fri, 30 Oct 2026 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAAwo16Y
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793368296;
	b=3A62V09VkHt0AnEDAnx8v5zas8AB+3RU5oJdjSOGdpAOlMzOTjfHSEs7ko4iR9lZK3FM
	 IkM1KyqLksfa5/nX0J8eObVsKQw2G7J24Yveg44vo8hJPAJQhseWBzZkhaIN19IEc729o
	 wWt7sIX8VsTV55DUuOQ+rA63rp73jxEYb38kY9yF24HWTmwLrgTFF6YIt8NuFdLTkt1S1
	 13Z9VSmuIeagOitwy4VBhVv3LHM3M7Bvovk3X0dc5/kKGchGPw1DY81GZgUTsQIEU1Fxn
	 StV2PTBgQcc4iiNzt0W6afD3kewcloSufxsASvPyQUIvGNW7uRSZrvsC8cGEHTiZ8dA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793368296;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=M64UvXS64vo0gOOtp0YAqMhGqcxzmBpD7h7yNGxoB2I=;
	b=DOOXZ638M8V7uKg9Gz09SQAOq0zNbj5002u257t4ySaerLACheh1XSMdpCGzqTnkm7TF
	 PupbK72TlNuJN1JCdfnbWOGHZ8adW22/oZ/wgVg0mbVcxVCFIPoPJqXIxyyqh8fABYa3u
	 /Xs4Ziu7jq9hNXCN/AIe4lnl9iOi9yqnYj8UJRW502nZwSo3lWQwJWbt4MXHRhfSQ/DMt
	 oOZUNl0zcrZVHrBQr1vpaT0G71E3oUO7L5zy7BIXsgCRHjIALvkG0pZEoNMoBwoGa9MKw
	 5DlvDN6hlDOLyxAQ+fg2T3rUN2LvyOQVytdUseg+MMLIUPPWzlcVT5gsHYhVht0laSA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 056511F00A16;
	Fri, 30 Oct 2026 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793368296;
	bh=M64UvXS64vo0gOOtp0YAqMhGqcxzmBpD7h7yNGxoB2I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UAAwo16Y0t/QiF0p6YXOkoKWoIleQ8laCqnq9Gm2kCexwVvDSqiVFqAUr0XSLHFdV
	 bH2hSOLdhm60R1iil4qP67eYEu1e6mbfyMgHTELFRKnYZrtiYdrJ6SkUFxqnx7A8pS
	 NP/UG9YqEWDx37hykyA/uNDJZ+yE7Sm2tx+h0IdX0a3u749UL2mkc8/ikMunODOPlm
	 5lfDNLqNe0RpeOuOSQl56iKClLWWn2+o3f81l5EYud6OwudVVZtETysqRR65OaQHZA
	 qn/WYITBo2kQw5ce/samq1B3RSiHW8OLWYH/OYfHV7eat4whw9s+yUYxpTOzEKUU/Z
	 9LeV0+sShHvdQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 71B99437E3;
	Fri, 30 Oct 2026 13:51:34 +0000 (UTC)
From: Nikolay Plastinin via B4 Relay <devnull+plaztininikolai.gmail.com@kernel.org>
Date: Fri, 30 Oct 2026 21:51:32 +0800
Subject: [PATCH v4 2/2] leds: trigger: input-events: Restore previous
 brightness on input
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261030-leds-input-events-brightness-v4-2-5ea0ead7480c@gmail.com>
References: <20261030-leds-input-events-brightness-v4-0-5ea0ead7480c@gmail.com>
In-Reply-To: <20261030-leds-input-events-brightness-v4-0-5ea0ead7480c@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikolay Plastinin <plaztininikolai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793368292; l=5347;
 i=plaztininikolai@gmail.com; s=20260924; h=from:subject:message-id;
 bh=0gQ+lQNtTSZ2rrSnglNS4oz/wIOSXLqSOeeFoSbjpMk=;
 b=xjgDMIhTZtF1JxtlsDoOtf9G2y5hQuqPvty+3ic+FOGw4chfj/eCkswdtA5K7dnq2X2A1oPy2
 Fl+vKlISXuIAq4H/Ij/6ytqkq4Ub8UZU2rJSH0MmJjUFv4Un5h6YeiD
X-Developer-Key: i=plaztininikolai@gmail.com; a=ed25519;
 pk=bmHrETa14IbiLNkJSoiLqUMni+IeSFwhOSDM4vVFN4s=
X-Endpoint-Received: by B4 Relay for plaztininikolai@gmail.com/20260924
 with auth_id=1052
X-Original-From: Nikolay Plastinin <plaztininikolai@gmail.com>
Reply-To: plaztininikolai@gmail.com
Content-Transfer-Encoding: 7bit

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

Use led_trigger_for_each_led() under guard(rcu)() for both the on and
off paths. Skip LEDs whose activate() callback has not set up their
state yet.

Clear trigger_data under the same lock used by the LED walker before
freeing the per-LED state. Although normal trigger removal waits for an
RCU grace period, the device_add_groups() error path calls deactivate()
while the LED is still linked, so a walker must see NULL after teardown.

The previous revision was tested on an ASUS ROG Flow X13 GV302XV:
keyboard backlight levels 1 and 2 were restored after idle timeout and
keyboard input, and 20 trigger activate/deactivate cycles completed
successfully.

Assisted-by: LLM
Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>
---
 drivers/leds/trigger/ledtrig-input-events.c | 76 ++++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
index d057b2a23..6b0bfd343 100644
--- a/drivers/leds/trigger/ledtrig-input-events.c
+++ b/drivers/leds/trigger/ledtrig-input-events.c
@@ -28,7 +28,69 @@ static struct input_events_data {
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
+	struct input_events_led *led;
+
+	scoped_guard(spinlock_irqsave, &input_events_data.lock) {
+		led = led_get_trigger_data(led_cdev);
+		led_set_trigger_data(led_cdev, NULL);
+	}
+	kfree(led);
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
+		/* Not yet activated, or already deactivated during error unwind */
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
@@ -42,7 +104,7 @@ static void led_input_events_work(struct work_struct *work)
 	 * running before a new event pushed led_off_time back.
 	 */
 	if (time_after_eq(jiffies, data->led_off_time)) {
-		led_trigger_event(input_events_led_trigger, LED_OFF);
+		input_events_set_leds(false);
 		data->led_on = false;
 	}
 
@@ -59,7 +121,7 @@ static void input_events_event(struct input_handle *handle, unsigned int type,
 	spin_lock_irqsave(&data->lock, flags);
 
 	if (!data->led_on) {
-		led_trigger_event(input_events_led_trigger, LED_FULL);
+		input_events_set_leds(true);
 		data->led_on = true;
 	}
 	data->led_off_time = jiffies + led_off_delay;
@@ -138,11 +200,13 @@ static int __init input_events_init(void)
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
 
@@ -153,7 +217,7 @@ static void __exit input_events_exit(void)
 {
 	input_unregister_handler(&input_events_handler);
 	cancel_delayed_work_sync(&input_events_data.work);
-	led_trigger_unregister_simple(input_events_led_trigger);
+	led_trigger_unregister(&input_events_led_trigger);
 }
 
 module_init(input_events_init);

-- 
2.56.0


