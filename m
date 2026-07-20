Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7306A3EC682
	for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545248; cv=none; b=Ue0CvW8jUCCWJD66irm+m9IiQkBMpT0NDjroUJ5oK+qtLAPSsSa/tSR5612zaEdJfrBqC7PAUO12HAPkbxt+psEpaZpRizE66mgZIANEDTIFMtGYmS5KiOEbxSg9Eih+inyYtCvri7Ewb0689QThtKckTZgxTE1nMXmjFhOJV1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545248; c=relaxed/simple;
	bh=aWgmh3n9eboTVPiVR5EguT15QxIUXCKg67uJF97LvnM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tKte38h+wa4SKgyEsfUZjTFBzHms7VShr6To0DS0pstcY+XiTs5kRHtiWkbg+NmtLJtRK+1lXk/HVLGww24e8ySFB+3kbu5thPHj5awIZcJvWvcqQvy6omQwmOfXf5Z6loqxA4QMvjZAQAaxDGfMVKqnk5mpJNfzJ/nG655KY9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0/s+UCd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0/s+UCd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186121F00A3D;
	Mon, 20 Jul 2026 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784545247;
	bh=PWyidW2LpOc3cmmHz+qZLvnaEgcb6QMHhjhW6EntJVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J0/s+UCdkDObOydGwAlTQxAPOHtYObuXvyp6iySvy/XpjTyFgvMwZa199lnJF5eX/
	 STJ3SpYxzITYcXNgjsz9CtC3+q/d2vpbPLlxmwp10a5JdDpYapj0Fb6ArKjSMn37Nm
	 kgToYzUBEi1S2LZDdCR7YwuopgECKXSDTR9CDBEzOzQ7VqhyZS2DjNYRCWnOHY0r/e
	 V7Cm0wQstsZzw/cngWSeqGIFnL3ei3Ea28KirSyd0SiRWi/Upz13LeOlrUMy3y65Ka
	 +D+wfs0oDjzEuFkXZzeYgoz7xtDE+EI8zbqWUpm8J8G5iWSzYLc8qdssTlLqo2XwzT
	 buDvEMsjRnbtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: lp5860: fix init error-path locking
Reply-To: sashiko-reviews@lists.linux.dev
To: kr494167@gmail.com
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260720104838.98101-1-kr494167@gmail.com>
References: <20260720104838.98101-1-kr494167@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:00:46 +0000
Message-Id: <20260720110047.186121F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit message violates the LED subsystem capitalization guidel=
ines.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the driver expli=
citly destroys its mutex in `.remove()` before hardware teardown completes =
and before managed LED resources are unregistered, leading to a determinist=
ic use-after-destroy vulnerability.
--

--- Patch [1]: [PATCH v2] leds: lp5860: fix init error-path locking ---
commit 685affba31d70c4dc3416357a81ff413cf7d2165
Author: surendra <kr494167@gmail.com>

leds: lp5860: fix init error-path locking

This commit fixes a double-unlock issue in the lp5860 initialization
error path. By unlocking immediately after the register update, the
common error handler remains lockless.

> leds: lp5860: fix init error-path locking

[Severity: Low]
This isn't a bug, but the commit message violates the LED subsystem=20
capitalization guidelines which mandate capitalizing the description after=
=20
the subsystem prefix. Should this be "leds: lp5860: Fix init error-path=20
locking"?

> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-=
lp5860-core.c
> index fd0e2f6e6e0f4..e21d5f2302be0 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c

[ ... ]

> @@ -215,7 +215,6 @@ int lp5860_device_init(struct device *dev)
>  	return 0;
> =20
>  err_disable:
> -	mutex_unlock(&lp->lock);
>  	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);

[Severity: High]
This isn't a bug introduced by this patch, but looking at the teardown
path, is there a use-after-destroy vulnerability with this mutex?

When the device is removed, lp5860_remove() in=20
drivers/leds/rgb/leds-lp5860-spi.c explicitly calls:

mutex_destroy(&lp5860->lock);

It then calls lp5860_device_remove() which disables the chip by calling=20
lp5860_chip_enable(). That function attempts to lock the destroyed mutex:

static int lp5860_chip_enable(struct lp5860 *lp, bool enable)
{
	guard(mutex)(&lp->lock);
	return regmap_write(lp->regmap, LP5860_REG_CHIP_EN, enable);
}

Additionally, the managed LED class devices are unregistered later by devre=
s,
which invokes lp5860_set_mc_brightness(). This also attempts to lock the
already destroyed mutex via guard(mutex)(&led->chip->lock).=20

Can this sequence cause a lockdep splat or kernel panic during unbind?

>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720104838.9810=
1-1-kr494167@gmail.com?part=3D1
