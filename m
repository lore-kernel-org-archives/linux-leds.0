Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696247;
	b=F5z8D10SrIJe2Y0Zm1lyJ91EYLOVFAH0ZErmL1z2eOuXEWHQ1gtioBVcOnDjfZAaKwet
	 3wnNUUYyG+p1OG05VNzVL4QBvzcmcRXo048bBOdTNdG/4+ULlhySdfOJ+6QE+xGNQKUAY
	 AFYgnj6aLSW+Vs+gAURSgulptlXaYdzReVonmJfyrO7P8GzO/rx9L/W7E60tpwxv6JR0/
	 gFXS27hsV9E3Dm0tIIvbMnvsWLy3eAprCGyYaycMs2n+me2l3T/Nauus7Fo79jXfeQjsD
	 cpwIL4Joz9Z9f4dJ6Quz1yazjoe6WZGtOD7saZYmo5kteO/76vo+DZOc8oUBax9lrgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696247;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f+Nf7ctMZi3CvQ8BFTOKzJf4kzdDIOaz8lt/554N31M=;
	b=cSeXnyjBgfiphM+d0d4PCoGNt1hjQG1YNMWKoaScaOff0bJWXz2U0VWAucjALTREfDrd
	 sjet5ew2Je5KsD4O+f5v9QLHJI3su0+kSRRrcK1sxXPcmYeKygjTwNqCqUNLe9hc87H0c
	 p/FbaTJBT0VfvUpPNDc3HMuzPBU+I+Adn4L3qtQUTm7aZK5YfYr+4j2gXIuni0hWVl+tA
	 VRJAKxb4qMJ0e7nXnnVkWZCbsfODRC33eoPE8GsPPyPvr+at0UeUn0ppkpjFI3oXx+D1A
	 5zoEI1N76BKbsz4JyugMAO7t8IwXCZv8IGTAJ2mXM6Vq/uvVZpS9Qtr78Xbe9kRhTkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KxpeXWNa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9F2606A321
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KxpeXWNa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B041F000C0;
	Thu, 26 Nov 2026 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696247;
	bh=f+Nf7ctMZi3CvQ8BFTOKzJf4kzdDIOaz8lt/554N31M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KxpeXWNaGdKaEPqTbPRIGjPVTm6OdxgZ4cph4bWePQDEhe4Um4J/EaJN6abiOoaZL
	 TNm7onSpLo8yoEL5yBC7hyC+YdnF9KKZr6T7D9FdO/2xn0+k1D0j0cTTir78UzgX+K
	 Dql8LPLbBZo89zKnfpDFYm/Pj0uh3V5Zw5zQH9gw42tj5Q08lv90FYfXXtZUbzg5Gv
	 fGGRZLavVvErDLp4fXGkTndVjVaCaqNkWxcRC5scqgvczc5vdy0fZ5/GHogxdRmuDU
	 Wrih1xEKP4xeLk8m8VzSJQsf3gsCFYNQXLVGTQR5CGMZgVIwsYUHqJpahvKe4TzAbP
	 /O7n0kstfs5dA==
Message-ID: <sashiko-outbox-235505@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: sgm3140: Put the child node reference on
 success
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261126122516.1198461-1-congnt264@gmail.com>
References: <20261126122516.1198461-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 12:30:46 +0000
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
- [High] leds: sgm3140: undefined label err in sgm3140_probe() breaking
  build
--

commit a2a470e44324b53eed05e9b4ce69e063a370bf56
Author: Cong Nguyen <congnt264@gmail.com>

leds: sgm3140: Put the child node reference on success

This commit drops the child fwnode reference in sgm3140_probe() on the
success path as well as on error paths, and renames the exit label from
err to out_put_node.

> diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-=
sgm3140.c
> index b1fdf2b55b5fe..df06fa1a38edc 100644
> --- a/drivers/leds/flash/leds-sgm3140.c
> +++ b/drivers/leds/flash/leds-sgm3140.c
> @@ -264,7 +264,7 @@ static int sgm3140_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to register flash device: %d\n",
>  			ret);
> -		goto err;
> +		goto out_put_node;
>  	}
> =20
>  	sgm3140_init_v4l2_flash_config(priv, &v4l2_sd_cfg);
> @@ -276,12 +276,10 @@ static int sgm3140_probe(struct platform_device *pd=
ev)
>  					   &v4l2_sd_cfg);
>  	if (IS_ERR(priv->v4l2_flash)) {
>  		ret =3D PTR_ERR(priv->v4l2_flash);
> -		goto err;
> +		goto out_put_node;
>  	}
> =20
> -	return ret;
> -
> -err:
> +out_put_node:
>  	fwnode_handle_put(child_node);
>  	return ret;
>  }

[Severity: High]
Does renaming the err label to out_put_node break the build when
CONFIG_LEDS_SGM3140 is enabled?

Earlier in sgm3140_probe(), the error check for
devm_delayed_work_autocancel() still jumps to err:

drivers/leds/flash/leds-sgm3140.c:sgm3140_probe() {
    ...
	ret =3D devm_delayed_work_autocancel(&pdev->dev, &priv->powerdown_work,
					   sgm3140_powerdown_work);
	if (ret)
		goto err;
    ...
}

That goto also needs to be updated to out_put_node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126122516.1198=
461-1-congnt264@gmail.com?part=3D1
