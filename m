Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279C13D38E
	for <linux-leds@vger.kernel.org>; Sat,  4 May 2024 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714839949; cv=none; b=sM/+BFHFion9NAKYkW8cBZpdLaotf1oLoVS9lRaUNelfj/S/zroz+ksvauyViVl+EuLHKlL7MkYM67L90tDKb9smmolkyZoI+9CfrP4fTfPT/vZDmp+TZhniJnTNZrky6sFujnmrDYycu1icj1/hRhakel3xYu8Rr+qvZQTDf7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714839949; c=relaxed/simple;
	bh=8+GKjmfqDGJKWGT7xGywBnxVLLfeT74ArP1DSCSV2Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HqEpARVIF0a775Y/xXZqSNeBHwzy9EYLFVd1UTvvbzubx4brO3ccU0n1Hk0WRa5CcPIbmm6hxY5C/EssU1RSVlHER85aI9L6dDx/DMGkJMIyzl6e7UfKSIOXOQYFnfx8tMmI4VhKl0Zu5gkePlyHA6/VPeYLv39GqPmCL9aoFNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bRgM6il2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bRgM6il2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714839946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z2Bbi6RcCL1bdRTooi87rYIm0ifzy0GZ6CeudVhr9mM=;
	b=bRgM6il2Z7MxpxQ3pSDkMRhLZvi9nM2ZjOa2iawKoeJnZhKTa1eOcbg9lhVDhD4ZIfk3Xh
	LEBQ3X6q2zjJ7G8YMrtfdxSNkbbLPlE+j2tSf5eoqyhW7O1RzZTRpAGYd2TR3epuagHqKn
	vZYFX+9b5/qVp9q1jqWjOdKENqObdKk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-438-nnFnBEWXPU-BJvPRWmcAcQ-1; Sat,
 04 May 2024 12:25:41 -0400
X-MC-Unique: nnFnBEWXPU-BJvPRWmcAcQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BB3B3C02748;
	Sat,  4 May 2024 16:25:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49BCD492BC6;
	Sat,  4 May 2024 16:25:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-leds@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH] leds: trigger: Unregister sysfs attributes before calling deactivate()
Date: Sat,  4 May 2024 18:25:33 +0200
Message-ID: <20240504162533.76780-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

Triggers which have trigger specific sysfs attributes typically store
related data in trigger-data allocated by the activate() callback and
freed by the deactivate() callback.

Calling device_remove_groups() after calling deactivate() leaves a window
where the sysfs attributes show/store functions could be called after
deactivation and then operate on the just freed trigger-data.

Move the device_remove_groups() call to before deactivate() to close
this race window.

This also makes the deactivation path properly do things in reverse order
of the activation path which calls the activate() callback before calling
device_add_groups().

Fixes: a7e7a3156300 ("leds: triggers: add device attribute support")
Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-triggers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index d72c42f38bd4..6d535a7fd075 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -179,9 +179,9 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 
 		cancel_work_sync(&led_cdev->set_brightness_work);
 		led_stop_software_blink(led_cdev);
+		device_remove_groups(led_cdev->dev, led_cdev->trigger->groups);
 		if (led_cdev->trigger->deactivate)
 			led_cdev->trigger->deactivate(led_cdev);
-		device_remove_groups(led_cdev->dev, led_cdev->trigger->groups);
 		led_cdev->trigger = NULL;
 		led_cdev->trigger_data = NULL;
 		led_cdev->activated = false;
-- 
2.44.0

