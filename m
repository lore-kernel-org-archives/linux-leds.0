Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E4F377A83
	for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 06:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133070; cv=none; b=QR7HHrUvB3SkoCEdFrWSOTa3GvHdDak2kD813zYceNg/Kf7ZsuxQdibcgGxnJG4Zi3p4eRPpntgbsZVZytTx0TLykRPjagE/UOFC7huQRu2CvIddeoVu1bKUXjpwgKPxBoUIvsw6qzc20wNKzDx8bzXUOr0VcKRc58nbWgDU3KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133070; c=relaxed/simple;
	bh=TxTWc1kOj60lEAfw5ut9YNnhTR1rX3CTGkLhPog4Uvc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AvbX4R6/MqDXhOVHcdTYoeU3CsgR9wm8R0qzc9quahv3f9JTeGV7qh/gZHc1I+QrF/5b5D2una36GFE4wtQdk70j872yCaHYu3zpsjViZKPphTCzHFBUru//dBc+GM6l7nMgcLuGSCrP2ZjmTD+ByKsgJdkoh5yIdSQoAzOISuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3nq4h0O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3nq4h0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21791F000C4;
	Fri, 16 Oct 2026 06:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792133069;
	bh=LqP6cWEjXP++89QGFe5JFcUEag8YMlSpHs29KI4fpMo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C3nq4h0OGz0MvDsKStPr7Mqd9kolJI/WN8XMCR9UqqAfXxUZvgU2Ul7thuIAI3BZ7
	 O8/dIxLVxP4iVJU6eAQ4OKhmkIHSi0Q8DuTcHmPrR16EU9u1BgHQeaKjf7Bv38ndiD
	 XF+demXwf2/hfc/f00S23e0SzOweWWljuhmcEvM59+nxKSongOiEpGy+vjgVHli61f
	 0gBgxVP2w+TgJl83GESWEdtIlXpz68qNRug0j+sHT6BrALVt2udhpn8i0ysr5WVd/R
	 96BuNd5it0ZHrRW9OdyfCMf5i3+ZNg3TPjL5Qr1XdFHs2iHxXDdwbmK2gTeBIXY415
	 wBlTHJB3LYhNw==
Message-ID: <sashiko-outbox-173877@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: flash: leds-qcom-flash: Release all V4L2 flash
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Neacsu" <geocausa@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261016-qcom-flash-v4l2-release-v1-1-0e92aa7c9327@gmail.com>
References: <20261016-qcom-flash-v4l2-release-v1-1-0e92aa7c9327@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 06:44:29 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: missing mutex_destroy() on probe error paths
--

commit 02e8e6631f1731424fa6ad18e025af7434984559
Author: George Neacsu <geocausa@gmail.com>

leds: flash: leds-qcom-flash: Release all V4L2 flash devices

This commit fixes an out-of-bounds array access and a loop logic error
during probe failure and driver removal. It ensures all registered V4L2
flash sub-devices are correctly released.

> diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/le=
ds-qcom-flash.c
> index b03a6833e3e3a..c2fefeec9b80c 100644
> --- a/drivers/leds/flash/leds-qcom-flash.c
> +++ b/drivers/leds/flash/leds-qcom-flash.c
> @@ -953,8 +953,8 @@ static int qcom_flash_led_probe(struct platform_devic=
e *pdev)
> =20
>  	return regmap_field_write(flash_data->r_fields[REG_TORCH_CLAMP], flash_=
data->torch_clamp);
>  release:
> -	while (flash_data->v4l2_flash[flash_data->leds_count] && flash_data->le=
ds_count)
> -		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);
> +	while (flash_data->leds_count)
> +		v4l2_flash_release(flash_data->v4l2_flash[--flash_data->leds_count]);

[Severity: Low]
Are we missing a call to mutex_destroy() for flash_data->lock on the error
paths?

Earlier in qcom_flash_led_probe(), the driver calls
mutex_init(&flash_data->lock). However, neither this release cleanup block
nor the earlier direct error returns destroy it:

	count =3D device_get_child_node_count(dev);
	if (count =3D=3D 0 || count > flash_data->max_channels) {
		dev_err(dev, "No child or child count exceeds %d\n", ...);
		return -EINVAL;
	}

While the memory for flash_data is devres-managed, bypassing mutex_destroy()
omits CONFIG_DEBUG_MUTEXES validation hooks during teardown and leaves the
cleanup asymmetric compared to qcom_flash_led_remove().

>  	return rc;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-qcom-flash=
-v4l2-release-v1-1-0e92aa7c9327@gmail.com?part=3D1
