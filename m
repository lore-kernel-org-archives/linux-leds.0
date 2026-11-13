Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528555;
	b=5deErMInAKVlPvTAyGiQs28rtSn4vrjpW2BsKsllmIdSh49VNdunCVg4OCZdqzJZXHpl
	 kYSuyIcjlkP4yWHDyOv2O+QYYlgeCjSpafhZqfogIqaViH5l8chXvBuPuZLrudXLWhte5
	 vHnyKcE/HZNA9veghYVidhnMHMFXXSbYpVhP7He1GnkZ9c29A+5VDX/WCtfXVWXY3fGF3
	 0m5+m+uVrNx1yHuV65pmbdRXw2uRh1xZFBHa4RT1NGRYqZZvh0HW6zKBFsj2fl5o7tiH0
	 uKgdOCAYRZdn3zmEZTT8MUHvnXBYtIdf548/RFGZFlvL8anScr7uA2zrYoLM75p0m/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528555;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ebRpGpdB2hTTtbG3QpuXVZMpD6cJsrogmkEi5stzfis=;
	b=WniqfJAmqW61qfRIUJDKHD7HvFvHT4xOsEPGNrmIL/wox6/zQZqtiC9wV8hm9SXwopw0
	 OUxQs873RoKKLr9ZxjKw2TOyfKHxXEXuYrIlCgk8qK11N9V9KcnWEHm6y6r8zROOranv7
	 usO5voMgSt6TN6Rrt3PdLyiJ/gwFhnFNPJISgIIMEtZgZWTVPMZC3o/YnUYTx+tEjR9Cu
	 /ie95JrC86T1aEfwJaFOTFfkWWxq03q/L5l6P8HlHiWabppaam+o6QMZrH+QXkJuIxt54
	 6HTbCARQKthALe6ZxXMCUt3CTbLzwpgntIUwcq1I9JrWRkR9MYkYVlenDJMwkTBat4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9FP4GqN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0EF606A31C;
	Fri, 13 Nov 2026 00:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9FP4GqN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563541F000C4;
	Fri, 13 Nov 2026 00:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794528554;
	bh=ebRpGpdB2hTTtbG3QpuXVZMpD6cJsrogmkEi5stzfis=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n9FP4GqNx1HUAt2L8wDS3VCD5V247eepy51hMsErXvvHGf3uGLAvEikhaHxEraRVv
	 hyMKc6hldI3ByxbPj/4oMq4bQUuKC0von6vRXYng9BE7QUdVOinLIogzyaRukChs1n
	 UhLNx3onzI4ap6J6PGPW5jeN2IvSMEGVfJ/VEfLNk0boTVDuQC0aaGsPtzSqrOO/j2
	 VypzDFgDgQeLRayLwsEFDgyvKSZwhTF/5F2OT7/K//5W8bGpl8dDzN0fVdeEkRlXef
	 o53hjMpMdQ/0bQ8fQzgDAjJAfi9pqEGwSVeNZyrkSHZmuscBYLpK6dkYkO3toCyZEW
	 8SdCsA9Dd6o7w==
Message-ID: <sashiko-outbox-211975@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] leds: aw2013: Use dev_err_probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261112-aw2013-aw20xx-rename-v6-3-251eca340abc@postmarketos.org>
References: <20261112-aw2013-aw20xx-rename-v6-0-251eca340abc@postmarketos.org>
 <20261112-aw2013-aw20xx-rename-v6-3-251eca340abc@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 00:09:13 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] leds: aw2013: I2C write in aw2013_probe_dt() while regulators
  are disabled
- [Low] leds: aw2013: missed dev_err_probe() conversion in
  aw2013_probe()
--

commit 82b1ad2c2b840e1ab229066538d745664fd9ce9b
Author: Paul Sajna <sajattack@postmarketos.org>

leds: aw2013: Use dev_err_probe

This commit converts error logging in aw2013_probe() from dev_err() to
dev_err_probe().

> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index 5ff9887086a61..f1106456d4edc 100644
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c

[ ... ]

> @@ -509,30 +508,29 @@ static int aw2013_probe(struct i2c_client *client)

[ ... ]

>  	if (chipid !=3D chip->cdef->chip_id) {
> -		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
> -			chipid);
> -		ret =3D -ENODEV;
> +		ret =3D dev_err_probe(&client->dev, -ENODEV,
> +				    "Chip reported wrong ID: %x\n",
> +				     chipid);
>  		goto error_reg;
>  	}

[Severity: Low]
Should the regmap_write(chip->regmap, AW2013_RSTR, AW2013_RSTR_RESET) error
path immediately following this block also use dev_err_probe() for
consistency with the rest of aw2013_probe()?

> @@ -545,8 +543,8 @@ static int aw2013_probe(struct i2c_client *client)
>  	ret =3D regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
>  				     chip->regulators);
>  	if (ret) {
> -		dev_err(&client->dev,
> -			"Failed to disable regulators: %d\n", ret);
> +		ret =3D dev_err_probe(&client->dev, ret,
> +				    "Failed to disable regulators\n");
>  		goto error;
>  	}

[Severity: High]
Does aw2013_probe_dt() write to AW20XX_GCR2 over I2C after
regulator_bulk_disable() has powered down the vcc and vio supplies?

drivers/leds/leds-aw2013.c:aw2013_probe_dt() {
	...
	if (chip->cdef->gcr2_imax) {
		mutex_lock(&chip->mutex);
		ret =3D aw2027_set_global_imax(chip);
		if (ret) {
			mutex_unlock(&chip->mutex);
			return ret;
		}
		mutex_unlock(&chip->mutex);
	}
	...
}

On AW2027 boards with switchable vcc or vio regulators, this I2C access
While the supplies are disabled will fail and abort probe.  Since
aw2013_chip_init() already calls aw2027_set_global_imax() after enabling
the regulators and the chip, the call in aw2013_probe_dt() can be dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-aw2013-aw2=
0xx-rename-v6-0-251eca340abc@postmarketos.org?part=3D3
