Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100844;
	b=xCvFZFfrfCec+8mV8WTSBqo8EiI6ZP7sBVgo/HvcGZ8GhRdxHY+e9r4WZeEJmYHHkWb4
	 mwBmBcQXQXJWflmdZMFBmk/UjeNUzNGBsOXL/B+mhS4AvHXco9Psimej9fPjtTsOu3O5O
	 jcDZC6fXflYrhasUlDhylemaAvnCow4Kh1XcixYr6EXUyK3HmFCrQkAPJxLni7pe6Tsf7
	 eCnhj0uBOYFHDYC2KQnm4GjXOgL8AhFc1JO9c9eOOTF740wN1Hpig6CthExlxaR2PpL1N
	 Q3YIRWymRXxegyGdJNSnCWHEYAd9KgqTfZ7cgkea3wCmYHqn6UtGosFL1dh7OapmEzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100844;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=Rs4N/HkUBnDEEaFceAjgCgShwFi+Xu++Bs87eYOoOBM=;
	b=GE7W5LMJB6ECWQs7E6+5KKpI3vLtGq5xxF7hkBbZHMMCQ6ROOcDHfhMBedFyOqiz7Krs
	 mAfvwoIygoq1QJUiYqgeI/BGlQ0ep7NTdPY4tjHGuC9HgX801QTDu/7PmK67JQxTCgz1I
	 UmYct3sPApHXYPzteTRJLVaDKkIXpIz63D47CGR9ymIogQgPBq3jNlRlNPnB/nbwA9u5t
	 /RllXEHaUTpaAiHFpGHfBaEHahODNA5Me1Oz0w1r6NoeswMuC/CYHIbvh83/JIoFy9gvb
	 XXCSALvIPsp6KKFwWgiXM4oXfWe0gY5/dRHPSaIUtcE6eUwLDGljTYSQ8XpaEPWhzLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=cf+VCVES;
	arc=none smtp.remote-ip=185.136.65.226
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F260A261F
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 11:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A4F260A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=cf+VCVES
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261027113354e84de725fb000207ca
        for <linux-leds@vger.kernel.org>;
        Tue, 27 Oct 2026 12:33:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Rs4N/HkUBnDEEaFceAjgCgShwFi+Xu++Bs87eYOoOBM=;
 b=cf+VCVES6xCl+xHMqj6WSTH2Ofcp/6zd/21BRKpFojcQGvn+foa9I/789ONGcowJZ+av9J
 uwL9f3NSmraXSQVjKU/zI1MrpwdDRYtBua6SodzTZsdhiRRqyxjvZrrhRXfSJdImBYyKZJdY
 ck6DPRrm+gldKBnkIRI82LVeKn4MGD0LN1ZLLZFfxxzmgfW68w9tOn1J38pIzlS672pTqVeh
 aR1nUgfFWl9WV/cgwtYN1LTHpS6jwcocR9VRpUv9OjCkYQ8VV4Q9n5JvzBjfCvPlF/LmwSJ9
 LAp0TGGvyhqjDROWQ6V6/uL6EdAv6nyLpQfn8cp9cpdrRe5wjO6KA40A==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 5/5] leds: trigger: netdev: Serialize mode/interval stores with trigger lock
Date: Tue, 27 Oct 2026 12:33:45 +0100
Message-ID: <20261027113349.383147-6-alexander.sverdlin@siemens.com>
In-Reply-To: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
References: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

netdev_led_attr_store() and interval_store() update ->mode and run
set_baseline_state() without trigger_data->lock. kernfs only serializes
writes to the same file, so two attribute writes race on the non-atomic
read-modify-write of ->mode:

  CPU0 (echo 1 > link_10)       CPU1 (echo 1 > link_100)
  -----------------------       ------------------------
  mode = trigger_data->mode;
                                mode = trigger_data->mode;
  set_bit(LINK_10, &mode);
                                set_bit(LINK_100, &mode);
  trigger_data->mode = mode;
                                trigger_data->mode = mode;  // LINK_10 lost

They also race the notifier's link-state and ->hw_control updates.

Take trigger_data->lock in both stores. netdev_trig_work() also holds it,
so use the async cancel_delayed_work(). interval_store() now tests
->hw_control under the lock too, so it can no longer sample a stale value
and change the interval while a concurrent store enables offload.

The async cancel cannot stop a worker already blocked on the lock: it may
resume after a store enabled hw_control and keep software-blinking and
rescheduling itself. Gate the worker and its arming in set_baseline_state()
on a shared netdev_trig_sw_blink() helper, so it stops once offload is
active or RX/TX monitoring is off.

set_baseline_state() can also re-arm the worker from a store that acquires
trigger_data->lock in the window between a notifier's
cancel_delayed_work_sync() and the notifier taking the same lock. The
notifier then sets carrier_link_up = false but does not cancel the re-armed
work. Gate netdev_trig_sw_blink() on carrier_link_up as well, so a worker
left armed across a link-down stops instead of blinking.

Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/all/sashiko-outbox-178980@kernel.org/
Fixes: d5e01266e7f5 ("leds: trigger: netdev: add additional specific link speed mode")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v6:
- fixed unlocked hw_control check in interval_store()
- added missing carrier_link_up check in netdev_trig_sw_blink()
v4:
- introduced netdev_trig_sw_blink() and used it in netdev_trig_work()
v3:
- explicit mutex_lock()/mutex_unlock() instead of guard()
v2:
- reduced verbosity both in the comments and in commit message
- dropped sync from cancel_delayed_work() (worker now takes the lock)

 drivers/leds/trigger/ledtrig-netdev.c | 56 +++++++++++++++++++--------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index b1f84014acab9..a503a4d64cefd 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -81,6 +81,17 @@ struct led_netdev_data {
 
 static const struct attribute_group netdev_trig_link_speed_attrs_group;
 
+/* True while the software activity worker should keep polling and blinking. */
+static bool netdev_trig_sw_blink(struct led_netdev_data *trigger_data)
+{
+	return trigger_data->net_dev && !trigger_data->hw_control &&
+	       trigger_data->carrier_link_up &&
+	       (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ||
+		test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) ||
+		test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) ||
+		test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode));
+}
+
 static void set_baseline_state(struct led_netdev_data *trigger_data)
 {
 	int current_brightness;
@@ -164,10 +175,7 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 		/* If we are looking for RX/TX start periodically
 		 * checking stats
 		 */
-		if (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ||
-		    test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) ||
-		    test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) ||
-		    test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode))
+		if (netdev_trig_sw_blink(trigger_data))
 			schedule_delayed_work(&trigger_data->work, 0);
 	}
 }
@@ -385,7 +393,7 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 {
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
 	struct led_classdev *led_cdev = trigger_data->led_cdev;
-	unsigned long state, mode = trigger_data->mode;
+	unsigned long state, mode;
 	int ret;
 	int bit;
 
@@ -417,6 +425,10 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 		return -EINVAL;
 	}
 
+	/* async cancel: the worker takes this lock */
+	mutex_lock(&trigger_data->lock);
+
+	mode = trigger_data->mode;
 	assign_bit(bit, &mode, state);
 
 	if (test_bit(TRIGGER_NETDEV_LINK, &mode) &&
@@ -429,20 +441,26 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 	     test_bit(TRIGGER_NETDEV_LINK_25000, &mode) ||
 	     test_bit(TRIGGER_NETDEV_LINK_40000, &mode) ||
 	     test_bit(TRIGGER_NETDEV_LINK_50000, &mode) ||
-	     test_bit(TRIGGER_NETDEV_LINK_100000, &mode)))
+	     test_bit(TRIGGER_NETDEV_LINK_100000, &mode))) {
+		mutex_unlock(&trigger_data->lock);
 		return -EINVAL;
+	}
 
-	cancel_delayed_work_sync(&trigger_data->work);
+	cancel_delayed_work(&trigger_data->work);
 
 	trigger_data->mode = mode;
 	trigger_data->hw_control = can_hw_control(trigger_data);
 
 	if (!led_cdev->brightness_set && !led_cdev->brightness_set_blocking &&
-	    !trigger_data->hw_control)
+	    !trigger_data->hw_control) {
+		mutex_unlock(&trigger_data->lock);
 		return -EOPNOTSUPP;
+	}
 
 	set_baseline_state(trigger_data);
 
+	mutex_unlock(&trigger_data->lock);
+
 	return size;
 }
 
@@ -494,9 +512,6 @@ static ssize_t interval_store(struct device *dev,
 	unsigned long value;
 	int ret;
 
-	if (trigger_data->hw_control)
-		return -EINVAL;
-
 	ret = kstrtoul(buf, 0, &value);
 	if (ret)
 		return ret;
@@ -505,11 +520,21 @@ static ssize_t interval_store(struct device *dev,
 	if (value < 5 || value > 10000)
 		return -EINVAL;
 
-	cancel_delayed_work_sync(&trigger_data->work);
+	/* async cancel: the worker takes this lock */
+	mutex_lock(&trigger_data->lock);
+
+	if (trigger_data->hw_control) {
+		mutex_unlock(&trigger_data->lock);
+		return -EINVAL;
+	}
+
+	cancel_delayed_work(&trigger_data->work);
 
 	atomic_set(&trigger_data->interval, msecs_to_jiffies(value));
 	set_baseline_state(trigger_data);	/* resets timer */
 
+	mutex_unlock(&trigger_data->lock);
+
 	return size;
 }
 
@@ -691,11 +716,8 @@ static void netdev_trig_work(struct work_struct *work)
 		return;
 	}
 
-	/* If we are not looking for RX/TX then return  */
-	if (!test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) &&
-	    !test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) &&
-	    !test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) &&
-	    !test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode)) {
+	/* Nothing to do under hw offload or without RX/TX monitoring */
+	if (!netdev_trig_sw_blink(trigger_data)) {
 		mutex_unlock(&trigger_data->lock);
 		return;
 	}
-- 
2.56.0

