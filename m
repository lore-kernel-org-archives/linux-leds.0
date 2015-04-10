From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v5 3/3] leds: Add ktd2692 flash LED driver
Date: Fri, 10 Apr 2015 15:42:44 +0900
Message-ID: <552770E4.3070508@samsung.com>
References: <1427860708-32559-1-git-send-email-ingi2.kim@samsung.com>
 <1427860708-32559-4-git-send-email-ingi2.kim@samsung.com>
 <1427861250.18175.51.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10758 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752460AbbDJGnD (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 10 Apr 2015 02:43:03 -0400
In-reply-to: <1427861250.18175.51.camel@perches.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Joe,

Thanks for the review.

On 2015=EB=85=84 04=EC=9B=94 01=EC=9D=BC 13:07, Joe Perches wrote:
> On Wed, 2015-04-01 at 12:58 +0900, Ingi Kim wrote:
>> This patch adds a driver to support the ktd2692 flash LEDs.
>> ktd2692 can control flash current by ExpressWire interface.
>=20
> trivia:
>=20
>> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692=
=2Ec
> []
>> +static void ktd2692_brightness_set(struct ktd2692_context *led,
>> +					enum led_brightness brightness)
>> +{
>> +	mutex_lock(&led->lock);
>> +
>> +	if (brightness =3D=3D LED_OFF) {
>> +		led->mode =3D KTD2692_MODE_DISABLE;
>> +		gpio_set_value(led->aux_gpio, KTD2692_LOW);
>> +		goto out;
>> +	}
>> +
>> +	ktd2692_expresswire_write(led, KTD2692_REG_MOVIE_CURRENT_BASE |
>> +				KTD2692_BRIGHTNESS_RANGE_255_TO_8(brightness));
>> +	led->mode =3D KTD2692_MODE_MOVIE;
>> +
>> +out:
>> +	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);
>> +	mutex_unlock(&led->lock);
>> +}
>=20
> Perhaps this function would be better with if/else
> without the out: label
>=20
>> +static int ktd2692_led_flash_strobe_set(struct led_classdev_flash *=
fled_cdev,
>> +						bool state)
>> +{
>> +	struct ktd2692_context *led =3D fled_cdev_to_led(fled_cdev);
>> +	struct led_flash_setting *timeout =3D &fled_cdev->timeout;
>> +	u32 flash_tm_reg;
>> +
>> +	mutex_lock(&led->lock);
>> +
>> +	if (state =3D=3D 0) {
>> +		led->mode =3D KTD2692_MODE_DISABLE;
>> +		gpio_set_value(led->aux_gpio, KTD2692_LOW);
>> +		goto done;
>> +	}
>> +
>> +	flash_tm_reg =3D GET_TIMEOUT_OFFSET(timeout->val, timeout->step);
>> +	ktd2692_expresswire_write(led, flash_tm_reg
>> +			| KTD2692_REG_FLASH_TIMEOUT_BASE);
>> +
>> +	led->mode =3D KTD2692_MODE_FLASH;
>> +	gpio_set_value(led->aux_gpio, KTD2692_HIGH);
>> +
>> +done:
>> +	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);
>=20
> Same if/else with the done: label?
>=20
>=20

Sorry about late comments,
It'll be pushed next patch

Thank you
