Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207439;
	b=k6xnJ7zYPOlrXEOC/6vnP4U3U+FHb0VuqZgktbKTYTWrcnosDcR1BgHq7J2DDiPmJ7kA
	 bzVeNBeZY3gRAhAblHc6VeVOYg3kpWH+nEv2eh5qWieg3u2BjqJ7ecrbhfHVwDVgfD4fF
	 fNHU2QEB+6/atAqsoVmSWZBddRN042evu2B4d1O1bImgSorVohoijrj9giY5kQNEGFp3q
	 29POk1PkNlZHaVEoqDaF0R1hvAFGy5cGwnWUmHsL1a/TWjkbQjXm3/2t5hBZhdSUUImMo
	 5eG9dhG0o0RWjukqzsjfeN/TsOw/Ucr1wYhfvs+TOhnn6knezbOkdEyHYOGn9b6g76g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207439;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=jWKBSzdAzzsDzCt82X+8X/qIHu6aYSXAuHqMqEPQGho=;
	b=qLqHb2+Eyo1mI/dwDZydsgRT3Y5U5uOoTyb8S96BXX64mJXpL2KZj8yXqN6jx6/U8QZJ
	 4uuvceTJHI+QBqOFJNriZ0btRPWXf4if4fX8RZcGkTkk/vZ7PRkutrvjHKLHuuTen2Tu/
	 FRyhyD8SU8kHbwBott5oHqZOL5x4ZB7TnpxtcUjquYGXULtmWWVRWFSN9wa7PSNyQw4b+
	 iIVefAtOW7Mwj6kGkZM9IuFDy3mAuiqmboefGrzGrt1Zw5AeONktL2y3uc0WVxuiZoQWO
	 3SbHmx9ecFnPG69woIJQgPxIelR8h+qRDrk3118tVZpOneqaSEUWu403hg2wON7SxVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=byI+qj4o;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BBD606B726
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 20:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1BBD606B726
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=byI+qj4o
DKIM2-Signature:  i=1; m=1; t=1795207434;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:t1EaFzlF9xY7kutSSFLLe2FxWqla
   bjySZ6KnaCA3UjD0tSHo7jCdQWe2mH4fj0rVuxhGF0fKcVeHRcdSRyafu4Lyryxwt4MrUyyjBGj
   XF01D4kDtzr6pw7LBUyavNESRlUYFyjNSQU0dhnHTVXrbQGY2NkV7wVUoL8wwb4avyV5tqjxYVy
   jSa1IK5IEt09v3+NgMAEbl5wEEsdv1jqFQ8seuk9dHG99EpldQinCxK2ABkZ+SbC+ZfE1bdvDtG
   YUk5iDZIx46xXR3iL76uyzUxlxqdRpb10Z5B+RZMfmFAO6yjIi2fYeYtGoS3q4YAkCZ/vJp0riD
   zJiCOqUYzYO/9w==;
Message-Instance:  m=1;
 h=sha256:
   veua0QGLxlrCTLOGeFrSO4U3wKq+Voju64ZAc1l8PwM=:
   h3fdsL54NEfP0jAYDQXAp2+cphLmYjEzMCj4tm5gBds=,
  sha512:
   4euvlA+xQ0X1JTXjGoxODFoAcQzl6IdrUfb4Qj8wWQfAIU3CnvVnhnWzHWc+eSXG8cFN1KP12T3xccL/Ogt1iA==:
   mPwPxeK4hKStXrxy7Rc4YOgr2/IKc6101hAlTu2KH5/s4wy0LgSfjZX8BfD/NzNYqZ54yqR41mGy5CRZW27bHg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795207384; x=1795812184; i=w_armin@gmx.de;
	bh=jWKBSzdAzzsDzCt82X+8X/qIHu6aYSXAuHqMqEPQGho=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=byI+qj4oQ247P/ajnW5qGoeXt4SJmLaWfFKltHoztMvJA4mvzT6zur5aV2hVcyKP
	 cJD21jvthyAoqI8Rbb/L6iMLQMVbLaHOOct6BKiU/LHkofGM5MuvpF7qSFJ13mXoj
	 ig+FGDELX+1uTGYKEwhKqovr7AmKbqY2dYirgG1lad9dDeqBPwCkPpfK7xcB+z6Gz
	 GywqX/FCXiqbgfVUOJynikXzhR+l8Anbumwk74YccKP18ht9dSfGZeDZ15BxJAPNV
	 MG+zLfHmz1pdNLne3fY9dORi0+mSfBAF7qXqpbOXVSo0eEklop/ZsPh07eTJ/wcvN
	 FKJPWD8KKZjIcI28Ng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8mV-1y9KRR0Znh-00bs3B; Fri, 20
 Nov 2026 21:43:04 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v2 05/10] leds: class: Fix race condition when creating the device
Date: Fri, 20 Nov 2026 21:35:17 +0100
Message-ID: <20261120204246.6645-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120204246.6645-1-W_Armin@gmx.de>
References: <20261120204246.6645-1-W_Armin@gmx.de>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DRiQw4pVvNZn/BL41Blsqhb4L4AgfS6lVTUML2xm1GvHsb65deg
 W0repeRMOog/1pQvA27Lnb/hT1Fi6ykl6OqRn2miYNNv59Nta3EWtAI4H3C4bV/l/V57uJL
 f0uQWtlYcAy0QpIK/55Uu175ZP/sH3m+xNZBUi5a4K+vQVx5lsgCYnn+v2WRkVXljqdLRTX
 W0NoP5qiuZEYehS79BKmQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kfOiTQm+BeY=;dIvRtn+U0BXiZ2NgFYYKuNytvti
 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

Userspace applications can access the sysfs attributes as soon as
device_create_with_groups() has returned. Two of those sysfs
attributes ("brightness_hw_changed" and "max_brightness") access
fields that are not properly initialized at this point, with only
"max_brightness" guarding against this by taking the LED access lock.

Fix the race condition affecting "brightness_hw_changed" by creating
the device after the associated fields have been properly initialized.
This also allows us to drop the LED access lock inside
max_brightness_show(), as the maximum brightness does not change after
initialization.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 00532437cc45..fa9803e2ae6d 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -81,13 +81,8 @@ static ssize_t max_brightness_show(struct device *dev, =
const struct device_attri
 				   char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
-	unsigned int max_brightness;
=20
-	mutex_lock(&led_cdev->led_access);
-	max_brightness =3D led_cdev->max_brightness;
-	mutex_unlock(&led_cdev->led_access);
-
-	return sysfs_emit(buf, "%u\n", max_brightness);
+	return sysfs_emit(buf, "%u\n", led_cdev->max_brightness);
 }
=20
 static const DEVICE_ATTR_RO(max_brightness);
@@ -555,6 +550,18 @@ int led_classdev_register_ext(struct device *parent,
 	init_rwsem(&led_cdev->trigger_lock);
 #endif
 	mutex_init(&led_cdev->led_access);
+	led_cdev->work_flags =3D 0;
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+	led_cdev->brightness_hw_changed =3D -1;
+#endif
+#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
+	if (led_cdev->flags & LED_TRIG_HW_CHANGED)
+		INIT_WORK(&led_cdev->trigger_hw_changed_work,
+			  led_trigger_hw_control_changed_worker);
+#endif
+	if (!led_cdev->max_brightness)
+		led_cdev->max_brightness =3D LED_FULL;
+
 	mutex_lock(&led_cdev->led_access);
 	led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
 						  led_cdev, led_cdev->groups, "%s", final_name);
@@ -562,6 +569,7 @@ int led_classdev_register_ext(struct device *parent,
 		mutex_unlock(&led_cdev->led_access);
 		return PTR_ERR(led_cdev->dev);
 	}
+
 	if (init_data && init_data->fwnode)
 		device_set_node(led_cdev->dev, init_data->fwnode);
=20
@@ -576,18 +584,6 @@ int led_classdev_register_ext(struct device *parent,
 		}
 	}
=20
-	led_cdev->work_flags =3D 0;
-#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
-	led_cdev->brightness_hw_changed =3D -1;
-#endif
-#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
-	if (led_cdev->flags & LED_TRIG_HW_CHANGED)
-		INIT_WORK(&led_cdev->trigger_hw_changed_work,
-			  led_trigger_hw_control_changed_worker);
-#endif
-	if (!led_cdev->max_brightness)
-		led_cdev->max_brightness =3D LED_FULL;
-
 	led_update_brightness(led_cdev);
=20
 	led_cdev->wq =3D leds_wq;
=2D-=20
2.56.1

