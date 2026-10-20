Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530110;
	b=gT/tjyma1G24pJt5gF3+u+8GJTHYEOet1oME1eXGqPp67WgMmFLtdnaIQkSa1HlK8j61
	 a1p0AKT9bE0kjRdYAI1NiuI2WLvV70cKKOE+fg8C+3aHRkob1msFQKV2hRDDm7jV9uoBn
	 cMMNIRoo/T0d2G5VaPGaefTr8jPryplfEJXEfPJPCgC+TyKnH4phPnFIjrfv0Q0EPhYLY
	 C7g4Sq93sbOaIHLKhPVKVtpv3O6VaAWXpGZhnly2WJmu1ly90MxLyNntDk8vmlfIBcqbl
	 FY2VA8k/fpn77a5a6y+iGOB2iQ6mymdJBNXUYSbtTfWWj2nfZioyLuLbucIZpPLJf+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530110;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=brKNXuDD/mpiRHORLBW7NSVaDvD0hq9jnS4V3xq/32A=;
	b=ASEPRgGWJ3vWJxdQHp/oPtrF/OAand2r0LBxLOXumc+C5MucrnYYjAjQpag/312nIjWA
	 MIjVthY3JIhpD/lhD390IJw3VslfwzOmjcRAYu0t2agnpJFMncr5ZzeAyYt4p1X8md2Bu
	 H8NO0WApyJWushxR2cyYiCS/5A9Jm4p47Mq5LmGsvlbO/Q+ELlTlYnDroZIi9UiaDYtjF
	 hoVf5RUVhTAKl9qHX5CWtbaJF7aqLv64f+gIjYbya35VUpw3jFDfGKf7XrH88d7W/VEm3
	 BSEgvF6shswU4Bn1WGBHGUsQXjpI9wSHi+ntE3diMwPBHflvyOsQNvKaeHNM7/l0kpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=im+1fV3V;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8F3606A31A
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 21:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D8F3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=im+1fV3V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792530107; x=1793134907; i=w_armin@gmx.de;
	bh=brKNXuDD/mpiRHORLBW7NSVaDvD0hq9jnS4V3xq/32A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=im+1fV3VQvRdS0iK8cqKB2/Wc6Pr4AZVPpi2oSmuw4uVbkNY57skExtC0vakzbFX
	 8A5OMRNo3I+FKUFTXt6TaD9ds254uqNNU75SxH6FgTNyDGe0uKOJeiGWr24HT81YS
	 KukAHa5JBvoyY17d8xmyWL7rVdfGWXQOgFbRW1Nds/GdzXtbHi64t/kqDo0pGBiH3
	 WmyzgGBJGzUucmvZWvi+orhl//Ajlde5b7L24aPIr/Qd/FozpBsfdsu8qb1hzhp+1
	 FsK4OUQCFGRb1gE/dDWiOEKFy13NNXKIgLF0sQsBiRby3ApCP9fyuv9MeGxhK6BuX
	 oKb710z4pT6I/sufdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Bk-1wmhI51t7m-00fFd5; Tue, 20
 Oct 2026 23:01:47 +0200
Message-ID: <f58e0b3a-d82a-4e3e-91f0-2c9114019f26@gmx.de>
Date: Tue, 20 Oct 2026 23:01:46 +0200
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] leds: class: Take the LED access lock when reading
 brightness_hw_changed
To: Rong Zhang <i@rong.moe>, sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-7-W_Armin@gmx.de> <sashiko-outbox-176178@kernel.org>
 <81e458c4-b9c9-4881-b669-16c87171046f@gmx.de>
 <24d07a72cfdfb39963fc3771fc105deb3b2eaddc.camel@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <24d07a72cfdfb39963fc3771fc105deb3b2eaddc.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BDxPwBKACZED5zR3Ckd43m13ycT3+K1/ShEO7Bx7wztTkvcWLNN
 eHREXjV/fMtZC/JtRFvoOw19Tljt8GO6PcpczYQdPNF2UPz+khUiG21Q9KdQ8wXFkNTrx4L
 J0D38GqIgY3WZvzSqISTEG5hoPzo7WZeD0FNWMy5FKiNizPRAcccSyYo5le87vrJS6VnCW+
 sgpp53ojWpVTGCtTEO+LQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DmXsxEV1yg8=;OX++TSYCBSS5+YYpqibSjNpkiPu
 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

Am 19.10.26 um 13:53 schrieb Rong Zhang:

> Hi Armin,
>
> On Sun, 2026-10-18 at 19:08 +0200, Armin Wolf wrote:
>> Am 18.10.26 um 16:03 schrieb sashiko-bot@kernel.org:
>>
>>> Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
>>> - [Medium] leds: one-sided locking in brightness_hw_changed_show()
>>> --
>>>
>>> commit ef875f7f46dcbf0a55900c763a37bd3cfcb02775
>>> Author: Armin Wolf <W_Armin@gmx.de>
>>>
>>> leds: class: Take the LED access lock when reading brightness_hw_chang=
ed
>>>
>>> This patch acquires the led_cdev->led_access mutex in
>>> brightness_hw_changed_show() to guard reading brightness_hw_changed
>>> against concurrent updates by led_classdev_notify_brightness_hw_change=
d().
>>>
>>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>>> index e1f1b710536b0..77a0fce039528 100644
>>>> --- a/drivers/leds/led-class.c
>>>> +++ b/drivers/leds/led-class.c
>>> [ ... ]
>>>> @@ -102,11 +103,15 @@ static ssize_t brightness_hw_changed_show(struc=
t device *dev, const struct devic
>>>>    					  char *buf)
>>>>    {
>>>>    	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>>>> +	unsigned int brightness_hw_changed;
>>>>   =20
>>>> -	if (led_cdev->brightness_hw_changed =3D=3D -1)
>>>> +	scoped_guard(mutex, &led_cdev->led_access)
>>>> +		brightness_hw_changed =3D led_cdev->brightness_hw_changed;
>>>> +
>>>> +	if (brightness_hw_changed =3D=3D -1)
>>>>    		return -ENODATA;
>>>>   =20
>>>> -	return sysfs_emit(buf, "%u\n", led_cdev->brightness_hw_changed);
>>>> +	return sysfs_emit(buf, "%u\n", brightness_hw_changed);
>>>>    }
>>>>   =20
>>>>    static const DEVICE_ATTR_RO(brightness_hw_changed);
>>> [Severity: Medium]
>>> Does taking led_cdev->led_access here actually synchronize against
>>> led_classdev_notify_brightness_hw_changed()?
>>>
>>> Looking at drivers/leds/led-class.c, the writer updates
>>> led_cdev->brightness_hw_changed without holding led_cdev->led_access:
>>>
>>> void led_classdev_notify_brightness_hw_changed(struct led_classdev *le=
d_cdev, unsigned int brightness)
>>> {
>>> 	led_cdev->brightness_hw_changed =3D brightness;
>>> 	sysfs_notify(&led_cdev->dev->kobj, NULL, "brightness_hw_changed");
>>> }
>>>
>>> In addition, most callers invoke led_classdev_notify_brightness_hw_cha=
nged()
>>> without holding led_cdev->led_access, such as t14s_kbd_bl_update() in
>>> drivers/platform/arm64/lenovo-thinkpad-t14s.c:
>>>
>>> static void t14s_kbd_bl_update(struct t14s_ec *ec)
>>> {
>>> 	enum led_brightness brightness =3D t14s_kbd_bl_get(&ec->kbd_backlight=
);
>>>
>>> 	led_classdev_notify_brightness_hw_changed(&ec->kbd_backlight, brightn=
ess);
>>> }
>>>
>>> Some callers also run in atomic context where a sleeping mutex cannot =
be
>>> taken, such as lg_g15_raw_event() -> lg_g13_event() in
>>> drivers/hid/hid-lg-g15.c:
>>>
>>> 	if (backlight_disabled ^ g15->backlight_disabled) {
>>> 		led_classdev_notify_brightness_hw_changed(
>>> 			&g15->leds[LG_G15_KBD_BRIGHTNESS].mcdev.led_cdev,
>>> 			backlight_disabled
>>> 			? 0 : g15->leds[LG_G15_KBD_BRIGHTNESS].brightness);
>>> 		g15->backlight_disabled =3D backlight_disabled;
>>> 	}
>>>
>>> Meanwhile, uniwill_ec_notify() in drivers/platform/x86/uniwill/uniwill=
-acpi.c
>>> already holds led_cdev->led_access across the call:
>>>
>>> 	guard(mutex)(&led_cdev->led_access);
>>>
>>> 	/* Sync the LED brightness with the actual hardware state */
>>> 	ret =3D led_update_brightness(led_cdev);
>>> 	if (ret < 0)
>>> 		return ret;
>>>
>>> 	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
>>>
>>> Since the writer side does not consistently hold led_cdev->led_access =
(and
>>> cannot take it inside led_classdev_notify_brightness_hw_changed() with=
out
>>> sleeping in atomic context or deadlocking uniwill_ec_notify()), should
>>> brightness_hw_changed_show() and led_classdev_notify_brightness_hw_cha=
nged()
>>> use READ_ONCE() and WRITE_ONCE() instead, similar to how trigger_hw_ch=
anged
>>> is handled in drivers/leds/led-triggers.c?
>> I am not sure if READ_ONCE() guarantees atomic behavior here. What do t=
he LED
>> subsystem maintainers say?
> While I am not a maintainer, paired READ_ONCE() and WRITE_ONCE() is
> usually sufficient, as the attribute is only a hint for userspace OSD.
>
> The memory access itself is inherently atomic, i.e., neither a RMW
> operation nor a split R/W. Since the led_cdev->brightness_hw_changed is
> never used to synchronize other things, no memory barrier is needed here=
.
> Using rwonce prevents the compiler from reordering memory access, which
> fulfills our requirements.
>
> Thanks,
> Rong

Nice, this also means that all the drivers calling led_classdev_notify_bri=
ghtness_hw_changed() do not
need to be audited for taking the led_access lock.

I will use READ_ONCE()/WRITE_ONCE() in the v2 revision.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
