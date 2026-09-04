Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A6738AC65
	for <linux-leds@vger.kernel.org>; Fri,  4 Sep 2026 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788506511; cv=none; b=DAS91BzV7xOlw5yY4MSI/RKaDtb23NP9pbFonOmFyyYLgrksZUwpDQTn3uXGCMqSZegYwcqd/iJ8Wtgp8+ljIwE+Y6TyWnTsdd33v2tTL8n/KrqgKPoRrujXZ6hyt3bTr24D7odgQqBfK70L6UAwjeUc/Xe+btpz7XLBZi+mlc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788506511; c=relaxed/simple;
	bh=/2XvezUHb+CCMV++tBxO9mxSo9DiPcJouqQ/6VgJlgQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qB46yViRuGMvD8fIMxQV62739eBUJ0Ydlo7A4ubqIB1uxESYoZc3KTw0kPJIsTf/VIby+/YAvXO8KJUTBucZPi7vAFWci765szDmHhXaIVsrAmQEMB5QacCauVLXm96/0C/ws2laFRrR5cAsk4uGYZQcFVzoFnsCOZ6bMiqbdEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqLBN0Ja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqLBN0Ja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA971F00A3D;
	Fri,  4 Sep 2026 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788506509;
	bh=Lkx+Hft5B5ei4eQodp/4RfOXs7uXoAQ2XDnwq4o0qlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GqLBN0JauW8PI5ovyeGTkncLZgMrEfI121OLQnWGBOybq3kINQ2nKEZ6VpxHBqvc4
	 ZRxCWb2y0wXQcM02pHVW32HSTCemCo8CTVUiV8tvj7BlXs2vbN5sdk61dWBRcJkJ06
	 U5QRQMl0rTJjUPtRlU3BTvHbSdwITk10w9/LhQn8yCGmgDrwWshiXz74aZ/m7xQeQz
	 BxnNExAfk9nxy2DmduCMGYAxnU4eYve2/AiFEfM8gqurgL8lAFMpMApfU3iAZnIJjK
	 TBfDllJ5oW54rN6omJfW+6BnFzIT5ANBAi1o9ia96mhJxXzpjbz4ZPmjK2NY7Z9AfV
	 IrCr0gkNI4Ujg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] leds: flash: Prevent using uninitialized
 variable in flash_fault_show()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Antipov" <dmantipov@yandex.ru>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260904070806.19125-1-dmantipov@yandex.ru>
References: <20260904070806.19125-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 07:21:49 +0000
Message-Id: <20260904072149.5FA971F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-after-free due to missing indicator LED unregistration on prob=
e error path.
- [Medium] Accumulating fault state in V4L2 flash controls due to uncleared=
 variable.
--

commit 9123f63288afc4cb1ae08569252a324f5721a8b4
Author: Dmitry Antipov <dmantipov@yandex.ru>

leds: flash: Prevent using uninitialized variable in flash_fault_show()

This commit initializes the fault variable in flash_fault_show() to prevent
undefined behavior. This occurs when driver callbacks only perform bitwise
ORs without clearing the pointer first.

Closes: https://sashiko.dev/#/patchset/20260904054437.461706-1-dmantipov@ya=
ndex.ru?part=3D1

> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flas=
h.c
> index 6fe9d700dfef6..e10a9c796c04c 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -188,7 +188,7 @@ static ssize_t flash_fault_show(struct device *dev,
>  {
>  	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>  	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
> -	u32 fault, mask =3D 0x1;
> +	u32 fault =3D 0, mask =3D 0x1;

[Severity: Medium]
This is a pre-existing issue, but while this commit fixes the
uninitialized variable in flash_fault_show(), does the exact same issue
exist in the V4L2 flash controls?

In drivers/media/v4l2-core/v4l2-flash-led-class.c:v4l2_flash_g_volatile_ctr=
l():

    case V4L2_CID_FLASH_FAULT:
        /* LED faults map directly to V4L2 flash faults */
        return led_get_flash_fault(fled_cdev, &c->val);

If a user-space process issues a volatile read for V4L2_CID_FLASH_FAULT,
c->val retains its previously cached value. Because underlying callbacks
like as3645a_get_fault() in drivers/leds/flash/leds-as3645a.c only
perform bitwise OR operations without clearing the pointer:

    if (rval & AS_FAULT_INFO_INDUCTOR_PEAK_LIMIT)
        *fault |=3D LED_FAULT_OVER_CURRENT;

cleared hardware faults will permanently remain stuck in the reported
V4L2 state until the module is reloaded. Could c->val be cleared before
calling led_get_flash_fault() here as well?

[Severity: High]
This is a pre-existing issue, but looking at the as3645a driver
mentioned above, is there a memory corruption concern on its probe error
path due to missing unregistration of the indicator LED?

In drivers/leds/flash/leds-as3645a.c:as3645a_probe():

    out_led_classdev_flash_unregister:
        led_classdev_flash_unregister(&flash->fled);

    out_mutex_destroy:

If as3645a_v4l2_setup() fails during device probe, the error path
unregisters the flash LED but completely misses unregistering the
indicator LED, iled_cdev, which was manually registered in
as3645a_led_class_setup().

The probe function returns an error, causing the devres framework to
automatically free the devm-allocated flash driver data structure. The
indicator LED remains fully registered and exposed to user-space sysfs.
Accessing its sysfs attributes will dereference the freed flash struct,
leading to a use-after-free. Would it make sense to call
led_classdev_unregister() for the indicator LED in this error path?

>  	char *pbuf =3D buf;
>  	int i, ret, buf_len;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904070806.1912=
5-1-dmantipov@yandex.ru?part=3D1
