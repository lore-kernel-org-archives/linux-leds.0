Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28934052BF
	for <linux-leds@vger.kernel.org>; Mon, 31 Aug 2026 17:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196437; cv=none; b=Kyt88OFe/An8FOYfY7QMDRH9px+sBPlnOWKhn3GDLlwgUdCqMPPKOSNR9XIhYYCJuadqiWa+4+GZhxEX9lRnwGn4vBejfwHCSj2pqCcOwOT9PKmds9eyYjLHoE/o28j9WCMZqzlIE6GnNdVfHD8Wfx2S0vG5IAjkfKVyYQ3N8R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196437; c=relaxed/simple;
	bh=kxQM+Zhz7sQVVKC2PFuPaXSHEN7QoQleELyyynIPPwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V8gJZmyzVmUHiWQxG8HSZzNdAvhI7ijcYzWmfOp62/hZRwjs79Z98rE07RZ2gogKGICSDM4uhl7IFj1r/OrMZRsgSdL3uGu7+9afW2IEbAS0ysyjzvgk7svNA53BoINObV2HQ1Bmb3Y2pZEdqE89NZpXa0WLEjqx3vQHyWDfRwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIDU/mmT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIDU/mmT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 352181F000E9;
	Mon, 31 Aug 2026 17:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788196435;
	bh=6eDO34Sfm5wIHx/GS2G7ktiYBAZIvsE42PsyU/EKOhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AIDU/mmTrM/6EmvALqCh39a+24p7Wxqy7pGstvi7hH/4uC9UvbYbUhyV/uANjAzSX
	 6igtAzGUY3xTGCilj+Q5vqRmXcED8ejHiUAPGmDy4byKjxlKc2FVzSnEcQ0YmDjeG9
	 qPTxLYpVx2KBiNMLiaIeKfWnfuoam8jBEoxUaK+9qXOYud+a8+3udhmb+wep4rry/R
	 Q8l9gSib6BSXV8LilI02BYL1QCxtHq2mDriuMYeEanLNmQh75L/DM3Nhy3JJLtVbYn
	 KKDeHTdeqCvQagkojMf0005/eVrdUt0DYN8Sf1D8XpEVCfqnFglf/leqpYpAQHIpJZ
	 288+YsoJqJBSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] leds: uleds: Return -EFAULT on
 copy_to_user() failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260831133314.4125787-563-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-563-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 17:13:54 +0000
Message-Id: <20260831171355.352181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing null-termination check on user-supplied LED name allows ou=
t-of-bounds read and information leak.
--

commit a8b47a018dff3b5b2d397104d41c5a68d837fbea
Author: Yousef Alhouseen <alhouseenyousef@gmail.com>

leds: uleds: Return -EFAULT on copy_to_user() failure

uleds_read() copies the current brightness value to userspace but ignores
copy_to_user() failures. It then clears the pending update and reports a
successful full read even when no data was copied. Return -EFAULT when
the copy fails and leave the update pending so a later read can retry.

Link: https://patch.msgid.link/20260521181205.15130-1-alhouseenyousef@gmail=
.com

> diff --git a/drivers/leds/uleds.c b/drivers/leds/uleds.c
> index 374a841f18c37..ce2ae79d5de04 100644
> --- a/drivers/leds/uleds.c
> +++ b/drivers/leds/uleds.c
> @@ -147,10 +147,13 @@ static ssize_t uleds_read(struct file *file, char _=
_user *buffer, size_t count,
>  		} else if (!udev->new_data && (file->f_flags & O_NONBLOCK)) {
>  			retval =3D -EAGAIN;
>  		} else if (udev->new_data) {
> -			retval =3D copy_to_user(buffer, &udev->brightness,
> -					      sizeof(udev->brightness));
> -			udev->new_data =3D false;
> -			retval =3D sizeof(udev->brightness);
> +			if (copy_to_user(buffer, &udev->brightness,
> +					 sizeof(udev->brightness))) {
> +				retval =3D -EFAULT;
> +			} else {
> +				udev->new_data =3D false;
> +				retval =3D sizeof(udev->brightness);
> +			}
>  		}
> =20
>  		mutex_unlock(&udev->mutex);

While reviewing this patch, I noticed a pre-existing issue in uleds_write()
within the same file:

> static ssize_t uleds_write(struct file *file, const char __user *buffer,
> 			   size_t count, loff_t *ppos)
> {
[ ... ]
> 	if (copy_from_user(&udev->user_dev, buffer,
> 			   sizeof(struct uleds_user_dev))) {
> 		ret =3D -EFAULT;
> 		goto out;
> 	}
>=20
> 	name =3D udev->user_dev.name;
> 	if (!name[0] || !strcmp(name, ".") || !strcmp(name, "..") ||
> 	    strchr(name, '/')) {

[Severity: High]
This is a pre-existing issue, but does this code lack a null-termination
check on the user-supplied LED name?

If a user writes a payload to /dev/uleds without a null byte in the 64-byte
name array, won't unbounded string functions like strchr() read past the
array boundary?

> 		ret =3D -EINVAL;
> 		goto out;
> 	}
>=20
> 	if (udev->user_dev.max_brightness <=3D 0) {
> 		ret =3D -EINVAL;
> 		goto out;
> 	}
> 	udev->led_cdev.max_brightness =3D udev->user_dev.max_brightness;
>=20
> 	ret =3D devm_led_classdev_register(uleds_misc.this_device,
> 					 &udev->led_cdev);

[Severity: High]
This is a pre-existing issue, but is it possible for
devm_led_classdev_register() to consume the non-null-terminated string to
create the sysfs directory?

If the array is not null-terminated, could this cause an out-of-bounds read
that exposes adjacent kernel heap memory to userspace via the resulting sys=
fs
directory name, or potentially cause a kernel oops if the read crosses into
an unmapped page?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-563-sashal@kernel.org?part=3D1
