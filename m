Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340151;
	b=OGrGOiQ0PCqirGV3Xdr627Xtz7V+SZGrZ6UQ9KDTtFBOKvjAu8JiYcF6pjvZhGHTPywp
	 AUJEVvGQ1P4WiAbGlxce2ZcuYnp91MWc4NiQRS95peG1lDHybf7Mf4fZs+6iSXcovizPX
	 0sWV0SMMxgd6QRa6yhxAwfoeotlI2byZCgMXcRurkmOyruRP1NFQbveM3ml2V6k4qYBlT
	 R9v0SvIT+4FPEqEjE85i7tW9E9faJ1elovkIN2vRHmu0z6zO/cdc9CeL5XQ3ri+w3/kgg
	 7UYyis6kFAdPCE1u6LyC2lqcRvE233OgtHXq6WuKoCjXxaENnBc8Q9vdtKGZZq78sUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340151;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XgFkiaalUYGH25eD9eEfRJdOi43ZuGo2ADVP/IUyemI=;
	b=Y8qZoKLDUqyDAe+P+6e7uaX5Ylrwg91VASbwT9j6khpvLd+VfAUqoJLfJsy52nKDu2T6
	 RqmaNJ1rBlxucBu8cg9NIRL3z+HE5JBaDbRTfIHabYcVt3DfUgo4wtK9tGxFFqJNgZe6r
	 hxJP+pqFOsmr2EOEXHost+S/7azkTsmt+VY8E7J/jcWKw/6mrzOQRIVvdYrYve/dnoLLg
	 H3kDWhL2qX061rh44BoEPAKQKQ4CA1aEpYF/ypwnCRS/fsN8+76rwdhunHQhZMrDRjy0c
	 7dgZQPU1wIoDkSStYkRCWpVGqQzSNYWdQDzu91iNMoLAkUPbJbtIyH5uAXR8GWcgjTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBEji5Ek;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630FF606A31C;
	Tue, 10 Nov 2026 19:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBEji5Ek
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AEA1F0089F;
	Tue, 10 Nov 2026 19:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794340151;
	bh=XgFkiaalUYGH25eD9eEfRJdOi43ZuGo2ADVP/IUyemI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dBEji5EktwQXVijgfeTc7chJnh47UX9U47ngoQUfa0S++uE6pUw4ke9IWrvhmIExF
	 9EJrhpuzZiOh3U0m+CuyfkYp1WpQUjric1RqgR1sm6xyOa87DeOVHtmrS7l2jjMPaL
	 WZ0OFzCgpu4EMETLyexjd4SHqjvSD3ZF8790dc13SToZ1QjoF1Zi+x2g0NSUHbmAUs
	 jNq+eUynrGX+0gr680gi2O3B76Yfi0/pWI+WG4fMX38fMz8aLHMnxi2pOx4EHDrqiq
	 gIK7bQdsVjkqT+6wuntnzhiOyVCI4Iri/46WfOMSDe6znhFvf81Dnj3s6CyMaq1EK5
	 SReH+HoRbRGHg==
Message-ID: <sashiko-outbox-207683@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] backlight: add ktd3137 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261110-6768-ktd3137-v2-2-9496c51efea4@protonmail.com>
References: <20261110-6768-ktd3137-v2-0-9496c51efea4@protonmail.com>
 <20261110-6768-ktd3137-v2-2-9496c51efea4@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 19:49:10 +0000
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
- [Low] backlight: ktd3137: use named initializer in ktd3137_ids
--

commit 8835810206d0f5ccda9a816dd64ce8c1128ef9b3
Author: Roman Vivchar <rva333@protonmail.com>

backlight: add ktd3137 support

This commit adds an I2C backlight driver for the Kinetic KTD3137 display
backlight IC.

> diff --git a/drivers/video/backlight/ktd3137.c b/drivers/video/backlight/=
ktd3137.c
> new file mode 100644
> index 0000000000000..1595aefd46e6c
> --- /dev/null
> +++ b/drivers/video/backlight/ktd3137.c
> @@ -0,0 +1,258 @@

[ ... ]

> +static const struct i2c_device_id ktd3137_ids[] =3D {
> +	{ "ktd3137" },
> +	{ }
> +};

[Severity: Low]
This isn't a bug, but new struct i2c_device_id entries should use named
initializers ({ .name =3D "ktd3137" }).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-6768-ktd31=
37-v2-0-9496c51efea4@protonmail.com?part=3D2
