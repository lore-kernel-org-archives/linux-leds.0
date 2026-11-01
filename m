Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793517563;
	b=nADYjBYlusj+6iqKAj3m2rRkHkpGg/F5tM6+FaZw/9mZwx6eXPPhwabWC8y26hDVIPvC
	 FjKEkJnCw+LjMz2I1rJtOb5ZBBVmIesdUmXvwf5KrU0ML4p8pIfkLKV5IuJKK+ReoiyHw
	 MMoXvZ6Kxu2FxL4mRTZzdXA/kioyBi1egxyJXhe9iIOb5iZ2eBhndil3qDwcK1rbTaIQB
	 75moaQYVoZlaRfzekKMRKWJuGYSV8xYogexN/IE1hsNHQZ8QnkE6l9vCDmCfvKYm49Oo5
	 cKBo8+1OrVKG7wmr+3NWwfrgqteRgFV3yCE8jiwNEd/J/3KvbtWBH86NLEBedu+tXlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517563;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d0Jwc6X3egJcs1GVoLjLmf7TOk7kUESXWn7WXw8D6Kw=;
	b=u4Amlt04zaqvOBZIBm6T6a+fo/ZFlWketUyoATO9OIG+3ciRzNYRnZkhnoSFy1DdpCg4
	 Js83b3Zuw7edpKGC5P+082jerMF0O4rAOonBAFHf/jR1CTvXfCn1f7CnlaO3ozsoO5odx
	 xkPn9OKDMWXSevQew9FHwjKc9xL7jyiClxcDyXOSihSe5Ct4hNAjC3Ue/UaQDp1gS+QwG
	 Gr9LfN4Ppe8IAb8Mijppyo51KLCA24tExQtaQptSvt3RnVIp52TCyJYoM4EBsnGRzZyps
	 IPgQOawGMuC+lxHLoy8a7CubEMS52ok6qcprNpXKAdJj6ybLa5SbR3ZH6/mWiTpMCAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMIjDZm0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6103E606A324;
	Sun,  1 Nov 2026 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMIjDZm0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793517563;
	b=MMv4csz7LUyv/toOd1ngBGs/sJx2kcoDzj1bRNLKSqT8inmXcuAcY26AFV6BGSqPUv5L
	 Y3dbufb/8Ya8GPOUxfWSxYFLQOVC8IBfQvq4CbWYe5eT10QeQ/scOFGZIHeURQE+1wTvh
	 HISbv+njj/jHebmojXAJ1vfRUFQnUHIXkN1qOej7UTC0pPE5M4KxngKaY0EPMGdi7Us2D
	 AcjfNmFzr4mQ9Npsr44gwDcbUuhDWv7FXvtoItgy2VZ4Rsit72NYMiWnNkcTigeztT/GK
	 2+lQSGWoJFPhRipTK8kkJuGDQJyx97d2doY4YjnH8/sPeQXg1ErThHr6qqqHZ3tqu2Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793517563;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d0Jwc6X3egJcs1GVoLjLmf7TOk7kUESXWn7WXw8D6Kw=;
	b=qWgKG1ezgjVlyyJPnciMhHB3VoYNIDW0WIiDD6IRh12hneQmGPrNNZKHQEAhXEUIAxMx
	 +h9uY7vglBb7SbJZ4Q4MLhZpKXJ5fGuX6EMthRu206rlL18uRrMpR/vEU0+tHZBBHQ3la
	 jEjEUYDRqo1hZ01riCh7H2C9NuQxG++TAkh/ksgqMofbW37LQxBx1Qx+LT/0cND7AU5nB
	 6qsNlz17itz8tmeDQL2Oua37o05kn4RSeW73doPV70GEW65v3OwK6A1YImYzSQNJuFisD
	 GTVPHwaziYaprSokMp2g3UkGX0az6/Rqiq2xHGtX6142u3LDwhsHnOZxb94tQd3WzyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3ACA91F000C1;
	Sun,  1 Nov 2026 07:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793517562;
	bh=d0Jwc6X3egJcs1GVoLjLmf7TOk7kUESXWn7WXw8D6Kw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=oMIjDZm04+AK48k9sCL+FKt9vE8nZfq60upu6DnrHQY7s+xYkl1ElT2LKWsp1ZxVp
	 XCZFjla8Ig1dIxxcbG6JjWmDEftvcK9Vdr8jp8iJgaxjTDFL2wDwvrZOe6U0ftSr41
	 9916xyAeBVal2IrazEzJcO4m7OlsLBQSylwAHCOuoyCwvqYFBxjY7R8E/ZgzqEH7Bt
	 TxTpSWfVMWsFUCEBElvcvKbDqdUsJ9/Q9wi0lE45AhigwzCErdg5rJgOou1fP5g4E/
	 Vs+3cUxkaSXM+vyqeLTxaMk0K87w8j3gdDb0BzMtSa/kc4GUx3xQz7NtkTGqXUDM8e
	 XrFkiZPsgmtAA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8D0C1460ED;
	Sun,  1 Nov 2026 07:19:21 +0000 (UTC)
From: Nikolay Plastinin via B4 Relay <devnull+plaztininikolai.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 15:19:18 +0800
Subject: [PATCH v5] leds: trigger: input-events: Restore previous
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
Message-Id: <20261101-leds-input-events-brightness-v5-1-d5296b1957dc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Ou27DMAyF4VcJNIcBdfGtU9+j6EBLtC0gkQPJF
 VoEfvcqGQKjHZzx5/Ad3kTi6DmJt8NNRM4++TmUqI4HYScKI4N3pYVCVWOnDJzZJfDh+rUAZw5
 Lgj76cVoCpwTU1MQdNU3fVqIQ18iD/37wH5+lJ5+WOf481rK8X1+EswQJPVoeBk1KG/0+XsifT
 3a+iDuc1QbTuIMpQNCdaZ22zrn2H6afmERZ72C6YMqaWlkaGBX+xcwG2/3MFKxiQibXmBbtFlv
 X9ReN3mklrwEAAA==
X-Change-ID: 20260924-leds-input-events-brightness-a76ae9a77b85
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikolay Plastinin <plaztininikolai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793517559; l=9582;
 i=plaztininikolai@gmail.com; s=20260924; h=from:subject:message-id;
 bh=P24GCfkFyv+z/dAtuHD8odXbRDrCuDyfPXRHi96zv1c=;
 b=8q+a2MSLo3uhp52HdVP468XeLNAzvPCEiIcIfd2OEovlm/ohhaxGxvS6Ct7xZsxw5yYaWRU9I
 cxLLkdw9tPBDqf8BggrwyxK1ccPS+/Ma/zh3zvE0SLY2abYU4aCGOIm
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

Iterate directly with list_for_each_entry_rcu() under guard(rcu)() for
both the on and off paths. Skip LEDs whose activate() callback has not
set up their state yet.

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
The input-events trigger turns LEDs back on with LED_FULL, so a keyboard
backlight with several levels always comes back at maximum after being
idle. This series restores the level the user picked instead.

V5 is a single patch. Iterate directly over the trigger's LEDs using
list_for_each_entry_rcu() under guard(rcu)(), as requested by Greg KH.
The per-LED state and locked teardown from v4 are unchanged. No changes
to include/linux/leds.h or the LED core are needed.

This came up while looking at a keyboard backlight idle timeout for ASUS
laptops in asusctl:
https://github.com/OpenGamingCollective/asusctl/issues/98

Validation for v5: the module builds out of tree with W=1 against Fedora
7.2.12-200.fc44.x86_64 using the installed kernel headers. The user-space
harness using the driver functions passes ASan/UBSan for the error-unwind
ordering, brightness restoration, and 10,000 concurrent teardown cycles.
The harness uses a mutex and a one-element list instead of kernel
primitives; it is not kernel fault injection or an RCU implementation test.
V5 hardware testing passed on the GV302XV with kernel 7.2.12: levels 1
and 2 were restored after idle and input, and 20 activate/deactivate
cycles completed. The original brightness 2 and trigger none were
restored, and the test module was unloaded. A separate journalctl check
of the test interval showed no kernel entries; the script's dmesg output
included messages from earlier suspend/resume cycles.

V4 was tested on an ASUS ROG Flow X13 GV302XV with kernel
7.2.12-200.fc44.x86_64 and no external monitor: brightness levels 1 and 2
were restored after idle timeout and keyboard input, and 20 trigger
activate/deactivate cycles passed. No kernel messages appeared during
the test. The original brightness and trigger were restored afterwards.
No full kernel build has been performed.

LLM assistance was used for the implementation, tests and message drafts.
---
Changes in v5:
- Drop the common led_trigger_for_each_led() macro and its patch.
- Open-code list_for_each_entry_rcu() next to guard(rcu)() in the trigger,
  as requested by Greg KH; include linux/rculist.h directly.
- Keep the locked trigger_data teardown from v4 unchanged.
- Link to v4: https://lore.kernel.org/r/20261030-leds-input-events-brightness-v4-0-5ea0ead7480c@gmail.com

Changes in v4:
- Clear trigger_data under input_events_data.lock before freeing per-LED
  state in deactivate(), as suggested by Lee Jones. This also covers the
  device_add_groups() error path, which deactivates before list removal.
- Update the NULL-state comment to cover activation error unwind.
- Patch 1 is unchanged.
- Link to v3: https://lore.kernel.org/r/20261016-leds-input-events-brightness-v3-0-2c462cafe020@gmail.com

Changes in v3:
- Replace led_trigger_walk_leds() with led_trigger_for_each_led(), an
  RCU list iterator in include/linux/leds.h, as suggested by Lee Jones.
- Remove the exported helper, callback typedef, and void-pointer argument.
- Keep saving and restoring brightness in input_events_set_leds(), using
  guard(rcu)() and a single loop for both the on and off paths.
- Link to v2: https://lore.kernel.org/r/20260930-leds-input-events-brightness-v2-0-3948d3cddd83@gmail.com

Changes in v2:
- Keep the saved brightness in a per-LED struct allocated in activate()
  and freed in deactivate(), stored in led_cdev->trigger_data, instead of
  overloading blink_brightness (Lee Jones).
- Add led_trigger_walk_leds() to led-triggers.c and use it instead of
  walking led_cdevs/trig_list from the trigger (Lee Jones).
- Use the Assisted-by tag format from coding-assistants.rst.
- Link to v1: https://lore.kernel.org/r/20260924-leds-input-events-brightness-v1-1-b0ceff3a2343@gmail.com
---
 drivers/leds/trigger/ledtrig-input-events.c | 78 ++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
index d057b2a23..5fbd3e853 100644
--- a/drivers/leds/trigger/ledtrig-input-events.c
+++ b/drivers/leds/trigger/ledtrig-input-events.c
@@ -10,6 +10,7 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/rculist.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
@@ -28,7 +29,70 @@ static struct input_events_data {
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
+	list_for_each_entry_rcu(led_cdev, &input_events_led_trigger.led_cdevs,
+				trig_list) {
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
@@ -42,7 +106,7 @@ static void led_input_events_work(struct work_struct *work)
 	 * running before a new event pushed led_off_time back.
 	 */
 	if (time_after_eq(jiffies, data->led_off_time)) {
-		led_trigger_event(input_events_led_trigger, LED_OFF);
+		input_events_set_leds(false);
 		data->led_on = false;
 	}
 
@@ -59,7 +123,7 @@ static void input_events_event(struct input_handle *handle, unsigned int type,
 	spin_lock_irqsave(&data->lock, flags);
 
 	if (!data->led_on) {
-		led_trigger_event(input_events_led_trigger, LED_FULL);
+		input_events_set_leds(true);
 		data->led_on = true;
 	}
 	data->led_off_time = jiffies + led_off_delay;
@@ -138,11 +202,13 @@ static int __init input_events_init(void)
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
 
@@ -153,7 +219,7 @@ static void __exit input_events_exit(void)
 {
 	input_unregister_handler(&input_events_handler);
 	cancel_delayed_work_sync(&input_events_data.work);
-	led_trigger_unregister_simple(input_events_led_trigger);
+	led_trigger_unregister(&input_events_led_trigger);
 }
 
 module_init(input_events_init);

---
base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
change-id: 20260924-leds-input-events-brightness-a76ae9a77b85

Best regards,
-- 
Nikolay Plastinin <plaztininikolai@gmail.com>


