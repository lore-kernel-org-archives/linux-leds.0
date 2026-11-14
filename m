Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677123;
	b=RvBYKbPRByuC6IfdhxNCGpR49ymmhKb39Ho2i9kabOavkFr3A9XB92B60ihZocPMsBnr
	 A42FPHXydLJtRhqX033GTsU0Ua75bh800BY7YuvbmmMouoiHmxs1eiazGJFDq9kzR20lP
	 FZ191x96UuGQlmmj4X83UvzPG9HHW3CSJkAN/fTExR2gdHsCvs0WGCBJg9IS0a7c3kmsB
	 mQkiobBr6yujJYpgbQSJLQk3Iez3b2KNge+YCUa8CGNAR2aPuW+BnZdh0jTPqLWtVwnqp
	 5YPqvH9WQlxrSvXvblMDgaUYeVgN5y7CHFkrhq5DCrJ9TPBNU+57aoaukQEXa6YRzKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JgKeFRFdFMKTuOr/2ku7uevoEs1YOFdFo0iXmmCpVp0=;
	b=XU5YY9d4nnP8bKo2YMy+Oc5iyPetyL+azoKCeNXW53USZdrpkK8fG967DAwvhRh5w7rP
	 OXX1/BSa8ONL6+Idk+I4IpVAzLWfG2oKiwRyN7zk3GvBHoVyyKr2pq5sLTZqPfbs3/SZh
	 XqpoeAwScyg4e071mK0WM64UVhzhUDRH0I1+/vV+OFdj27db739cqnOGApyuuubHvYwWY
	 0ts1bVeWertsj2MKlmW5XplT4pLnZCQg89Ioy5dKHvjCV0Yu6K+V3rS07cWnQdZrq8GxV
	 DYy+GsZZQH91EYlq+Xdg6KTzizEdrNPcharr2XBfvDgIvEujqjWuoJ0npJpFwqFFBRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpSOzNPL;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85638606A323
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 17:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85638606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpSOzNPL
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490f38e9688so1375218f8f.0
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 09:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677121; x=1795281921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgKeFRFdFMKTuOr/2ku7uevoEs1YOFdFo0iXmmCpVp0=;
        b=BpSOzNPLJS2160Rc/o3kkSN8FLmSljLr5XTOrcfMXnhoLPXHmrD9GYCEJdmhRdAG2/
         8AUyrtADC6YTE5g33UGoSYRa8yYHqmGNeXfPLmgaSdcozShN6xtZafyRstbm9VAep4c+
         Hi8WHU8kOY84v796ZyLUxMyU8hU5aYRlCPTviD9N8IYYM8jX6Nve4SPv/8qlIJTykD7U
         kEgl0ZSJsu+Fzp63kdeWv0lFxG01un0oNmshf5WGO6+9+3UzMbR/PBCJBHL8020vK6Kh
         rRX+KFtnZ7s/PXB/h/OkSUbgY9W7NYULE0wUQ8LKS2/9TWCfSnVT6k8a0mnNuWSSZWBO
         zNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677121; x=1795281921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JgKeFRFdFMKTuOr/2ku7uevoEs1YOFdFo0iXmmCpVp0=;
        b=W0WgEiEltt/UWSfOqNOrzJunQfdTlEsLIXtGeXAlg8YEQycjWzQEpFZDfOhiONx3wF
         rxAKNymPpK6zjPGNCWfyKPKemQ4zAl/naHsMqZejlssxTzZiU997svzb1wbF/03SgBPF
         x9PfqQpznkZw5WCrvGxN97jjSyUN9KlXs9vDTIMsIqJQvXHALXl470fI7YtHludOxBmq
         bUh30XKvgiqDgAvMyDrI0p2vbxSLLJRwZ/8UV+BYBbzXzCQHtL5Ksa7QxAJTvmDA8Dpa
         DBZdEx0S4uZkPQO+CyXFA0BZKTJ0tgWIWuuPUi6tRrdXIxyqqIy4F3f0CcAmm2RPdzA1
         huVg==
X-Gm-Message-State: APuU4Z/lC4ps0kPkPVUG22WxSDZjMb1nDZbYhvrJV2zDGHw96WyTm75L
	Ay7HS3oihRX5tb65EDYQvF8zH4LfN3AvO6FBD/wYUJ5b+socW1RYR4BEkcV0JdBzAxY=
X-Gm-Gg: AYBFou2fcTlafimm6mesUEQp5Bg0mzM7mNZUysyRH0MEVk7mqIBSHshDSZDJstrw7+w
	Imzq34aBslCgrBALNF0N1pv2GTjSxVNdFGAHaLvlT7pR62DgvaLymnCy47HJQvMEARxKjkYXhK/
	YZvtbnBbv9Pkdvnmy7u1MnlUAlhpsenyS7Ish7A1IB/kz+xoKn2e4B/I+hOieEdXOtVWmjysX6e
	5dJheVYWMLP02s5x2EYR9kutD6QtpKDfIBlFbPsfFHT7OOhmOr3CSiSXEhtpxwvXtqy5WX+fFEs
	cebqGk7buNU9tW5c959D0o7COPEhZeldvPr2zqWqKMOtvwFSLIoig8XKXaRswpErCwP7delf81/
	d8jZcmQw2bwJykvnN6AXWHqRV4MnjcFjjv787rGHR07P9o5iejnvQ/uNACc/iZxJOUe26znxY0D
	0modr0It1DFh8HXbAEr0jvImh1JkGyho3db3Q6zhMUHg1LecQJzzpuj1PP2AK5q67bVboYg8uuS
	2kozV9NdP+raVlPKdHtlKrmQotsdEklvKNEgQxvaKAGTdSAgrcZBAuiawSsMGEavRnVQbyX6L4t
	WQminuuyurV2fbss2g==
X-Received: by 2002:a05:6000:4211:b0:498:364d:7509 with SMTP id ffacd0b85a97d-49b02d4cd48mr22295252f8f.24.1794677120594;
        Sat, 14 Nov 2026 09:25:20 -0800 (PST)
Received: from averion.play.pl ([2a02:a313:21ec:9380::e204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm10421709f8f.16.2026.11.14.09.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:25:20 -0800 (PST)
From: Daniil Demakov <t3127430@gmail.com>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	linusw@kernel.org,
	Daniil Demakov <t3127430@gmail.com>
Subject: [PATCH v2] leds: pca9532: Propagate I2C errors
Date: Sat, 14 Nov 2026 17:24:31 +0000
Message-ID: <20261114172431.11075-1-t3127430@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114141926.92737-1-t3127430@gmail.com>
References: <20261114141926.92737-1-t3127430@gmail.com>
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

Restore the previous LED state when I2C operations fail to
avoid inconsistent software state.

Avoid warnings for unsupported or invalid hardware blink
configurations, since the LED subsystem can fall back to
software blinking.

Signed-off-by: Daniil Demakov <t3127430@gmail.com>
---
 drivers/leds/leds-pca9532.c | 216 +++++++++++++++++++++++++++---------
 1 file changed, 165 insertions(+), 51 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index c8085427696f..0856c0665707 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -148,39 +148,75 @@ static int pca9532_setpwm(struct i2c_client *client, int pwm)
 {
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
+	int ret;
+
+	if (pwm < 0 || pwm > 1)
+		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
-	i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, pwm),
-		data->pwm[pwm]);
-	i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, pwm),
-		data->psc[pwm]);
+ret = i2c_smbus_write_byte_data(client,
+				PCA9532_REG_PWM(maxleds, pwm),
+				data->pwm[pwm]);
+	if (ret < 0) {
+		dev_warn(&client->dev, "Failed to write PWM register: %d\n", ret);
+		goto out;
+	}
+
+ret = i2c_smbus_write_byte_data(client,
+				PCA9532_REG_PSC(maxleds, pwm),
+				data->psc[pwm]);
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
 	enum led_brightness value)
 {
-	int err = 0;
 	struct pca9532_led *led = ldev_to_led(led_cdev);
+	int old_state = led->state;
+	int err = 0;
 
 	if (value == LED_OFF) {
 		led->state = PCA9532_OFF;
@@ -190,13 +226,26 @@ static int pca9532_set_brightness(struct led_classdev *led_cdev,
 		led->state = PCA9532_ON;
 	} else {
 		led->state = PCA9532_PWM0; /* Thecus: hardcode one pwm */
-		err = pca9532_calcpwm(led->client, PCA9532_PWM_ID_0, 0, value);
+		err = pca9532_calcpwm(led->client, PCA9532_PWM_ID_0,
+				      0, value);
 		if (err)
-			return err;
+			goto restore_state;
+	}
+
+	if (led->state == PCA9532_PWM0) {
+		err = pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
+		if (err < 0)
+			goto restore_state;
 	}
-	if (led->state == PCA9532_PWM0)
-		pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
-	pca9532_setled(led);
+
+	err = pca9532_setled(led);
+	if (err < 0)
+		goto restore_state;
+
+	return 0;
+
+restore_state:
+	led->state = old_state;
 	return err;
 }
 
@@ -205,7 +254,8 @@ static int pca9532_update_hw_blink(struct pca9532_led *led,
 {
 	struct pca9532_data *data = i2c_get_clientdata(led->client);
 	unsigned int psc;
-	int i;
+	unsigned long period;
+	int i, ret;
 
 	/* Look for others LEDs that already use PWM1 */
 	for (i = 0; i < data->chip_info->num_leds; i++) {
@@ -223,17 +273,32 @@ static int pca9532_update_hw_blink(struct pca9532_led *led,
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
 		return -EINVAL;
 	}
 
-	led->state = PCA9532_PWM1;
+	psc = (period * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
+
 	data->psc[PCA9532_PWM_ID_1] = psc;
-	data->pwm[PCA9532_PWM_ID_1] = (delay_on * PCA9532_PWM_DUTY_DIV) / (delay_on + delay_off);
+	data->pwm[PCA9532_PWM_ID_1] =
+		(delay_on * PCA9532_PWM_DUTY_DIV) / period;
+
+	ret = pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
+	if (ret < 0)
+		return ret;
 
-	return pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
+	led->state = PCA9532_PWM1;
+
+	return 0;
 }
 
 static int pca9532_set_blink(struct led_classdev *led_cdev,
@@ -242,6 +307,7 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 	struct pca9532_led *led = ldev_to_led(led_cdev);
 	struct i2c_client *client = led->client;
 	struct pca9532_data *data = i2c_get_clientdata(client);
+	int old_state = led->state;
 	int err;
 
 	if (!data->hw_blink)
@@ -257,16 +323,17 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 	if (err)
 		return err;
 
-	pca9532_setled(led);
+	err = pca9532_setled(led);
+	if (err < 0)
+		led->state = old_state;
 
-	return 0;
+	return err;
 }
 
 static int pca9532_event(struct input_dev *dev, unsigned int type,
 	unsigned int code, int value)
 {
 	struct pca9532_data *data = input_get_drvdata(dev);
-
 	if (!(type == EV_SND && (code == SND_BELL || code == SND_TONE)))
 		return -1;
 
@@ -286,27 +353,35 @@ static void pca9532_input_work(struct work_struct *work)
 	struct pca9532_data *data =
 		container_of(work, struct pca9532_data, work);
 	u8 maxleds = data->chip_info->num_leds;
+	int ret;
 
 	mutex_lock(&data->update_lock);
-	i2c_smbus_write_byte_data(data->client, PCA9532_REG_PWM(maxleds, 1),
-		data->pwm[PCA9532_PWM_ID_1]);
+ret = i2c_smbus_write_byte_data(data->client,
+				PCA9532_REG_PWM(maxleds, 1),
+				data->pwm[PCA9532_PWM_ID_1]);
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
@@ -328,33 +403,37 @@ static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 {
 	struct pca9532_data *data = gpiochip_get_data(gc);
 	struct pca9532_led *led = &data->leds[offset];
+	int old_state = led->state;
+	int ret;
 
 	if (val)
 		led->state = PCA9532_OFF;
 	else
 		led->state = PCA9532_ON;
 
-	pca9532_setled(led);
+	ret = pca9532_setled(led);
+	if (ret < 0)
+		led->state = old_state;
 
-	return 0;
+	return ret;
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
@@ -394,40 +473,57 @@ static int pca9532_configure(struct i2c_client *client,
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
@@ -435,6 +531,7 @@ static int pca9532_configure(struct i2c_client *client,
 			led->ldev.brightness_set_blocking =
 						pca9532_set_brightness;
 			led->ldev.blink_set = pca9532_set_blink;
+
 			err = led_classdev_register(&client->dev, &led->ldev);
 			if (err < 0) {
 				dev_err(&client->dev,
@@ -442,19 +539,35 @@ static int pca9532_configure(struct i2c_client *client,
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
@@ -467,6 +580,7 @@ static int pca9532_configure(struct i2c_client *client,
 			data->idev->event = pca9532_event;
 			input_set_drvdata(data->idev, data);
 			INIT_WORK(&data->work, pca9532_input_work);
+
 			err = input_register_device(data->idev);
 			if (err) {
 				cancel_work_sync(&data->work);
@@ -498,8 +612,8 @@ static int pca9532_configure(struct i2c_client *client,
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

