From: Andrea Scian - DAVE Embedded Systems <andrea.scian@dave.eu>
Subject: Re: about pca955x led driver gpio management
Date: Tue, 17 Oct 2017 11:16:59 +0200
Message-ID: <4ac527f2-c59e-70a2-efd4-da52370ea557@dave.eu>
References: <f4a6919a-83c8-79c9-94ed-48f803a3191f@dave.eu>
 <ea6795ac-806e-4e15-c18b-8cf4aab95ca8@kaod.org>
 <f5b716ff-0b9b-982b-2236-970333dcbb0a@dave.eu>
 <998d7654-f69a-1a99-d4e7-19abd0a54da0@kaod.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------CABB12C0C07A10B6E44BEE10"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx.dave-tech.it ([2.229.21.40]:48663 "EHLO mx.dave-tech.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755515AbdJQJRC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Oct 2017 05:17:02 -0400
In-Reply-To: <998d7654-f69a-1a99-d4e7-19abd0a54da0@kaod.org>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------CABB12C0C07A10B6E44BEE10
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit


> On 10/17/2017 10:20 AM, Andrea Scian - DAVE Embedded Systems wrote:
>>
>> Il 17/10/2017 10:18, Cédric Le Goater ha scritto:
>>> On 10/17/2017 09:36 AM, Andrea Scian - DAVE Embedded Systems wrote:
>>>> Dear all,
>>>>
>>>> I'm working on an iMX6 based board with a PCA9555 which is used both to drive LEDs and manage some GPIOs.
>>> The PCA9555 chip and the PCA955[0-3] chips have different control
>>> registers. You need a different led driver for it.
>>
>> My typo sorry, as you can see in the device tree below, I'm using pca9551
> 
> ok.
> 
> You might want to take a look at how we mixed gpios and leds on the witherspoon
> system using pca9552 chips. we added a gpio-leds binding.
> 
> https://github.com/openbmc/linux/blob/dev-4.10/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts

understood: you configure all pins of PCA955x as GPIOs and the map the 
one you need as led with gpio-leds binding.

However to me this is a kind of workaround or, at least, there's nothing 
about this limitation into the devicetree binding (in fact, IMHO, the 
device tree binding example will just fail)

I wrote the attached patch which should fix the issue and allow a more 
generic approach. WDYT?

(in case it looks good, I'll send the patch in the correct way)


Kind Regards,

Andrea

>>
>>>> My current kernel is quite old (4.1.15) but I've found Cédric patches on mainline and backported to this old revision.
>>>>
>>>> I'm facing an issue with it, because it seems that it fails when it's used in a mixed (led/gpios) environment.
>>>>
>>>> E.g.: let's say that I have one led connected to LED0 output and one GPIO connected at LED1 output.
>>>>
>>>> I define it as
>>>>
>>>>                           pca9551: pca9551@60 {
>>>>                                   compatible = "nxp,pca9551";
>>>>                                   reg = <0x60>;
>>>>                                   #address-cells = <1>;
>>>>                                   #size-cells = <0>;
>>>>                                   #gpio-cells = <1>;
>>>>
>>>>                                   led@0 {
>>>>                                           label = "led0";
>>>>                                           reg = <0>;
>>>>                                           linux,default-trigger = "none";
>>>>                                   };
>>>>                                   gpio@1 {
>>>>                                           label = "gpio1";
>>>>                                           reg = <1>;
>>>>                                           type = <2>; /* GPIO */
>>>>                                   };
>>>>                   };
>>>>
>>>> At boot it's probed as
>>>>
>>>> root@sbc-lynx:~# dmesg | grep pca
>>>> [    5.315425] leds-pca955x 5-0060: leds-pca955x: Using pca9551 8-bit LED driver at slave address 0x60
>>>> [    5.350349] leds-pca955x 5-0060: gpios 511...511
>>>>
>>>> But I cannot access it:
>>>>
>>>> root@sbc-lynx:~# echo 511 > /sys/class/gpio/export
>>>> -sh: echo: write error: Device or resource busy
>>>>
>>>> Because for pca955x_gpio_request_pin() this is at offset 0 (in fact is the first gpio registered of this gpio_chip) but it's the index 1 inside pca955x->leds[]
>>>>
>>>> Am I missing something? (maybe I made a mistake in my backport and/or I'm missing some patches about the GPIO subsystems).
>>>>
>>>> If I'm right I think I can send a patch to fix this (I'm thinking about having an array of GPIO index to map offset -> pca955x->leds[] index or just register all pins as GPIOs and then just report the busy state)
>>>>
>>>> WDYT?
>>>>
>>>> Kind Regards,
>>>>
>>
> 

--------------CABB12C0C07A10B6E44BEE10
Content-Type: text/plain; charset=UTF-8;
 name="0001-leds-pca955x-map-gpio-offset-to-led-index-correctly.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-leds-pca955x-map-gpio-offset-to-led-index-correctly.pat";
 filename*1="ch"

>From 5f8be223e8b302dbba2690560c1ea74b6e26c07f Mon Sep 17 00:00:00 2001
From: Andrea Scian <andrea.scian@dave.eu>
Date: Tue, 17 Oct 2017 11:09:11 +0200
Subject: [PATCH] leds: pca955x: map gpio offset to led index correctly

We need to map gpio offset to led index of this device otherwise we
cannot mix led and gpios into device tree definition

Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
---
 drivers/leds/leds-pca955x.c |   38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index cdd7a4c..27942aa 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -122,6 +122,7 @@ struct pca955x {
 	struct i2c_client	*client;
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 	struct gpio_chip gpio;
+	int *gpio_to_index;
 #endif
 };
 
@@ -313,25 +314,36 @@ static int pca955x_read_input(struct i2c_client *client, int n, u8 *val)
 	}
 	*val = (u8)ret;
 	return 0;
+}
 
+/*
+ * Map from gpio offset to led index.
+ * Return NULL in case of unmapped GPIO (even if it should never happens)
+ */
+static struct pca955x_led *
+pca955x_gpio_get_led_index(struct pca955x *pca955x, unsigned int offset)
+{
+	int index = pca955x->gpio_to_index[offset];
+
+	return index < 0 ? NULL : &pca955x->leds[index];
 }
 
 static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pca955x *pca955x = to_pca(gc);
-	struct pca955x_led *led = &pca955x->leds[offset];
-
-	if (led->type == PCA955X_TYPE_GPIO)
-		return 0;
+	struct pca955x_led *led = pca955x_gpio_get_led_index(pca955x, offset);
 
-	return -EBUSY;
+	return led == NULL ? -EBUSY : 0;
 }
 
 static int pca955x_set_value(struct gpio_chip *gc, unsigned int offset,
 			     int val)
 {
 	struct pca955x *pca955x = to_pca(gc);
-	struct pca955x_led *led = &pca955x->leds[offset];
+	struct pca955x_led *led = pca955x_gpio_get_led_index(pca955x, offset);
+
+	if (led == NULL)
+		return -EINVAL;
 
 	if (val)
 		return pca955x_led_set(&led->led_cdev, LED_FULL);
@@ -348,10 +360,14 @@ static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pca955x *pca955x = to_pca(gc);
-	struct pca955x_led *led = &pca955x->leds[offset];
+	struct pca955x_led *led = pca955x_gpio_get_led_index(pca955x, offset);
 	u8 reg = 0;
 
 	/* There is nothing we can do about errors */
+	if (led == NULL)
+		return 0;
+
+	/* There is nothing we can do about errors */
 	pca955x_read_input(pca955x->client, led->led_num / 8, &reg);
 
 	return !!(reg & (1 << (led->led_num % 8)));
@@ -497,6 +513,11 @@ static int pca955x_probe(struct i2c_client *client,
 	if (!pca955x->leds)
 		return -ENOMEM;
 
+	pca955x->gpio_to_index = devm_kzalloc(&client->dev,
+			sizeof(int) * chip->bits, GFP_KERNEL);
+	if (!pca955x->gpio_to_index)
+		return -ENOMEM;
+
 	i2c_set_clientdata(client, pca955x);
 
 	mutex_init(&pca955x->lock);
@@ -508,12 +529,13 @@ static int pca955x_probe(struct i2c_client *client,
 		pca955x_led->led_num = i;
 		pca955x_led->pca955x = pca955x;
 		pca955x_led->type = pdata->leds[i].type;
+		pca955x->gpio_to_index[i] = -ENOENT;
 
 		switch (pca955x_led->type) {
 		case PCA955X_TYPE_NONE:
 			break;
 		case PCA955X_TYPE_GPIO:
-			ngpios++;
+			pca955x->gpio_to_index[ngpios++] = i;
 			break;
 		case PCA955X_TYPE_LED:
 			/*
-- 
1.7.9.5


--------------CABB12C0C07A10B6E44BEE10--
