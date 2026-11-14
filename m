Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665976;
	b=C7CgWEPEcyroexvf7DLSbYzvQQ+NSt+NRIX0Cj2RGDlps1CMLttSU6yMfZTkUv9cqxip
	 icqScgcfKLVmJsX4kXoTl8NprsPDCh7PXgkmo7O1qDbuJTGkK7NPzGvFQ9wCuMAufIgxL
	 70xyayK4PwKeK3ESBEeYKfiAE3+VPQX7PHWVcbAMCkUK8BCh0nRidq/rw8fB3CxlXH+Jh
	 Nw7dI8dq6VP7M03eSVHZK6YPYGaQym9DWBAGV3jHREIWkw+CKuanK4iY29kevwxmvV8Zo
	 yJEK5EZrvYr/beWcoq30t73O/nnmKRHq0l7NK64cnVoqi5Arc5DxJidQxSRnIrWOhlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KF5ZCESgsZSVu0B3wdeuocQ2u5naY2csnCKAhixwvPc=;
	b=y4lOZHcPNAlWfJesAmSNmtwzUZPcis2gAe3SLYc7/jbbkUNrqB2RPtcdcAo5gRsizP1E
	 4enRez6Ka5N+TljNm4b8kQUdWfug0HutEMpAxbBt48q2ATKW5PPiWAqDxjpJFqOQT/4eM
	 cI63XocHh1JlHY06xQ88s8khC/12Odf8F9lYNkQQga5ASf/D/yAca+04t14bxCiEu9eFg
	 Da+grHu35y1YAF7jlhY9rjGzY9d7vY4IjAcD911b0RAHRgcMEzv5UtW3fpoCGRGi8Byy4
	 27lQP3d+Kl5eGO3Uj59ogS4yGc1nfeu028XDsCUIkzSqiz0h/mPVjNmhUHg6B6kfq0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7BN5Xp7;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4D8606A332
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 14:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B4D8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7BN5Xp7
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa5103so789491f8f.2
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 06:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794665974; x=1795270774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KF5ZCESgsZSVu0B3wdeuocQ2u5naY2csnCKAhixwvPc=;
        b=E7BN5Xp7ZgmyEc1SRkozN87GIKu+yfvY6gFgmsOD3nxKdlkgZTITwN9STA2JT09JeJ
         qMFNOAUPlhJKp/E0BX+/n6ZFRabrZtbvbntf8j5I4z7vGJxk59Yqt73e/EC24guM1Dq/
         mN2Q/k3tft4cBm8JWyL0noLPiGqVU+7Xxo7rDz7u+fUHNCLxNxtIN6FL+musezQJFGZb
         X+VBC8cnCXQsbYMqCdLYMf/MI8/jrgdTy521AB1MpGfVC2OeZaZZDOBnDxL2XRrLN845
         /TAcY5QPmHHFYoLQIl7yVuygL0V14DQvvf9D5l5ZaHE5xN5NKuN0y8/W/foIclAyIPUL
         yN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665974; x=1795270774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KF5ZCESgsZSVu0B3wdeuocQ2u5naY2csnCKAhixwvPc=;
        b=WpZrTBa9PAw/Ipct5V/5Zhypw/gjc9bVM7MyzgJUAsDA5XXPqvKQ46LV8E2TQg4PDo
         Pl1ecncToN1iktmRV61sI6UL9Gb6w/a/CQ9mJme088MrkGpNIUE8QqhVnBI2jlmdItZH
         Tk5gZCle9vy4TtPzr7eNwa6CnjSpVCpVhTMZTfrhiH014NHzW+/4ADjNCeH1ONnF2Fpt
         L9Cz3iqRG1jCVPq8HFwN9IiNBOg1JfbuOT9oU0PaU4375hyxfb7hcVzSNnu4SaGN3tVj
         73g7VYAv0SgESM0iXRDGzYtvjWuq8Gv1/yYmjOYxPkAR5xqxintXxIswk8VU69TWGOOY
         poWg==
X-Gm-Message-State: APuU4Z9pePJ+LAteLkmKZ+sUFQGBZyxMzoVeqwoHFMXV674siUeGDfta
	PLiMcd9h1X0l0pseH4gHA3xWJs1Swzy05zqfJ+aQeMI6kRssQaYW9C1A50Tvt7IlU7I=
X-Gm-Gg: AYBFou1EEhjSX/4kWJRTuuB6uehyT7SNDa5LIhHwaIJkbMlZZec9VZxY9bih6xMNs9o
	/nocivA5HzDL6NVdTy8nYab7WtsqHUdyJpGc0okZKDf/+GAX+EtZYqyBzbkc03JL/4ciTWvduyd
	T6SCVLUPn9DmVzcAMz4aMcGKogiUzFnQX5NnOe7wp8CxPTR7ZWmd3Z7FkHQEb7CPo9YKNtglkis
	8MaOdPnOoz73I1O0m+IIQCeUAUBrdsI7QZKBO7R5dZgM4isvX0FEeopD87TMhW+VtXCzRAEdQXk
	f4p6EqiWZyuo0kApRidniiyGdkKF4Vi8KTN/aq+u25cxqblI02LCtsjGeozh8spggstXg56fLP6
	uCp1L6SvrtmeLB+uNKBLBQEebAGqK8255QgxvrwS2AUzJosBCubCZ7DFkaEn8nFGa3WIqanzIak
	DVuqUvF6ya6kPuGEKU/oSzpvJ2FZcilQgAm+ztlz2hiM5yx26wTMnfPOq0SQ5hyHtocfJiBzFZB
	X+/eTfB7PMyyIzdLdS+s5CGtUF8PBzfWKgVO34scRjZklMxkd+GN7nz3M5DOU6jNbFAVOgIz81Y
	NX7pzgJsGer0Pqy2ow==
X-Received: by 2002:a05:6000:41c7:b0:490:2033:1477 with SMTP id ffacd0b85a97d-49c7390fb4emr11166402f8f.56.1794665973648;
        Sat, 14 Nov 2026 06:19:33 -0800 (PST)
Received: from averion.play.pl ([2a02:a313:21ec:9380::e204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm11205737f8f.56.2026.11.14.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:19:31 -0800 (PST)
From: Daniil Demakov <t3127430@gmail.com>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	linusw@kernel.org,
	riku.voipio@iki.fi,
	brgl@kernel.org,
	griffin@kroah.com,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Daniil Demakov <t3127430@gmail.com>
Subject: [PATCH] leds: pca9532: Propagate I2C errors
Date: Sat, 14 Nov 2026 14:19:26 +0000
Message-ID: <20261114141926.92737-1-t3127430@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Check return values from SMBus read and write operations and
propagate errors through LED, PWM, blink and GPIO operations.

Also check register writes during device initialization and
report failures instead of continuing with an incorrectly
configured device.

Signed-off-by: Daniil Demakov <t3127430@gmail.com>
---
 drivers/leds/leds-pca9532.c | 185 +++++++++++++++++++++++++++---------
 1 file changed, 139 insertions(+), 46 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index c8085427696f..335795520490 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -148,32 +148,66 @@ static int pca9532_setpwm(struct i2c_client *client, int pwm)
 {
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
+	int ret;
+
+	if (pwm < 0 || pwm > 1)
+		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
-	i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, pwm),
+	ret = i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, pwm),
 		data->pwm[pwm]);
-	i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, pwm),
+
+	if (ret < 0) {
+		dev_warn(&client->dev, "Failed to write PWM register: %d\n", ret);
+		goto out;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, pwm),
 		data->psc[pwm]);
+
+	if (ret < 0) {
+		dev_warn(&client->dev, "Failed to write PSC register: %d\n", ret);
+		goto out;
+	}
+
+out:
 	mutex_unlock(&data->update_lock);
-	return 0;
+	return ret;
 }
 
 /* Set LED routing */
-static void pca9532_setled(struct pca9532_led *led)
+static int pca9532_setled(struct pca9532_led *led)
 {
 	struct i2c_client *client = led->client;
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
-	char reg;
-
+	int reg;
+	int ret;
 	mutex_lock(&data->update_lock);
+
 	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
+	if (reg < 0) {
+		ret = reg;
+		dev_warn(&client->dev, "Failed to read LED register: %d\n", ret);
+		goto out;
+	}
+
 	/* zero led bits */
-	reg = reg & ~LED_MASK(led->id);
+	reg &= ~LED_MASK(led->id);
+
 	/* set the new value */
-	reg = reg | (led->state << LED_SHIFT(led->id));
-	i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
+	reg |= led->state << LED_SHIFT(led->id);
+
+	ret = i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
+
+	if (ret < 0) {
+		dev_warn(&client->dev, "Failed to write LED register: %d\n", ret);
+		goto out;
+	}
+
+out:
 	mutex_unlock(&data->update_lock);
+	return ret;
 }
 
 static int pca9532_set_brightness(struct led_classdev *led_cdev,
@@ -194,9 +228,13 @@ static int pca9532_set_brightness(struct led_classdev *led_cdev,
 		if (err)
 			return err;
 	}
-	if (led->state == PCA9532_PWM0)
-		pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
-	pca9532_setled(led);
+
+	if (led->state == PCA9532_PWM0) {
+		err = pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
+		if (err < 0)
+			return err;
+	}
+	err = pca9532_setled(led);
 	return err;
 }
 
@@ -205,6 +243,7 @@ static int pca9532_update_hw_blink(struct pca9532_led *led,
 {
 	struct pca9532_data *data = i2c_get_clientdata(led->client);
 	unsigned int psc;
+	unsigned long period;
 	int i;
 
 	/* Look for others LEDs that already use PWM1 */
@@ -223,15 +262,28 @@ static int pca9532_update_hw_blink(struct pca9532_led *led,
 		}
 	}
 
-	psc = ((delay_on + delay_off) * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
-	if (psc > U8_MAX) {
-		/* Blink period too long to be handled by hardware */
+	if (delay_on > ULONG_MAX - delay_off)
+		return -EINVAL;
+
+	period = delay_on + delay_off;
+
+	if (!period)
+		return -EINVAL;
+
+	if (period > ((U8_MAX + 1) * 1000) /
+		     PCA9532_PWM_PERIOD_DIV) {
+		dev_warn(&led->client->dev,
+			 "Blink period too long: %lu ms on, %lu ms off\n",
+			 delay_on, delay_off);
 		return -EINVAL;
 	}
 
+	psc = (period * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
+
 	led->state = PCA9532_PWM1;
 	data->psc[PCA9532_PWM_ID_1] = psc;
-	data->pwm[PCA9532_PWM_ID_1] = (delay_on * PCA9532_PWM_DUTY_DIV) / (delay_on + delay_off);
+	data->pwm[PCA9532_PWM_ID_1] =
+		(delay_on * PCA9532_PWM_DUTY_DIV) / period;
 
 	return pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
 }
@@ -244,8 +296,10 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	int err;
 
-	if (!data->hw_blink)
+	if (!data->hw_blink) {
+		dev_warn(&client->dev, "Blinking not supported on this device\n");
 		return -EINVAL;
+	}
 
 	if (*delay_on == 0 && *delay_off == 0) {
 		/* led subsystem ask us for a blink rate */
@@ -254,19 +308,18 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 	}
 
 	err = pca9532_update_hw_blink(led, *delay_on, *delay_off);
-	if (err)
+	if (err) {
+		dev_warn(&client->dev, "Failed to set blink: %d\n", err);
 		return err;
+	}
 
-	pca9532_setled(led);
-
-	return 0;
+	return pca9532_setled(led);
 }
 
 static int pca9532_event(struct input_dev *dev, unsigned int type,
 	unsigned int code, int value)
 {
 	struct pca9532_data *data = input_get_drvdata(dev);
-
 	if (!(type == EV_SND && (code == SND_BELL || code == SND_TONE)))
 		return -1;
 
@@ -286,27 +339,34 @@ static void pca9532_input_work(struct work_struct *work)
 	struct pca9532_data *data =
 		container_of(work, struct pca9532_data, work);
 	u8 maxleds = data->chip_info->num_leds;
+	int ret;
 
 	mutex_lock(&data->update_lock);
-	i2c_smbus_write_byte_data(data->client, PCA9532_REG_PWM(maxleds, 1),
+	ret = i2c_smbus_write_byte_data(data->client, PCA9532_REG_PWM(maxleds, 1),
 		data->pwm[PCA9532_PWM_ID_1]);
+	if (ret < 0)
+		dev_warn(&data->client->dev, "Failed to write PWM register: %d\n", ret);
+
 	mutex_unlock(&data->update_lock);
 }
 
-static enum pca9532_state pca9532_getled(struct pca9532_led *led)
+static int pca9532_getled(struct pca9532_led *led)
 {
 	struct i2c_client *client = led->client;
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
 	int reg;
-	enum pca9532_state ret = PCA9532_OFF;
+	int ret;
 
 	mutex_lock(&data->update_lock);
 	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
-	if (reg >= 0)
+
+	if (reg >= 0) {
 		ret = (reg & LED_MASK(led->id)) >> LED_SHIFT(led->id);
-	else
-		dev_warn(&client->dev, "failed to read LED register: %d\n", reg);
+	} else {
+		ret = reg;
+		dev_warn(&client->dev, "Failed to read LED register: %d\n", ret);
+	}
 	mutex_unlock(&data->update_lock);
 	return ret;
 }
@@ -334,27 +394,25 @@ static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 	else
 		led->state = PCA9532_ON;
 
-	pca9532_setled(led);
-
-	return 0;
+	return pca9532_setled(led);
 }
 
 static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 {
 	struct pca9532_data *data = gpiochip_get_data(gc);
-	unsigned char reg;
+	int reg;
 
 	reg = i2c_smbus_read_byte_data(data->client, PCA9532_REG_INPUT(offset));
 
+	if (reg < 0)
+		return reg;
+
 	return !!(reg & (1 << (offset % 8)));
 }
 
 static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	/* To use as input ensure pin is not driven */
-	pca9532_gpio_set_value(gc, offset, 1);
-
-	return 0;
+	return pca9532_gpio_set_value(gc, offset, 1);
 }
 
 static int pca9532_gpio_direction_output(struct gpio_chip *gc, unsigned offset, int val)
@@ -394,40 +452,57 @@ static int pca9532_configure(struct i2c_client *client,
 	struct pca9532_data *data, struct pca9532_platform_data *pdata)
 {
 	int i, err = 0;
+#ifdef CONFIG_LEDS_PCA9532_GPIO
 	int gpios = 0;
+#endif
 	u8 maxleds = data->chip_info->num_leds;
 
-	for (i = 0; i < 2; i++)	{
+	for (i = 0; i < 2; i++) {
 		data->pwm[i] = pdata->pwm[i];
 		data->psc[i] = pdata->psc[i];
-		err = i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, i),
+
+		err = i2c_smbus_write_byte_data(client,
+						PCA9532_REG_PWM(maxleds, i),
 						data->pwm[i]);
 		if (err < 0)
 			return err;
-		err = i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, i),
+
+		err = i2c_smbus_write_byte_data(client,
+						PCA9532_REG_PSC(maxleds, i),
 						data->psc[i]);
 		if (err < 0)
 			return err;
 	}
 
 	data->hw_blink = true;
+
 	for (i = 0; i < data->chip_info->num_leds; i++) {
 		struct pca9532_led *led = &data->leds[i];
 		struct pca9532_led *pled = &pdata->leds[i];
+
 		led->client = client;
 		led->id = i;
 		led->type = pled->type;
+
 		switch (led->type) {
 		case PCA9532_TYPE_NONE:
 			break;
 		case PCA9532_TYPE_GPIO:
+#ifdef CONFIG_LEDS_PCA9532_GPIO
 			gpios++;
+#endif
 			break;
 		case PCA9532_TYPE_LED:
-			if (pled->state == PCA9532_KEEP)
-				led->state = pca9532_getled(led);
-			else
+			if (pled->state == PCA9532_KEEP) {
+				err = pca9532_getled(led);
+				if (err < 0)
+					goto exit;
+
+				led->state = err;
+			} else {
 				led->state = pled->state;
+			}
+
 			led->name = pled->name;
 			led->ldev.name = led->name;
 			led->ldev.default_trigger = pled->default_trigger;
@@ -435,6 +510,7 @@ static int pca9532_configure(struct i2c_client *client,
 			led->ldev.brightness_set_blocking =
 						pca9532_set_brightness;
 			led->ldev.blink_set = pca9532_set_blink;
+
 			err = led_classdev_register(&client->dev, &led->ldev);
 			if (err < 0) {
 				dev_err(&client->dev,
@@ -442,19 +518,35 @@ static int pca9532_configure(struct i2c_client *client,
 					led->name);
 				goto exit;
 			}
-			pca9532_setled(led);
+
+			err = pca9532_setled(led);
+			if (err < 0) {
+				dev_err(&client->dev,
+					"couldn't set LED %s state\n",
+					led->name);
+				led_classdev_unregister(&led->ldev);
+				goto exit;
+			}
 			break;
 		case PCA9532_TYPE_N2100_BEEP:
 			/* PWM1 is reserved for beeper so blink will not use hardware */
 			data->hw_blink = false;
 			BUG_ON(data->idev);
+
 			led->state = PCA9532_PWM1;
-			pca9532_setled(led);
+			err = pca9532_setled(led);
+			if (err < 0) {
+				dev_err(&client->dev,
+					"couldn't set beeper state\n");
+				goto exit;
+			}
+
 			data->idev = devm_input_allocate_device(&client->dev);
 			if (data->idev == NULL) {
 				err = -ENOMEM;
 				goto exit;
 			}
+
 			data->idev->name = pled->name;
 			data->idev->phys = "i2c/pca9532";
 			data->idev->id.bustype = BUS_HOST;
@@ -467,6 +559,7 @@ static int pca9532_configure(struct i2c_client *client,
 			data->idev->event = pca9532_event;
 			input_set_drvdata(data->idev, data);
 			INIT_WORK(&data->work, pca9532_input_work);
+
 			err = input_register_device(data->idev);
 			if (err) {
 				cancel_work_sync(&data->work);
@@ -498,8 +591,8 @@ static int pca9532_configure(struct i2c_client *client,
 			dev_warn(&client->dev, "could not add gpiochip\n");
 		} else {
 			dev_info(&client->dev, "gpios %i...%i\n",
-				data->gpio.base, data->gpio.base +
-				data->gpio.ngpio - 1);
+				 data->gpio.base, data->gpio.base +
+				 data->gpio.ngpio - 1);
 		}
 	}
 #endif
-- 
2.56.0

