Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBBB3D6CC7
	for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544113; cv=none; b=lOpFzIOPIiD47N6/o2+nm1DyeYyHrsGzF90RPbOacvZI9UDbtRcjIpEUKWKmjoQ+qMwbtSRlJMO0RNQPnzX+etAsIbYAejQsu8DE8MQF/0qrYA9KTOuvcTf648vxiGCKt+AQGQeqT9hH3nOEpU2/2wfyZM5exTdDvAPr1CZcfsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544113; c=relaxed/simple;
	bh=w5Doqho9Djg8YgSdgZaDJNvQV15iLg0jLJZJE/TR10I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XhDvRgZDmlCYmQmln0rErP06AuRyLpMe4LWGZTftTexCVp2FVbduK5EcyUyttiTa8VQv2geqbVBdtOj26uYAdcwRGNpNbPynui8K+BLEo7uTTSbxzTHY+Gv9KgcASKC/n43SmfTriUDlqJKP7eH2vZ87BUPbMT6zW9QWU1/Z0x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAZqg4gv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAZqg4gv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C7D1F000E9;
	Mon, 20 Jul 2026 10:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784544110;
	bh=VQAUXTkPqWukync3md3x5//qblJE4TMvv+ZhySC+Khc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cAZqg4gvgsNJe96UtJqf1rbbDHQuu9ddkT3VxnHWUeYdf+VH8hv/AeIuAi8hVfvb9
	 ikYnOOxN1HuBHR8b1fCHhOMv6DyR+aDZf78+NHcx+lTEztdkfZiI/0g10Tvslwoijr
	 2ytPIRPft3ZQZPweHhqSI2ycjLLfun19uYwB1Aydz8MRVZRTHzULKNQiqAyxGAuRCs
	 eRhAwRNd1oJd0SNUetprUAI/Czla5j2SKPdLOPtmzFRwixp/bYBUMq+L9HcHwEqVk4
	 GrXDiLyg7YmPu0GTBqeqyN+AS9oJYGE0yMSLYeJqFE00yYn2lPc1/1U/gLnv+7SBHH
	 cgI8n22eIDSxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: lp5860: reject out-of-range channel IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: kr494167@gmail.com
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260720103017.88090-1-kr494167@gmail.com>
References: <20260720103017.88090-1-kr494167@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:41:49 +0000
Message-Id: <20260720104149.C2C7D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly claims that the malformed sub-LED=
 uses the invalid ID for register addressing.
- [Low] The commit message description is not capitalized, violating the LE=
D subsystem conventions.
- [Low] The patch uses `dev_err()` instead of `dev_err_probe()` to report a=
 configuration failure.
--

--- Patch [1]: [PATCH] leds: lp5860: reject out-of-range channel IDs ---
commit 4536ff26f6ab558401ac176c54f90cdb3be700b7
Author: surendra <kr494167@gmail.com>

leds: lp5860: reject out-of-range channel IDs

This commit fixes an issue where lp5860_iterate_subleds() returns success
when encountering a channel ID that is out of bounds, instead of correctly
returning an error.

> leds: lp5860: reject out-of-range channel IDs

[Severity: Low]
This isn't a bug, but the LED subsystem guidelines require capitalizing the
description after the subsystem prefix. Should this be "Reject out-of-range
channel IDs"?

> The caller therefore treats the malformed
> sub-LED description as valid and uses the invalid ID for register
> addressing.

[Severity: Medium]
Is this description accurate?

Looking at the original code, if channel > LP5860_MAX_LED, it returns `ret`
(which is 0) and aborts the loop before assigning the parsed channel to
led->mc_cdev.subled_info[subled].channel.

Since the subled_info array is zero-filled by allocation, the unassigned
channel would remain 0 rather than containing the invalid out-of-bounds ID.
Could the commit message be updated to better reflect the exact behavior?

> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-=
lp5860-core.c
> index e21d5f2302be0..75498311b0803 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -114,12 +114,18 @@ static int lp5860_iterate_subleds(struct lp5860_led=
 *led, struct led_init_data *
>  		}
> =20
>  		ret =3D fwnode_property_read_u32(led_node, "reg", &channel);
> -		if (ret < 0 || channel > LP5860_MAX_LED) {
> +		if (ret < 0) {
>  			dev_err_probe(led->chip->dev, ret,
>  				      "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
>  			fwnode_handle_put(led_node);
>  			return ret;
>  		}
> +		if (channel > LP5860_MAX_LED) {
> +			dev_err(led->chip->dev, "%pfwP: 'reg' property is out of range.\n",
> +				led_node);

[Severity: Low]
Should this use dev_err_probe() instead of dev_err() to maintain consistency
with the surrounding error paths and conform to the LED subsystem guidelines
for probe failures?

> +			fwnode_handle_put(led_node);
> +			return -EINVAL;
> +		}
> =20
>  		led->mc_cdev.subled_info[subled].color_index =3D color_index;
>  		led->mc_cdev.subled_info[subled].channel =3D channel;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720103017.8809=
0-1-kr494167@gmail.com?part=3D1
