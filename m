Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8307F3D902D
	for <linux-leds@vger.kernel.org>; Tue, 30 Jun 2026 17:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839143; cv=none; b=JvDhtQqeByd9vBg6qmiC1qdP8bjte59Db2Jij80bLeJ8MI4IuOvzJXi/ra2MqaLXhm6qPSsGsHcHMqPKwLl7yObsmfpte+uEKrvNH77fuTAi/9362nubY4NO/2CXS5fYxGWl84GovTQ3NnL6JI6N18waXKnB2KHq0FeSxleYTlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839143; c=relaxed/simple;
	bh=0Uwn5wLiQj3tJaPlnhF1tBnz5JBcvjeXN9cyOgQxkHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5mklSSP5Iy5rQobPL2U4QNRaacKsIkSZzDUOg5pa61DEJCCI/3QcqNjTJOV3mFGn0FxiQFc+kYCM3VkvkIpa2Xo4jIrbpDfq/2Ub+e2lMKVH+cPVkZr52fHs1ks5Wo+h/gVFy9yuVruboKy4oSBA4iSFMWNFH59/RNkVk2Y3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=H+mUVYB6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="H+mUVYB6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso663076f8f.2
        for <linux-leds@vger.kernel.org>; Tue, 30 Jun 2026 10:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782839141; x=1783443941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8dphnC8SKNiL5rCPN27FPOK3wkClI/SkKY0aFIfYvFE=;
        b=H+mUVYB6uD+L3jERIRs5EkLhBPlBwvmY3dqJCY+x00zCSiiJpx1kPiOJoHFn7of2Kp
         JFhtPYAtdHoi2AQtx4pUj7y4ApkSO2rzAkR8SgnXCEoc15ABoXMbZv6KDzMAydayGEbg
         JhKg/HfuFozups3qfgiEuquezC7Dhg2dtMGGYniFjuYa+BbnTMHWfgdW1XCe+/9qJhAS
         ju1lcacUitgWWFTCs+lXRUWnDUX4ps2n+6Hx+j/Z/4py/qj1yyOkUGHYdNGpbqKk7gua
         0fFWGFTfR0klfaKLNh2A1vfVXQqVnMakFTfAeHASqule8mqXkpDhbLLby84AF5D0EcV9
         aikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839141; x=1783443941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dphnC8SKNiL5rCPN27FPOK3wkClI/SkKY0aFIfYvFE=;
        b=s+Zn72CisOII7B5n3PgPfdPVnVKtOQntPoeESr9z8efT48po5GoA/O/t30i4Akqsa/
         Vv02ooIIG+uSSJy9PS3uLpdTAalLh9xDy+s9W1WMYG2j1iAzhOhunwWBDuUEBpSM9drE
         otv0rBPXrVsYea56nX+/fGSLZFNhI4vzWMCOVLUUo88O3tRrl8PNme/jmQ+UIXnirLTK
         2gAY8UL9LTFc7QiCAVndt+gUgidi2yX4ViUeS8Gex+0tDFJG2KBzFtLgg0opKUcGfc8v
         NA/6VeHl94hA5bX5vNRRnzZ9pS8mZoOdMEkF3kVowIqBKyDZ5w92NckFFAYO/OEhv/p3
         o2+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqufyLYDNL0ghKtaI7ywUzIZrw+UQamAcY4eNSW/8HzsARAtfjnVd7MSFb42aLBqQ8FDaT1yorxroab@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3QllUdc+mdM9dlo9By5vncm3nL/3yWdmRCC1HQayHOR+oYVXq
	PAqQ/ywGT74aky+lMs8vkGDMhh9oXqwHGNlhpUu+DrN4+WkDzL0QhBJAjALfnDKE5Ok=
X-Gm-Gg: AfdE7cl26LRkuJnQ/Jbw5qnqe7C336QGx7Ti2L8nCTl9foyWTBmdU6t3DAX8lb+n1zX
	XxLy+STKdKch0M+mQMb7pD6BwGgWzKforArzglC476Squa5T5WfcmX64IddaDilPEVbOT4mEQQt
	V6D4xZcysBymSjG7oLVcNfqLUzXgWUnE7fMfM6FH+QL0XzS2y0fIYuOQzTBknQPMARvSHI7prYX
	xfDn94qpjhREDntAbh7oQjq7/d/3IxXuURlTTbF91fMlPXJGrBEUiMSuGBmaEdUiH0SvrS1NtI4
	mWmK9Y4mRCmBO7B81rZ+45Za1YU44yBPs6xjSpKHdZVQpmuaZgWrpKNhs/yX0C1PTzi4ByYob7T
	pj8THnd+pPD4KFygS5W3j++sE4n19+BQ5T8Q6f0Bg7NPBdcfIjvAZ0OHzFIrI7ZgDLkY+frpagC
	T8c7/3Z8eKmd5kQ2G1apEAtKyu+ac3zxS7Py+v2INpBI29fmuokHzcmCdFVF3+8Y+shLCRYYJgM
	4VDlQh+5yQY21E=
X-Received: by 2002:a05:6000:26d3:b0:473:e22:e819 with SMTP id ffacd0b85a97d-475521c8722mr5818240f8f.29.1782839140964;
        Tue, 30 Jun 2026 10:05:40 -0700 (PDT)
Received: from localhost (p200300f65f47db042a9b551def0a6b94.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2a9b:551d:ef0a:6b94])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-475643cd64bsm9939104f8f.14.2026.06.30.10.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:05:40 -0700 (PDT)
Date: Tue, 30 Jun 2026 19:05:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 5/6 RESEND] mfd: motorola-cpcap: diverge configuration
 per-board
Message-ID: <akP3Izez9NIln7ER@monoceros>
References: <20260625081812.33474-1-clamor95@gmail.com>
 <20260625081812.33474-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ltaqrrercs4zhqmo"
Content-Disposition: inline
In-Reply-To: <20260625081812.33474-6-clamor95@gmail.com>


--ltaqrrercs4zhqmo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 5/6 RESEND] mfd: motorola-cpcap: diverge configuration
 per-board
MIME-Version: 1.0

Hello,

On Thu, Jun 25, 2026 at 11:18:11AM +0300, Svyatoslav Ryhel wrote:
> -static const struct of_device_id cpcap_of_match[] = {
> -	{ .compatible = "motorola,cpcap", },
> -	{ .compatible = "st,6556002", },
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, cpcap_of_match);
> -
> -static const struct spi_device_id cpcap_spi_ids[] = {
> -	{ .name = "cpcap", },
> -	{ .name = "6556002", },
> -	{},
> -};
> -MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> [...]
> +static const struct of_device_id cpcap_of_match[] = {
> +	{ .compatible = "motorola,cpcap", .data = (void *)CPCAP_DEFAULT },
> +	{ .compatible = "motorola,mapphone-cpcap", .data = (void *)CPCAP_MAPPHONE },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cpcap_of_match);
> +
> +static const struct spi_device_id cpcap_spi_ids[] = {
> +	{ "cpcap", CPCAP_DEFAULT },
> +	{ "mapphone-cpcap", CPCAP_MAPPHONE },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);

Please keep the named initializers for cpcap_spi_ids[].

See https://lore.kernel.org/lkml/20260515103150.164887-2-u.kleine-koenig@baylibre.com/
for a rationale.

Best regards
Uwe

--ltaqrrercs4zhqmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpD92AACgkQj4D7WH0S
/k5/wgf/diCBfYdB8j8uFC1QHVGHgF5dNlMzGStyhWpcGPl1UoNYng77/aCjw7Hn
nhki9CD9CbxoX+rYpFKe9BT56YpJg6Nc3f4cQWreBuHJPQklpvFwR8Rkt4CcFEEq
VFXsKF9lDmLuZAbIC/BYGeD0AK18fq/HSWB3L1ScZa4i+tGPHGxzJlOI2CgZpRJj
f7dvbm90vj2mdPNnM/eiUccxWqK8b+CtUuAcxCx2bhMQab7ywTDL9zLUCvGzc2c0
X1L85lBeEbpW4VQf3bCaaHuNVFBwpeJ2CRNa3bG8Iz6IT+0hia7P2jv0qp2OJG6+
z3+uZrNyEwelyBZN7FBlATiKorwxgg==
=q6sW
-----END PGP SIGNATURE-----

--ltaqrrercs4zhqmo--
