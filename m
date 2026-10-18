Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A898835F5E3
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 21:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792359741; cv=none; b=IiCqkQ/98as1zzYD7gLDVodUsT6X2aaPXRGviTacCnJR4SyF4l69tQ3AYPk+GJcR+cO8+wnYeQ5WkaZltr/196J3jmyhqeibk/U+Vi0acrSkcIcEUYgZ8oyipzglF/cy6Hhd1yHnFqQwZLrvjOxlHkvtTxJCDXeBp4PeZoaMWxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792359741; c=relaxed/simple;
	bh=Kq4u5wMOungtYjEwunlnRnR9K21G2hGwUHUeWT5V7Xk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Po9hEZriBrq241+1UsiqNcgOcb6OMRXmol0UgZ84/u53BrraBPlkQSSy49R509WRwWp2teqcTZy92AbsF/dTODu/thZVmZsI100bWpntbCoUnvVxC7GBtiHvLsgWo8x8LIJvyytLmktVUomA9c+DbkiBh2yjpK+BHM7YatW5znU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I82laPD+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I82laPD+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF021F000C4;
	Sun, 18 Oct 2026 21:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792359740;
	bh=Kq4u5wMOungtYjEwunlnRnR9K21G2hGwUHUeWT5V7Xk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I82laPD+qskWMlmRZdCFS/4uZScD5T9k3it8jgcSo7qo40zq938Bbv62AyxGGLHYT
	 IJla4K97CCxFLJwa/Vtv9Oz+xx+1Mi74EgqiQpSZBYqmjm1zCEezERMq6wQWRzdsTJ
	 AU9zHHqMTTxYf5X0mWCAbuxegttdAh1MTcJ7+vs9wqU3OykazgWhzcXUXtcVTcsY27
	 MvMgLqXsP0aMXga2KS7eNHn5JtfMK9snLAbaJrtKSeKox6QDZX1+0AriJHKwBHYAeL
	 fpoX9pqlPK/xIb9gwbYqTgH5rKpRuxtW/KrDp3tKIQStSRP66IDi1gqhy35o6izAKH
	 7+Zd4/Xty9CmA==
Message-ID: <sashiko-outbox-176408@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] leds: flash: leds-qcom-flash: Release all V4L2 flash
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Neacsu" <geocausa@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018-qcom-flash-v4l2-release-v3-1-02e18d30b18a@gmail.com>
References: <20261018-qcom-flash-v4l2-release-v3-1-02e18d30b18a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 21:42:19 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: George Neacsu <geocausa@gmail.com>
>=20
> The probe error path and qcom_flash_led_remove() use leds_count as an
> array index before decrementing it. Since leds_count is the number of
> registered LEDs, that first access is one entry past the last registered
> V4L2 flash device. The loops also stop before index 0, so with a single
> LED nothing is released at all.
>=20
> The V4L2 flash sub-device then stays registered after the driver is
> unbound, still pointing at the driver's freed devm memory. On a Surface
> Pro 11 (X1E80100, PM8550 flash, IR LED linked to a sensor through
> flash-leds), unloading the module and then setting a flash control on
> the sub-device triggered UBSAN shift-out-of-bounds reports and a NULL
> pointer dereference in regmap_field_update_bits_base(), called from
> update_allowed_flash_current().
>=20
> Release the registered entries from leds_count - 1 down to 0. Initialize
> the mutex with devm_mutex_init() before registering managed LED class
> devices so it remains valid until their devres cleanup has completed.
> Route a final torch-clamp programming failure through the V4L2 cleanup
> as well.
>=20
> Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module=
 in QCOM PMICs")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261016-qcom-flash-v4l2-release-v1-=
1-0e92aa7c9327@gmail.com?part=3D1
> Link: https://sashiko.dev/#/patchset/20261018-qcom-flash-v4l2-release-v2-=
1-8e2297844d9f@gmail.com?part=3D1
> Assisted-by: Claude:claude-opus-5-5
> Assisted-by: ChatGPT:gpt-5.6-sol
> Signed-off-by: George Neacsu <geocausa@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-qcom-flash=
-v4l2-release-v3-1-02e18d30b18a@gmail.com?part=3D1

