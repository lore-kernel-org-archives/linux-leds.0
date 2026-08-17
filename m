Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AB73ECBED
	for <linux-leds@vger.kernel.org>; Mon, 17 Aug 2026 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959585; cv=none; b=D2qUY7suv2LblFyJ9ad3dCpHv82WBpyMtsJsgzPDXqZD8b8Sb4HBqrxpX2PhQIuUU+T2/fQakzHx8bOVGCM4iA0hMu88HkX/cRXJUxuVL624D7PodaA8k/t98L/Se0XlceDyu7e7E6WHAHUmfYXUxLHAV8GDsNYt3pAQKoyb3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959585; c=relaxed/simple;
	bh=dtk6e7DXkab0Wi6uKJ4HjHzWIAKxI0jK8NztSrr+wKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2yxQVomo0Yn0opQMnswPyQPgMVDg0pL98Id6xwVGxXVdLvazxSImMMJE7fQYAkDK72PIZztUJHHzX3j7eps5cnasbHY5iDehJRwp0EmmVn1shVlJFF7BOa37S0s/J80Y4Di8zCQdRK+cd2TS4imSB+VRyh3mF/cU5waOSpMLuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=hDHFMeiv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="hDHFMeiv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so25716085e9.2
        for <linux-leds@vger.kernel.org>; Mon, 17 Aug 2026 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786959579; x=1787564379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dtk6e7DXkab0Wi6uKJ4HjHzWIAKxI0jK8NztSrr+wKk=;
        b=hDHFMeivnqgaKc+0lZ93f98BgXbzgnxU3Ky/WbFz1oZPuM93N2vbfUSzt7WX7xQNZ4
         IJc7twCldleo7/B430+SRGv34cEn9G834h7wlUXuQXGkyozNDRowruON2bS8FQwesTp1
         jxY+ox2LQy6qF+0z/RyxRHKl+sBVwkdtK4oebDRIuueFloW4Jw/OxostUmk1SPyfxVZ1
         Or9GM2v3mTfzqv9VATtVzpbgn39+vkAMKrlo6Z458IKTXsTZ2qhoHzbFWgGEqEeJbJm/
         jDOxRdBbimbQBqz/0nQlvmMWUMlS/CpnEdHMEsY1t+5F6upQp9HKhXGq/CQPUzOT8/FR
         Fp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786959579; x=1787564379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtk6e7DXkab0Wi6uKJ4HjHzWIAKxI0jK8NztSrr+wKk=;
        b=SPqmZlNKtRADOPZ+xO2+nCUfiBf+iQ7nCpqZGj1pd3A+MJmpq/xnKjQyXadW5w2tGI
         GKG78GNwhc3Hg6BCgjPDRI2aOFUij853yeeTn0BNTCv1uwzQZIWhF89vn4wppqOW3kxb
         yEjMsrQ+NMdHdItyUkkofbNOjoBLlAWP5pS8PbRAwjIDCM7mn+AIAqZE60MpmrDcnN3k
         YF45ma8u0PUe14OybBRXKxd43rylDhy22sJafyn3v2+w/oZLbzVG5fl3riPV7Va5f5BD
         yAHMrSk6KjDXTfyqVnRvOOXbVt4RNP2jW1dP55DgaS2I/r62vCbSrjLT417k0XwlgF3E
         Tg2A==
X-Forwarded-Encrypted: i=1; AHgh+RpmNbbt4jaAWieQxPnrn0A8kabBYn7WCCiQLWbfH2u24P79pysa7KOFpRAdCcvwPBV0API6ySdPAqFz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy11qSs2KoSUz8/5BJJVc4nari6l0riZ3C9RSGXrEbz/xKfFDwF
	0hFraNDZv/Or2MsAfHCunWvMpRX0M1hnRpdwzq/bQNd06hYPK+OIIQAmbUv/MNwoMf0=
X-Gm-Gg: AR+sD130Yy4DX8t9qfMwTliLmOhGm35whKij4p+Es0amoLTdok74Hf2/GNerY0TDxPD
	QhKVsA0LfY/frQWO+41W/m8qJCX2mrMceuW/E5L3pPdfwxGACrqO25L0tfVxQirRVSjQqlsC0jV
	xUelFUwfhWyshXO4G+Lvoz4o7kXRlRcwOhZVLqGBCvYBcNSf402poeRuuL3WX7+PWO8y0Fz4sPA
	+34W2/NVern900GmSsN5nI4CYXgbVKnxVUYULpmzLGoU18cc75MaS7jJyCtIO07iqLtmVj/dIpX
	R0Xbh4uEPQEc14d/sxp/WmokBTXGHE89/01GVsGZjTfGRkPnkReRUS3esuFfhy8cUgZPrbiqVHD
	BYqonmNa8qujhHb9wsw2BXrtD17uoKN/MAAN5Ejb7bbfvwOrDZB99VYhTlJVI44fNO73vaxV6IQ
	No5ptKwsxQaOlagI5BiWxcs1BCUMH93nz34FZ+2n7tATgYoAmG5lsQByYNXMuAUIjTBEg64rNgb
	9A+dSWx37Vbk3qbmDXPEhD5bs1BFYH8WL4gbyZGdr0486o4YKPO79LW6F/3Q8hb0DdbsyZyL1v5
	lHIdxykafmvSfamzln/kZrb9Ze8Y4FKSa5nPI0M/1QIlnA==
X-Received: by 2002:a05:600c:4f12:b0:499:491e:4b0d with SMTP id 5b1f17b1804b1-499879c627bmr387093535e9.19.1786959579385;
        Mon, 17 Aug 2026 02:39:39 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999610ed6dsm169142985e9.8.2026.08.17.02.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:39:38 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:39:36 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	mfd@lists.linux.dev, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v6 04/14] mfd: lm3533: Pass only regmap and light sensor
 presence to child devices
Message-ID: <aoLW2Lo7LDD-OcWF@aspen.lan>
References: <20260731113632.158440-1-clamor95@gmail.com>
 <20260731113632.158440-5-clamor95@gmail.com>
 <20260815025203.2618cf8f@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815025203.2618cf8f@jic23-huawei>

On Sat, Aug 15, 2026 at 02:52:03AM +0100, Jonathan Cameron wrote:
> On Fri, 31 Jul 2026 14:36:22 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Instead of passing the entire lm3533 core data structure, only pass the
> > regmap and the light sensor presence flag to child devices.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Acked-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> #for-iio
> (I didn't read the rest on this one)

... and it looks like I overlooked that there were backlight changes in
this one:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> #for-backlight


Daniel.
