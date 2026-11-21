Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795247437;
	b=hltnvLvCodvrnwDMMg6m6nERLxl1QUijjIahp5Ww08Via+GXdV2ZwHcnntFZ4HxbG3J7
	 o0EZr2PCL/vFzcmt0mct1zd8oqhvGXkhdO1kMFp8Uoh2Ltu62gUbUBUaRx2yx0U9cXp2p
	 RkfhDZ/m4aTLTYUgGriZzKtac2Wh3WFIOVDxT9GmqYHpS4LMTqsLpzTD/qhTZbbPlyxz1
	 pKYP+67sMhAQ6j+eNKdH91EeRzEPZTanD3pflCYw7090ri9/C7m+REf5uwlM56X++YWSm
	 Fmg+PG1LMA8Q9lA9kww5XQDKcqWCV8Lsx9HrOcwGndViBhn7CZlj8PjLoVwGU9IxUwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795247437;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y83cxzfKjByJ3ToN6GvDg7DqYnrDUY9AB4W5cuF4h/4=;
	b=KBOGBLjirHL6uZkFmQs7jMuG+NLEA0KK0sNZq73L62g+CiQXPQCbXHcqfCHh2clgeud9
	 NLjgcCY4wLHD/cMlbUK7CGEqklV6qBE5gXGmfbyPqEZibxtkPPPwLIjLglRaG3Bt6x8Nm
	 NQmJ6NEena6rQeBtiDRXFC51H/ilaguArjwamBIwBOP7XUsKe5SQFAHr2/RhOir+q2g/6
	 KTx6hMaF6sd0qmU1Iumkyv7Am3rga+B6YVl2FIePqYxHfUQUwfEpoSvYVHF44nieFTxa6
	 fLDYfXI9z3zkGqS/EAd62fEX8QLewTJkDUqE4AHx+eEpnqedU8FOzEIDt8h9gk2STWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KsAZmVn9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAB0606A325
	for <linux-leds@vger.kernel.org>; Sat, 21 Nov 2026 07:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KsAZmVn9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502A61F000C4;
	Sat, 21 Nov 2026 07:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795247436;
	bh=Y83cxzfKjByJ3ToN6GvDg7DqYnrDUY9AB4W5cuF4h/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KsAZmVn9Rb6L2pECbT4R2DW3X4Lbx4atCXIzcX4frb641vv7/PWoodf5VCOdj6PMQ
	 Kvy94WnT1+KtFJ5GQzLrGj+LqzinGJ6ou8ooom+vADyxIoZkBKN3c4ND3rfbqOW7UV
	 vdlaOn8SypFUyaJ/ay3USwz40YbsDjD6zXKlCZKWwI7jEMETrEV8VGcJJQ1j9ECEzp
	 2Dez5AEVdfxRazsNwTF0AtMRtt5DRgiji4htxZbsYlssF4ntRYxy3d4axztw2OOvKz
	 CfmeMOOxono/32mVHhCiIN5Fd+2RMFsXviCA3/bt0SV4MSnUI+PG3cJozyUvygDvwn
	 CXBJsvMeL8Guw==
Message-ID: <sashiko-outbox-226805@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] leds: leds-mc13783: use unified device property API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Kurz" <akurz@blala.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261121074239.8745-1-akurz@blala.de>
References: <20261121074239.8745-1-akurz@blala.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 07:50:35 +0000
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
- [High] leds: mc13783: wrong fsl,led-control property name in
  mc13xxx_led_probe_dt()
--

commit 68fd5224b7b684d27cc41e7ff6cfe1fa69173623
Author: Alexander Kurz <akurz@blala.de>

leds: leds-mc13783: use unified device property API

This commit replaces OF-specific API calls in mc13xxx_led_probe_dt() with
the unified fwnode device property API.

> diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
> index 19c1b51475db6..c3bbbc8ef946b 100644
> --- a/drivers/leds/leds-mc13783.c
> +++ b/drivers/leds/leds-mc13783.c

[ ... ]

> @@ -122,34 +122,34 @@ static struct mc13xxx_leds_platform_data __init *mc=
13xxx_led_probe_dt(
>  	if (!pdata)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	struct device_node *parent __free(device_node) =3D
> -		of_get_child_by_name(dev_of_node(dev->parent), "leds");
> +	struct fwnode_handle *parent __free(fwnode_handle) =3D
> +		device_get_named_child_node(dev->parent, "leds");
>  	if (!parent)
>  		return ERR_PTR(-ENODATA);
> =20
> -	ret =3D of_property_read_u32_array(parent, "led-control",
> +	ret =3D fwnode_property_read_u32_array(parent, "fsl,led-control",
>  					 pdata->led_control,
>  					 leds->devtype->num_regs);
>  	if (ret)
>  		return ERR_PTR(ret);

[Severity: High]
Does changing the property name from "led-control" to "fsl,led-control"
break Device Tree probing?  The binding in
Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml and all in-tree
Device Trees define this property as "led-control", so
fwnode_property_read_u32_array() will return -EINVAL and abort
mc13xxx_led_probe_dt().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121074239.8745=
-1-akurz@blala.de?part=3D1
