Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C814582CA
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392267; cv=none; b=hHHEZagKGtuggE2SvMEKNEHpZ1CHQr7wv7bxAr71rf3xU9zLQkG81QaSW6csS2oGn31z6fbYjg5ua31hE4GoGy59ONLxF5BPgTTzxBFUuTgY+MPD9YhbyW2iTDJgTZOnvusIH65z+0mh9+aQBpadSt3qPkX8XMNYuENaKrQjnXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392267; c=relaxed/simple;
	bh=9HBnHM60dkZoJJ9TZo4Bf/k5iR/6DDKcRlWsX5OeNqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOizKABr/+hrZr6M3gcSxhTMQSXCRYE8hm8yRXZdnM/3bvtnN3CdNfciMeWCKiX4ZuT0P3zoJFycL/M9GDyMqcj3LqB3QFXFB+BOzSLcbe3/tUAfBmDTTLIIp7D3ClSqSgj7plguqNjm9DAe1G8kEg952sYsZ2sVWxBC8A8q+Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=iARvsx0s; arc=none smtp.client-ip=185.136.65.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="iARvsx0s"
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260914132414110f322b7e000207e6
        for <linux-leds@vger.kernel.org>;
        Mon, 14 Sep 2026 15:24:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=xYR6ikkqymzGTBgO/+Kq6rjETk1dH+hHoTqbYvuk6lE=;
 b=iARvsx0s8NXpxh9lQqfgWyYfIYn0azYiR3Lmef0mQ4i5M3+tY21hnuiNx5QB/wnDu4thcy
 8QBsH/2Xrmk4Zc/BWtB9ZCB+5upOFulF3qqM/254XNIH3JSACai0vmMXGKN8SE16wE3dA1OV
 JKN0/APCg0MjN/oc+8CvFhp5zwuhNQrDp6qPr1Jx9+ih9j4D6Zn1cRdc6F9ETE4SJrirkyt3
 SQUinFEqSoXHZrO9VcC7MGs4eyiicsyCBpLKaRnKDKbRz2e+GB+AWCt9W8CHGGlC27QkOaYR
 KysPnQ3ogQSId+9CwlzMk1dlfcFOw5BLwYZ3Yj0bb+EoFZ6w6de28Eiw==;
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] leds: trigger: netdev: serialize mode/interval stores with trigger lock
Date: Mon, 14 Sep 2026 15:23:52 +0200
Message-ID: <20260914132356.807004-4-alexander.sverdlin@siemens.com>
In-Reply-To: <20260914132356.807004-1-alexander.sverdlin@siemens.com>
References: <20260914132356.807004-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

netdev_led_attr_store() and interval_store() update the shared
trigger_data state and call set_baseline_state() without holding
trigger_data->lock, while netdev_trig_notify() and device_name_store()
do the same work under that lock. Because the store paths do not take
the lock, it provides no mutual exclusion against them.

kernfs only serializes writes to the same attribute file, so writes to
two different files run concurrently. netdev_led_attr_store() does a
non-atomic read-modify-write of ->mode, so one update can be lost:

  CPU0 (echo 1 > link_10)            CPU1 (echo 1 > link_100)
  -------------------------          --------------------------
  mode = trigger_data->mode; // 0
                                     mode = trigger_data->mode; // 0
  set_bit(LINK_10, &mode);
                                     set_bit(LINK_100, &mode);
  trigger_data->mode = mode; // LINK_10
                                     trigger_data->mode = mode; // LINK_100
                                     /* LINK_10 update lost */

The store path also races with the notifier, which updates the link
state under the lock. set_baseline_state() then programs the LED from a
half-updated snapshot, and both CPUs drive the same led_cdev at once:

  CPU0 (echo 1 > link)               CPU1 (NETDEV_CHANGE)
  -------------------------          --------------------------
                                     mutex_lock(&trigger_data->lock);
                                     carrier_link_up = false;
                                     link_speed = SPEED_UNKNOWN;
  trigger_data->mode = mode;
  set_baseline_state();
    /* reads carrier_link_up == false,
       link_speed == SPEED_UNKNOWN,
       torn intermediate state */
                                     get_device_state(); // refill
                                     set_baseline_state();
                                     mutex_unlock(&trigger_data->lock);

->hw_control is likewise written non-atomically by both the store path
and netdev_trig_notify(), and set_baseline_state() branches on it.

Hold trigger_data->lock around the read-modify-write of ->mode, the
->hw_control update and set_baseline_state() in both stores, matching
the locking already used by device_name_store() and
netdev_trig_notify(). In netdev_led_attr_store() use guard(mutex) so
the lock is released on every return path; the invalid-combination check
is performed on the locked snapshot so a rejected write does not disturb
the running configuration. cancel_delayed_work_sync() is called under
the lock; this is safe because netdev_trig_work() never acquires
trigger_data->lock.

Fixes: d5e01266e7f5 ("leds: trigger: netdev: add additional specific link speed mode")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/leds/trigger/ledtrig-netdev.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 89b48c522c227..6556f6d28547f 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -389,7 +389,7 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 {
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
 	struct led_classdev *led_cdev = trigger_data->led_cdev;
-	unsigned long state, mode = trigger_data->mode;
+	unsigned long state, mode;
 	int ret;
 	int bit;
 
@@ -421,6 +421,16 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 		return -EINVAL;
 	}
 
+	/*
+	 * Serialize the read-modify-write of ->mode and the dependent
+	 * ->hw_control update and set_baseline_state() against concurrent
+	 * attribute stores and netdev_trig_notify().  netdev_trig_work() must
+	 * never take this lock, otherwise the cancel_delayed_work_sync() below
+	 * would deadlock.
+	 */
+	guard(mutex)(&trigger_data->lock);
+
+	mode = trigger_data->mode;
 	if (state)
 		set_bit(bit, &mode);
 	else
@@ -510,10 +520,14 @@ static ssize_t interval_store(struct device *dev,
 
 	/* impose some basic bounds on the timer interval */
 	if (value >= 5 && value <= 10000) {
+		mutex_lock(&trigger_data->lock);
+
 		cancel_delayed_work_sync(&trigger_data->work);
 
 		atomic_set(&trigger_data->interval, msecs_to_jiffies(value));
 		set_baseline_state(trigger_data);	/* resets timer */
+
+		mutex_unlock(&trigger_data->lock);
 	}
 
 	return size;
-- 
2.55.0

