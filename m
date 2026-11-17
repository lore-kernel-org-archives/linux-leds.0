Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899242;
	b=uoKOlQTKDZw/TNs7KniDosNW1lQ7aj7YBJbusAFr0saXmTcB0UdWuSKBB6pnRpVaXGXZ
	 saxxzJBA0ZUdBbHfgH33b4OnZli9IWdMSyB/vn9kPgF0XMi+m9gcuaLxWAxUqMfmDahrp
	 j64UdFcUJDyh20ejrNKZhNLJmHeBICgHuSyUCjgvzPY1dZuMMhmK+waQo3yOVgejXrcXa
	 M8RByV3JvOxrRZKHXB8sqQe6qqVLuLieXA6AdORlqhosXblYrZisBo5uWif8QN3DTGxAb
	 +O7miEd7+rHhHhO2+Fj1sTUrbMMkFnMNdj+DSnDmVn2d/stIVUg6+lrbhjvGJYbbERw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uF8hvpWcU/NDMAjvgcPKp574wcs6nyPkvvgcBh6yw5o=;
	b=2lf/ZyCQ1CR4GAsfTGzNXTnvEVjuLFKAV+lWxbia6yPKiFcJhwJoau3Gq388BSp/Gd2y
	 RwlEuTxzuswTa4hw85ezavlSBYifK4M+kh7b/U7K6HlqSW+oH9T5CZAv73ARxUo/TodmD
	 xacp3RjR6hfq9uohzHYH7r028yoPEMr9tegSPBo6GldWwmC35ARcs5WSbbneefaDNwFbO
	 jt0CZfTqCBKHvamxSCxs6AAFP0uTkDMGB1EmGPZ69BkRvwPcyhOCcBNGT/UDkvud3EL0I
	 2MV1MfhDbdrrKOusuVaSEYMoAzUsR+UYmp8hmRhnBJNGb9cJ376wTxMkb3tBMUX56BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXV6VCmT;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25426606A32A
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 07:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25426606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXV6VCmT
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so26726625e9.3
        for <linux-leds@vger.kernel.org>; Mon, 16 Nov 2026 23:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794899240; x=1795504040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uF8hvpWcU/NDMAjvgcPKp574wcs6nyPkvvgcBh6yw5o=;
        b=zXV6VCmT7qPLu2daFtEbUGdFuCEx5Q29KclSiRO62UPrbAO+etu8jcz7wgVm4HbzFX
         Ix5j7Mo8OUf1uvVWIWjPBTOHwT6VOIIO8i1H1DqdpqH6veVu32Ue/v+pk96RZS/CRqas
         daarzVwGNlMh+QsaOiKz6NO5LWA/MhVnaKSBCoY9aqbqnQMmv+jPftrdVGR6Z5sJTyl6
         n2gXg5v1Ux3uL2wLAke1tIwlhQDitZ5w0uWBlcKyPnp8KC6qUhXkgOomEdZQeQTxjhvD
         TIwRo7GUJl3yWbuNAtq8c39CLfs1SaD2DmCp9DwtVzqUTw0zVSzbOjYBfsiPm7XVQXRJ
         xk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899240; x=1795504040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uF8hvpWcU/NDMAjvgcPKp574wcs6nyPkvvgcBh6yw5o=;
        b=suo0af+5lZT1PwaUkDtkzYkv4SzZJ4BpGV4Mh7AXHuhhsix3SiarXwjRjxO/Mbl5h+
         BIBhRcIK+ngcBkDzOxWDZbbRxlCSUO+WQbwO8OO+48TADqyMn/C9nWH7oEqSYF6WHrhH
         sdpU4hcW/nC0xR+I0Kad4ng2B4RQQlvhkAmjobNyDoDajU+4+i4n4fRYxP311kHM+IE7
         rF3wkrmKk2liIKNGLPcXzu7Y/IDBUnRdEdtN3IjKVzx7gQuCMceI5OjkIu3pVMSbySoO
         qe2GTESbzF2iNt0cU7ChpBakEGmnWEWdK93jYaOT2S3hhFFMN2zxkN7GcPB3+LsQvRHS
         W/Kw==
X-Forwarded-Encrypted: i=1; AL+hErFmSTHpQ7Hns/5RBS8SIieLlBlTUb4/WSdGcJKfCzMwvXp6eVR/a4xWlEFPzWm7mJK9STyBJj/GuQce@vger.kernel.org
X-Gm-Message-State: APuU4Z8eZfexHx0Tq/fEvlooJvny9sOPNdsjwXCjOtelpUmSzDZH0+79
	xxvDfLs7eX0iiMHK/ihntQBfO7EuV4hlE1mAu1AgNQn33c8L+GmJwXpzEgF648PT
X-Gm-Gg: AYBFou3GMkEDfnxYuNfvHkKUGF/u8ZbLuKNYQ1uhVJADW7XMl+gLWDnSAOsws1OjewA
	Lk1wdZWjjhTcFkSM//12BWElnHISkFLqFzOF+mRVu9WITdLHKHJNAZ7xPd62mzY9tI0azjTzQre
	Z+sSHFiZ5ZlMUrz5ag1/TxI5oTRFmtg4GrdEA2849uccOsQb55ubdxosZ/53tV+UcTCza9RLqgZ
	mI9WKvvR3BszbYPThXQsb+dSXpG6YVk4IK0F28jcpQiiKhRtSJOVpcyqT3XNT76vZo1TReqMfp9
	RTYSkzaK1sjN7waIkm8mA7idgwEq0ZR/dQtaoj7Rz2QiF42Zr9+1G82PkgKLDTBUBo90WDI+7RK
	TV9atw2mXjbL+KH891jk2A8GfZa6NUOLKFyEKGkh5xP+2Z9vnj8h3B+7/q1p2kY+FUecjJCpmtK
	06zOdzNGTi9SRU6Sjcmi4pgeqxj5Fx5GkmtKz8rvBslgi5vSpWXJQ7P3qxsE6Tk2c8RP9dFVlYW
	ztJPmgdEGMZBwfZb3VU6kghDbvGF/gLmgekK8tU5BrSaBuIjZKZ436uXbSEmV1pPWmmoVGV7dD8
	X2p7w2HgSOEK2Guu4pf4Ec+abwqVrQdg/UiHPzM=
X-Received: by 2002:a05:600c:6085:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4bb55a8d7abmr265331995e9.20.1794899240159;
        Mon, 16 Nov 2026 23:07:20 -0800 (PST)
Received: from averion.play.pl ([2a02:a313:21ec:9380::e204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad96096sm4456755e9.9.2026.11.16.23.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:07:19 -0800 (PST)
From: Daniil Demakov <t3127430@gmail.com>
To: riku.voipio@iki.fi
Cc: lee@kernel.org,
	pavel@kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	griffin@kroah.com,
	Daniil Demakov <t3127430@gmail.com>
Subject: [PATCH] leds: pca9532: Propagate I2C errors
Date: Tue, 17 Nov 2026 07:05:18 +0000
Message-ID: <20261117070518.26130-1-t3127430@gmail.com>
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

Check return values from I2C register accesses and propagate
errors to LED and GPIO callers.

Restore cached LED and PWM state when register updates fail.
Also protect the beeper PWM value shared between the input
event callback and workqueue.

Signed-off-by: Daniil Demakov <t3127430@gmail.com>
---
 drivers/leds/leds-pca9532.c | 351 +++++++++++++++++++++++++++++-------
 1 file changed, 283 insertions(+), 68 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index c8085427696f..ce34ade3febb 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -14,6 +14,7 @@
 #include <linux/leds.h>
 #include <linux/input.h>
 #include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/workqueue.h>
 #include <linux/leds-pca9532.h>
 #include <linux/gpio/driver.h>
@@ -42,6 +43,9 @@ struct pca9532_data {
 	struct i2c_client *client;
 	struct pca9532_led leds[16];
 	struct mutex update_lock;
+	/* Protects beep_pwm between the event callback and workqueue. */
+	spinlock_t beep_lock;
+	u8 beep_pwm;
 	struct input_dev *idev;
 	struct work_struct work;
 #ifdef CONFIG_LEDS_PCA9532_GPIO
@@ -144,68 +148,147 @@ static int pca9532_calcpwm(struct i2c_client *client, int pwm, int blink,
 	return 0;
 }
 
-static int pca9532_setpwm(struct i2c_client *client, int pwm)
+static int __pca9532_setpwm(struct i2c_client *client, int pwm)
 {
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
+	int ret;
 
-	mutex_lock(&data->update_lock);
-	i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, pwm),
-		data->pwm[pwm]);
-	i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, pwm),
-		data->psc[pwm]);
-	mutex_unlock(&data->update_lock);
-	return 0;
-}
+	if (pwm < 0 || pwm > 1)
+		return -EINVAL;
+
+	ret = i2c_smbus_write_byte_data(client,
+					PCA9532_REG_PWM(maxleds, pwm),
+					data->pwm[pwm]);
+	if (ret < 0) {
+		dev_warn(&client->dev,
+			 "Failed to write PWM register: %d\n", ret);
+		return ret;
+	}
+
+	ret = i2c_smbus_write_byte_data(client,
+					PCA9532_REG_PSC(maxleds, pwm),
+					data->psc[pwm]);
+	if (ret < 0)
+		dev_warn(&client->dev,
+			 "Failed to write PSC register: %d\n", ret);
 
+	return ret;
+}
 /* Set LED routing */
-static void pca9532_setled(struct pca9532_led *led)
+static int __pca9532_setled(struct pca9532_led *led)
 {
 	struct i2c_client *client = led->client;
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
-	char reg;
+	int reg;
+	int ret;
 
-	mutex_lock(&data->update_lock);
 	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
+	if (reg < 0) {
+		ret = reg;
+		dev_warn(&client->dev, "Failed to read LED register: %d\n", ret);
+		return ret;
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
+	if (ret < 0)
+		dev_warn(&client->dev, "Failed to write LED register: %d\n", ret);
+
+	return ret;
+}
+
+static int pca9532_setled(struct pca9532_led *led)
+{
+	struct pca9532_data *data = i2c_get_clientdata(led->client);
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	ret = __pca9532_setled(led);
 	mutex_unlock(&data->update_lock);
+
+	return ret;
 }
 
 static int pca9532_set_brightness(struct led_classdev *led_cdev,
-	enum led_brightness value)
+				  enum led_brightness value)
 {
-	int err = 0;
 	struct pca9532_led *led = ldev_to_led(led_cdev);
+	struct pca9532_data *data = i2c_get_clientdata(led->client);
+	int old_state;
+	u8 old_pwm;
+	u8 old_psc;
+	bool pwm_updated = false;
+	int restore_err;
+	int err = 0;
+
+	mutex_lock(&data->update_lock);
+	old_state = led->state;
+	old_pwm = data->pwm[PCA9532_PWM_ID_0];
+	old_psc = data->psc[PCA9532_PWM_ID_0];
 
 	if (value == LED_OFF) {
 		led->state = PCA9532_OFF;
 	} else if (led->state == PCA9532_PWM1) {
-		return 0; /* Non-zero brightness shall not stop HW blinking */
+		goto out;
 	} else if (value == LED_FULL) {
 		led->state = PCA9532_ON;
 	} else {
-		led->state = PCA9532_PWM0; /* Thecus: hardcode one pwm */
-		err = pca9532_calcpwm(led->client, PCA9532_PWM_ID_0, 0, value);
+		led->state = PCA9532_PWM0;
+		err = pca9532_calcpwm(led->client, PCA9532_PWM_ID_0,
+				      0, value);
 		if (err)
-			return err;
+			goto restore_state;
 	}
-	if (led->state == PCA9532_PWM0)
-		pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
-	pca9532_setled(led);
+
+	if (led->state == PCA9532_PWM0) {
+		pwm_updated = true;
+		err = __pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
+		if (err < 0)
+			goto restore_state;
+	}
+
+	err = __pca9532_setled(led);
+	if (err < 0)
+		goto restore_state;
+
+	goto out;
+
+restore_state:
+	led->state = old_state;
+	data->pwm[PCA9532_PWM_ID_0] = old_pwm;
+	data->psc[PCA9532_PWM_ID_0] = old_psc;
+
+	if (pwm_updated) {
+		restore_err = __pca9532_setpwm(led->client,
+					       PCA9532_PWM_ID_0);
+		if (restore_err < 0)
+			dev_warn(&led->client->dev,
+				 "Failed to restore PWM settings: %d\n",
+				 restore_err);
+	}
+out:
+	mutex_unlock(&data->update_lock);
 	return err;
 }
 
 static int pca9532_update_hw_blink(struct pca9532_led *led,
-				   unsigned long delay_on, unsigned long delay_off)
+				   unsigned long delay_on,
+				   unsigned long delay_off)
 {
 	struct pca9532_data *data = i2c_get_clientdata(led->client);
 	unsigned int psc;
-	int i;
+	unsigned long period;
+	u8 old_pwm = data->pwm[PCA9532_PWM_ID_1];
+	u8 old_psc = data->psc[PCA9532_PWM_ID_1];
+	int i, ret;
 
 	/* Look for others LEDs that already use PWM1 */
 	for (i = 0; i < data->chip_info->num_leds; i++) {
@@ -223,58 +306,125 @@ static int pca9532_update_hw_blink(struct pca9532_led *led,
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
+	if (!delay_on || !delay_off)
+		return -EINVAL;
+
+	if (period > ((U8_MAX + 1) * 1000) /
+		     PCA9532_PWM_PERIOD_DIV)
 		return -EINVAL;
+
+	psc = (period * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
+
+	data->psc[PCA9532_PWM_ID_1] = psc;
+	data->pwm[PCA9532_PWM_ID_1] =
+		(delay_on * PCA9532_PWM_DUTY_DIV) / period;
+
+	ret = __pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
+	if (ret < 0) {
+		data->pwm[PCA9532_PWM_ID_1] = old_pwm;
+		data->psc[PCA9532_PWM_ID_1] = old_psc;
+
+		if (__pca9532_setpwm(data->client, PCA9532_PWM_ID_1) < 0)
+			dev_warn(&data->client->dev,
+				 "Failed to restore PWM settings\n");
+
+		return ret;
 	}
 
 	led->state = PCA9532_PWM1;
-	data->psc[PCA9532_PWM_ID_1] = psc;
-	data->pwm[PCA9532_PWM_ID_1] = (delay_on * PCA9532_PWM_DUTY_DIV) / (delay_on + delay_off);
 
-	return pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
+	return 0;
 }
 
 static int pca9532_set_blink(struct led_classdev *led_cdev,
-	unsigned long *delay_on, unsigned long *delay_off)
+			     unsigned long *delay_on,
+			     unsigned long *delay_off)
 {
 	struct pca9532_led *led = ldev_to_led(led_cdev);
 	struct i2c_client *client = led->client;
 	struct pca9532_data *data = i2c_get_clientdata(client);
+	int old_state;
+	int restore_err;
+	u8 old_pwm;
+	u8 old_psc;
 	int err;
 
-	if (!data->hw_blink)
-		return -EINVAL;
+	mutex_lock(&data->update_lock);
+
+	old_state = led->state;
+	old_pwm = data->pwm[PCA9532_PWM_ID_1];
+	old_psc = data->psc[PCA9532_PWM_ID_1];
+
+	if (!data->hw_blink) {
+		err = -EINVAL;
+		goto restore_state;
+	}
 
-	if (*delay_on == 0 && *delay_off == 0) {
-		/* led subsystem ask us for a blink rate */
+	if (!*delay_on && !*delay_off) {
 		*delay_on = 500;
 		*delay_off = 500;
 	}
 
 	err = pca9532_update_hw_blink(led, *delay_on, *delay_off);
 	if (err)
-		return err;
+		goto restore_state;
 
-	pca9532_setled(led);
+	err = __pca9532_setled(led);
+	if (err < 0) {
+		data->pwm[PCA9532_PWM_ID_1] = old_pwm;
+		data->psc[PCA9532_PWM_ID_1] = old_psc;
 
-	return 0;
+		restore_err = __pca9532_setpwm(client, PCA9532_PWM_ID_1);
+		if (restore_err < 0)
+			dev_warn(&client->dev,
+				 "Failed to restore PWM settings: %d\n",
+				 restore_err);
+
+		goto restore_state;
+	}
+
+	goto out;
+
+restore_state:
+	led->state = old_state;
+
+	if (old_state == PCA9532_PWM1) {
+		led->state = PCA9532_OFF;
+		restore_err = __pca9532_setled(led);
+		if (restore_err < 0) {
+			led->state = old_state;
+			dev_warn(&client->dev,
+				 "Failed to disable hardware blinking: %d\n",
+				 restore_err);
+		}
+	}
+out:
+	mutex_unlock(&data->update_lock);
+	return err;
 }
 
 static int pca9532_event(struct input_dev *dev, unsigned int type,
-	unsigned int code, int value)
+			 unsigned int code, int value)
 {
 	struct pca9532_data *data = input_get_drvdata(dev);
+	unsigned long flags;
 
 	if (!(type == EV_SND && (code == SND_BELL || code == SND_TONE)))
 		return -1;
 
-	/* XXX: allow different kind of beeps with psc/pwm modifications */
+	spin_lock_irqsave(&data->beep_lock, flags);
+
 	if (value > 1 && value < 32767)
-		data->pwm[PCA9532_PWM_ID_1] = 127;
+		data->beep_pwm = 127;
 	else
-		data->pwm[PCA9532_PWM_ID_1] = 0;
+		data->beep_pwm = 0;
+
+	spin_unlock_irqrestore(&data->beep_lock, flags);
 
 	schedule_work(&data->work);
 
@@ -286,27 +436,48 @@ static void pca9532_input_work(struct work_struct *work)
 	struct pca9532_data *data =
 		container_of(work, struct pca9532_data, work);
 	u8 maxleds = data->chip_info->num_leds;
+	unsigned long flags;
+	u8 old_pwm;
+	u8 pwm;
+	int ret;
+
+	spin_lock_irqsave(&data->beep_lock, flags);
+	pwm = data->beep_pwm;
+	spin_unlock_irqrestore(&data->beep_lock, flags);
 
 	mutex_lock(&data->update_lock);
-	i2c_smbus_write_byte_data(data->client, PCA9532_REG_PWM(maxleds, 1),
-		data->pwm[PCA9532_PWM_ID_1]);
+
+	old_pwm = data->pwm[PCA9532_PWM_ID_1];
+	data->pwm[PCA9532_PWM_ID_1] = pwm;
+
+	ret = i2c_smbus_write_byte_data(data->client,
+					PCA9532_REG_PWM(maxleds, 1), pwm);
+	if (ret < 0) {
+		data->pwm[PCA9532_PWM_ID_1] = old_pwm;
+		dev_warn(&data->client->dev,
+			 "Failed to write PWM register: %d\n", ret);
+	}
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
@@ -328,33 +499,42 @@ static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 {
 	struct pca9532_data *data = gpiochip_get_data(gc);
 	struct pca9532_led *led = &data->leds[offset];
+	int old_state;
+	int ret;
+
+	mutex_lock(&data->update_lock);
+	old_state = led->state;
 
 	if (val)
 		led->state = PCA9532_OFF;
 	else
 		led->state = PCA9532_ON;
 
-	pca9532_setled(led);
+	ret = __pca9532_setled(led);
+	if (ret < 0)
+		led->state = old_state;
 
-	return 0;
+	mutex_unlock(&data->update_lock);
+
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
@@ -394,40 +574,57 @@ static int pca9532_configure(struct i2c_client *client,
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
@@ -435,6 +632,15 @@ static int pca9532_configure(struct i2c_client *client,
 			led->ldev.brightness_set_blocking =
 						pca9532_set_brightness;
 			led->ldev.blink_set = pca9532_set_blink;
+
+			err = pca9532_setled(led);
+			if (err < 0) {
+				dev_err(&client->dev,
+					"couldn't set LED %s state\n",
+					led->name);
+				goto exit;
+			}
+
 			err = led_classdev_register(&client->dev, &led->ldev);
 			if (err < 0) {
 				dev_err(&client->dev,
@@ -442,19 +648,26 @@ static int pca9532_configure(struct i2c_client *client,
 					led->name);
 				goto exit;
 			}
-			pca9532_setled(led);
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
@@ -467,6 +680,7 @@ static int pca9532_configure(struct i2c_client *client,
 			data->idev->event = pca9532_event;
 			input_set_drvdata(data->idev, data);
 			INIT_WORK(&data->work, pca9532_input_work);
+
 			err = input_register_device(data->idev);
 			if (err) {
 				cancel_work_sync(&data->work);
@@ -498,8 +712,8 @@ static int pca9532_configure(struct i2c_client *client,
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
@@ -591,6 +805,7 @@ static int pca9532_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, data);
 	data->client = client;
 	mutex_init(&data->update_lock);
+	spin_lock_init(&data->beep_lock);
 
 	return pca9532_configure(client, data, pca9532_pdata);
 }
-- 
2.56.0

