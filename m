Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1924618D636
	for <linux-leds@vger.kernel.org>; Fri,  4 Sep 2026 05:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788501193; cv=none; b=vE9taifqgiMwDxSMcalzbqwBBR1Aj3EymIty3JB5q5yrQKAs8/SLPepJ9TE8KkTMxcXFcFrEaRu8k/URseyRVd3Tpqd/dI7EoYtoHkXXTW3FHq3QWJ7zGzEVyDsb2SDDw0FpMRr2zakZfN1/1/YPY9p9xoHWZB/P6rWCrxAEuzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788501193; c=relaxed/simple;
	bh=W7Wz6T5SKJguMjPBwNI2IMOa0QtXeMWx7Fz6BenFBBk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J0zp/CFsSsEpp8qm3qvFiozw0D4diWXSMvE0ZLgg9ZmOhPVuBx2MQQFdycTYW4KQWh0/vuiaSbL6TMbK0jaYlfjiiRp+3eE2Z1oaEvkxNw1hroCnV0tSz+maV55MLFzfD0CxurV1MxDiEmdhTn1IFE8ZpDORwjnCBx9TuY1nsKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLzJb/vP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLzJb/vP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5471F00A3D;
	Fri,  4 Sep 2026 05:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788501191;
	bh=SyzC/jfERoLCMbK4MR5Y1HyfUd7O7zuQ8RiM7O5gVSY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eLzJb/vPqShEwtTgEA6JLfhmFM3YPnyxWPy2BA14xPoL8KXCJvxv3w1IBopYyp6nQ
	 DHu17+x+IRAa5mBIXgn7e2OznIzLDJ6rfglzC24pLZOHU2GSEdD0XQvHoT1jl/YxFC
	 xg5cElQfCOMOMjGQX+6Cm02wyEz6Gsz1ysiEIqHx3H/4R263qh/hjbMKhj0zu1RF8v
	 Ynu7X6PTVvHHL2qMmXsBRV+SmHHK+x8mLK341CKdWJ0lWxjkqqUxuSvZT073DiNHeu
	 9uvKPKEihlmvNTQxhz09UyltIMaJ/pmqhNEmKMVqEp313/RHGW3y5UbST3lKvWtMH1
	 5tv6CX2wVZgaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: flash: simplify flash_fault_show()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Antipov" <dmantipov@yandex.ru>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260904054437.461706-1-dmantipov@yandex.ru>
References: <20260904054437.461706-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 05:53:10 +0000
Message-Id: <20260904055311.5D5471F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description is not capitalized, violating the LE=
D subsystem guidelines.

Pre-existing issues:
- [High] Uninitialized stack variable `fault` leaks kernel memory state to =
userspace.
--

commit 57bfe07a03cad5bedb847332afd85707164afd8d
Author: Dmitry Antipov <dmantipov@yandex.ru>

leds: flash: simplify flash_fault_show()

Do not emit extra trailing space and prefer direct pointer
ops over strcat() and strlen() calls in flash_fault_show().

> leds: flash: simplify flash_fault_show()

[Severity: Low]
Does this commit subject violate the LED subsystem naming convention?

The guidelines state that the description after the subsystem prefix should
always be capitalized. Could this be changed to something like
"leds: flash: Simplify flash_fault_show()"?

> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flas=
h.c
> index 6fe9d700dfef6..cc9600a311296 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -190,24 +190,22 @@ static ssize_t flash_fault_show(struct device *dev,
>  	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
>  	u32 fault, mask =3D 0x1;

[Severity: High]
This isn't a bug introduced by this patch, but does this leak uninitialized
kernel stack memory to userspace?

When reading the flash_fault sysfs attribute, flash_fault_show() allocates
the fault variable on the stack without initializing it, and then passes it
by reference:

	ret =3D led_get_flash_fault(fled_cdev, &fault);

If the driver's fault_get callback (such as as3645a_get_fault() in
leds-as3645a.c) uses bitwise OR without first initializing the variable, it
preserves the stack garbage:

	if (rval & AS_FAULT_INFO_INDUCTOR_PEAK_LIMIT)
		*fault |=3D LED_FAULT_OVER_CURRENT;

The loop in flash_fault_show() then iterates over the 9 lowest bits of this
value and prints their corresponding fault names, which could disclose
kernel memory to unprivileged userspace processes.

Could the fault variable be explicitly initialized to 0 during declaration?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904054437.4617=
06-1-dmantipov@yandex.ru?part=3D1
