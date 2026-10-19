Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BB93E7BA8
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 07:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393275; cv=none; b=FcbcisyD547SOVO3SsGH/cSxKZs206x82Ey5vCMOrd/ye0CvlUnoegWo+fIL/F6OMT09o5wdA4P0SC4cBqweUoNw1AUkc3Svtb/P0Z7QsqWsDxVaLRaah+yu8vEw1lWUHbaCyd5hTcBaQhsUWzbH+vN/75yq6LJEFcJiSMz1AlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393275; c=relaxed/simple;
	bh=oZ0gokOtvvho1vQAI82v7ekdmMpczVsPguujZbX7mtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1XeoYBiQNTnJWA6POTuayci+P7r9mRWUYEGx6uEFjYNpfXKxV4m65g7mfbCJhca6PnFS7kj678H4k4Aa65DVdthl7mYcaLWCgke06cz1HozBsPsq9hObEAFWi267mCy7lUnFQnM+LhyZN8tl3Z5sTJgPFxXXeks06pacJXQ0Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WFaGix46; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WFaGix46"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so2036752a12.0
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 00:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792393272; x=1792998072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oZ0gokOtvvho1vQAI82v7ekdmMpczVsPguujZbX7mtk=;
        b=WFaGix46Lz1n08JyZmgqDocAeYq2pXOmMZHkbQoXwjpSt15IC137n35bfYVWI6CMl5
         rBE66V6Wx6ENL01C5x4KzDwSOv2iEeQ6RQ6/eOWK2N8c+mTyM0IbrSzAI9gFQd6SLupE
         UU23CzjQ3WUM6OY6tQEkf1ssY7qZDux+uZXHTZVvyNR/Ea8h18Kw+/ARQ8pSb1zOS8Rv
         hZ0BSrovjFNCh/nUNrgjgN5YXabJj+4PtJ13maD5yqRbRrQlKXoa5XaoXgYXOdvsmKyF
         YjFl49AHjtC+DEbmJNHRZe7iQVdFFTWgHu0U1nrCfKDNVAsqyP2BkUSxoonzhJsmcNQ6
         zRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393272; x=1792998072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZ0gokOtvvho1vQAI82v7ekdmMpczVsPguujZbX7mtk=;
        b=v+Rt0mTcjUfpNvExdvPSEeSPnd3FBy8FvgRRQ1NU0gUZKN8BinzLGIqEGzKkNagG/L
         Cg7X6w5bGN7+6qVkoiCIZopxPJnBm2V4U39siBUx71AiBkGPGMgnNFi/6MCqbfFGcSRJ
         O5oq5jHAftdCEE9LWbSX5U3sUzaployhKyDrXNqT+ZgHTRpC4qbIyq8hY/3LVHzQTsBZ
         V14hOH3QQPb4OExjkImL0ilPkWUbX1KrWGhyvLQLgjSrX8iTVSeOb1OpJ8APqV6YYN1U
         iE7v0uc4weo6usavjzPC67Du2XqHLdeFiB2oIKkrWegHlLo1JzyMm0N7Ku6gh5CglwM4
         tDlg==
X-Forwarded-Encrypted: i=1; AKwUvBxPGf+K4ZdOi+s5QcF4ybkOUUboTeOL1sRfW2YyJCAeBnBzZ8tYZBaSp3CEBtQ1sSq9drniCqH46Lv4@vger.kernel.org
X-Gm-Message-State: AFq9FYIOEGeegpP3bqRDdORwryqZH4j4VKC66zsPyAlggJ2wmU4fKtG2
	37Qm9snfasla2l7fgOV9S6mCk8msT/PP7Qf6z1EVzibxcIljTjMLTtF1mffE03LsEV8=
X-Gm-Gg: AYBFou1e4ys2nkx+t8ADKNEnrqylyeyOP2/iK3tHaySgUeQMtaqvvJOoSbTXd6KcBNR
	1YNX43HPP8vW7TBp9vlm1P/IDICHmD1h6bQoPMn4x1wYhLy0klirswwxQLkFNkAiFDwRAJKGsId
	0570Ro3NFfA+i7Z3us95sNdZyviD0mc+pfcdIHpof0UiLqXqi6guseO4NF8gFlePQQWbZd7b5Br
	VzFYZ7q66c1pWWPnUrG6DpSD7Oa71YTzaoBGn7CWFta6qe3aTe4iF2cuNEv5wMDvhv0NlxJk6jl
	E1E4J53inepfHqr1dPrSoK6Kpelp0/qaZ8Wtr/azjIZGh6QGVtXxkvhgNvqMwcnLtiR5sQvmWet
	li2NoF8f9d3wrMxUk5mDDQUpY7wmq/Jgw7GNeRJQD1YrhYj7EVsKDpy/Aj3RmwEeHG7YKhy/+Zf
	w73mJHl5SHRhSfQ1pwXIPgGbv9t5ea58mI46X++6mhRZIsNxfCMQcFUNKX+QgEMrrjL1SnmF66R
	iDsNVNHJMYCqp80GpWrIPrOaLLKxPXHmmIZea6uqlpHd/Fw9ddqPtWnkrkabA==
X-Received: by 2002:a05:6402:325c:b0:6ac:6fd3:1e97 with SMTP id 4fb4d7f45d1cf-6b3a8198b00mr3033569a12.35.1792393271655;
        Mon, 19 Oct 2026 00:01:11 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dfd4e7ff1sm22693440f8f.25.2026.10.19.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:01:10 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:01:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ross Cawston <ross@r-sc.ca>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chris.packham@alliedtelesis.co.nz, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] leds: add Realtek RTL9300 port LED driver
Message-ID: <atW_3bhMg0vsHtNe@monoceros>
References: <20261018194339.132-1-ross@r-sc.ca>
 <20261018194339.132-4-ross@r-sc.ca>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nxjchq4abhvsnp6i"
Content-Disposition: inline
In-Reply-To: <20261018194339.132-4-ross@r-sc.ca>


--nxjchq4abhvsnp6i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/3] leds: add Realtek RTL9300 port LED driver
MIME-Version: 1.0

Hello Ross,

On Sun, Oct 18, 2026 at 12:43:38PM -0700, Ross Cawston wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> which pulls in a big
bunch of dependencies on subsystems not used in your driver.
<linux/platform_device.h> already provides of_device_id so you can just
drop the former.

Best regards
Uwe

--nxjchq4abhvsnp6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVwDIACgkQj4D7WH0S
/k4jrAf/da4fouhkXJC88m375WuCC2zmp7feudZpUHTGrjpPVuXOGtGEQGIvfq0q
pCd5kfrkD6R2nAVU02XiHIf6z9KbVLfbNaXojWbu0NdKBpCvyUMEJ3C+QZtXSXZX
qG+en94XPUEproDiPCzMnTCEjwPK9ZGBVPezOSTj2EiG83ehP6Y91UVRf9X4z/qb
qHVHfNszS2ZHEOYgkDU9vi4ouTTg7XybRC8+ikJXmYJIkqMG3WP6HXRHADnr6mVO
CaTbrr7SvLdlO5lEfKp2E6GEpfgwDCwMR/GeIHXL2qj7KO85kycsjOk20ZcuMzUw
3qudAVQ2eBldeyhG8SHT4ndWZyFrJg==
=+WSr
-----END PGP SIGNATURE-----

--nxjchq4abhvsnp6i--
