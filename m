Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515347;
	b=y+Z9kPzbtCcxokM/4PgxX6+sk0O7gfv4EVdSkiHgDDUnEhWZ9DbypC26tmJr/5NGZ87s
	 ZeUiQVLndzd8Ej5M6ImyzKRS5Qz3LB9m7DhlbGON1Z7F1xnySkw+lIcP75JiTtLcGupu5
	 m9K3EZWyDZjmHYi3kCOD5ymN+fQuFBrVnboASCar11ZaaiqbqDUdgpkfm1/SOf97nXgHF
	 1wn6mh2P7MBSBIbuVwxk1roXqPxeIxv670Mn4UqVlqa0aTIz2G5lgn0EZbhqyDULm67Wu
	 5KfbAeeM/m1aWpRCzEdhWZSbZTq5khJBQnQSH3U2cJ9EglPHFyudjxiVb9pRq7EZCkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515347;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dj+0I3Wnfmx4bY8I7T5DvnN/BsGk9y1/IGilx51F6wQ=;
	b=musMPUHl1/LMSah3fKzjz6M6f3Kxxuf1NktQiQmUSyvnj3JeEnOSbYGSpHPVdOZFIYNd
	 gdH1JERXYQqbFTBm6EBV6sDMmK0pBvY4rvyUtzyUfZ05OGKJduW+2Zi3Kq2jRxOWDrNq8
	 lIcXHFcSaIfKMDjJioafUY5WutNZUobcqrulM8vXM7DbsZmSwUycoeAtc/brMRTOfOdH6
	 mxhBS9bCE4Op8r52kxzfzY5m125IiiHIU/o6CjUUoJ61LpUugOpKuYIXaEBY53+5Z5ikY
	 SFLB1x57Pz/CNR3/D9iITVtK8WRen6Tsq3j+TrXUg94AKsvXZBkcTSOQBooRtShCAuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9+Uz7hx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC93606A68D
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9+Uz7hx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EE31F000C4;
	Tue, 24 Nov 2026 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795515347;
	bh=dj+0I3Wnfmx4bY8I7T5DvnN/BsGk9y1/IGilx51F6wQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B9+Uz7hxks27KPlkFq0tpUVl8vI6Nmt+IKO90FZh5MBCZkDBorbdwgqIzsFuGFpSD
	 SDae6bCToRzsvaTGmgdQk8rsdzrIDij9+NhjohjqljKtay2IZ01eeZKc1vd6gbTGsN
	 KDpXSYF/N+lamaTHeCD/v+b0AdjYuhzygq9g8sZmloQnfgMqQpLU391WOl9ZdgglnZ
	 S3Wp5LAx7mQTa5SimB6jsrd5dAX6k91P3LwoLp01x14tARDAgP4ss6hzqzbeLpDa5t
	 CJemcvsYC2c7xfXI7Aonm3eKFPsIix8vxoX0ChuUJC2H0mGzAkWlnlUv4AoTyg6X+L
	 3jUTWCibVRTZg==
Message-ID: <sashiko-outbox-230952@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: rgb: ktd202x: allocate the LED array for the
 chip's LED count
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261124095707.3852724-1-congnt264@gmail.com>
References: <20261124095707.3852724-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:15:46 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] leds: ktd202x: uninitialized chip->num_leds in ktd202x_probe()
--

commit acafdda47f9cb14e885911a263b15aa32abaff09
Author: Cong Nguyen <congnt264@gmail.com>

leds: rgb: ktd202x: allocate the LED array for the chip's LED count

This commit allocates chip->leds[] for the number of LEDs supported by the
chip rather than the number of firmware child nodes, and removes the later
assignment to chip->num_leds.

> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd2=
02x.c
> index f1822281c3e61..56f6fa906b709 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
> @@ -533,6 +533,7 @@ static int ktd202x_probe(struct i2c_client *client)
>  {
>  	struct device *dev =3D &client->dev;
>  	struct ktd202x *chip;
> +	unsigned long num_leds;
>  	int count;
>  	int ret;
> =20
> @@ -540,7 +541,9 @@ static int ktd202x_probe(struct i2c_client *client)
>  	if (!count || count > KTD202X_MAX_LEDS)
>  		return dev_err_probe(dev, -EINVAL, "Incorrect number of leds (%d)", co=
unt);
> =20
> -	chip =3D devm_kzalloc_flex(dev, *chip, leds, count);
> +	num_leds =3D (unsigned long)i2c_get_match_data(client);
> +
> +	chip =3D devm_kzalloc_flex(dev, *chip, leds, num_leds);
>  	if (!chip)
>  		return -ENOMEM;
> =20
> @@ -558,8 +561,6 @@ static int ktd202x_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
> =20
> -	chip->num_leds =3D (unsigned long)i2c_get_match_data(client);

[Severity: High]
Does removing this assignment leave chip->num_leds set to 0 on compilers
without working __builtin_counted_by_ref() support (GCC < 15.1 and
Clang < 22.1)?

When __builtin_counted_by_ref() is unavailable or
CONFIG_CC_HAS_BROKEN_COUNTED_BY_REF is set, __set_flex_counter() inside
devm_kzalloc_flex() is a no-op and does not populate chip->num_leds.
ktd202x_probe() -> ktd202x_probe_fw() then fails unconditionally with
-EINVAL:

drivers/leds/rgb/leds-ktd202x.c:ktd202x_probe_fw() {
	count =3D device_get_child_node_count(dev);
	if (!count || count > chip->num_leds)
		return -EINVAL;
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124095707.3852=
724-1-congnt264@gmail.com?part=3D1
