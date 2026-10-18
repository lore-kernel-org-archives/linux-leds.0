Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713F44C753A;
	Sun, 18 Oct 2026 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331652; cv=none; b=mRQNwWrx+ZcuIIPrxUIFk5pfhLWP/M6CLrw5fboYNHO1loxRb5gFeFt3FLndvDVvClBCbFi1RWO6fpsPKDw4/dvwvul8TeAkC9BA2a8EycryKI2/+E3uB6d+q33eXCAwFDOkkl2/KpMm+XciayCmGjE/HTOqQQwb6ctUQ5b42DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331652; c=relaxed/simple;
	bh=u1tWIaPkqODVPEDlNBYq25frf3KExpUtX3ahSbCVZiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGS2HwtIs287Ry5B9uScqW5Z/Z7qYXKYUxgIQX6MKrmP4XdaNwMvy4bPh1UdqDhZmQnYawG/L3Ytx/TUruFA/gh+tqkn8E6seyDSu8UGJficSp3KA8jPxboktB5FWzTfqVTsn7u200S1tM7opNLaCOG+BB4afc922e1RkxXHNRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=caiWnuCb; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="caiWnuCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792331638; x=1792936438; i=w_armin@gmx.de;
	bh=M2/9Crmj1eE/eFH35fnusHs1cIUMbv7xpmsv9L64qqo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=caiWnuCbPNYEL99o4PoM77GFMsh0DagqPcDFMVzW2LItiZjZf+SWyy9+DVsruWBq
	 zDkNQr9aRDWws1SLmeFQ1xryEeWtlu37kmQn6ZUq8DHZX5CcxxKtgrhYTWWL+3pFi
	 xPU7cYy1j79EWUvSjvDuyEfni3/MI8niLK+ckeboHCz+BOtvHGNxsZSbEhaReLKTU
	 AAz3YRJ7lFYqFQadXGDvyh9S+70y6kURp/lId/ComONEqP82qEqWeXM+wk8ktAK6w
	 Enlu/Qto8mZM5rOyMbcPxpaTcSsRAQYuzHnKF57PwmUvIMeiBHs2zdBanVOelH/t9
	 fMlfFropGjFSoM6nlg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2V4J-1wcBCs3pPj-00vdzY; Sun, 18
 Oct 2026 15:53:58 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] leds: class: Fix race condition when creating the device
Date: Sun, 18 Oct 2026 15:46:24 +0200
Message-ID: <20261018135339.1109271-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018135339.1109271-1-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OajaZrIZaReP9nX3ZS1NR3S+8qMnrDo4ugNjfA0q6aMIUtCb69N
 PXlpNdbexDTkb+NRL9o7XvhaLYp43CrNE8zlich3qaeWVwUQGZBAlN/JqQ92GflicIuhFiV
 M2FQ0pPa6c+1+MGmnVBmhDuZ9duiPx2TgyEdCb94W3J6eUpRJsB+InxaDbrB38Kf5D3EcGH
 BwMX2BbSMakdXb/KIPZwg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cGQ8NwoamWw=;Kfhl7mxI2r9vm4C5ENe5xOnmkGA
 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
 =

Userspace applications can access the sysfs attributes as soon as
device_create_with_groups() has returned. Two of those sysfs
attributes ("brightness_hw_changed" and "max_brightness") access
fields that are not properly initialized at this point, with only
"max_brightness" guarding against this by taking the LED access lock.

Fix the race conditon affecting "brightness_hw_changed" by creating
the device after the associated fields have been properly initialized.
This also allows us to drop the LED access lock inside
max_brightness_show(), as the maximum brightness does not change after
initialization.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index d460f041ed86..e1f1b710536b 100644
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
@@ -524,16 +519,6 @@ int led_classdev_register_ext(struct device *parent,
 		dev_warn(parent, "LED %s color identifier out of range\n", final_name);
=20
 	mutex_init(&led_cdev->led_access);
-	mutex_lock(&led_cdev->led_access);
-	led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
-						  led_cdev, led_cdev->groups, "%s", final_name);
-	if (IS_ERR(led_cdev->dev)) {
-		mutex_unlock(&led_cdev->led_access);
-		return PTR_ERR(led_cdev->dev);
-	}
-	if (init_data && init_data->fwnode)
-		device_set_node(led_cdev->dev, init_data->fwnode);
-
 	led_cdev->work_flags =3D 0;
 #ifdef CONFIG_LEDS_TRIGGERS
 	init_rwsem(&led_cdev->trigger_lock);
@@ -549,6 +534,17 @@ int led_classdev_register_ext(struct device *parent,
 	if (!led_cdev->max_brightness)
 		led_cdev->max_brightness =3D LED_FULL;
=20
+	mutex_lock(&led_cdev->led_access);
+	led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0, led_=
cdev,
+						  led_cdev->groups, "%s", final_name);
+	if (IS_ERR(led_cdev->dev)) {
+		mutex_unlock(&led_cdev->led_access);
+		return PTR_ERR(led_cdev->dev);
+	}
+
+	if (init_data && init_data->fwnode)
+		device_set_node(led_cdev->dev, init_data->fwnode);
+
 	led_update_brightness(led_cdev);
=20
 	led_cdev->wq =3D leds_wq;
=2D-=20
2.56.0

