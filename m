Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324771;
	b=MP+8WWkQ1sp5Otj2RRk1AqVM4rN4RW4pIbzh5yyhC4w/5VDxEblqvBS+9EDrP2k2Y3yr
	 LM3D+KYC1QPYseTRBZwtUmhMMgT2qGxn4LKx5Phhy+TLgbPNz4jyAHMSonj76pg0QxRrt
	 WeoVYDQo1gkG8H2gHmZ3PHgzVh/JHF36WGSxgjWFcTJMMvGb3DiuuIxHz4ZlB1MKRxAbE
	 Ka2HqPrd9CSVu7xuHAMJ138neE9KLuO7kzltmzIlu7TCkEWAOyKVr64czVuR2nXh4hXbn
	 lrtRyl2T7vClzKXVbu5TjEKhRKzrlukGT0c4vSRYsxC8k9baXBf22xs02fNaLNCOEmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324771;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cwoAflfULkKi5dWJkLDkZFbtOP4YzBUn/BULp19p3/w=;
	b=ZvKjawIqPqqJeSfgHHfoLA2I0nsKh7kl162z23FjWPuxLp0E0ASkAbSMLnXEaUfeQKqC
	 gsSitNRR0ZgLPUcs6Ai0w0+9o0mYVyiEhcqlc242e7enskaUAMxhK+eo9HxNr14B6HswW
	 j0HV63rVqMnFDgPV26ypP0VbmODk1T1TTELCp7Z9xsphyRtpwYskuHsa7DUjSebpe3t88
	 88D2hOUQgGfuzRtfl30cKTnkQ4tRKBojueHKN7asemqUZwO1a/W/GTy3/xFeVUAjofOzB
	 SReXldpeYddBteXcKNkeMGq6v/8GMCbJC1W8G1wJujj/1n9W995fZD0k/3oBCHgOpAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bOLQzDNE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22210606A31C
	for <linux-leds@vger.kernel.org>; Fri, 30 Oct 2026 01:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bOLQzDNE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03671F000C1;
	Fri, 30 Oct 2026 01:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793324771;
	bh=cwoAflfULkKi5dWJkLDkZFbtOP4YzBUn/BULp19p3/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bOLQzDNEHrvaejDfdhaQJJvv01tivgf9PW83o2uXzL8g6RinXaM19zOXHW6lrmzV0
	 EOAzXsNPD6+IOG5tZ/Vjl7vq6aYBzjm6pxMHlxRkQc7xvgp7XkU4J/HBENOZ9qv0ZG
	 gMEQKC7tvziWlir2k2GA+3AN/v1IQkMAW04eicFuGU+zjHCvVn0EcS6NLPTJzYjlt8
	 +ae6OCG7BhizqhDlCs+Xux+nx518CUGfJukM4npaAw5ykVWClRSLnlngl5mAaJqpRQ
	 0WyO/bMsn/ikidvrCtddF7IcA4rQEv1++A08jLqBk7IDwPCi9slQcaM2+Oyg+dNbZV
	 e/SRd8Bl9xGWA==
Message-ID: <sashiko-outbox-190152@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: pwm-multicolor: manage the multi-led node
 reference
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yige Jiang" <yigejiang86@gmail.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <rc-review-20261029-ai27-27-2c77ed65cec2@gmail.com>
References: <rc-review-20261029-ai27-27-2c77ed65cec2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 01:46:10 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] leds: pwm-multicolor: lowercase commit subject description
- [Low] leds: pwm-multicolor: unused release_mcnode label in led_pwm_mc_pro=
be()
--

commit 67921ff7042ba5bbedd0da0b44a4a770d241be02
Author: Yige Jiang <yigejiang86@gmail.com>

leds: pwm-multicolor: manage the multi-led node reference

This commit registers a devm action in led_pwm_mc_probe() to release the
multi-led fwnode reference upon driver unbind or probe failure, and removes
the manual fwnode_handle_put() call on the error path.

>     leds: pwm-multicolor: manage the multi-led node reference
>    =20
>     led_pwm_mc_probe() leaks the multi-led node reference on successful
>     probe and if the final PWM update fails. LED registration borrows
>     the node, so it must remain valid until the LED is unregistered.
>    =20
>     Register a managed put action before LED registration. Reverse devres
>     order then unregisters the LED before releasing the node on unbind
>     or probe failure. Remove the explicit error-path put to avoid
>     releasing the reference twice.
>    =20
>     Fixes: 9fa2762110dd ("leds: Add PWM multicolor driver")
>     Assisted-by: LLM
>     Signed-off-by: Yige Jiang <yigejiang86@gmail.com>

[Severity: Low]
Should the commit subject description after the subsystem and driver prefix
be capitalized to follow the LED subsystem convention:

  leds: pwm-multicolor: Manage the multi-led node reference

> diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/le=
ds-pwm-multicolor.c
> index 6365459ec27f1..0ccf6839bc65f 100644
> --- a/drivers/leds/rgb/leds-pwm-multicolor.c
> +++ b/drivers/leds/rgb/leds-pwm-multicolor.c

[ ... ]

> @@ -121,6 +126,10 @@ static int led_pwm_mc_probe(struct platform_device *=
pdev)
>  		return dev_err_probe(&pdev->dev, -ENODEV,
>  				     "expected multi-led node\n");
> =20
> +	ret =3D devm_add_action_or_reset(&pdev->dev, led_pwm_mc_put_node, mcnod=
e);
> +	if (ret)
> +		return ret;
> +
>  	/* count the nodes inside the multi-led node */
>  	count =3D fwnode_get_child_node_count(mcnode);
> =20
> @@ -174,7 +183,6 @@ static int led_pwm_mc_probe(struct platform_device *p=
dev)
>  	return 0;
> =20
>  release_mcnode:
> -	fwnode_handle_put(mcnode);
>  	return ret;
>  }

[Severity: Low]
In led_pwm_mc_probe() in drivers/leds/rgb/leds-pwm-multicolor.c, now that
fwnode_handle_put(mcnode) is registered via devm_add_action_or_reset() and
removed from the release_mcnode label, the release_mcnode label only execut=
es
return ret.

Could the release_mcnode label and the goto release_mcnode jumps on the
subsequent error paths in led_pwm_mc_probe() be removed in favor of returni=
ng
directly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/rc-review-20261029-=
ai27-27-2c77ed65cec2@gmail.com?part=3D1
