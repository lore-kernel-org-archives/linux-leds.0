Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924885;
	b=lHuNbZ1Wcb5hLQalLDRD1tPq7KLQXMobZo38A0EHZ1iK+REKkq5yO+7Utz4VhlYukdMl
	 +wzNsv4t+DoCpd7TEuSObCrS4U/CLB6iGSbXoEZodoGpx6m4MWSVBMLl0BeEZqoe5umVw
	 O4x7/xrgCJG5LwA7SatgajBgqRzciDyrVGpE9cjeojQeEF4ysHo0lF94UgfN01Xr4vtlt
	 AcX7fmv/lfC7CmM8XdOTP4m6wVUG1Gas0LFygzTFgjiNQYrfCejrcFBRiscmu2S+EyEed
	 fbnv0+AT7lqK0yTFpQ22TmvPV761L4NCm7r8FifKqZ5nBRqnNqYU+nIMJ3AXLsuPM0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=t9Z9GWOoq55CK62xauUtdSr28r0CBC3/vbxHlMVyCWM=;
	b=Q8YE386MRKUpOR0zTznwDmI1IQoVJ+rnxaOuhEj7o3wT5lbtvYkRrw5f0VV2ZffJqQLg
	 b+oZFE33nP74sVOzkc3IrCrQqsE2p9Ov4psal0y7egsdV+H6ywSMAenI9n13uTfe0gad6
	 mmLdmf/AB5bp2x9IsNEggbDFAiQRY1kqiCqviEo+hIh+B03I1AykQVluX1GwvFDKTVzQy
	 V+3U94rly5xvlkpsV/9ylk/8c77wLEMBU0489/ssw0U4ve2An7JQgZzZc2Yy95hX8KSuO
	 r3Vbc6GJ4Dtitijgs+cDTnQmLKXj9T3kQXsEhhj44p4iDoUzdpLIBaAXneLrYoNf3xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dcZZaDKP;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31B9606BD1E
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 14:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31B9606BD1E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dcZZaDKP
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c505186727fso304441966b.3
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 06:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794924883; x=1795529683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9Z9GWOoq55CK62xauUtdSr28r0CBC3/vbxHlMVyCWM=;
        b=dcZZaDKPSOmq14t7/Sxy5dES2lKltU7p9ZYImMyJXndzGVnxM62Lr9CtLvuQd+kV87
         8Vp5pO2XmHTH9X9sKeXz/iwTarVuh5G7dkvg/WEZHMKwdjd9hLtx5UB5aY61mNW9l8ev
         NNUv/SuBc/GGKiwdgsYCEVI57KTN7Gpg7kULaKiehxpZla56sTHPvfVuWxHFXPYLANys
         dJBnmmi2topavK5o/PzoxlKV/sMHL71SUamapnnpK1h2wXNh+CstVlkKzGJdGt9zZ8yH
         WH1Pgqr/QIah1Z+06BYF0RPZ++2cW0TFoWEFM4Sp1jXy9Uy2qzx2qNik89oTzO4BTRMy
         rvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924883; x=1795529683;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9Z9GWOoq55CK62xauUtdSr28r0CBC3/vbxHlMVyCWM=;
        b=Nw7domzzm++XbnnZ9SISTbd5zeQzz3c2x7ru2cuhmHrQVLLecBcEmXb3EPfVaa6dFN
         Xj3KwSclhJpt39RLp7lvH4wTTMcXDqw6eA15pCmagdhsBqINx1NitdKuDSqlNudzfCjf
         N+xxYv0X9od3eL7f4aV+WXerBN1DRmZFYWvIw0sReL5P6rnUjKVwn3N5dnBLkGnZvly/
         zNFowZFo5EUb3TAsakni6WSa5QbBClA/Kj+mZfoF/Hc2CTRCK530TGSdLVHI3bMtmJcO
         cnCzTdlvQ6NGYnLllrfS7ILV5jqex+12Es9ZLSa3cw6ST4AfspWidwwo48Vxbp2s2bUT
         2SFA==
X-Forwarded-Encrypted: i=1; AL+hErE2wNhmffDBjiBZ5JQG6Z/MTUdgxn3H3omeV1+pX2a8PoDRL96BwI0z5s18ZbZuKYUSoApd1NTxhiHv@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y8qrvvvwkvCMeFgC5Da8ANAfqYLZLICIRsE0TAd7yCZq1iKmQ
	SGc4SX0fj4DMk10PSD4HlZo5sm0Jaj8LmTO98JkHomEmEE3MmkmoQbmnILaILf5CuMs=
X-Gm-Gg: AYBFou0rF6rwoxYeDAf7QvQfcAQBp7ZFNGgI+Qbye6Q69V7Ic21ii/a71rghbANALzh
	G6JJERNjgvrxTtEk6pkn3Oyj0WvzEDCW2SYa0MLK1adEpYxEBFHwf+aKjR3XqbA7kNofNyl37K/
	tSUYMfdSUTx3FViiMqbA/CmAPe2Kg6Ey6vH9QO/TrX7LCcsnKT27JRQVy/PABhBLsddu76d7xfe
	Zo1+t87I3R2t8gY6N8x39Zg5SVo3iB/OojMZH/IPGIJ/iwRdNpFddiiZQ64sjkkoq1yjXElwXj+
	HNOsDxm/+3Ia/kPRoxDRcCRIzKUBotnK3trexyU5MbfS37lbThXR5T5EMxxzuBM0EAJUruUVbcJ
	2apE1aqJ5sHweZVFMezNEW73Ms8XoXsoMrTAGznGhioRFG44hFlxe9xJKupfmHuj5imVR5Y2IB8
	wINpSvWiw26MATlTW5q596COGfNh0RDZXQsonPxxAqiAiVb8xloSqd9k9cbQJ1Kw33MKSzQ/qD4
	oJB9ou8s11eUQR6VF27gzA63m4wL4aHxzafGhc5iyhu52mrGxkync/jQAU7W5M9KudQrU808RM0
	Up4LM9//t63hWJ2Wj4IRGsFTORjTgLw4+0YVT1JCNMHRTS/1DC/5M4JuJlhBuWt9swVSk3n2OKt
	1ct/G7+tggpO3egaYX3h85ibFr2A4Am/CsJAC
X-Received: by 2002:a17:907:3f8f:b0:c41:4964:90b6 with SMTP id a640c23a62f3a-c50963bda5dmr1256478766b.36.1794924883104;
        Tue, 17 Nov 2026 06:14:43 -0800 (PST)
Received: from localhost (p200300f65f19a904a5ac91f50e61369e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:a5ac:91f5:e61:369e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c5095b23afdsm552084666b.13.2026.11.17.06.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:14:42 -0800 (PST)
Date: Tue, 17 Nov 2026 15:14:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: flash: Add driver for the TI LM3554
Message-ID: <avxg_XjFo88nIzU3@monoceros>
References: <20261116180809.26946-1-volodymyrchapman@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z3hfkeb7q3mzmblc"
Content-Disposition: inline
In-Reply-To: <20261116180809.26946-1-volodymyrchapman@gmail.com>


--z3hfkeb7q3mzmblc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] leds: flash: Add driver for the TI LM3554
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 06:08:09PM +0000, Volodymyr Chapman wrote:
> +#include <linux/i2c.h>
> [..]
> +#include <linux/mod_devicetable.h>

Don't include <linux/mod_devicetable.h>. <linux/i2c.h> already provides
acpi_device_id, so you can just drop <linux/mod_devicetable.h>.

> [...]
> +static const struct acpi_device_id lm3554_acpi_match[] = {
> +	{ "INTCF1C" },

Please make this:

	{ .id = "INTCF1C" },

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, lm3554_acpi_match);

Best regards
Uwe

--z3hfkeb7q3mzmblc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr8YUwACgkQj4D7WH0S
/k4Q5gf+MQ8N0OnagqRh5xzbEfeJF5RFpOVmouxins1dOoDKt79ab3SBiUej/V/V
1wCFOE+4jS2Q00/oLgVxF2yfYQaat4Kwbm4/EeXFAvwSsNJ8kIftlzcu6oVcbmK8
tUW1lD2a2mge2rbchIfe0iqdSsvGDANWa7Bq6TcWjHox0t+4IkHTq3XLmwOKP+pI
/Y32GaGbDtR2tSp2DDNU7PFMxnmVHHfgccQi+vcONmNTSO2RlF06Mw8ZDmU9YP8o
xiLD2c/GqVIoCboQqrnWSsTno8GGO2o7DeSI8In0kJ/vqpI9dWzoTwqDaaBJjrif
bHRY3BS4Z3jSet96NJgHWYlmzT6tTA==
=2wSg
-----END PGP SIGNATURE-----

--z3hfkeb7q3mzmblc--
