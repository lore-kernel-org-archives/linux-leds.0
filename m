Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1418B3DAAAB
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 17:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343341; cv=none; b=RH+l5NVWfChX6FmmaFvSp2ka/8Iq8DKC80uR5XwamkANCVz9i4iKwdWb0BK6dR4e5XkIgHqAbDswFGKqYqV5bFi5jcjPvO2VfSAJd2u209YGVGYetHJ3H4pStaswn+LzZoc+nrzW3q4jEjL43CP/yQxWUbSJD8Am0irdBcmn9eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343341; c=relaxed/simple;
	bh=MTL1muS8ml3bqtA/Uy6AF/cTMv/1QDwqEIVSJUwNznM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iE1YhG9B2zv2e6n45/8iK5B51TV2olgtHqqVvJPT6IrTFr4TolbWvNP1Z4/gejjncszTaObiBbeMFIaCC15KDdQ68Xa8IB85aNygXjhVGA49pbkMVpXPpWagdHajgUALn4l5G23pNfxnFzoaNsg4bbx1mPD315zwIQ0EXVK9u+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=G15LdWEu; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="G15LdWEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792343333; x=1792948133; i=w_armin@gmx.de;
	bh=sjC87rqB+F2XAObPxn4Ao9bngpdYIj9uspi0cuKDxg4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=G15LdWEuW7Kw6r5bZOkgwmz/O9jUcKkSHyu1ASAFPdReeXz/GJI+V8imvwtilXrc
	 Az5vIbK4AyASSjr2XK4BPBV7/jngZB/lg93bdwbj7D73NhDjTG78ZQUo348vOUg4V
	 dh0AmASXfMDUAsaUwXSntd5DyFR2DznasiSRR7/ltuV2j97ZPGahAeQfWylpKyGRn
	 VQ8GbhMsJ9KrCMxGdzNNJzijywqKDcWwmenbu70AgwyBmawg4PndTYXB2wsnZYNmT
	 0VvZtoZxxAgzlqbHNrmTc5XVPY1wHCVkPwUPlE/1fi/X5/8xXNe9AGSRKEnsEeJYn
	 Nk4CcVyQi6LSibNFuw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBlxW-1xSLCT2FfI-003TAU; Sun, 18
 Oct 2026 19:08:53 +0200
Message-ID: <81e458c4-b9c9-4881-b669-16c87171046f@gmx.de>
Date: Sun, 18 Oct 2026 19:08:53 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] leds: class: Take the LED access lock when reading
 brightness_hw_changed
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-7-W_Armin@gmx.de> <sashiko-outbox-176178@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <sashiko-outbox-176178@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6wsZ6rf1PTVVjdQd3DUj/lPrlKQZkcZN4V5NdeyKvGAdghV7I9v
 liWkFHfsmicHjlQfn31wtTHf8RFvLuZc1sh7FG7W2tjZ1GDQcgII2frJz7nb0K7I4IOAL5j
 19SCzI6MdJHdlGtMtbb4U788zNL2FElKzRJa6itlX1xtPJYd2iNus0lR/kcJNnLVwmgtnqA
 cA+0Hb3+4Bo/8HcnVWQ9Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aW8WTbnzDyw=;9mLz+WcvqTaQ/lGCjExYWOfF7dT
 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
 =

Am 18.10.26 um 16:03 schrieb sashiko-bot@kernel.org:

> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
> - [Medium] leds: one-sided locking in brightness_hw_changed_show()
> --
>
> commit ef875f7f46dcbf0a55900c763a37bd3cfcb02775
> Author: Armin Wolf <W_Armin@gmx.de>
>
> leds: class: Take the LED access lock when reading brightness_hw_changed
>
> This patch acquires the led_cdev->led_access mutex in
> brightness_hw_changed_show() to guard reading brightness_hw_changed
> against concurrent updates by led_classdev_notify_brightness_hw_changed(=
).
>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index e1f1b710536b0..77a0fce039528 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
> [ ... ]
>> @@ -102,11 +103,15 @@ static ssize_t brightness_hw_changed_show(struct =
device *dev, const struct devic
>>   					  char *buf)
>>   {
>>   	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>> +	unsigned int brightness_hw_changed;
>>  =20
>> -	if (led_cdev->brightness_hw_changed =3D=3D -1)
>> +	scoped_guard(mutex, &led_cdev->led_access)
>> +		brightness_hw_changed =3D led_cdev->brightness_hw_changed;
>> +
>> +	if (brightness_hw_changed =3D=3D -1)
>>   		return -ENODATA;
>>  =20
>> -	return sysfs_emit(buf, "%u\n", led_cdev->brightness_hw_changed);
>> +	return sysfs_emit(buf, "%u\n", brightness_hw_changed);
>>   }
>>  =20
>>   static const DEVICE_ATTR_RO(brightness_hw_changed);
> [Severity: Medium]
> Does taking led_cdev->led_access here actually synchronize against
> led_classdev_notify_brightness_hw_changed()?
>
> Looking at drivers/leds/led-class.c, the writer updates
> led_cdev->brightness_hw_changed without holding led_cdev->led_access:
>
> void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_=
cdev, unsigned int brightness)
> {
> 	led_cdev->brightness_hw_changed =3D brightness;
> 	sysfs_notify(&led_cdev->dev->kobj, NULL, "brightness_hw_changed");
> }
>
> In addition, most callers invoke led_classdev_notify_brightness_hw_chang=
ed()
> without holding led_cdev->led_access, such as t14s_kbd_bl_update() in
> drivers/platform/arm64/lenovo-thinkpad-t14s.c:
>
> static void t14s_kbd_bl_update(struct t14s_ec *ec)
> {
> 	enum led_brightness brightness =3D t14s_kbd_bl_get(&ec->kbd_backlight);
>
> 	led_classdev_notify_brightness_hw_changed(&ec->kbd_backlight, brightnes=
s);
> }
>
> Some callers also run in atomic context where a sleeping mutex cannot be
> taken, such as lg_g15_raw_event() -> lg_g13_event() in
> drivers/hid/hid-lg-g15.c:
>
> 	if (backlight_disabled ^ g15->backlight_disabled) {
> 		led_classdev_notify_brightness_hw_changed(
> 			&g15->leds[LG_G15_KBD_BRIGHTNESS].mcdev.led_cdev,
> 			backlight_disabled
> 			? 0 : g15->leds[LG_G15_KBD_BRIGHTNESS].brightness);
> 		g15->backlight_disabled =3D backlight_disabled;
> 	}
>
> Meanwhile, uniwill_ec_notify() in drivers/platform/x86/uniwill/uniwill-a=
cpi.c
> already holds led_cdev->led_access across the call:
>
> 	guard(mutex)(&led_cdev->led_access);
>
> 	/* Sync the LED brightness with the actual hardware state */
> 	ret =3D led_update_brightness(led_cdev);
> 	if (ret < 0)
> 		return ret;
>
> 	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
>
> Since the writer side does not consistently hold led_cdev->led_access (a=
nd
> cannot take it inside led_classdev_notify_brightness_hw_changed() withou=
t
> sleeping in atomic context or deadlocking uniwill_ec_notify()), should
> brightness_hw_changed_show() and led_classdev_notify_brightness_hw_chang=
ed()
> use READ_ONCE() and WRITE_ONCE() instead, similar to how trigger_hw_chan=
ged
> is handled in drivers/leds/led-triggers.c?

I am not sure if READ_ONCE() guarantees atomic behavior here. What do the =
LED
subsystem maintainers say?

Thanks,
Armin Wolf

