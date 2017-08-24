From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v3 3/4] leds: pca955x: add GPIO support
Date: Thu, 24 Aug 2017 13:30:07 +0200
Message-ID: <4a6d3c67-c7ac-664c-2506-8c5e0530a2c1@kaod.org>
References: <1502199760-763-1-git-send-email-clg@kaod.org>
 <1502199760-763-4-git-send-email-clg@kaod.org> <20170811134757.GA22561@amd>
 <9330f31a-110c-8398-8cd1-764f8dd358e9@kaod.org> <20170811153742.GA31267@amd>
 <b585f234-6ad6-e63f-f4ec-f7d1efaf83ca@kaod.org> <20170812084213.GA20383@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 3.mo179.mail-out.ovh.net ([178.33.251.175]:46608 "EHLO
        3.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751300AbdHXLhj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Aug 2017 07:37:39 -0400
Received: from player794.ha.ovh.net (b6.ovh.net [213.186.33.56])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id DF3D65CCB4
        for <linux-leds@vger.kernel.org>; Thu, 24 Aug 2017 13:30:17 +0200 (CEST)
In-Reply-To: <20170812084213.GA20383@amd>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>

On 08/12/2017 10:42 AM, Pavel Machek wrote:
> Hi!
> 
>>>>>> +static u8 pca955x_read_input(struct i2c_client *client, int n)
>>>>>> +{
>>>>>> +	return (u8)i2c_smbus_read_byte_data(client, n);
>>>>>> +}
>>>>>
>>>>> Is the cast needed? Should you attempt to handle errors?
>>>>
>>>> ah. this is a left over. I can fix in a resend.
>>>
>>> No need to resend just for this.
>>>
>>> Should you WARN_ON() if the read_byte_data returns < 0 or something?
>>>
>>> https://linuxtv.org/downloads/v4l-dvb-internals/device-drivers/API-i2c-smbus-read-byte-data.html
>>
>> I don't think so as this is just to read the gpio value. 
>>
>> I suppose that the i2c layer will output some errors before 
>> if it catches some invalid state.
> 
> Normally its driver's job to output errors. (Same for write).

ok. I can respin the patchset with an extra patch adding checks
for I2C errors (see below). In which order would you want that, 
before the gpio support or after ? 

Thanks,

C.  

>From c52749964ee435eec8dc5b8634f7f76cf637e7b1 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Thu, 24 Aug 2017 13:27:45 +0200
Subject: [PATCH] leds: pca955x: check for I2C errors
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This should also allow probing to fail when a pca955x chip is not
found on a I2C bus.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/leds/leds-pca955x.c | 89 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 70 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index f062d1e7640f..17ac7cf2728d 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -165,13 +165,18 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
  * Write to frequency prescaler register, used to program the
  * period of the PWM output.  period = (PSCx + 1) / 38
  */
-static void pca955x_write_psc(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	int ret;
 
-	i2c_smbus_write_byte_data(client,
+	ret = i2c_smbus_write_byte_data(client,
 		pca95xx_num_input_regs(pca955x->chipdef->bits) + 2*n,
 		val);
+	if (ret < 0)
+		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
+			__func__, n, val, ret);
+	return ret;
 }
 
 /*
@@ -181,38 +186,57 @@ static void pca955x_write_psc(struct i2c_client *client, int n, u8 val)
  *
  * Duty cycle is (256 - PWMx) / 256
  */
-static void pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	int ret;
 
-	i2c_smbus_write_byte_data(client,
+	ret = i2c_smbus_write_byte_data(client,
 		pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + 2*n,
 		val);
+	if (ret < 0)
+		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
+			__func__, n, val, ret);
+	return ret;
 }
 
+
 /*
  * Write to LED selector register, which determines the source that
  * drives the LED output.
  */
-static void pca955x_write_ls(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	int ret;
 
-	i2c_smbus_write_byte_data(client,
+	ret = i2c_smbus_write_byte_data(client,
 		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n,
 		val);
+	if (ret < 0)
+		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
+			__func__, n, val, ret);
+	return ret;
 }
 
 /*
  * Read the LED selector register, which determines the source that
  * drives the LED output.
  */
-static u8 pca955x_read_ls(struct i2c_client *client, int n)
+static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	int ret;
 
-	return (u8) i2c_smbus_read_byte_data(client,
+	ret = i2c_smbus_read_byte_data(client,
 		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n);
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
+			__func__, n, ret);
+		return ret;
+	}
+	*val = (u8) ret;
+	return 0;
 }
 
 static int pca955x_led_set(struct led_classdev *led_cdev,
@@ -223,6 +247,7 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	u8 ls;
 	int chip_ls;	/* which LSx to use (0-3 potentially) */
 	int ls_led;	/* which set of bits within LSx to use (0-3) */
+	int ret;
 
 	pca955x_led = container_of(led_cdev, struct pca955x_led, led_cdev);
 	pca955x = pca955x_led->pca955x;
@@ -232,7 +257,9 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 
 	mutex_lock(&pca955x->lock);
 
-	ls = pca955x_read_ls(pca955x->client, chip_ls);
+	ret = pca955x_read_ls(pca955x->client, chip_ls, &ls);
+	if (ret)
+		return ret;
 
 	switch (value) {
 	case LED_FULL:
@@ -252,13 +279,17 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 		 * OFF, HALF, or FULL.  But, this is probably better than
 		 * just turning off for all other values.
 		 */
-		pca955x_write_pwm(pca955x->client, 1,
-				255 - value);
+		ret = pca955x_write_pwm(pca955x->client, 1,
+					255 - value);
+		if (ret)
+			return ret;
 		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK1);
 		break;
 	}
 
-	pca955x_write_ls(pca955x->client, chip_ls, ls);
+	ret = pca955x_write_ls(pca955x->client, chip_ls, ls);
+	if (ret)
+		return ret;
 
 	mutex_unlock(&pca955x->lock);
 
@@ -269,9 +300,18 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 /*
  * Read the INPUT register, which contains the state of LEDs.
  */
-static u8 pca955x_read_input(struct i2c_client *client, int n)
+static int pca955x_read_input(struct i2c_client *client, int n, u8 *val)
 {
-	return (u8)i2c_smbus_read_byte_data(client, n);
+	int ret = i2c_smbus_read_byte_data(client, n);
+
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
+			__func__, n, ret);
+		return ret;
+	}
+	*val = (u8) ret;
+	return 0;
+
 }
 
 static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
@@ -301,7 +341,10 @@ static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pca955x *pca955x = gpiochip_get_data(gc);
 	struct pca955x_led *led = &pca955x->leds[offset];
-	u8 reg = pca955x_read_input(pca955x->client, led->led_num / 8);
+	u8 reg = 0;
+
+	/* There is nothing we can do about errors */
+	pca955x_read_input(pca955x->client, led->led_num / 8, &reg);
 
 	return !!(reg & (1 << (led->led_num % 8)));
 }
@@ -496,14 +539,22 @@ static int pca955x_probe(struct i2c_client *client,
 	}
 
 	/* PWM0 is used for half brightness or 50% duty cycle */
-	pca955x_write_pwm(client, 0, 255-LED_HALF);
+	err = pca955x_write_pwm(client, 0, 255-LED_HALF);
+	if (err)
+		return err;
 
 	/* PWM1 is used for variable brightness, default to OFF */
-	pca955x_write_pwm(client, 1, 0);
+	err = pca955x_write_pwm(client, 1, 0);
+	if (err)
+		return err;
 
 	/* Set to fast frequency so we do not see flashing */
-	pca955x_write_psc(client, 0, 0);
-	pca955x_write_psc(client, 1, 0);
+	err = pca955x_write_psc(client, 0, 0);
+	if (err)
+		return err;
+	err = pca955x_write_psc(client, 1, 0);
+	if (err)
+		return err;
 
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 	if (ngpios) {
-- 
2.13.5
